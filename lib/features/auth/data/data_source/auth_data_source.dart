import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future<void> signUpUser ({required String email , required String password})async
{
await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
}

Future<void> signInUser({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  
}
