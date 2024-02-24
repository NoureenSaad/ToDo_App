import 'package:flutter/material.dart';
import 'package:todo_app/layout/login/login_screen.dart';
import 'package:todo_app/layout/registration/registration_screen.dart';
import 'package:todo_app/style/app_theme.dart';

void main() {
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
      },
      initialRoute: LoginScreen.route,
    );
  }
}