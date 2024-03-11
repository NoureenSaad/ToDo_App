import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home/home_screen.dart';
import 'package:todo_app/layout/login/login_screen.dart';
import 'package:todo_app/shared/providers/auth_data_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      CheckAutoLogin();
    });
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/splash.jpg"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  void CheckAutoLogin()async{
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context, listen: false);
    if(provider.isFirebaseUserLoggedIn()){
      await provider.retrieveDatabaseUserData();
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    }else{
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }
}
