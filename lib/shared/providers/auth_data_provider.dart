import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/model/firestore_user.dart';
import 'package:todo_app/shared/remote/firebase/firestore_helper.dart';

class AuthDataProvider extends ChangeNotifier{
  User? firebaseUserAuth;
  FirestoreUser? databaseUser;

  void setUsers(User? newFirebaseUserAuth, FirestoreUser? newDatabaseUser){
    firebaseUserAuth = newFirebaseUserAuth;
    databaseUser = newDatabaseUser;
  }

  bool isFirebaseUserLoggedIn(){
    if(FirebaseAuth.instance.currentUser == null){
      return false;
    }
    firebaseUserAuth = FirebaseAuth.instance.currentUser;
    return true;
  }

  Future<void> retrieveDatabaseUserData()async{
    try{
      databaseUser = await FirestoreHelper.GetUser(firebaseUserAuth!.uid);
    }catch(e){
      print(e);
    }
  }
}