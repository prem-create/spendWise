import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<UserCredential> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword(String email) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    await auth.sendPasswordResetEmail(email: email);
  }
}
