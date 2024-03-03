import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/layout/home/home_screen.dart';
import 'package:todo_app/layout/login/login_screen.dart';
import 'package:todo_app/layout/registration/registration_screen.dart';
import 'package:todo_app/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        LoginScreen.route:(_)=>LoginScreen(),
        RegistrationScreen.route:(_)=>RegistrationScreen(),
        HomeScreen.route:(_)=>HomeScreen(),
      },
      initialRoute: LoginScreen.route,
    );
  }
}