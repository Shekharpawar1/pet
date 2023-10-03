import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class NotificationUser extends StatefulWidget {
  const NotificationUser({super.key});

  @override
  State<NotificationUser> createState() => _NotificationUserState();
}

class _NotificationUserState extends State<NotificationUser> {
  NotificationController notificationcontroller =
      Get.put(NotificationController());
    bool isBrandExpanded = false; // Initially, the panel is collapsed

  List<String> filterOptions = ["Option 1", "Option 2"]; // Your filter options

  Set<String> selectedBrandOptions = <String>{}; // Store selected options

  void toggleBrandExpansion() {
    setState(() {
      isBrandExpanded = !isBrandExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    notificationcontroller.notifyinit();
    return 
       DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back,color:Colors.black),
          title: const Center(child: Text('Notification',style:TextStyle(color: Colors.black,fontSize: 18))),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Public',),
                 Tab(text: 'for you'),
        //       ExpansionPanelList(
        //   elevation: 1,
        //   expandedHeaderPadding: EdgeInsets.all(0),
        //   expansionCallback: (int index, bool isExpanded) {
        //     toggleBrandExpansion();
        //   },
        //   children: [
        //     ExpansionPanel(
        //       headerBuilder: (BuildContext context, bool isExpanded) {
        //         return ListTile(
        //           title: Text("Brand"),
        //         );
        //       },
        //       body: ListView.builder(
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemCount: filterOptions.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           final filterOption = filterOptions[index];
        //           return CheckboxListTile(
        //             value: selectedBrandOptions.contains(filterOption),
        //             onChanged: (isChecked) {
        //               if (isChecked!) {
        //                 print("Adding brand");
        //                 selectedBrandOptions.add(filterOption);
        //               } else {
        //                 print("Removing brand");
        //                 selectedBrandOptions.remove(filterOption);
        //               }
        //               // Perform any filtering logic here
        //               // filter();
        //               setState(() {});
        //             },
        //             title: Text(filterOption),
        //           );
        //         },
        //       ),
        //       isExpanded: isBrandExpanded,
        //     ),
        //   ],
        // ),
      
            ],
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBarView(
            children: [
              // Content for Tab 1
             GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return notificationcontroller.userNotificationModel == null
                        ? const SizedBox()
                        : ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: notificationcontroller
                                .userNotificationModel!.state!.length,
                            itemBuilder: (context, index) {
                              var item = notificationcontroller
                                  .userNotificationModel!.state![index];
                              // print(item.name!);
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                               notificationcontroller.notifyinit();
                                 showDialog(
              context: context,
              builder: (BuildContext context) {
          return GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return notificationcontroller.userNotifyListModel == null
                        ? const SizedBox()
                        : AlertDialog(
                // title: Text("Simple Popup"),
                content: const Text(''),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                  ),
                ],
              );
            }
          );
                                    });
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
             
             
              // ExpansionPanelList(
              //     elevation: 1,
              //     expandedHeaderPadding: EdgeInsets.all(0),
              //     expansionCallback: (int index, bool isExpanded) {
              //       toggleBrandExpansion();
              //     },
              //     children: [
              //       ExpansionPanel(
              //         headerBuilder: (BuildContext context, bool isExpanded) {
              //           return ListTile(
              //             title: Text("Brand"),
              //           );
              //         },
              //         body: ListView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: filterOptions.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             final filterOption = filterOptions[index];
              //             return CheckboxListTile(
              //               value: selectedBrandOptions.contains(filterOption),
              //               onChanged: (isChecked) {
              //                 if (isChecked!) {
              //                   print("Adding brand");
              //                   selectedBrandOptions.add(filterOption);
              //                 } else {
              //                   print("Removing brand");
              //                   selectedBrandOptions.remove(filterOption);
              //                 }
              //                 // Perform any filtering logic here
              //                 // filter();
              //                 setState(() {});
              //               },
              //               title: Text(filterOption),
              //             );
              //           },
              //         ),
              //         isExpanded: isBrandExpanded,
              //       ),
              //     ],
              //   ),
              
