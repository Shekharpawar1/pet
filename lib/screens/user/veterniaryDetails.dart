import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
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

     appBar:CustomAppBarback(title:"Veterniary Details"),
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