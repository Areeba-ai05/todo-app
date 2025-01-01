
import 'package:flutter/material.dart';

import '../app-colors/app-colors.dart';

    class PasswordField extends StatefulWidget {
      String hintText;
      TextEditingController controller2;
       PasswordField({super.key, required this.hintText, required this.controller2});

      @override
      State<PasswordField> createState() => _PasswordFieldState();
    }

    class _PasswordFieldState extends State<PasswordField> {

      bool isHide=true;
      
      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: TextFormField(
              controller: controller2,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none
              ),
            ),
          ),
        );
      }
    }
