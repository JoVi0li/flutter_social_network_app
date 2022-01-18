import 'package:social_network_app/src/auth/states/auth_state.dart';

class ErrorState extends AuthState {
  ErrorState({required this.message});

  final String message;
}
