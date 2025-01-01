import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/constants/apploader/app-loader.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/button-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth-view/signupview/signup.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,//Color(0xff55847A),
      body:Center(
        child:
        Column(
          children: [
            //Image(image:AssetImage(AppImages.splashImg ),
            //height: 254,),
            SizedBox(height: 50,),
            ImageWidget(image: AppImages.splashImg),
            SizedBox(height: 10,),
           BlackTextHeading(text:'Get things done with TODo'),
            SizedBox(height: 30,),
           //SpinKitCircle(
             //color: AppColors.primaryColor,
           //),
            AppLoader(),
            ButtonWidget(text:'Get started', ontap: () async {
              await FirebaseAuth.instance.currentUser
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));

            })

          ],
        ),
      ),
    );
  }
}
