class FirestoreUser{
  String? id;
  String? fullName;
  String? email;

  FirestoreUser({required this.id,required this.fullName,required this.email});

  FirestoreUser.fromFirestore(Map<String, dynamic> data){
    id = data['id'];
    fullName = data['fullname'];
    email = data['email'];
}

  Map<String, dynamic> toFirestore(){
    return{
      'id':id,
      'fullname':fullName,
      'email':email
    };
  }
}