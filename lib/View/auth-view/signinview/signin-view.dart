import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:architecture/View/auth-view/signupview/signup.dart';
import 'package:flutter/material.dart';
class SignInView extends StatefulWidget {

  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailAddressController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
   bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          children:[
           BlackTextHeading(text: 'Welcome Back!'),
            SizedBox(height:50,),
            ImageWidget(image: AppImages.signinImg),
            SizedBox(height: 30,),
            TextFormFieldWidget(hintText:'Enter your email Address', controller: emailAddressController),
            TextFormFieldWidget(hintText: ' Confirm password', controller: confirmpasswordController,
            ),
            SizedBox(height: 20,),
            NormalTextWidget(text: 'Forgot password?', textColor: AppColors.primaryColor),
            SizedBox(height: 20,),
            isLoading?AppLoader(): ButtonWidget(text: 'Sign In', ontap: ()async{}),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalTextWidget(text: 'Dont have an account?', textColor:AppColors.blackColor),
                SizedBox(width: 5,),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
                    },
                    child: NormalTextWidget(text: 'Sign Up', textColor:AppColors.primaryColor)),
              ],
            )

          ]
        )
      )
    );
  }
}

