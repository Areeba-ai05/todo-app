import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:flutter/material.dart';

class InsertDataScreen extends StatefulWidget {
  const InsertDataScreen({super.key});

  @override
  State<InsertDataScreen> createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
            ButtonWidget(
              text: 'Save Data',
              ontap: () {
                // This is just the UI screen; backend logic can be implemented here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
