import 'package:flutter/material.dart'

    class PasswordField extends StatefulWidget {
      const PasswordField({super.key});
    
      @override
      State<PasswordField> createState() => _PasswordFieldState();
    }
    
    class _PasswordFieldState extends State<PasswordField> {
      TextEditingController confirmpasswordController=TextEditingController();
  bool isHide=true;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          TextFormFieldWidget(hintText: 'Create a password', controller: createpasswordController),
        );
      }
    }
    