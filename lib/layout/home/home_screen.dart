import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/login/login_screen.dart';
import 'package:todo_app/shared/providers/auth_data_provider.dart';
import 'package:todo_app/style/app_colors.dart';
 
class HomeScreen extends StatelessWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()async{
                await provider.SignOut();
                Navigator.pushReplacementNamed(context, LoginScreen.route);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 25,
              )
          ),
        ],
        backgroundColor: AppColors.primaryLightColor,
      ),
    );
  }
}
