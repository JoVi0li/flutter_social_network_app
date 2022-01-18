import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_network_app/src/auth/states/auth_state.dart';
import 'package:social_network_app/src/auth/states/authenticated_state.dart';
import 'package:social_network_app/src/auth/states/error_state.dart';
import 'package:social_network_app/src/auth/states/initial_state.dart';
import 'package:social_network_app/src/auth/states/loading_state.dart';
import 'package:social_network_app/src/auth/states/success_state.dart';

class AuthService extends ValueNotifier<AuthState> {
  AuthService() : super(InitialState()) {
    _authCheck();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? userAuthenticated;

  resetState() {
    value = InitialState();
  }

  _authCheck() async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 3));
    _auth.authStateChanges().listen((User? user) {
      userAuthenticated = (user == null) ? null : user;
    });
    if (userAuthenticated != null) {
      value = AuthenticatedState(user: userAuthenticated!);
    }
    value = InitialState();
  }

  _getUser() {
    userAuthenticated = _auth.currentUser;
    if (userAuthenticated != null) {
      print('_getUser: ${userAuthenticated!.email}');
      value = AuthenticatedState(user: userAuthenticated!);

      print(value);
    } else {
      value = InitialState();
    }
  }

  register(String email, String password) async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 3));
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      value = SuccessState(message: 'Usuário cadastrado com sucesso!');
      await Future.delayed(const Duration(seconds: 3));
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        value = ErrorState(message: 'A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        value = ErrorState(message: 'Este e-mail já está em uso!');
      }
    }
  }

  login(String email, String password) async {
    value = LoadingState();
    await Future.delayed(const Duration(seconds: 3));
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      value = SuccessState(message: 'Login realizado com sucesso');
      await Future.delayed(const Duration(seconds: 3));
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        value = ErrorState(message: 'Usuário não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        value = ErrorState(message: 'Senha incorreta. Tente novamente.');
      }
    } catch (e) {
      value = ErrorState(message: e.toString());
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
