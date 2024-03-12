import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myservices_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class MyServiceDetails extends StatelessWidget {
   MyServiceDetails({super.key,required this.id,required this.mobile,required this.slot,required this.petname,required this.city, required this.date,required this.status});
  int? id;
  String? petname;
  String? date;
  String? city;
  String? status;
  String? slot;
  String? mobile;
// MyServicesController myservicescontroller = Get.put(MyServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:CustomAppBarback(title:"Service Details"),
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
                Column(
                  children: [
                    Text(
                      "$id",
                      style: CustomTextStyle.popinsmedium,
                    ),
                     Text(
                  "$status",
                  style:(status == "pending")?
                   CustomTextStyle.popinsmediumorange:CustomTextStyle.popinsmediumgreen,
                ),
                  ],
                ),
              ],
            ),
            Text(
              "Pet Name: ${petname}",
              style: CustomTextStyle.popinsmedium,
            ),
             Text(
              "slot: ${slot}",
              style: CustomTextStyle.popinssmall0,
            ),
            Text(
              "Mobile Number: ${mobile}",
              style: CustomTextStyle.popinssmall0,
            ),
              Text(
              "city: ${city}",
              style: CustomTextStyle.popinssmall0,
            ),
          ],
        ),
      )
    // })
    );
  }
}