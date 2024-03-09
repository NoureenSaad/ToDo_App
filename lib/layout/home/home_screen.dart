import 'package:flutter/material.dart';
import 'package:todo_app/style/app_colors.dart';
 
class HomeScreen extends StatelessWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLightColor,
      ),
    );
  }
}
