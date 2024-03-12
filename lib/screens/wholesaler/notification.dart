import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import '../../controllers/wholesaler_controller/notification_controller.dart';

class NotificationWhole extends StatefulWidget {
  const NotificationWhole({super.key});

  @override
  State<NotificationWhole> createState() => _NotificationWholeState();
}

class _NotificationWholeState extends State<NotificationWhole> {
  WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());

@override
  void onInit() {
  // notificationcontroller.notifydeleteinit();
    wholenotificationcontroller.notifyinit();
   print(wholenotificationcontroller.wholeNotifyListModel!.notification);
  }
  @override
  Widget build(BuildContext context) {
     wholenotificationcontroller.notifyinit();
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
          title: const Center(
              child: Text('Notification',
                  style: TextStyle(color: Colors.black, fontSize: 18))),
          bottom: const TabBar(
            tabs: [
             Tab(text: 'Public'),
              
              Tab(text: 'Notify'),

              Tab(text: 'Order Info'),
          
            
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
              // GetBuilder<WholeNotificationController>(
              //     init: wholenotificationcontroller,
              //     builder: (_) {
              //       return wholenotificationcontroller.wholeNotificationModel ==
              //               null
              //           ? const SizedBox()
              //           : ListView.builder(
              //               primary: false,
              //               scrollDirection: Axis.vertical,
              //               shrinkWrap: true,
              //               itemCount: wholenotificationcontroller
              //                   .wholeNotificationModel!.state!.length,
              //               itemBuilder: (context, index) {
              //                 var item = wholenotificationcontroller
              //                     .wholeNotificationModel!.state![index];
              //                 // print(item.name!);
              //                 var imagePath =
              //                     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
              //                 return Column(
              //                   children: [
              //                     Container(
              //                         width: 335,
              //                         height: 71,
              //                         decoration: BoxDecoration(
              //                             color: MyColors.lightpurple,
              //                             borderRadius:
              //                                 BorderRadius.circular(16.567)),
              //                         child: Padding(
              //                           padding: const EdgeInsets.all(10.0),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Row(
              //                                 children: [
              //                                   // Image.asset(item["image"],
              //                                   //     height: 30),
              //                                   CachedNetworkImage(
              //                                     imageUrl: imagePath,
              //                                     width: 50,
              //                                     height: 50,
              //                                     placeholder: (context, url) =>
              //                                         const Center(
              //                                       child:
              //                                           CircularProgressIndicator(),
              //                                     ), // Replace with your own placeholder widget
              //                                     errorWidget: (context, url,
              //                                             error) =>
              //                                         const Icon(Icons
              //                                             .error), // Replace with your own error widget
              //                                   ),
              //                                   const SizedBox(
              //                                     width: 10,
              //                                   ),
              //                                   Column(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.start,
              //                                     crossAxisAlignment:
              //                                         CrossAxisAlignment.start,
              //                                     children: [
              //                                       SizedBox(
              //                                         // width:
              //                                         //     MediaQuery.of(context)
              //                                         //             .size
              //                                         //             .width *
              //                                         //         0.58,
              //                                         child: Text(
              //                                           item.title!,
              //                                           style: CustomTextStyle
              //                                               .popinssmall014,
              //                                         ),
              //                                       ),
              //                                       Text(
              //                                         item.description!.length >
              //                                                 36
              //                                             ? item.description!
              //                                                 .substring(0, 35)
              //                                             : item.description!,
              //                                         textAlign:
              //                                             TextAlign.center,
              //                                         style: CustomTextStyle
              //                                             .popinssmall01,
              //                                       )
              //                                     ],
              //                                   ),
              //                                 ],
              //                               ),
              //                               // Column(
              //                               //   // mainAxisAlignment:
              //                               //   // MainAxisAlignment.end,
              //                               //   children: [
              //                               //     Text(
              //                               //       item.description!,
              //                               //       textAlign: TextAlign.center,
              //                               //       style:
              //                               //           CustomTextStyle.popinssmall01,
              //                               //     )
              //                               //   ],
              //                               // ),
              //                             ],
              //                           ),
              //                         )),
              //                     const SizedBox(
              //                       height: 15,
              //                     ),
              //                   ],
              //                 );
              //                 //  ,SizedBox(height:15 ,),
              //               },
              //             );
              //     })
             
             
             
             
             

           wholenotificationcontroller
                                  .wholeNotifyListModel == null? SizedBox():
                   GetBuilder<WholeNotificationController>(
                  init: wholenotificationcontroller,
                  builder: (_) {
                    return
                     wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification == ''|| wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification == null || wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification!.isEmpty?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification![wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification!.length- 1-index];
                              // print(item.name!);
                               var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                           
                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return
                             wholenotificationcontroller
                                  .wholeNotifyListModel == null ||  wholenotificationcontroller
                                  .wholeNotifyListModel!.allNotification == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: ()  async {
// notificationcontroller.itemView(item.id??0);
          // Close the dialog
          wholenotificationcontroller.itemView(item.itemId??0,item.id??0);
   await wholenotificationcontroller.notifyView();
  
       Get.to(ProductDetailswhole(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

//                               await notificationcontroller.notifydeleteinit();
                              
                        
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
                                        // height: 71,
                                        decoration: BoxDecoration(
                                            color:(item.status == "read")?MyColors.grey: MyColors.lightpurple,
                                            borderRadius:
                                                BorderRadius.circular(16.567)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                          
                                             Spacer(),
                                              InkWell(
onTap: (){


                                            
    
   showDialog(
              context: context,
              builder: (BuildContext context) {
          return  BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    
            child: AlertDialog(
                  // title: Text("Simple Popup"),
                  content:    Container(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Notification',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18.0),
          Text('Are you sure you want to delete this notification?'),
          // SizedBox(height: 16.0),
         ],
      ),
    ),
                  actions: [Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
                child: Text('Cancel'),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
                  // Call the order cancellation function from the controller
                  // Replace `cancelOrder` with the actual function in your controller to cancel the order
                  // controller.cancelOrder();

                  // Close the dialog
          wholenotificationcontroller
                                  .itemView(item.itemId??0,item.id??0);
  //  await notificationcontroller.notifydeleteinit();
      //  Get.to(ProductDetails(
      //   id: item.id??0,
      //  ));
      //  print("ItemId==${item.id}");
                              await wholenotificationcontroller.notifydeleteinit();
                              // Get.back();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
                    
            //       <Widget>[
            //         ElevatedButton(
            // child: const Text("Close"),
            // onPressed: () {
            //   Navigator.of(context).pop(); // Close the popup
            // },
            //         ),
            //       ],
                ),
          );
                                    });
                                 
},
                                                child: Icon(Icons.delete_outline_outlined)),
                                              
                                            
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
       GetBuilder<WholeNotificationController>(
                  init: wholenotificationcontroller,
                  builder: (_) {
                    return
                     wholenotificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : wholenotificationcontroller
                                  .wholeNotifyListModel == null || wholenotificationcontroller
                                  .wholeNotifyListModel!.data == null?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: wholenotificationcontroller
                                  .wholeNotifyListModel!.data!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = wholenotificationcontroller
                                  .wholeNotifyListModel!.data![wholenotificationcontroller
                                  .wholeNotifyListModel!.data!.length- 1-index];
                              // print(item.name!);
                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return
                             wholenotificationcontroller
                                  .wholeNotifyListModel == null ||  wholenotificationcontroller
                                  .wholeNotifyListModel!.data == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: ()  async{

          wholenotificationcontroller.itemView(item.itemId??0,item.id??0);
          await wholenotificationcontroller.notifyView();
  
       Get.to(ProductDetailswhole(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

//                               await notificationcontroller.notifydeleteinit();
                              
                        
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
                                        // height: 71,
                                        decoration: BoxDecoration(
                                            color:(item.status == "read")?MyColors.grey: MyColors.lightpurple,
                                            borderRadius:
                                                BorderRadius.circular(16.567)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(  mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                         "Item Id : "+ (item.id??0).toString(),
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
                                          
                                             Spacer(),
                                              InkWell(
onTap: (){


                                            
    
   showDialog(
              context: context,
              builder: (BuildContext context) {
          return  BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    
            child: AlertDialog(
                  // title: Text("Simple Popup"),
                  content:    Container(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Notification',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18.0),
          Text('Are you sure you want to delete this notification?'),
          // SizedBox(height: 16.0),
         ],
      ),
    ),
                  actions: [Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
                child: Text('Cancel'),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
                  // Call the order cancellation function from the controller
                  // Replace `cancelOrder` with the actual function in your controller to cancel the order
                  // controller.cancelOrder();

                  // Close the dialog
          wholenotificationcontroller.itemView(item.itemId??0,item.id??0);
  //  await notificationcontroller.notifydeleteinit();
      //  Get.to(ProductDetails(
      //   id: item.id??0,
      //  ));
      //  print("ItemId==${item.id}");
                              await wholenotificationcontroller.notifydeleteinit();
                              // Get.back();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
                    
            //       <Widget>[
            //         ElevatedButton(
            // child: const Text("Close"),
            // onPressed: () {
            //   Navigator.of(context).pop(); // Close the popup
            // },
            //         ),
            //       ],
                ),
          );
                                    });
                                 
},
                                                child: Icon(Icons.delete_outline_outlined)),
                                              
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
       GetBuilder<WholeNotificationController>(
                  init: wholenotificationcontroller,
                  builder: (_) {
                    return
                     wholenotificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : wholenotificationcontroller
                                  .wholeNotifyListModel == null || wholenotificationcontroller
                                  .wholeNotifyListModel!.notification == null?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: wholenotificationcontroller
                                  .wholeNotifyListModel!.notification!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = wholenotificationcontroller
                                  .wholeNotifyListModel!.notification![wholenotificationcontroller
                                  .wholeNotifyListModel!.notification!.length- 1-index];
                              // print(item.name!);
                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return
                             wholenotificationcontroller
                                  .wholeNotifyListModel == null ||  wholenotificationcontroller
                                  .wholeNotifyListModel!.notification == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: ()  async{
// notificationcontroller.itemView(item.id??0);
          // Close the dialog
          wholenotificationcontroller.itemView(item.itemId??0,item.id??0);
   await wholenotificationcontroller.notifyView();
  
       Get.to(ProductDetailswhole(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

//                               await notificationcontroller.notifydeleteinit();
                              
                        
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
                                        // height: 71,
                                        decoration: BoxDecoration(
                                            color:(item.status == "read")?MyColors.grey: MyColors.lightpurple,
                                            borderRadius:
                                                BorderRadius.circular(16.567)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(  mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                         "Item Id : "+ (item.id??0).toString(),
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
                                          
                                             Spacer(),
                                              InkWell(
onTap: (){


                                            
    
   showDialog(
              context: context,
              builder: (BuildContext context) {
          return  BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    
            child: AlertDialog(
                  // title: Text("Simple Popup"),
                  content:    Container(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Notification',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18.0),
          Text('Are you sure you want to delete this notification?'),
          // SizedBox(height: 16.0),
         ],
      ),
    ),
                  actions: [Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
                child: Text('Cancel'),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
                  // Call the order cancellation function from the controller
                  // Replace `cancelOrder` with the actual function in your controller to cancel the order
                  // controller.cancelOrder();

                  // Close the dialog
          wholenotificationcontroller.itemView(item.itemId??0,item.id??0);
  //  await notificationcontroller.notifydeleteinit();
      //  Get.to(ProductDetails(
      //   id: item.id??0,
      //  ));
      //  print("ItemId==${item.id}");
                              await wholenotificationcontroller.notifydeleteinit();
                              // Get.back();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
                    
            //       <Widget>[
            //         ElevatedButton(
            // child: const Text("Close"),
            // onPressed: () {
            //   Navigator.of(context).pop(); // Close the popup
            // },
            //         ),
            //       ],
                ),
          );
                                    });
                                 
},
                                                child: Icon(Icons.delete_outline_outlined)),
                                              
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
      
      
           
            ],
          ),
        ),
      ),
    );

    //  Scaffold(
    //     appBar: CustomAppBarWholeback(title: "Notification",),
    //     body: Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: ListView(
    //         primary: true,
    //         shrinkWrap: true,
    //         // scrollDirection: Axis.vertical,
    //         children: [
    //           GetBuilder<WholeNotificationController>(
    //               init: wholenotificationcontroller,
    //               builder: (_) {
    //                 return wholenotificationcontroller.wholeNotificationModel ==
    //                         null
    //                     ? SizedBox()
    //                     : ListView.builder(
    //                         primary: false,
    //                         scrollDirection: Axis.vertical,
    //                         shrinkWrap: true,
    //                         itemCount: wholenotificationcontroller
    //                             .wholeNotificationModel!.state!.length,
    //                         itemBuilder: (context, index) {
    //                           var item = wholenotificationcontroller
    //                               .wholeNotificationModel!.state![index];
    //                           // print(item.name!);
    //                           var imagePath =
    //                               "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
    //                           return Column(
    //                             children: [
    //                               Container(
    //                                   width: 335,
    //                                   height: 71,
    //                                   decoration: BoxDecoration(
    //                                       color: MyColors.lightpurple,
    //                                       borderRadius:
    //                                           BorderRadius.circular(16.567)),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.all(10.0),
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Row(
    //                                           children: [
    //                                             // Image.asset(item["image"],
    //                                             //     height: 30),
    //                                             CachedNetworkImage(
    //                                               imageUrl: imagePath,
    //                                               width: 50,
    //                                               height: 50,
    //                                               placeholder: (context, url) =>
    //                                                   Center(
    //                                                 child:
    //                                                     CircularProgressIndicator(),
    //                                               ), // Replace with your own placeholder widget
    //                                               errorWidget: (context, url,
    //                                                       error) =>
    //                                                   Icon(Icons
    //                                                       .error), // Replace with your own error widget
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10,
    //                                             ),
    //                                             Column(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment.start,
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                               children: [
    //                                                 SizedBox(
    //                                                   // width:
    //                                                   //     MediaQuery.of(context)
    //                                                   //             .size
    //                                                   //             .width *
    //                                                   //         0.58,
    //                                                   child: Text(
    //                                                     item.title!,
    //                                                     style: CustomTextStyle
    //                                                         .popinssmall014,
    //                                                   ),
    //                                                 ),
    //                                                 Text(
    //                                                   item.description!.length >
    //                                                           36
    //                                                       ? item.description!
    //                                                           .substring(0, 35)
    //                                                       : item.description!,
    //                                                   textAlign:
    //                                                       TextAlign.center,
    //                                                   style: CustomTextStyle
    //                                                       .popinssmall01,
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         // Column(
    //                                         //   // mainAxisAlignment:
    //                                         //   // MainAxisAlignment.end,
    //                                         //   children: [
    //                                         //     Text(
    //                                         //       item.description!,
    //                                         //       textAlign: TextAlign.center,
    //                                         //       style:
    //                                         //           CustomTextStyle.popinssmall01,
    //                                         //     )
    //                                         //   ],
    //                                         // ),
    //                                       ],
    //                                     ),
    //                                   )),
    //                               SizedBox(
    //                                 height: 15,
    //                               ),
    //                             ],
    //                           );
    //                           //  ,SizedBox(height:15 ,),
    //                         },
    //                       );
    //               }),
    //         ],
    //       ),
    //     ));
  }
}
