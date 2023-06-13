import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static bool isLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
