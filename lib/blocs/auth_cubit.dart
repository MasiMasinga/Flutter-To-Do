import 'package:bloc/bloc.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

// Services
import 'package:to_do/services/firebase_auth_service.dart';

class AuthCubit extends Cubit<User?> {
  final FirebaseAuthService _authService;

  AuthCubit(this._authService) : super(_authService.getCurrentUser());

}
