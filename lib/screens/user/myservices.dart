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
myservicescontroller.init();
    return Scaffold(
   appBar:CustomAppBarback(title:"My Services"),
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
        margin: EdgeInsets.only(left:10,right: 10,bottom:10),
        padding: EdgeInsets.only(left:10,bottom:10),
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
                                         
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                      //alignment: Alignment.topRight,
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.05,
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.3,
                                                      decoration: BoxDecoration(
                                                          color:(item.status == "pending")?
                   MyColors.orange: MyColors.green,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(25),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20))),
                                                      child: Center(
                                                          child: Text(
                                                           "${item.status.toString()}",
                                                        style: CustomTextStyle
                                                            .popinstextsmall12,
                                                      )),
                                                    ),
                                                  ),
                                                ],
               
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [

                    Text(
                      "${item.date.toString()}",
                      style: CustomTextStyle.popinsmedium,
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