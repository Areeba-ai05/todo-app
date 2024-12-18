import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-icons/app-icons.dart';

import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(children: [
        Column(
          children: [
            Container(
                  height: 400,
                  width: double.infinity,
                  color: AppColors.primaryColor,
                ),
          ],
        ),
      Container(
        height:100,
        width: 200,
        decoration: BoxDecoration(
          color:Colors.teal.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            //topRight: Radius.circular(200),
            bottomLeft: Radius.circular(200),
            bottomRight:Radius.circular(200),
            //topLeft: Radius.circular(10),
          )
        ),
      ),
        Container(
          height:200,
          width: 100,
          decoration: BoxDecoration(
              color:Colors.teal.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(200),
                //bottomLeft: Radius.circular(200),
                bottomRight:Radius.circular(200),
                //topLeft: Radius.circular(10),

              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 8.0),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: ImageIcon(AssetImage(AppIcons.backArrowIcon),
            size:50,
            ),
          ),
        )

      ]
      ),
    );
  }
}
