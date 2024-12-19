import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTaskWidget extends StatelessWidget {
  String text;
  TodoTaskWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      color: AppColors.greyColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),

    );
  }
}
