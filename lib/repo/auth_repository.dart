import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<UserCredential> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
