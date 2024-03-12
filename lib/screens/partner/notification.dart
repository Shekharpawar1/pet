import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/controllers/partner_controller/notification_controller.dart';
import 'package:pet/screens/partner/widget/wholeAppBar.dart';
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
 PartnerNotificationController partnernotificationcontroller = Get.put(PartnerNotificationController()) ;
 
    @override
  void onInit() {
  
    partnernotificationcontroller.init();   
  }
  @override
  Widget build(BuildContext context) {
    // partnernotificationcontroller.init();
    return Scaffold(
      
         appBar: CustomAppBarPartnerback(title:"Notification"), 
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
                    return 
                    partnernotificationcontroller.partnerNotificationModel == null
                        ? const SizedBox()
                        : 
                        ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: partnernotificationcontroller
                                .partnerNotificationModel!.state!.length ,
                            itemBuilder: (context, index) {
                             
                              var item = partnernotificationcontroller
                                  .partnerNotificationModel!.state![partnernotificationcontroller
                                .partnerNotificationModel!.state!.length- 1-index];
                              // print(item.name!);
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                              //  notificationcontroller.notifyinit();
                                                                }  ,
                                    child: Container(
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
                                                MainAxisAlignment.start,
                                            children: [
                                               Row( mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  // Image.asset(item["image"],
                                                  //     height: 30),
                                                  CachedNetworkImage(
                                                    imageUrl: imagePath,
                                                    width: 50,
                                                    height: 50,
                                                    placeholder: (context, url) =>
                                                       const  Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ), // Replace with your own placeholder widget
                                                    errorWidget: (context, url,
                                                            error) =>
                                                       const  Icon(Icons
                                                            .error), // Replace with your own error widget
                                                  ),
                                                 const  SizedBox(
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
//                                              Spacer(),
//                                               InkWell(
// onTap: (){


                                            
    
//    showDialog(
//               context: context,
//               builder: (BuildContext context) {
//           return  BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    
//             child: AlertDialog(
//                   // title: Text("Simple Popup"),
//                   content:    Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Delete Notification',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 18.0),
//           Text('Are you sure you want to delete this notification?'),
//           // SizedBox(height: 16.0),
//          ],
//       ),
//     ),
//                   actions: [Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   // Close the dialog
//                   Get.back();
//                 },
//                 child: Text('Cancel'),
//               ),
//               SizedBox(width: 16.0),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Colors.red),
//                 ),
//                 onPressed: () async {
//                   // Call the order cancellation function from the controller
//                   // Replace `cancelOrder` with the actual function in your controller to cancel the order
//                   // controller.cancelOrder();

//                   // Close the dialog
                  
// notificationcontroller.itemView(item.id??0);
//   //  await notificationcontroller.notifydeleteinit();
//       //  Get.to(ProductDetails(
//       //   id: item.id??0,
//       //  ));
//        print("ItemId==${item.id}");
//                               await notificationcontroller.notifydeleteinit();
                              
//                   Get.back();
//                   // Get.dialog(OrderCancellationReasonsDialog());
//                 },
//                 child: Text('Delete'),
//               ),
//             ],
//           ),
//        ]
                    
//             //       <Widget>[
//             //         ElevatedButton(
//             // child: const Text("Close"),
//             // onPressed: () {
//             //   Navigator.of(context).pop(); // Close the popup
//             // },
//             //         ),
//             //       ],
//                 ),
//           );
//                                     });
                                 
// },
//                                                 child: Icon(Icons.delete_outline_outlined)),
                                             
                                             
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
                                  ),
                                const   SizedBox(
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