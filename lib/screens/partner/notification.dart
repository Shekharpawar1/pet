import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/controllers/partner_controller/notification_controller.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationPartner extends StatefulWidget {
  const NotificationPartner({super.key});

  @override
  State<NotificationPartner> createState() => _NotificationPartnerState();
}

class _NotificationPartnerState extends State<NotificationPartner> {
  PartnerNotificationController partnernotificationcontroller = PartnerNotificationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
           appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:15.0,top: 15,bottom: 15),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },child:Icon(Icons.arrow_left,color:MyColors.black)
            ),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child:Text("Notification",style: TextStyle(fontSize: 16,color: MyColors.black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),
           
            // SizedBox(width: 20),
            Padding(
              padding:  EdgeInsets.only(right:20.0),
              child: SvgPicture.asset("assets/image/notification.svg"),
              //  Image.asset("assets/image/girl.png"),
            ),
           
          ],
         
        ),

body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          primary: true,
          shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          children: [
            GetBuilder<PartnerNotificationController>(
                init: partnernotificationcontroller,
                builder: (_) {
                  return partnernotificationcontroller.salesNotificationModel == null
                      ? SizedBox()
                      : ListView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: partnernotificationcontroller
                              .salesNotificationModel!.state!.length,
                          itemBuilder: (context, index) {
                            var item = partnernotificationcontroller
                                .salesNotificationModel!.state![index];
                            // print(item.name!);
                            var imagePath =
                                "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                            return Column(
                              children: [
                                Container(
                                    width: 335,
                                    height: 71,
                                    decoration: BoxDecoration(
                                        color: MyColors.lightpurple,
                                        borderRadius:
                                            BorderRadius.circular(16.567)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              // Image.asset(item["image"],
                                              //     height: 30),
                                              CachedNetworkImage(
                                                imageUrl: imagePath,
                                                width: 50,
                                                height: 50,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ), // Replace with your own placeholder widget
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Icon(Icons
                                                        .error), // Replace with your own error widget
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    // width:
                                                    //     MediaQuery.of(context)
                                                    //             .size
                                                    //             .width *
                                                    //         0.58,
                                                    child: Text(
                                                      item.title!,
                                                      style: CustomTextStyle
                                                          .popinssmall014,
                                                    ),
                                                  ),
                                                  Text(
                                                    item.description!.length >
                                                            36
                                                        ? item.description!
                                                            .substring(0, 35)
                                                        : item.description!,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyle
                                                        .popinssmall01,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Column(
                                          //   // mainAxisAlignment:
                                          //   // MainAxisAlignment.end,
                                          //   children: [
                                          //     Text(
                                          //       item.description!,
                                          //       textAlign: TextAlign.center,
                                          //       style:
                                          //           CustomTextStyle.popinssmall01,
                                          //     )
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                            //  ,SizedBox(height:15 ,),
                          },
                        );
                }),
          ],
        ),
      ),
   );
  }
}