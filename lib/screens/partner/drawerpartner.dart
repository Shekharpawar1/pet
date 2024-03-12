import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/partner_controller/notification_controller.dart';
import 'package:pet/controllers/partner_controller/partnerprofile_controller.dart';

import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/partner/Dashboard.dart';
import 'package:pet/screens/partner/myplan.dart';
import 'package:pet/screens/partner/notification.dart';
import 'package:pet/screens/partner/partnerprofile.dart';
import 'package:pet/screens/partner/profilepart.dart';
import 'package:pet/screens/user/login.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class drawerpartner extends StatefulWidget {
  const drawerpartner({
    super.key,
  });

  @override
  State<drawerpartner> createState() => _drawerpartnerState();
}

class _drawerpartnerState extends State<drawerpartner> {
  // MyOrderController myordercontroller = Get.put(MyOrderController());
PartnerNotificationController partnerNotificationController = Get.put(PartnerNotificationController());

PartnerProfileController profilecontroller = Get.put(PartnerProfileController());
  static final List<String> _listViewData = [
    "Profile",
    "DashBoard",
    "My Plan",
    "Notifications",
    "Logout"
  ];

  static final List<IconData> _listViewIcons = [
      Icons.person, 
    Icons.dashboard,
    Icons.subscriptions_outlined,
    Icons.notifications,
    Icons.logout,
  ];

  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    profilecontroller.partnerprofile();
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        children: [
           Container(height:MediaQuery.of(context).size.height*0.2,

                child: DrawerHeader(

                  child: GetBuilder<PartnerProfileController>(
                  init: profilecontroller,
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
                                                        child:
                                                        profilecontroller
                              .partnerprofilemodel == null || profilecontroller
                              .partnerprofilemodel!.data == null || profilecontroller
                              .partnerprofilemodel!.data!.isEmpty ?   Image.asset("assets/image/boyprofile3.png") :
                
                                                            CachedNetworkImage(
                                                          imageUrl: "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                                            profilecontroller
                         .partnerprofilemodel!
                                                                  
                                                                  .data![0]
                                                                  .vendorId![0].image
                                                                  .toString(),

                                                          fit: BoxFit.cover,
                                                          
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
                                                    Positioned(
                                                      bottom: 10,
                                                      child: InkWell(
                                                        onTap:(){
                                                          Get.to(PartnerProfile());
                                                        },
                                                        child: Image.asset(
                                                          "assets/image/drawer2.png",
                                                          height: 25,
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  
                                                        profilecontroller
                              .partnerprofilemodel == null || profilecontroller
                              .partnerprofilemodel!.data == null || profilecontroller
                              .partnerprofilemodel!.data!.isEmpty ?  Text("Username",style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                      "${profilecontroller
                              .partnerprofilemodel!.data![0].vendorId![0].fName.toString()} ${profilecontroller
                              .partnerprofilemodel!.data![0].vendorId![0].lName.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                         
                                                        profilecontroller
                              .partnerprofilemodel == null || profilecontroller
                              .partnerprofilemodel!.data == null || profilecontroller
                              .partnerprofilemodel!.data!.isEmpty ? Text("Email",style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                    profilecontroller
                              .partnerprofilemodel!
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
      profilecontroller.partnerprofile();
        Get.to(PartnerProfile());
        break;
          case 1:
     Get.to(DashboardPartner());
        break;
       case 2:
      //  partnerNotificationController.init();
                              
        Get.to(MyPlan());
        break; 
      case 3:
       partnerNotificationController.init();
                              
        Get.to(NotificationPartner());
        break;
      // case 3:
      //   Get.to(Userfavourite());
      //   break;
      case 4:
        await GetStorage().erase();
        Get.offAll(LoginUser());
        break;
    }
  }
}
