import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential> login(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword(String email) async {
    return await auth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> register(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

 
}
