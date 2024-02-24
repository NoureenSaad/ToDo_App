import 'package:flutter/material.dart';
import 'package:todo_app/shared/constants.dart';
import 'package:todo_app/shared/reusable_components/custom_form_field.dart';
import 'package:todo_app/style/app_colors.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = "RegistrationScreen";
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isObscured = true;
  bool isConfirmObscured = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
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
          title: const Text("Registration",style: TextStyle(
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
                  lable: "Full Name",
                  keyboard: TextInputType.name,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "This Field Can't Be Empty";
                    }
                    return null;
                  },
                  controller: fullNameController,
                ),
                const SizedBox(height: 15,),
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
                const SizedBox(height: 15,),
                CustomFormField(
                  lable: "Password Confirmation",
                  keyboard: TextInputType.visiblePassword,
                  obscureText: isConfirmObscured,
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isConfirmObscured = !isConfirmObscured;
                        });
                      },
                      icon: Icon(
                        isConfirmObscured?Icons.visibility_off:Icons.visibility,
                        color: AppColors.primaryLightColor,
                        size: 25,
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "This Field Can't Be Empty";
                    }
                    if(value != passwordController.text){
                      return "Passwords Don't Match";
                    }
                    return null;
                  },
                  controller: passwordConfirmationController,
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLightColor
                    ),
                    onPressed: (){
                      if(formKey.currentState?.validate()??false){

                      }
                    },
                    child: const Text("Register",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
