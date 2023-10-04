import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';

import '../../../controllers/user_controller/addtocartcontroller.dart';
// import '../../../controllers/wholesaler_controller/user/ordersummary.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBar({required this.drawerKey});
    NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
  @override
  void onInit() {

    notificationcontroller.init();
       mycartController.init(); 
    // super.onInit();
  }
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
     notificationcontroller.init();
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
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),

                    notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                    
//                     FutureBuilder(
//   future: fetchData(), // Replace with your actual future function
//   builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       // While the future is still running, show a loading indicator
//       return CircularProgressIndicator();
//     } else if (snapshot.hasError) {
//       // Handle errors
//       return Text('Error: ${snapshot.error}');
//     } else if (!snapshot.hasData) {
//       // Handle cases where there is no data
//       return Text('No data available');
//     } else {
//       // Data is available, use GetBuilder for additional state management
//       return GetBuilder<NotificationController>(
//         init: NotificationController(), // Initialize the controller
//         builder: (_) {
//           if (notificationcontroller.userNotificationModel == null ||
//               notificationcontroller.userNotificationModel!.state == null ||
//               notificationcontroller.userNotificationModel!.state!.isEmpty) {
//             return const SizedBox();
//           } else {
//             return Positioned(
//               top: 3.0,
//               right: 4.0,
//               child: Center(
//                 child: Text(
//                   notificationcontroller.userNotificationModel!.state!.length.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 8.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       );
//     }
//   },
// ))

                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller.userNotificationModel == null ||
                                    notificationcontroller.userNotificationModel!.state ==
                                        null ||
                                     notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
//                    notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
// SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                       GetBuilder<NotificationController>(
//                           init: notificationcontroller,
//                           builder: (_) {
//                             return   notificationcontroller.userNotificationModel == null ||
//                                     notificationcontroller.userNotificationModel!.state ==
//                                         null ||
//                                      notificationcontroller.userNotificationModel!.state!.isEmpty
//                                 ? const SizedBox():
//                            Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
                  onTap: () async{
                 await   mycartController.init();
                 mycartController.updateTotal();
                    Get.to(AddToCardUser());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
mycartController.mycartmodel == null || mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
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
       
    );
  }
}



class CustomAppBarGreenDrawer extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarGreenDrawer({required this.drawerKey});
    NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    notificationcontroller.init();
      mycartController.init();
    return AppBar(
      elevation: 0,
       backgroundColor: MyColors.green,
     leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              drawerKey.currentState!.openDrawer();
            },
            child: Image.asset(
              "assets/image/menu2.png",color:Colors.white
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
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.white),
                  )),
                   notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller.userNotificationModel == null ||
                                    notificationcontroller.userNotificationModel!.state ==
                                        null ||
                                     notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
                    Get.to(AddToCardUser());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg",color:Colors.white))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
mycartController.mycartmodel == null || mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
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
       
    );
  }
}




class CustomAppBarback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
  NotificationController notificationcontroller =
      Get.put(NotificationController());
  // CustomAppBarback({required this.drawerKey});
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    notificationcontroller.init();
      mycartController.init();
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
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
                   notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller.userNotificationModel == null ||
                                    notificationcontroller.userNotificationModel!.state ==
                                        null ||
                                     notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
                    Get.to(AddToCardUser());
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
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
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




class CustomAppBarTitleback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;
  NotificationController notificationcontroller =
      Get.put(NotificationController());
  // CustomAppBarback({required this.drawerKey});
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    notificationcontroller.init();
      mycartController.init();
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

//         actions: [
//         Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     Get.to(NotificationUser());
//                   },
//                   child: Center(
//                     child: Icon(Icons.notifications, color: MyColors.black),
//                   )),
//                    notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
// SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                       GetBuilder<NotificationController>(
//                           init: notificationcontroller,
//                           builder: (_) {
//                             return   notificationcontroller.userNotificationModel == null ||
//                                     notificationcontroller.userNotificationModel!.state ==
//                                         null ||
//                                      notificationcontroller.userNotificationModel!.state!.isEmpty
//                                 ? const SizedBox():
//                            Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
        
//           SizedBox(width: 20),
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     mycartController.init();
//                     Get.to(AddToCardUser());
//                     // Get.to(AddToCardUser());
//                   },
//                   child:
//                       Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
// mycartController.mycartmodel == null|| mycartController.mycartmodel!.data!.isEmpty?
// SizedBox():
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                       GetBuilder<MyCartController>(
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
//                                             fontSize: 8.0,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ));
//                           }),
//                     ],
//                   )),
//             ],
//           ),
//           SizedBox(
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


class CustomAppBargreen extends StatelessWidget implements PreferredSizeWidget {
    NotificationController notificationcontroller =
      Get.put(NotificationController());
  // CustomAppBarwhite({});
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    notificationcontroller.init();
      mycartController.init();
    return        AppBar(
       elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.green,
        leading: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left, color: MyColors.white)),
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
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.white),
                  )),
                   notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller.userNotificationModel == null ||
                                    notificationcontroller.userNotificationModel!.state ==
                                        null ||
                                     notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
                    Get.to(AddToCardUser());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg",color:Colors.white))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
 mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
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


class CustomAppBarwhite extends StatelessWidget implements PreferredSizeWidget {
    NotificationController notificationcontroller =
      Get.put(NotificationController());
  // CustomAppBarwhite({});
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    notificationcontroller.init();
      mycartController.init();
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
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
                   notificationcontroller.userNotificationModel == null|| notificationcontroller.userNotificationModel!.state!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller.userNotificationModel == null ||
                                    notificationcontroller.userNotificationModel!.state ==
                                        null ||
                                     notificationcontroller.userNotificationModel!.state!.isEmpty
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  ( notificationcontroller.userNotificationModel!.state!.length).toString(),
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
                    Get.to(AddToCardUser());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
 mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
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