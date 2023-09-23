import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/partner/notification.dart';

import 'package:pet/utils/colors.dart';
// import '../../../controllers/wholesaler_controller/user/ordersummary.dart';

class CustomAppBarPartner extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarPartner({required this.drawerKey});
  // MyCartWholeController mycartController = Get.put(MyCartWholeController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
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
                    Get.to(NotificationPartner());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ("5").toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(width: 20),
        
        ],
       
    );
  }
}




class CustomAppBarPartnerback extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> drawerKey;

  // CustomAppBarback({required this.drawerKey});
  // MyCartController mycartController = Get.put(MyCartController());
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
                    Get.to(NotificationPartner());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ("5").toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(width: 20),
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
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}





class CustomAppBarPartnerwhite extends StatelessWidget implements PreferredSizeWidget {
  
  // CustomAppBarwhite({});
  // MyCartController mycartController = Get.put(MyCartController());
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
                    Get.to(NotificationPartner());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ("5").toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(width: 20),
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
//                                             color: Colors.black,
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
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      );
  }
}