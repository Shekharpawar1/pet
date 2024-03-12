import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import '../../../controllers/user_controller/addtocartcontroller.dart';
import '../../bottomnavbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;
 final BuildContext context;
  CustomAppBar({required this.drawerKey, required this.context});
    NotificationController notificationcontroller =
      Get.put(NotificationController());
            ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  MyCartController mycartController = Get.put(MyCartController());

  @override
  void onInit() {

   //   notificationcontroller.init();
       mycartController.init(); 
    // super.onInit();
  }
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

                    notificationcontroller.userNotificationModel == ""?
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
                    
 
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   
                             notificationcontroller.userNotifyListModel == null 
                                ? const SizedBox():
                           Positioned(
                              top: 4.0,
                              right: 4.0,
                              child: Center(
                                child:  notificationcontroller.userNotifyListModel == null?
                                Text("0"):Text(
                (notificationcontroller.totalNotify??0).toString(),
                                
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
                    Get.to(AddToCardUser());
                    
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

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
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return
                            
                            mycartController.mycartmodel == null 
                            ? const SizedBox():
                                  
                                 Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .mycartmodel!.data!.length)
                                            .toString(),
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
                        notificationcontroller.userNotifyListModel == "" ?
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
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return     notificationcontroller.userNotifyListModel == null 
                                ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child:
                            
                             
                               Center(
                                child: 
 notificationcontroller.userNotifyListModel == null?
                                Text("0"):Text(
                (notificationcontroller.totalNotify??0).toString(),
                                
                                      
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
                    Get.to(AddToCardUser());
                    
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg",color:Colors.white))),


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
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return 
                            mycartController.mycartmodel == null 
                            ? const SizedBox()
                                  
                                : Positioned(
                                    top: 3.0,
                                    right: 4.0,
                                    child: Center(
                                      child: Text(
                                        (mycartController
                                                .mycartmodel!.data!.length)
                                            .toString(),
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




class CustomAppBarback extends StatelessWidget implements PreferredSizeWidget {
  
  final title;
  
   CustomAppBarback({required this.title});
  NotificationController notificationcontroller =
      Get.put(NotificationController());
  
  
  MyCartController mycartController = Get.put(MyCartController());
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Adjust the height as needed.

  @override
  Widget build(BuildContext context) {
    return  AppBar( 
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  Get.back();
                  // Get.off(()=>BottomNavBar());
                },
                child: Icon(Icons.arrow_left, color: MyColors.black)),
          ),

 title: Center(child: Text(title.toString(),   style: CustomTextStyle.appbartext,),),
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
                         notificationcontroller.userNotificationModel == ""?
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
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
 notificationcontroller.userNotifyListModel == null?
                                Text("0"):Text(
                (notificationcontroller.totalNotify??0).toString(),
                                      
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
                    Get.to(AddToCardUser());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():

    mycartController.mycartmodel  == ""?
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
                       mycartController.mycartmodel == null? SizedBox():
                      GetBuilder<MyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return 
                                  
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




class CustomAppBarTitleback extends StatelessWidget implements PreferredSizeWidget {
 
  NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
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
   //   notificationcontroller.init();
      // mycartController.init();
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
 notificationcontroller.userNotificationModel == ""?
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
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            return   notificationcontroller .userNotificationModel == null
                            ? const SizedBox():
                           Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child:
 notificationcontroller.userNotifyListModel == null?
                                Text("0"):Text(
                (notificationcontroller.totalNotify??0).toString(),
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
                    Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg",color:Colors.white))),

              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
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


class CustomAppBarwhite extends StatelessWidget implements PreferredSizeWidget {
    NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
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
//             
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
                      GetBuilder<NotificationController>(
                          init: notificationcontroller,
                          builder: (_) {
                            
                            return    notificationcontroller .userNotificationModel == null 
                           
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
 notificationcontroller.userNotifyListModel == null?
                                Text("0"):Text(
                (notificationcontroller.totalNotify??0).toString(),
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
                    Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

 mycartController.mycartmodel!.data!.isEmpty?
SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 18.0, color: MyColors.red),
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