              // Content for Tab 2
                GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return
                     notificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.data == null? const Text("No data Found"):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: notificationcontroller
                                .userNotifyListModel!.data!.length,
                            itemBuilder: (context, index) {
                              var item = notificationcontroller
                                  .userNotifyListModel!.data![index];
                              // print(item.name!);
                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return
                              notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.data == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
notificationcontroller.itemView(item.id??0);
       Get.to(ProductDetails(
        id: item.id??0,
       ));
       print(item.id);
                              await notificationcontroller.notifydeleteinit();
                        
              //                          showDialog(
              // context: context,
              // builder: (BuildContext context) {
              //   return GetBuilder<NotificationController>(
              //           init: notificationcontroller,
              //           builder: (_) {
              //             return notificationcontroller.userNotifyListModel == null
              //                 ? SizedBox()
              //                 : AlertDialog(
              //         // title: Text("Simple Popup"),
              //         content: Text(''),
              //         actions: <Widget>[
              //           ElevatedButton(
              //             child: Text("Close"),
              //             onPressed: () {
              //               Navigator.of(context).pop(); // Close the popup
              //             },
              //           ),
              //         ],
              //       );
              //     }
              //   );
              //                             });
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  // Image.asset(item["image"],
                                                  //     height: 30),
                                                  // CachedNetworkImage(
                                                  //   imageUrl: imagePath,
                                                  //   width: 50,
                                                  //   height: 50,
                                                  //   placeholder: (context, url) =>
                                                  //       Center(
                                                  //     child:
                                                  //         CircularProgressIndicator(),
                                                  //   ), // Replace with your own placeholder widget
                                                  //   errorWidget: (context, url,
                                                  //           error) =>
                                                  //       Icon(Icons
                                                  //           .error), // Replace with your own error widget
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 10,
                                                  // ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                     Text(
                                                         "Order Id : "+ (item.orderId??0).toString(),
                                                          style: CustomTextStyle
                                                              .popinssmall014,
                                                        ),
                                                     
                                                      Text(
                                                         "Order status : "+( item.orderStatus??'').toString(),
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStyle
                                                            .popinssmall01,
                                                      ),
        
        
                                                       Row(
                                                         children: [
                                                           Text(
                                                           "Stock : "+( item.stock??0).toString(),
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStyle
                                                                .popinssmall01,
                                                      ),
        SizedBox(width: 15,)
        ,                                                    Text(
                                                          "Variation : "+ ( item.variation??"").toString(),
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStyle
                                                                .popinssmall01,
                                                      ),
                                                         ],
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
                                  ),
                                 const  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                              //  ,SizedBox(height:15 ,),
                            },
                          );
                  }),
      
      
          ]),
        )
          
        ),
      
    );


//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_left, color: MyColors.black)),
//         ),
//         title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child: Text(
//           "Notification",
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         )),
//         // actions: [
//         //   //  SvgPicture.asset("assets/image/girl.svg"),

