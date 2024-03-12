import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/ordersummary.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import '../../../controllers/user_controller/addtocartcontroller.dart';
// import '../../../controllers/wholesaler_controller/user/ordersummary.dart';

class CustomAppBarSales extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;
final title;
  CustomAppBarSales({required this.drawerKey,required this.title});
  NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
  SalesMyCartController mycartController = Get.put(SalesMyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  void onInit() {

       mycartController.init(); 
   
  }
  @override
  Widget build(BuildContext context) {
    // notificationsalescontroller.init();
    // notificationsalescontroller.notifyinit();
    //   mycartController.init();
  
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
     leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              drawerKey.currentState!.openDrawer();
            },
            child: Image.asset(
              "assets/image/menu2.png",
            ),
          ),
        ),
          title: Center(child: Text(title.toString(),   style: CustomTextStyle.appbartext,),),
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

        actions: [
                Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationSales());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              notificationsalescontroller.salesNotifyListModel == ""?
 Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<NotificationsalesController>(
                          init:  notificationsalescontroller,
                          builder: (_) {
                            return     
                             notificationsalescontroller.salesNotifyListModel == null 
                            
                            ? SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
                                
                                        Text(
                 ((notificationsalescontroller.totalNotify??0)).toString(),
                                  
                                  // list.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ));
                        }
                      ),
                    ],
                  )),
            ],
          ),
      SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    mycartController.clearFields();
                    mycartController.init();
                       mycartController. updateTotal();
                    Get.to(AddToCardSales());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
//  mycartController.mycartmodel == ""?
//  Center(
//                                           child: SpinKitCircle(
//                                             color: Colors
//                                                 .grey, // Color of the progress bar
//                                             size:
//                                                 20.0, // Size of the progress bar
//                                           ),
//                                         ):
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<SalesMyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return  
                                // mycartController.mycartmodel!.data!.isEmpty
                                // ? const SizedBox()
                                mycartController.mycartmodel == null ||
                                    mycartController.mycartmodel!.data ==
                                        null ||
                                    mycartController.mycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .mycartmodel!.data!.length)
                                            .toString(),
                                        // list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ));
                          }),
                    ],
                  )),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
       
    );
  }
}




class CustomAppBarSalesWholeback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
  final title;
   CustomAppBarSalesWholeback({required this.title});
NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
  // CustomAppBarback({required this.drawerKey});
   SalesMyCartController mycartController = Get.put(SalesMyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    return        AppBar(
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
 title: Center(child: Text(title.toString(),   style: CustomTextStyle.appbartext,),),
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

        actions: [
           Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationSales());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
                
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<NotificationsalesController>(
                          init:  notificationsalescontroller,
                          builder: (_) {
                            return    notificationsalescontroller.salesNotifyListModel == null 
                        
                            ? const SizedBox():
                                         Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
                                
                                        Text(
                 (             (notificationsalescontroller.totalNotify??0)).toString(),
                                  
                                  // list.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ));
                        }
                      ),
                    ],
                  )),
            ],
          ),
      SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    mycartController.init();
                    Get.to(AddToCardSales());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
  mycartController.mycartmodel == null|| mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<SalesMyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return mycartController.mycartmodel == null ||
                                    mycartController.mycartmodel!.data ==
                                        null ||
                                    mycartController.mycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .mycartmodel!.data!.length)
                                            .toString(),
                                        // list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ));
                          }),
                    ],
                  )),
            ],
          ),
        SizedBox(
            width: 20,
          )
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}



class CustomAppBarSalesback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
  final title;
   CustomAppBarSalesback({required this.title});
NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
  // CustomAppBarback({required this.drawerKey});
   SalesMyCartController mycartController = Get.put(SalesMyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    return        AppBar(
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
 title: Center(child: Text(title.toString(),   style: CustomTextStyle.appbartext,),),
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

//         actions: [
//            Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     Get.to(NotificationSales());
//                   },
//                   child: Center(
//                     child: Icon(Icons.notifications, color: MyColors.black),
//                   )),
//                    notificationsalescontroller.salesNotificationModel == null||  notificationsalescontroller.salesNotificationModel !.state!.isEmpty?
// SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
//                       GetBuilder<NotificationsalesController>(
//                           init:  notificationsalescontroller,
//                           builder: (_) {
//                             return   notificationsalescontroller.salesNotificationModel == null 
//                             // ||
//                             //        notificationsalescontroller.salesNotificationModel!.state ==
//                             //             null ||
//                             //          notificationsalescontroller.salesNotificationModel!.state!.isEmpty
//                                     ? Center(
//                                           child: SpinKitCircle(
//                                             color: Colors
//                                                 .grey, // Color of the progress bar
//                                             size:
//                                                 20.0, // Size of the progress bar
//                                           ),
//                                         ):
//                            Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   (  notificationsalescontroller.salesNotificationModel!.state!.length).toString(),
//                                   // list.length.toString(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10.0,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ));
//                         }
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//       SizedBox(width: 20),
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     mycartController.init();
//                     Get.to(AddToCardSales());
//                     // Get.to(AddToCardUser());
//                   },
//                   child:
//                       Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//   mycartController.mycartmodel == null|| mycartController.mycartmodel!.data!.isEmpty?
// SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
//                       GetBuilder<SalesMyCartController>(
//                           init: mycartController,
//                           builder: (_) {
//                             return mycartController.mycartmodel == null ||
//                                     mycartController.mycartmodel!.data ==
//                                         null ||
//                                     mycartController.mycartmodel!.data!.isEmpty
//                                 ? const SizedBox()
//                                 : Positioned(
//                                     top: 3.0,
//                                     right: 4.0,
//                                     child: Center(
//                                       child: Text(
//                                         (mycartController
//                                                 .mycartmodel!.data!.length)
//                                             .toString(),
//                                         // list.length.toString(),
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 10.0,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ));
//                           }),
//                     ],
//                   )),
//             ],
//           ),
//         SizedBox(
//             width: 20,
//           )
//         ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}




class CustomAppBarSaleswhite extends StatelessWidget implements PreferredSizeWidget {
  NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
  // CustomAppBarwhite({});
  SalesMyCartController mycartController = Get.put(SalesMyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    return        AppBar(
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
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

        actions: [
       Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationSales());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
          
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<NotificationsalesController>(
                          init:  notificationsalescontroller,
                          builder: (_) {
                            return  notificationsalescontroller.salesNotifyListModel == null 
                          
                            ? const SizedBox():
                                         Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
                                
                                        Text(
                 (             (notificationsalescontroller.totalNotify??0)).toString(),
                                  
                                  // list.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ));
                        }
                      ),
                    ],
                  )),
            ],
          ),
      SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    mycartController.init();
                    Get.to(AddToCardSales());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
 mycartController.mycartmodel == ""?
 Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,size: 18.0, color: MyColors.red),
                      GetBuilder<SalesMyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return     mycartController.mycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .mycartmodel!.data!.length)
                                            .toString(),
                                        // list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ));
                          }),
                    ],
                  )),
            ],
          ),
        SizedBox(
            width: 20,
          )
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}