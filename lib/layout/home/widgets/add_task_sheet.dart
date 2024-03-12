import 'package:flutter/material.dart';
import 'package:todo_app/shared/reusable_components/custom_form_field.dart';

class AddTaskSheet extends StatefulWidget {
  void Function() onCancel;
  AddTaskSheet({required this.onCancel});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Create New Task",style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 20,),
              CustomFormField(
                controller: titleController,
                lable: "Enter Task Title",
                keyboard: TextInputType.text,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Title can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              CustomFormField(
                controller: descController,
                lable: "Enter Task Description",
                keyboard: TextInputType.multiline,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Description can't be empty";
                  }
                  return null;
                },
                maxLines: 2,
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: ()async{
                  selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    initialDate: DateTime.now()
                  );
                  setState(() {

                  });
                },
                child: Text(selectedDate==null
                    ? "Select Date"
                    : "${selectedDate?.day} / ${selectedDate?.month} / ${selectedDate?.year}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400
                ),),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    widget.onCancel();
                  },
                  child: Text("Cancel")),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
