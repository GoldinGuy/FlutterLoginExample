import 'package:firebase_auth/firebase_auth.dart';

class SignUpRouteArgs {
  final FirebaseAuth auth;

  SignUpRouteArgs(this.auth);
}

class LoginRouteArgs {
  final FirebaseAuth auth;
  final User user;

  LoginRouteArgs(this.auth, this.user);
}
