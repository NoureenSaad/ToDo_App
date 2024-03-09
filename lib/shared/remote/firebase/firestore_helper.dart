import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/user.dart';

class FirestoreHelper{

  static CollectionReference<User> getUserCollection(){
    var reference = FirebaseFirestore.instance.collection('User').withConverter(
      fromFirestore: (snapshot, options){
        Map<String, dynamic>? data = snapshot.data();
        return User.fromFirestore(data??{});
      },
      toFirestore: (user,options){
        return user.toFirestore();
      }
    );
    return reference;
}

  static Future<void> AddUser(String userID, String email,String fullname) async{
    var document = getUserCollection().doc(userID);
    await document.set(
      User(
        id: userID,
        fullName: fullname,
        email: email)
    );
  }

  static Future<User?> GetUser(String userID) async{
    var document = getUserCollection().doc(userID);
    var snapshot = await document.get();
    User? user = snapshot.data();
    return user;
  }
}