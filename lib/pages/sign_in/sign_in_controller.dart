

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
        if (emailAddress.isEmpty) {
           print('email is empty');
        }else{
          print('email is $emailAddress');
        }
        if (userPassword.isEmpty) { 
             print('password empty');
             
        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: userPassword);

          if(credential.user==null){
            print("No user found");

          }
          if(!credential.user!.emailVerified){
            print("The email isn't registered");

          }
          final user = credential.user;
          if(user!=null){
            print("User found");
          }else{
            print('no user');
          }
        }
      on FirebaseAuthException  catch(e){
              if(e.code == "user-not-found"){
                print('No user found for that email.');
              }else if(e.code == 'wrong-password'){
                print('wrong password provided for the user');
              }else if(e.code == 'invalid-email'){
                print('Your email format is wrong');
              }
        }
      }
    } catch (e) {
           print(e.toString());
    }
  }
}
