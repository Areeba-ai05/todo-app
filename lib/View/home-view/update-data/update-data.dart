import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDataScreen extends StatefulWidget {
  String docid;
   UpdateDataScreen({super.key, required this.docid});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading=false;
  updateData() async{
    try{
      await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).doc(widget.docid).update({
        'enterTask':taskController.text,
        'taskDescription':descriptionController.text,
      });
      Navigator.pop(context);
    }
    catch (e) {}
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
            BlackTextHeading(text: 'Update Data'),
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
                updateData();
                //insertData();// This is just the UI screen; backend logic can be implemented here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
