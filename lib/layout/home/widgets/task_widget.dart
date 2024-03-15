import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/firestore_task.dart';
import 'package:todo_app/style/app_colors.dart';

class TaskWidget extends StatelessWidget {
  FirestoreTask task;
  TaskWidget({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date??0);
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context){},
                icon: Icons.delete,
                label: "Delete",
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title??"",
                      style: Theme.of(context).textTheme.titleLarge
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,color: AppColors.timeColor,size: 18,),
                          SizedBox(width: 5,),
                          Text("${DateFormat.jm().format(taskDate)}",
                            style: Theme.of(context).textTheme.titleSmall,)
                        ],
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: (){

                  },
                  child: Icon(Icons.check)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
