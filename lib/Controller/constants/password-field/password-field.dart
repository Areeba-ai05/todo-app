import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:flutter/material.dart';

    class PasswordField extends StatefulWidget {
      const PasswordField({super.key});
    
      @override
      State<PasswordField> createState() => _PasswordFieldState();
    }
    
    class _PasswordFieldState extends State<PasswordField> {
      TextEditingController createpasswordController=TextEditingController();
  bool isHide=true;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
         body:  Column(
            children: [
              TextFormFieldWidget(
                //obscureText=isHide,//
                  hintText: 'Create a password', controller: createpasswordController),
            ],
          ),

        );
      }
    }
    