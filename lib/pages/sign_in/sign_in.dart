import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_event.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_state.dart';
import 'package:learnify/pages/sign_in/sign_in_controller.dart';
// import 'package:learnify/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:learnify/pages/common_widgets.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state){
        return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Log In"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child: reusableText("Or use your email account to login")),
                Container(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  margin: EdgeInsets.only(top: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          "Enter your email address", "email", "user",
                          (value){
                            context.read<SignInBloc>().add(EmailEvent(email: value));
                          }
                          ),
                      reusableText("Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          "Enter your password", "password", "lock",
                          (value){
                            context.read<SignInBloc>().add(PasswordEvent(password: value));
                          }
                          ),
                    
                    ],
                  ),
                ),
               forgotPassword(),
               buildLogInAndRegButton("Log In", "login", (){
                  SignInController(context: context).handleSignIn("email");
               }
               ),
               buildLogInAndRegButton("Sign Up","register",(){
                Navigator.of(context).pushNamed("register");
               })
              ],
            ),
          ),
        ),
      ),
    );
  
      }
    );
  
  }
}
