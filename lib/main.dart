import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/app_bloc.dart';
import 'package:learnify/app_event.dart';
import 'package:learnify/app_state.dart';
import 'package:learnify/common/routes/pages.dart';
import 'package:learnify/common/values/colors.dart';
import 'package:learnify/firebase_options.dart';
import 'package:learnify/pages/bloc_providers.dart';
import 'package:learnify/pages/register/register.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_bloc.dart';
import 'package:learnify/pages/sign_in/sign_in.dart';
import 'package:learnify/pages/welcome/blocs/bloc/welcome_bloc.dart';
import 'package:learnify/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProvider(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColors.primaryText),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
        onGenerateRoute: AppPages.GenerateRouteSettings,

          // home: const Welcome(),
          // routes: {
          //   // "myHomePage": (context) => const MyHomePage(),
          //   "signIn": (context) => const SignIn(),
          //   "register": (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
