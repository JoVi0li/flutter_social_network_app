import 'package:social_network_app/src/auth/states/auth_state.dart';

class SuccessState extends AuthState {
  SuccessState({required this.message});

  final String message;
}
