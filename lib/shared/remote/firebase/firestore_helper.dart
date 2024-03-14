import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/firestore_task.dart';
import 'package:todo_app/model/firestore_user.dart';

class FirestoreHelper{

  static CollectionReference<FirestoreUser> getUserCollection(){
    var reference = FirebaseFirestore.instance.collection('User').withConverter(
      fromFirestore: (snapshot, options){
        Map<String, dynamic>? data = snapshot.data();
        return FirestoreUser.fromFirestore(data??{});
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
      FirestoreUser(
        id: userID,
        fullName: fullname,
        email: email)
    );
  }

  static Future<FirestoreUser?> GetUser(String userID) async{
    var document = getUserCollection().doc(userID);
    var snapshot = await document.get();
    FirestoreUser? user = snapshot.data();
    return user;
  }

  static CollectionReference<FirestoreTask> getTaskCollection(String userID){
    var reference = getUserCollection().doc(userID).collection('Tasks').withConverter(
        fromFirestore: (snapshot, options) => FirestoreTask.fromFirestore(snapshot.data()??{}),
        toFirestore: (task,options)=> task.toFirstore()
    );
    return reference;
  }

  static Future<void> AddTask(FirestoreTask task, String userID)async{
    var reference = getTaskCollection(userID);
    var taskDocument = reference.doc();
    task.id = taskDocument.id;
    await taskDocument.set(task);
  }

  static GetTask(){

  }

}