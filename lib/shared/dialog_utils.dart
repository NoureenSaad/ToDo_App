import 'package:flutter/material.dart';

class DialogUtils{

  static void showLoadingDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 15,),
                  Text("Loading",style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage({required BuildContext context,
    required String message,
    String? positiveText,
    String? negativeText,
    void Function()? positivePress,
    void Function()? negativePress,
  }){
    showDialog(
        context: context,
        builder: (context){
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(positiveText != null)
                          TextButton(
                              onPressed: positivePress,
                              child: Text(positiveText,style: TextStyle(
                                fontSize: 16
                              ),)
                          ),
                        if(negativeText != null)
                          TextButton(
                              onPressed: negativePress,
                              child: Text(negativeText, style: TextStyle(
                                  fontSize: 16
                              ),)
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
