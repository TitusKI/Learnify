import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String userPassword = state.password;
        if (emailAddress.isEmpty) {}
        if (userPassword.isEmpty) {}
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: userPassword);

          if(credential.user==null){

          }
          if(!credential.user!.emailVerified){

          }
          final user = credential.user;
          if(user!=null){
            
          }
        }
        catch(e){

        }
      }
    } catch (e) {

    }
  }
}
