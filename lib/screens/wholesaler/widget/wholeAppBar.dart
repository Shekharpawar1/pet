import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/notification_controller.dart';

import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

// import '../../../controllers/wholesaler_controller/user/ordersummary.dart';

class CustomAppBarWhole extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarWhole({required this.drawerKey});
   WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
  MyCartWholeController mycartController = Get.put(MyCartWholeController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.
 @override
  void onInit() {

    // wholenotificationcontroller.init();
       wholenotificationcontroller.notifyinit();
     mycartController.init();
    // super.onInit();
  }
  @override
  Widget build(BuildContext context) {
    // wholenotificationcontroller.init();
      //  wholenotificationcontroller.notifyinit();
     mycartController.init();
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
                    Get.to(NotificationWhole());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
 wholenotificationcontroller.wholeNotifyListModel == "" ?
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
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                    
 
                      GetBuilder<WholeNotificationController>(
                          init: wholenotificationcontroller,
                          builder: (_) {
                            return   
                             wholenotificationcontroller.wholeNotifyListModel == null 
                            //  ||  wholenotificationcontroller.wholeNotifyListModel == null ||
                            //       wholenotificationcontroller.wholeNotificationModel!.state! .isEmpty
                            //             ||
                            //              wholenotificationcontroller.wholeNotifyListModel!.notification!.isEmpty
                                         //||
                                    //  notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
                                wholenotificationcontroller.wholeNotifyListModel == null?
                                Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, 
                                            size:
                                                20.0, 
                                          ),
                                        ):Text(
                 (                        (wholenotificationcontroller.totalNotify??0)).toString(),
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


//          Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     Get.to(NotificationWhole());
//                   },
//                   child: Center(
//                     child: Icon(Icons.notifications, color: MyColors.black),
//                   )),
// //                    wholenotificationcontroller.wholeNotificationModel == null|| wholenotificationcontroller.wholeNotificationModel!.state!.isEmpty?
// // SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
//                       GetBuilder<WholeNotificationController>(
//                           init: wholenotificationcontroller,
//                           builder: (_) {
//                             return   wholenotificationcontroller.wholeNotificationModel == null ||
//                                    wholenotificationcontroller.wholeNotificationModel!.state ==
//                                         null ||
//                                      wholenotificationcontroller.wholeNotificationModel!.state!.isEmpty
//                                 ? const SizedBox():
//                            Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   (  wholenotificationcontroller.wholeNotificationModel!.state!.length).toString(),
//                                   // list.length.toString(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 8.0,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ));
//                         }
//                       ),
//                     ],
//                   )),
//             ],
//           ),
       
       
        SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {

                    mycartController.init();
                     mycartController.updateTotal();
                    Get.to(AddToCardwhole());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
//   mycartController.wholemycartmodel == null|| mycartController.wholemycartmodel!.data!.isEmpty?
// SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<MyCartWholeController>(
                          init: mycartController,
                          builder: (_) {
                            return mycartController.wholemycartmodel == null ||
                                    mycartController.wholemycartmodel!.data ==
                                        null ||
                                    mycartController.wholemycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                : Positioned(
                                      top: 3.0,
                              right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .wholemycartmodel!.data!.length)
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




class CustomAppBarWholeback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
    final title;
   CustomAppBarWholeback({required this.title});
 WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
  // CustomAppBarback({required this.drawerKey});
  MyCartWholeController mycartController = Get.put(MyCartWholeController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
   
    return       
    
     AppBar(
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
                    Get.to(NotificationWhole());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
                 wholenotificationcontroller.wholeNotifyListModel == ""||  wholenotificationcontroller.wholeNotifyListModel == null?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<WholeNotificationController>(
                          init: wholenotificationcontroller,
                          builder: (_) {
                            return   wholenotificationcontroller.wholeNotifyListModel == null 
                            // ||
                                  //  wholenotificationcontroller.wholeNotificationModel!.state ==
                                  //       null ||
                                  //    wholenotificationcontroller.wholeNotificationModel!.state!.isEmpty
                                    ? Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: 
                                Text(
                                   (wholenotificationcontroller.totalNotify??0).toString(),
                                  // list.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
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
                    Get.to(AddToCardwhole);
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
mycartController.wholemycartmodel == null|| mycartController.wholemycartmodel!.data!.isEmpty?
SizedBox(): Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<MyCartWholeController>(
                          init: mycartController,
                          builder: (_) {
                            return mycartController.wholemycartmodel == null ||
                                    mycartController.wholemycartmodel!.data ==
                                        null ||
                                    mycartController.wholemycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .wholemycartmodel!.data!.length)
                                            .toString(),
                                        // list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.0,
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

class CustomAppBarWholeOnlyback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
    final title;
   CustomAppBarWholeOnlyback({required this.title});
 WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
  // CustomAppBarback({required this.drawerKey});
  MyCartWholeController mycartController = Get.put(MyCartWholeController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    // wholenotificationcontroller.init();
    //  mycartController.init();
    return       
    
     AppBar(
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
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

        
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}






class CustomAppBarwhite extends StatelessWidget implements PreferredSizeWidget {
  
  // CustomAppBarwhite({});
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
   WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    // wholenotificationcontroller.init();
    //    wholenotificationcontroller.notifyinit();
    //  mycartwholeController.init();
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
                    Get.to(NotificationWhole());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              (wholenotificationcontroller.wholeNotifyListModel== null)?
   Text("0"):
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<WholeNotificationController>(
                          init: wholenotificationcontroller,
                          builder: (_) {
                            return   wholenotificationcontroller.wholeNotifyListModel == null
                            //  ||
                            //        wholenotificationcontroller.wholeNotificationModel!.state ==
                            //             null ||
                                    //  wholenotificationcontroller.wholeNotificationModel!.state!.isEmpty
                                    ?const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                   (                          (wholenotificationcontroller.totalNotify??0)).toString(),
                                  // list.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
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
                    mycartwholeController.init();
                    Get.to(AddToCardwhole());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():

              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<MyCartWholeController>(
                          init: mycartwholeController,
                          builder: (_) {
                            return mycartwholeController.wholemycartmodel == null ||
                                    mycartwholeController.wholemycartmodel!.data ==
                                        null ||
                                    mycartwholeController.wholemycartmodel!.data!.isEmpty
                                ? const SizedBox()
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartwholeController
                                                .wholemycartmodel!.data!.length)
                                            .toString(),
                                        // list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.0,
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