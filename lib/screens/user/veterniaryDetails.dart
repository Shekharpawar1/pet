import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
// import 'package:pet/screens/user/veterniaryDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class VeterniaryDetails extends StatelessWidget {
   VeterniaryDetails({super.key,
   required this.id,required this.phone,required this.petId,required this.name,required this.city, required this.date,required this.petProblem,
   required this.address,required this.email,required this.state,
   });
 int? id;
  String? petId;
  String? date;
  String? state;
    String? city;
  String? address;
  String? name;
  String? email;
  String? petProblem;
  String? phone;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left, color: MyColors.black)),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
              child: Text(
            "Veterniary",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
         actions: [
        

                  
          Stack(
            children: [
              InkWell(
                  onTap: () {
                     Get.to(NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
                SizedBox(width: 20),
 Stack(
            children: [
              InkWell(
                  onTap: () {
                      Get.to(AddToCardUser());
                   
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
    
        ], 
        ),

       body:

                   Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$date",
                  style: CustomTextStyle.popinsmedium,
                ),
                
              ],
            ),
            Text(
              "User Name: ${name}",
              style: CustomTextStyle.popinsmedium,
            ),
             Text(
              "Pet ID: ${petId}",
              style: CustomTextStyle.popinssmallnormal,
            ),
             Text(
              "Email: ${email}",
              style: CustomTextStyle.popinssmallnormal,
            ),
            Text(
              "Mobile Number: ${phone}",
              style: CustomTextStyle.popinssmallnormal,
            ),
                 Text(
                "state: ${state}"+ ", "+"city: ${city}",
              style: CustomTextStyle.popinssmallnormal,
            ),
             Text(
              "Address: ${address}",
              style: CustomTextStyle.popinssmallnormal,
            ),
          ],
        ),
      )
   

    );
  }
}