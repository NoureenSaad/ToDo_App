class FirestoreTask{
  String? id;
  String? title;
  String? description;
  int? date;
  bool? isDone;
  FirestoreTask({this.isDone = false,this.id,required this.title , required this.description , required this.date});

  FirestoreTask.fromFirestore(Map<String , dynamic> data){
    id = data["id"];
    title = data["title"];
    description = data["description"];
    date = data["date"];
    isDone = data["isDone"];
  }

  Map<String , dynamic> toFirstore(){
    Map<String , dynamic> data = {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "idDone":isDone
    };
    return data;
  }

}