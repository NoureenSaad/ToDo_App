import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home/provider/home_provider.dart';
import 'package:todo_app/shared/reusable_components/custom_form_field.dart';

class AddTaskSheet extends StatefulWidget {
  void Function() onCancel;
  TextEditingController titleController;
  TextEditingController descController;
  GlobalKey<FormState> formKey;

  AddTaskSheet({required this.onCancel,required this.titleController,required this.descController,required this.formKey});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Create New Task",style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 20,),
              CustomFormField(
                controller: widget.titleController,
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
                controller: widget.descController,
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
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    initialDate: DateTime.now()
                  );
                  provider.selectDate(selectedDate);
                  setState(() {

                  });
                },
                child: Text(provider.selectedDate==null
                    ? "Select Date"
                    : "${provider.selectedDate?.day} / ${provider.selectedDate?.month} / ${provider.selectedDate?.year}",
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
