import 'dart:ui';

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
    // bool isBrandExpanded = false; // Initially, the panel is collapsed

  List<String> filterOptions = ["Option 1", "Option 2"]; // Your filter options

  Set<String> selectedBrandOptions = <String>{}; // Store selected options
  @override
  void onInit() {
  // notificationcontroller.notifydeleteinit();
    notificationcontroller.notifyinit();
    
    // super.onInit();
  }
  // void toggleBrandExpansion() {
  //   setState(() {
  //     isBrandExpanded = !isBrandExpanded;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // notificationcontroller.notifydeleteinit();
    notificationcontroller.notifyinit();


    return 
       DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(onTap: (){
            Get.back();
          }
            ,
            child: const Icon(Icons.arrow_back,color:Colors.black)),
          title: const Center(child: Text('Notification',style:TextStyle(color: Colors.black,fontSize: 18))),
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

                GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return
                     notificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.allNotification == null?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: notificationcontroller
                                .userNotifyListModel!.allNotification!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = notificationcontroller
                                  .userNotifyListModel!.allNotification![notificationcontroller
                                  .userNotifyListModel!.allNotification!.length- 1-index];
                              // print(item.name!);
                                   var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return
                              notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.allNotification == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: ()  async{
// notificationcontroller.itemView(item.id??0);
          // Close the dialog
          notificationcontroller.itemView(item.itemId??0,item.id??0);
   await notificationcontroller.notifyView();
  
       Get.to(ProductDetails(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

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
          notificationcontroller.itemView(item.itemId??0,item.id??0);
                              await notificationcontroller.notifydeleteinit();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
                    
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
                            },
                          );
               
               
               
               
                  }),
      
      

                GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return
                     notificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.data == null?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: notificationcontroller
                                .userNotifyListModel!.data!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = notificationcontroller
                                  .userNotifyListModel!.data![notificationcontroller
                                  .userNotifyListModel!.data!.length- 1-index];
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
                                    onTap: ()  async{
// notificationcontroller.itemView(item.id??0);
          // Close the dialog
          notificationcontroller.itemView(item.itemId??0,item.id??0);
   await notificationcontroller.notifyView();
  
       Get.to(ProductDetails(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

                                                                 }  ,
                                    child: Container(
                                        width: 335,
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
                 
          notificationcontroller.itemView(item.itemId??0,item.id??0);
                              await notificationcontroller.notifydeleteinit();
                              // Get.back();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
                    
            
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
                            },
                          );
               
               
               
               
                  }),
      

      
                GetBuilder<NotificationController>(
                  init: notificationcontroller,
                  builder: (_) {
                    return
                     notificationcontroller.notifiyLoaded == null
                        ? const SizedBox()
                        : notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.notification == null?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                         ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: notificationcontroller
                                .userNotifyListModel!.notification!.length,
                            itemBuilder: (context, index) {
                             
                                  var item = notificationcontroller
                                  .userNotifyListModel!.notification![notificationcontroller
                                  .userNotifyListModel!.notification!.length- 1-index];
                               return
                              notificationcontroller
                                  .userNotifyListModel == null ||  notificationcontroller
                                  .userNotifyListModel!.notification == null?const  Text("No data Found"):
                               Column(
                                children: [
                                  InkWell(
                                    onTap: ()  async{
          notificationcontroller.itemView(item.itemId??0,item.id??0);
   await notificationcontroller.notifyView();
  
       Get.to(ProductDetails(
        id: item.itemId??0,
       ));
       print("ItemId==${item.itemId??0}");
       

                                                                 }  ,
                                    child: Container(
                                        width: 335,
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
                 
          notificationcontroller.itemView(item.itemId??0,item.id??0);
                              await notificationcontroller.notifydeleteinit();
                },
                child: Text('Delete'),
              ),
            ],
          ),
       ]
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
                            },
                          );
               
               
               
               
                  }),
      
      
      
          ]),
        )
          
        ),
      
    );


    
    
  }

  
}
