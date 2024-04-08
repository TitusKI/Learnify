import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify/common/widgets/flutter_toast.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        // Read and access Sign In Bloc here to get the state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String userPassword = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (userPassword.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: userPassword);

          if (credential.user == null) {
            toastInfo(msg: "User doesn't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }
          final user = credential.user;
          if (user != null) {
            toastInfo(msg: "User exist");
            return;
          } else {
            toastInfo(msg: "You aren't registered Please Sign Up first");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No User found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided by You");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid email provided");
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
