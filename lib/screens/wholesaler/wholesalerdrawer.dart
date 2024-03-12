import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/notification_controller.dart';
import 'package:pet/controllers/wholesaler_controller/profilewhole_controller.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/user/login.dart';



import 'package:pet/screens/wholesaler/Dashboard.dart';
import 'package:pet/screens/wholesaler/login.dart';
import 'package:pet/screens/wholesaler/myOrderPage.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/wholeprofile.dart';

import 'package:pet/screens/wholesaler/wholefavourite.dart';
import 'package:pet/screens/wholesaler/wholetranscation.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import '../../utils/constants.dart';

class drawerWholeSaler extends StatefulWidget {
  const drawerWholeSaler({
    super.key,
  });

  @override
  State<drawerWholeSaler> createState() => _drawerWholeSalerState();
}

class _drawerWholeSalerState extends State<drawerWholeSaler> {
  WholeMyOrderController wholemyordercontroller = Get.put(WholeMyOrderController());
WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
      
WholeProfileController wholeprofilecontroller = Get.put(WholeProfileController());
      
 @override
  void initState() {
    super.initState();
    

wholeProfileController.myprofile();

  }
WholeProfileController wholeProfileController = Get.put(WholeProfileController());
  static final List<String> _listViewData = [
    "Dashboard",
    "Profile",
    "My Order",
    "Notifications",
    "Favourite",
    // "Transaction History",
    "Logout"
  ];

  static final List<IconData> _listViewIcons = [
    Icons.dashboard,
    Icons.person,
    Icons.shopping_bag_outlined,
    Icons.notifications,
    Icons.favorite,
    // Icons.payment_outlined,
    Icons.logout,
 
   
  ];

  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    wholeProfileController.myprofile();
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        children: [
           Container(height:MediaQuery.of(context).size.height*0.2,

                child: DrawerHeader(
              child: GetBuilder<WholeProfileController>(
                  init: wholeProfileController,
                  builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(Profile());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: CircleAvatar(
                                                        radius: 35,
                                                         backgroundColor:
                                                              Colors.transparent,
                                                        child: ClipOval(
                                                          child:
                                                          wholeProfileController
                                                                                    .wholemyprofilemodel == null || wholeProfileController
                                                                                    .wholemyprofilemodel!.data == null || wholeProfileController
                                                                                    .wholemyprofilemodel!.data!.isEmpty ?  Image.asset("assets/image/boyprofile3.png") :
                                                                      (wholeProfileController
                                                                                    .wholemyprofilemodel!.data![0].image == null)?
                                                              CachedNetworkImage(
                                                            imageUrl:  "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                                                                wholeProfileController
                                                                                    .wholemyprofilemodel!
                                                                    
                                                                    .data![0]
                                                                    .upload1
                                                                    .toString(),
                                                      
                                                            fit: BoxFit.cover,
                                                            width: 75,
                                                            height: 75,
                                                            placeholder:
                                                                (context, url) =>
                                                                    Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ), // Replace with your own placeholder widget
                                                            errorWidget: (context,
                                                                    url, error) =>
                                                                Icon(Icons
                                                                    .error), // Replace with your own error widget
                                                          )
:
       CachedNetworkImage(
                                                            imageUrl:  "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                                                                wholeProfileController
                                                                                    .wholemyprofilemodel!
                                                                    
                                                                    .data![0]
                                                                    .image
                                                                    .toString(),
                                                      
                                                            fit: BoxFit.cover,
                                                            width: 75,
                                                            height: 75,
                                                            placeholder:
                                                                (context, url) =>
                                                                    Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ), // Replace with your own placeholder widget
                                                            errorWidget: (context,
                                                                    url, error) =>
                                                                Icon(Icons
                                                                    .error), // Replace with your own error widget
                                                          ),
                                                         
                                                         
                                                         
                                                         
                                                          //  Image.asset("assets/image/boyprofile3.png"),
                                                        ),
                                                      ),
                                                    ),
                                                   Positioned(
                                                        bottom: 10,
                                                        child:   InkWell(
                                                      onTap:(){
Get.to(WholeSalerProfile());
                                                      },
                                                      child:Image.asset(
                                                          "assets/image/drawer2.png",
                                                          height: 25,
                                                        ),)
                                                      
                                                    )
                                                  ]),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  
                                                        wholeProfileController
                              .wholemyprofilemodel == null || wholeProfileController
                              .wholemyprofilemodel!.data == null || wholeProfileController
                              .wholemyprofilemodel!.data!.isEmpty ? Text("Username",style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                    "${wholeProfileController
                              .wholemyprofilemodel!.data![0].fName.toString()} ${wholeProfileController
                              .wholemyprofilemodel!.data![0].lName.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  
                                                        wholeProfileController
                              .wholemyprofilemodel
      == null || wholeProfileController
                              .wholemyprofilemodel!.data == null || wholeProfileController
                              .wholemyprofilemodel!.data!.isEmpty ? Text("Email",style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                    wholeProfileController
                              .wholemyprofilemodel!
                                                        .data![0]
                                                        .email
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: MyColors.white,
                                                        fontSize: 14),
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ]),
                                ]),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
              ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _listViewData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the corresponding screen
                  _navigateToScreen(context, index);
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: _currentSelected == index
                  //       ? MyColors.gradient
                  //       : MyColors.bgcolor,
                  // ),
                  child: ListTile(
                    title: Text(
                      _listViewData[index],
                      style: CustomTextStyle.reemStyle,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: MyColors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        _listViewIcons[index],
                        color: MyColors.yellow,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToScreen(BuildContext context, int index) async {
    switch (index) {
  
       case 0:
        Get.to(DashboardWhole());
        break;
      case 1:
      wholeprofilecontroller.myprofile();
        Get.to(WholeSalerProfile());
        break;
      case 2:
       wholemyordercontroller.init();
      Get.to(MyOrderWhole());
        break;
      case 3:
// wholenotificationcontroller.init();
 wholenotificationcontroller.notifyinit();
        Get.to(NotificationWhole());
        break;
      case 4:
        Get.to(wholefavourite());
        break;
    //  case 5:
    //   Get.to(wholeTranscation());
    //     break;
      case 5:
        await GetStorage().erase();
        Get.offAll(LoginUser());
        break;
    }
  }
}
