import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/constants/password-field/password-field.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/normal-text-widget.dart';
import 'package:architecture/Controller/widgets/text-form-field.dart';
import 'package:architecture/View/auth-view/signupview/signup.dart';
import 'package:architecture/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child:
         Stack(
           children: [
             Column(
              children:[
               BlackTextHeading(text: 'Welcome Back!'),
                SizedBox(height:50,),
                ImageWidget(image: AppImages.signinImg),
                SizedBox(height: 30,),
                TextFormFieldWidget(hintText:'Enter your email Address', controller: emailAddressController),
                PasswordField(hintText: 'Create a password', controller2: confirmpasswordController),
                //TextFormFieldWidget(hintText: ' Confirm password', controller: confirmpasswordController,
                SizedBox(height: 20,),
                NormalTextWidget(text: 'Forgot password?', textColor: AppColors.primaryColor),
                SizedBox(height: 20,),
                isLoading?AppLoader(): ButtonWidget(text: 'Sign In', ontap: ()async{
                  isLoading=true;
                  setState(() {

                  });
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddressController.text.trim(),
                      password: confirmpasswordController.text).then((onValue){
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>ContainerClass()));
                  }).onError((handleError,value){});
                }),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalTextWidget(text: 'Dont have an account?', textColor:AppColors.blackColor),
                    SizedBox(width: 5,),
                    InkWell(
                        onTap: (){
                          Get.to(()=>SignupView());
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
                        },
                        child: NormalTextWidget(text: 'Sign Up', textColor:AppColors.primaryColor)),
                  ],
                )

              ]
                     ),
             Container(
               height: 100,
               width: 200,
               decoration: BoxDecoration(
                 color: Colors.teal.withOpacity(0.5),
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(200),
                   bottomRight: Radius.circular(200),
                 ),
               ),
             ),
             Container(
               height: 200,
               width: 100,
               decoration: BoxDecoration(
                 color: Colors.teal.withOpacity(0.5),
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(200),
                   bottomRight: Radius.circular(200),
                 ),
               ),
             ),
           ],
         )
      )
    );
  }
}

