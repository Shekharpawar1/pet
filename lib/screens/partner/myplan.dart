


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/screens/partner/widget/wholeAppBar.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({super.key});

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
    final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar:CustomAppBarPartnerback(title: "My Plan" ,),

body:
ListView(
  shrinkWrap: true,
  primary: true,
  children: [


Container(

 margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
           decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            gradient: LinearGradient(

                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFEEEEFF),
                                                Color.fromRGBO(238, 238, 255, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                          ),
       


  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [



Text( "Plan Name : "+storage.read('planname').toString()),
SizedBox(height: 5,),

Text( "Plan Price : "+storage.read('planprice').toString()),
SizedBox(height: 5,),

Text( "plan Purchase Date : "+storage.read('planpurchase').toString()),
SizedBox(height: 5,),

Text( "plan Expirey Date : "+storage.read('planexpirey').toString()),

  ]),
)

  ],
)

    );
  }
}