import 'package:bloc/bloc.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

// Services
import 'package:to_do/services/firebase_auth_service.dart';

enum AuthError {
  signIn,
  signUp,
  signOut,
  resetPassword,
  signInWithGoogle,
  signInWithPhoneNumber
}

class AuthCubit extends Cubit<User?> {
  final FirebaseAuthService _authService;

  AuthCubit(this._authService) : super(null) {
    _init();
  }

  void emitError(AuthError error) {
    emit(null);
    emitError(error);
  }

  Future<void> _init() async {
    try {
      final currentUser = await _authService.getCurrentUser();
      emit(currentUser);
    } catch (e) {
      emitError(AuthError.signIn);
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential =
          await _authService.signUpWithEmailAndPassword(email, password);
      emit(userCredential.user);
    } catch (e) {
      emitError(AuthError.signUp);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential =
          await _authService.signInWithEmailAndPassword(email, password);
      emit(userCredential.user);
    } catch (e) {
      emitError(AuthError.signIn);
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      emit(null);
    } catch (e) {
      emitError(AuthError.signOut);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authService.resetPassword(email);
    } catch (e) {
      emitError(AuthError.resetPassword);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await _authService.signInWithGoogle();
      emit(userCredential.user);
    } catch (e) {
      emitError(AuthError.signInWithGoogle);
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      final userCredential =
          await _authService.signInWithPhoneNumber(phoneNumber);
      emit(userCredential.user);
    } catch (e) {
      emitError(AuthError.signInWithPhoneNumber);
    }
  }
}
