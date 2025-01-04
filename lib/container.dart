// import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
// import 'package:architecture/Controller/constants/app-icons/app-icons.dart';
// import 'package:architecture/Controller/constants/app-images/app-images.dart';
// import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
// import 'package:architecture/Controller/widgets/image-widget.dart';
// //import 'package:architecture/Controller/widgets/normal-text-widget.dart';
// //import 'package:architecture/Controller/widgets/text-form-field.dart';
// import 'package:architecture/Controller/widgets/todo-task%20widget.dart';
// import 'package:architecture/View/auth-view/signupview/signup.dart';
// import 'package:architecture/View/home-view/insert-data/insert-data.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:flutter/material.dart';
//
// class ContainerClass extends StatelessWidget {
//   const ContainerClass({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Navigator.push(context, CupertinoDialogRoute(builder: (context)=>InsertDataScreen(), context:context));
//       },backgroundColor: AppColors.primaryColor,child: Icon(Icons.add,color:AppColors.whiteColor),),
//       body:
//           Stack(children: [
//              Column(
//                children: [
//                  Container(
//                        height: 300,
//                        width: double.infinity,
//                        color: AppColors.primaryColor,
//                    child: Column(
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.only(top:100.0),
//                          child: Container(
//                            height: 119,
//                            width: 121,
//                            child: CircleAvatar(
//                             child: ImageWidget(image: AppImages.homeImg),
//                            ),
//                          ),
//                        ),
//                        SizedBox(height:30),
//                        BlackTextHeading(text: 'Welcome Mr.Khan'),
//                      ],
//                    ),
//                      ),
//                  Container(
//                    child: Column(children: [
//                     //  SizedBox(height: 30,),
//                     // // ImageWidget(image: AppImages.homeScreenImg),
//                     //  SizedBox(height: 30,),
//                   Row(
//                     mainAxisAlignment:MainAxisAlignment.start,
//                     children: [
//                     BlackTextHeading(text:'Todo Tasks.'),
//                     ],
//                   ),
//                      SizedBox(height: 20,),
//                      Container(
//                        child: Expanded(child:
//                        StreamBuilder(
//                          stream: FirebaseFirestore.instance.collection('Test').snapshots(),
//                          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
//                            final data =snapshot.data!.docs;
//                            return ListView.builder(
//                              itemCount: data.length,
//                              itemBuilder:(context,index){
//                                return ListTile(
//                                  title: Text(data [index]['enterTask']),
//                                );
//                              },
//                            );
//                          },
//                        )),
//                      )
//                    ],),
//                  )
//                ],
//              ),
//            Container(
//              height:100,
//              width: 200,
//              decoration: BoxDecoration(
//                color:Colors.teal.withOpacity(0.5),
//                borderRadius: BorderRadius.only(
//                  //topRight: Radius.circular(200),
//                  bottomLeft: Radius.circular(200),
//                  bottomRight:Radius.circular(200),
//                  //topLeft: Radius.circular(10),
//                )
//              ),
//            ),
//              Container(
//                height:200,
//                width: 100,
//                decoration: BoxDecoration(
//                    color:Colors.teal.withOpacity(0.5),
//                    borderRadius: BorderRadius.only(
//                      topRight: Radius.circular(200),
//                      //bottomLeft: Radius.circular(200),
//                      bottomRight:Radius.circular(200),
//                      //topLeft: Radius.circular(10),
//
//                    )
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: [
//                    InkWell(
//                      onTap: (){
//                        Navigator.pop(context);
//                      },
//                      child: ImageIcon(AssetImage(AppIcons.backArrowIcon),
//                      size:50,
//                      ),
//                    ),
//                    IconButton(onPressed:()async{
//                      await FirebaseAuth.instance.signOut();
//                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>SignupView()));
//                    } ,icon:Icon(Icons.logout) ,)
//                  ],
//                ),
//              ),
//            ],
//            ),);
//   }
// }
import 'package:architecture/Controller/constants/app-colors/app-colors.dart';
import 'package:architecture/Controller/constants/app-icons/app-icons.dart';
import 'package:architecture/Controller/constants/app-images/app-images.dart';
import 'package:architecture/Controller/widgets/blacktext-heading-widget.dart';
import 'package:architecture/Controller/widgets/image-widget.dart';
import 'package:architecture/Controller/widgets/todo-task%20widget.dart';
import 'package:architecture/View/auth-view/signupview/signup.dart';
import 'package:architecture/View/home-view/insert-data/insert-data.dart';
import 'package:architecture/View/home-view/update-data/update-data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoDialogRoute(builder: (context) => InsertDataScreen(), context: context),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        height: 119,
                        width: 121,
                        child: CircleAvatar(
                          child: ImageWidget(image: AppImages.homeImg),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    BlackTextHeading(text: 'Welcome Mr.Khan'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlackTextHeading(text: 'Todo Tasks.'),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 240, // Set a fixed height for the task list
                width: 339,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.whiteColor,
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final data = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap:(){
                              Navigator.push(context, CupertinoDialogRoute(builder: (context)=>UpdateDataScreen(docid: data[index]['docid'],), context: context));
                            },
                            onLongPress: ()async{
                             await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).doc(data[index]['docid']).delete();
                            },
                            title: Text(data[index]['enterTask']),
                            subtitle: Text(data[index]['taskDescription']),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 100,
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
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ImageIcon(
                    AssetImage(AppIcons.backArrowIcon),
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
