import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myservices_controller.dart';
import 'package:pet/screens/user/myservicedetails.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class Myservices extends StatelessWidget {
   Myservices({super.key});

MyServicesController myservicescontroller = Get.put(MyServicesController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
   appBar:CustomAppBarback(),
body: Padding(
  padding: const EdgeInsets.all(15.0),
  child:   GetBuilder<MyServicesController>(
           init: myservicescontroller,
           builder: (_) {
             return
   !myservicescontroller.myservicesLoaded
                            ? SizedBox()
   :
  ListView.builder(
  shrinkWrap: true,
  primary: false,
  itemCount: myservicescontroller.myservicesmodel!.data!.length,
  itemBuilder: (context, index) {
    var item = myservicescontroller.myservicesmodel!.data![index];

    return GestureDetector(
      onTap: (){
        Get.to(MyServiceDetails(
          id:item.id??0,
          city: item.city??'',
          date: item.date??'',
          status: item.status??'',
          petname: item.pet??'',
          slot:item.slot??'',
          mobile: item.mobile??"",

        ));
      },
      child: Container(
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
                      "${item.date.toString()}",
                      style: CustomTextStyle.popinsmedium,
                    ),
                     Text(
                  "${item.status.toString()}",
                  style:(item.status == "pending")?
                   CustomTextStyle.popinsmediumorange:CustomTextStyle.popinsmediumgreen,
                ),
                  ],
                ),
              ],
            ),
            Text(
              "Pet Name: ${item.pet.toString()}",
              style: CustomTextStyle.popinsmedium,
            ),
             Text(
              "slot: ${item.slot.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
            Text(
              "Mobile Number: ${item.mobile.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
              Text(
              "city: ${item.city.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
          ],
        ),
      ),
    );
  },
);
      }),
)
    );
  }
}