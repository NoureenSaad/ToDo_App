import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/home/home_screen.dart';
import 'package:todo_app/layout/registration/registration_screen.dart';
import 'package:todo_app/shared/constants.dart';
import 'package:todo_app/shared/dialog_utils.dart';
import 'package:todo_app/shared/firebase_auth_error_codes.dart';
import 'package:todo_app/shared/reusable_components/custom_form_field.dart';
import 'package:todo_app/style/app_colors.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/SIGN IN – 1.jpg"),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Login",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomFormField(
                    lable: "Email",
                    keyboard: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This Field Can't Be Empty";
                      }
                      if(!RegExp(Constants.emailRegex).hasMatch(value)){
                        return "Enter A Valid Email";
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  const SizedBox(height: 15,),
                  CustomFormField(
                    lable: "Password",
                    keyboard: TextInputType.visiblePassword,
                    obscureText: isObscured,
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isObscured = !isObscured;
                          });
                        },
                        icon: Icon(
                          isObscured?Icons.visibility_off:Icons.visibility,
                          color: AppColors.primaryLightColor,
                          size: 25,
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This Field Can't Be Empty";
                      }
                      if(value.length < 8){
                        return "Password Can't Be Less Then 8 Characters";
                      }
                      return null;
                    },
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLightColor
                    ),
                      onPressed: (){
                        Login();
                      },
                    child: const Text("Login",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                      ),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have An Account?",style: TextStyle(
                        fontSize: 18
                      ),),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RegistrationScreen.route);
                        },
                        child: const Text("Sign Up",style: TextStyle(
                          color: AppColors.primaryLightColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }

  void Login() async{
    if(formKey.currentState?.validate()??false){
      DialogUtils.showLoadingDialog(context);
      try{
        UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        DialogUtils.hideLoadingDialog(context);
        DialogUtils.showMessage(
            context: context,
            message: "Login Successfully",
            positiveText: "OK",
            positivePress: (){
              Navigator.pushReplacementNamed(context, HomeScreen.route);
            }
        );
      }on FirebaseAuthException catch(e){
        DialogUtils.hideLoadingDialog(context);
        if (e.code == FirebaseAuthErrorCodes.userNotFound) {
          print('No user found for that email.');
          DialogUtils.showMessage(
            context: context,
            message: "User Not Found",
            positiveText: "Try Again",
            positivePress: (){
              DialogUtils.hideLoadingDialog(context);
            },
          );
        } else if (e.code == FirebaseAuthErrorCodes.wrongPassword) {
          print('Wrong password provided for that user.');
          DialogUtils.showMessage(
            context: context,
            message: "Wrong Password",
            positiveText: "Try Again",
            positivePress: (){
              DialogUtils.hideLoadingDialog(context);
            },
          );
        }
      }
    }


  }
}
