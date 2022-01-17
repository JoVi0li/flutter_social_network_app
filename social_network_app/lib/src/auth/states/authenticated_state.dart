import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_network_app/src/auth/states/auth_state.dart';
// import 'package:flutter/material.dart';

class AuthenticatedState extends AuthState {
  AuthenticatedState({required this.user}){
    goToFeed();
  }

  final User user;

  goToFeed(){
  }
}
