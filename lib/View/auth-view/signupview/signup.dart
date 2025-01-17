import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/constants/password-field/password-field.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:architecture/View/auth-view/signinview/signin-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
   SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
TextEditingController fullNameController=TextEditingController();

   TextEditingController emailAddressController=TextEditingController();

   TextEditingController createpasswordController=TextEditingController();

   TextEditingController confirmpasswordController=TextEditingController();

     bool isLoading=false;

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
        PasswordField(hintText: 'Create a password', controller2: createpasswordController),
        PasswordField(hintText: 'Confirm password', controller2: confirmpasswordController),
        //TextFormFieldWidget(hintText: 'Create a password', controller: createpasswordController),
        //TextFormFieldWidget(hintText: ' Confirm password', controller: confirmpasswordController),
        SizedBox(height: 10,),
        isLoading?AppLoader(): ButtonWidget(text: 'Sign Up', ontap: ()async{
          isLoading =true;
          setState(() {

          });
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddressController.text.trim(),
              password:createpasswordController.text).then((value){
                isLoading=false;
                setState(() {
                });
                Navigator.push(context,CupertinoPageRoute(builder: (context)=>SignInView()) );
          }).onError((value,error){
            isLoading=false;
            setState(() {});
            Get.snackbar('Error','${value.toString()}',
            backgroundColor: AppColors.primaryColor);
            print('Error: ' +value.toString());
          });

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
