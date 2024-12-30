import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:architecture/View/auth-view/signinview/signin-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
   SignupView({super.key});
TextEditingController fullNameController=TextEditingController();
   TextEditingController emailAddressController=TextEditingController();
   TextEditingController createpasswordController=TextEditingController();
   TextEditingController confirmpasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 30,),
        BlackTextHeading(text: 'Welcome Onboard!'),
        SizedBox(height: 20,),
        NormalTextWidget(text: 'Lets help you meet up your task',textColor: AppColors.primaryColor,),
        TextFormFieldWidget(hintText: 'Enter your Full Name', controller: fullNameController),
        TextFormFieldWidget(hintText: 'Enter your Email Address', controller: emailAddressController),
        TextFormFieldWidget(hintText: 'Create a password', controller: createpasswordController),
        TextFormFieldWidget(hintText: ' Confirm password', controller: confirmpasswordController),
        SizedBox(height: 10,),
        ButtonWidget(text: 'Sign Up', ontap: ()async{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddressController.text.trim(), password:createpasswordController.text);
        }),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalTextWidget(text: 'Already have an account?', textColor:AppColors.blackColor),
            SizedBox(width: 5,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
                },
                child: NormalTextWidget(text: 'Sign In', textColor:AppColors.primaryColor)),
          ],
        )

      ],)
    );
  }
}
