import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertDataScreen extends StatefulWidget {
  const InsertDataScreen({super.key});

  @override
  State<InsertDataScreen> createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading=false;
  insertData() async{
    try{
      isLoading=true;
      setState(() {

      });
      await FirebaseFirestore.instance.collection('Test').add({
        'enterTask':taskController.text,
        'taskDescription':descriptionController.text
      });
      isLoading=false;
      setState(() {

      });
      Navigator.pop(context);
    }
    catch(e){
     isLoading=false;
     setState(() {

     });
     Get.snackbar('Error','${e.toString()}');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            BlackTextHeading(text: 'Add New Task'),
            const SizedBox(height: 20),
            NormalTextWidget(
              text: 'Fill in the details below',
              textColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: 'Enter Task',
              controller: taskController,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: 'Enter Task Description',
              controller: descriptionController,
            ),
            const SizedBox(height: 30),
            isLoading==true?AppLoader():ButtonWidget(
              text: 'Save Data',
              ontap: () {
                insertData();// This is just the UI screen; backend logic can be implemented here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
