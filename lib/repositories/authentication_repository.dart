// Firebase
import 'package:firebase_auth/firebase_auth.dart';

// Services
import 'package:to_do/services/firebase_auth_service.dart';

class AuthenticationRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthenticationRepository(this._firebaseAuthService);

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _firebaseAuthService.signUpWithEmailAndPassword(
        email, password);
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await _firebaseAuthService.signInWithEmailAndPassword(
        email, password);
  }

  Future<void> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  Future<void> resetPassword(String email) async {
    return await _firebaseAuthService.resetPassword(email);
  }

  Future<UserCredential> signInWithGoogle() async {
    return await _firebaseAuthService.signInWithGoogle();
  }

  Future<UserCredential> signInWithPhoneNumber(String phoneNumber) async {
    return await _firebaseAuthService.signInWithPhoneNumber(phoneNumber);
  }
}