//         //   // SizedBox(width: 20),
//         //   Padding(
//         //     padding: EdgeInsets.only(right: 20.0),
//         //     child: SvgPicture.asset("assets/image/notification.svg"),
//         //     //  Image.asset("assets/image/girl.png"),
//         //   ),
//         // ],
//       ),
    
    
    
    
    
      // body: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: ListView(
      //     primary: true,
      //     shrinkWrap: true,
      //     // scrollDirection: Axis.vertical,
      //     children: [
      // //       GetBuilder<NotificationController>(
      // //           init: notificationcontroller,
      // //           builder: (_) {
      // //             return notificationcontroller.userNotificationModel == null
      // //                 ? SizedBox()
      // //                 : ListView.builder(
      // //                     primary: false,
      // //                     scrollDirection: Axis.vertical,
      // //                     shrinkWrap: true,
      // //                     itemCount: notificationcontroller
      // //                         .userNotificationModel!.state!.length,
      // //                     itemBuilder: (context, index) {
      // //                       var item = notificationcontroller
      // //                           .userNotificationModel!.state![index];
      // //                       // print(item.name!);
      // //                       var imagePath =
      // //                           "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
      // //                       return Column(
      // //                         children: [
      // //                           InkWell(
      // //                             onTap: () {
      // //                        notificationcontroller.notifyinit();
      // //                          showDialog(
      // // context: context,
      // // builder: (BuildContext context) {
      // //   return GetBuilder<NotificationController>(
      // //           init: notificationcontroller,
      // //           builder: (_) {
      // //             return notificationcontroller.userNotifyListModel == null
      // //                 ? SizedBox()
      // //                 : AlertDialog(
      // //         // title: Text("Simple Popup"),
      // //         content: Text(''),
      // //         actions: <Widget>[
      // //           ElevatedButton(
      // //             child: Text("Close"),
      // //             onPressed: () {
      // //               Navigator.of(context).pop(); // Close the popup
      // //             },
      // //           ),
      // //         ],
      // //       );
      // //     }
      // //   );
      // //                             });
      // //                                                          }  ,
      // //                             child: Container(
      // //                                 width: 335,
      // //                                 height: 71,
      // //                                 decoration: BoxDecoration(
      // //                                     color: MyColors.lightpurple,
      // //                                     borderRadius:
      // //                                         BorderRadius.circular(16.567)),
      // //                                 child: Padding(
      // //                                   padding: const EdgeInsets.all(10.0),
      // //                                   child: Row(
      // //                                     mainAxisAlignment:
      // //                                         MainAxisAlignment.spaceBetween,
      // //                                     children: [
      // //                                       Row(
      // //                                         children: [
      // //                                           // Image.asset(item["image"],
      // //                                           //     height: 30),
      // //                                           CachedNetworkImage(
      // //                                             imageUrl: imagePath,
      // //                                             width: 50,
      // //                                             height: 50,
      // //                                             placeholder: (context, url) =>
      // //                                                 Center(
      // //                                               child:
      // //                                                   CircularProgressIndicator(),
      // //                                             ), // Replace with your own placeholder widget
      // //                                             errorWidget: (context, url,
      // //                                                     error) =>
      // //                                                 Icon(Icons
      // //                                                     .error), // Replace with your own error widget
      // //                                           ),
      // //                                           SizedBox(
      // //                                             width: 10,
      // //                                           ),
      // //                                           Column(
      // //                                             mainAxisAlignment:
      // //                                                 MainAxisAlignment.start,
      // //                                             crossAxisAlignment:
      // //                                                 CrossAxisAlignment.start,
      // //                                             children: [
      // //                                               SizedBox(
      // //                                                 // width:
      // //                                                 //     MediaQuery.of(context)
      // //                                                 //             .size
      // //                                                 //             .width *
      // //                                                 //         0.58,
      // //                                                 child: Text(
      // //                                                   item.title!,
      // //                                                   style: CustomTextStyle
      // //                                                       .popinssmall014,
      // //                                                 ),
      // //                                               ),
      // //                                               Text(
      // //                                                 item.description!.length >
      // //                                                         36
      // //                                                     ? item.description!
      // //                                                         .substring(0, 35)
      // //                                                     : item.description!,
      // //                                                 textAlign: TextAlign.center,
      // //                                                 style: CustomTextStyle
      // //                                                     .popinssmall01,
      // //                                               )
      // //                                             ],
      // //                                           ),
      // //                                         ],
      // //                                       ),
      // //                                       // Column(
      // //                                       //   // mainAxisAlignment:
      // //                                       //   // MainAxisAlignment.end,
      // //                                       //   children: [
      // //                                       //     Text(
      // //                                       //       item.description!,
      // //                                       //       textAlign: TextAlign.center,
      // //                                       //       style:
      // //                                       //           CustomTextStyle.popinssmall01,
      // //                                       //     )
      // //                                       //   ],
      // //                                       // ),
      // //                                     ],
      // //                                   ),
      // //                                 )),
      // //                           ),
      // //                           SizedBox(
      // //                             height: 15,
      // //                           ),
      // //                         ],
      // //                       );
      // //                       //  ,SizedBox(height:15 ,),
      // //                     },
      // //                   );
      // //           }),
      // //    SizedBox(height: 10,),
      //   //  Text("Stock"),
      // //     GetBuilder<NotificationController>(
      // //           init: notificationcontroller,
      // //           builder: (_) {
      // //             return
      // //              notificationcontroller.notifiyLoaded == null
      // //                 ? SizedBox()
      // //                 :
      // //                  ListView.builder(
      // //                     primary: false,
      // //                     scrollDirection: Axis.vertical,
      // //                     shrinkWrap: true,
      // //                     itemCount: notificationcontroller
      // //                         .userNotifyListModel!.data!.length,
      // //                     itemBuilder: (context, index) {
      // //                       var item = notificationcontroller
      // //                           .userNotifyListModel!.data![index];
      // //                       // print(item.name!);
      // //                       // var imagePath =
      // //                       //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
      // //                       return
      // //                        notificationcontroller
      // //                           .userNotifyListModel!.data == null? SizedBox():
      // //                        Column(
      // //                         children: [
      // //                           InkWell(
      // //                             onTap: () {
      // //                       //  notificationcontroller.notifyinit();
      // // //                          showDialog(
      // // // context: context,
      // // // builder: (BuildContext context) {
      // // //   return GetBuilder<NotificationController>(
      // // //           init: notificationcontroller,
      // // //           builder: (_) {
      // // //             return notificationcontroller.userNotifyListModel == null
      // // //                 ? SizedBox()
      // // //                 : AlertDialog(
      // // //         // title: Text("Simple Popup"),
      // // //         content: Text(''),
      // // //         actions: <Widget>[
      // // //           ElevatedButton(
      // // //             child: Text("Close"),
      // // //             onPressed: () {
      // // //               Navigator.of(context).pop(); // Close the popup
      // // //             },
      // // //           ),
      // // //         ],
      // // //       );
      // // //     }
      // // //   );
      // // //                             });
      // //                                                          }  ,
      // //                             child: Container(
      // //                                 width: 335,
      // //                                 height: 71,
      // //                                 decoration: BoxDecoration(
      // //                                     color: MyColors.lightpurple,
      // //                                     borderRadius:
      // //                                         BorderRadius.circular(16.567)),
      // //                                 child: Padding(
      // //                                   padding: const EdgeInsets.all(10.0),
      // //                                   child: Row(
      // //                                     mainAxisAlignment:
      // //                                         MainAxisAlignment.spaceBetween,
      // //                                     children: [
      // //                                       Row(
      // //                                         children: [
      // //                                           // Image.asset(item["image"],
      // //                                           //     height: 30),
      // //                                           // CachedNetworkImage(
      // //                                           //   imageUrl: imagePath,
      // //                                           //   width: 50,
      // //                                           //   height: 50,
      // //                                           //   placeholder: (context, url) =>
      // //                                           //       Center(
      // //                                           //     child:
      // //                                           //         CircularProgressIndicator(),
      // //                                           //   ), // Replace with your own placeholder widget
      // //                                           //   errorWidget: (context, url,
      // //                                           //           error) =>
      // //                                           //       Icon(Icons
      // //                                           //           .error), // Replace with your own error widget
      // //                                           // ),
      // //                                           // SizedBox(
      // //                                           //   width: 10,
      // //                                           // ),
      // //                                           Column(
      // //                                             mainAxisAlignment:
      // //                                                 MainAxisAlignment.start,
      // //                                             crossAxisAlignment:
      // //                                                 CrossAxisAlignment.start,
      // //                                             children: [
      // //                                             //  Text(
      // //                                             //       (item.orderId??0).toString(),
      // //                                             //       style: CustomTextStyle
      // //                                             //           .popinssmall014,
      // //                                             //     ),
                                                   
      // //                                               // Text(
      // //                                               //  ( item.orderStatus??'').toString(),
      // //                                               //   textAlign: TextAlign.center,
      // //                                               //   style: CustomTextStyle
      // //                                               //       .popinssmall01,
      // //                                               // ),


      // //                                               //  Text(
      // //                                               //  ( item.stock??0).toString(),
      // //                                               //   textAlign: TextAlign.center,
      // //                                               //   style: CustomTextStyle
      // //                                               //       .popinssmall01,
      // //                                               // ),

      // //                                               // Text(
      // //                                               //  ( item.variation??"").toString(),
      // //                                               //   textAlign: TextAlign.center,
      // //                                               //   style: CustomTextStyle
      // //                                               //       .popinssmall01,
      // //                                               // )
      // //                                             ],
      // //                                           ),
      // //                                         ],
      // //                                       ),
      // //                                       // Column(
      // //                                       //   // mainAxisAlignment:
      // //                                       //   // MainAxisAlignment.end,
      // //                                       //   children: [
      // //                                       //     Text(
      // //                                       //       item.description!,
      // //                                       //       textAlign: TextAlign.center,
      // //                                       //       style:
      // //                                       //           CustomTextStyle.popinssmall01,
      // //                                       //     )
      // //                                       //   ],
      // //                                       // ),
      // //                                     ],
      // //                                   ),
      // //                                 )),
      // //                           ),
      // //                           SizedBox(
      // //                             height: 15,
      // //                           ),
      // //                         ],
      // //                       );
      // //                       //  ,SizedBox(height:15 ,),
      // //                     },
      // //                   );
      // //           }),
    
    
      // //    Text("Order"),
      // //       GetBuilder<NotificationController>(
      // //           init: notificationcontroller,
      // //           builder: (_) {
      // //             return
      // //             //  notificationcontroller.user == null
      // //             //     ? SizedBox()
      // //                 // :
      // //                  ListView.builder(
      // //                     primary: false,
      // //                     scrollDirection: Axis.vertical,
      // //                     shrinkWrap: true,
      // //                     itemCount: notificationcontroller
      // //                         .userNotifyListModel!.data!.length,
      // //                     itemBuilder: (context, index) {
      // //                       var item = notificationcontroller
      // //                           .userNotifyListModel!.stockData![index];
      // //                       // print(item.name!);
      // //                       // var imagePath =
      // //                       //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
      // //                       return Column(
      // //                         children: [
      // //                           InkWell(
      // //                             onTap: () {
      // //                       //  notificationcontroller.notifyinit();
      // // //                          showDialog(
      // // // context: context,
      // // // builder: (BuildContext context) {
      // // //   return GetBuilder<NotificationController>(
      // // //           init: notificationcontroller,
      // // //           builder: (_) {
      // // //             return notificationcontroller.userNotifyListModel == null
      // // //                 ? SizedBox()
      // // //                 : AlertDialog(
      // // //         // title: Text("Simple Popup"),
      // // //         content: Text(''),
      // // //         actions: <Widget>[
      // // //           ElevatedButton(
      // // //             child: Text("Close"),
      // // //             onPressed: () {
      // // //               Navigator.of(context).pop(); // Close the popup
      // // //             },
      // // //           ),
      // // //         ],
      // // //       );
      // // //     }
      // // //   );
      // // //                             });
      // //                                                          }  ,
      // //                             child: Container(
      // //                                 width: 335,
      // //                                 height: 71,
      // //                                 decoration: BoxDecoration(
      // //                                     color: MyColors.lightpurple,
      // //                                     borderRadius:
      // //                                         BorderRadius.circular(16.567)),
      // //                                 child: Padding(
      // //                                   padding: const EdgeInsets.all(10.0),
      // //                                   child: Row(
      // //                                     mainAxisAlignment:
      // //                                         MainAxisAlignment.spaceBetween,
      // //                                     children: [
      // //                                       Row(
      // //                                         children: [
      // //                                           // Image.asset(item["image"],
      // //                                           //     height: 30),
      // //                                           // CachedNetworkImage(
      // //                                           //   imageUrl: imagePath,
      // //                                           //   width: 50,
      // //                                           //   height: 50,
      // //                                           //   placeholder: (context, url) =>
      // //                                           //       Center(
      // //                                           //     child:
      // //                                           //         CircularProgressIndicator(),
      // //                                           //   ), // Replace with your own placeholder widget
      // //                                           //   errorWidget: (context, url,
      // //                                           //           error) =>
      // //                                           //       Icon(Icons
      // //                                           //           .error), // Replace with your own error widget
      // //                                           // ),
      // //                                           // SizedBox(
      // //                                           //   width: 10,
      // //                                           // ),
      // //                                           Column(
      // //                                             mainAxisAlignment:
      // //                                                 MainAxisAlignment.start,
      // //                                             crossAxisAlignment:
      // //                                                 CrossAxisAlignment.start,
      // //                                             children: [
      // //                                               SizedBox(
      // //                                                 // width:
      // //                                                 //     MediaQuery.of(context)
      // //                                                 //             .size
      // //                                                 //             .width *
      // //                                                 //         0.58,
      // //                                                 child: Text(
      // //                                                   (item.orderId??0).toString(),
      // //                                                   style: CustomTextStyle
      // //                                                       .popinssmall014,
      // //                                                 ),
      // //                                               ),
      // //                                               Text(
      // //                                                 item.orderStatus??'',
      // //                                                 textAlign: TextAlign.center,
      // //                                                 style: CustomTextStyle
      // //                                                     .popinssmall01,
      // //                                               )
      // //                                             ],
      // //                                           ),
      // //                                         ],
      // //                                       ),
      // //                                       // Column(
      // //                                       //   // mainAxisAlignment:
      // //                                       //   // MainAxisAlignment.end,
      // //                                       //   children: [
      // //                                       //     Text(
      // //                                       //       item.description!,
      // //                                       //       textAlign: TextAlign.center,
      // //                                       //       style:
      // //                                       //           CustomTextStyle.popinssmall01,
      // //                                       //     )
      // //                                       //   ],
      // //                                       // ),
      // //                                     ],
      // //                                   ),
      // //                                 )),
      // //                           ),
      // //                           SizedBox(
      // //                             height: 15,
      // //                           ),
      // //                         ],
      // //                       );
      // //                       //  ,SizedBox(height:15 ,),
      // //                     },
      // //                   );
      // //           }),
       
      //     ],
      //   ),
      // ),
    
    // );
  }

  
}
