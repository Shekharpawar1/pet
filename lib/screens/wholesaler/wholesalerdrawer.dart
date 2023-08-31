import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/screens/intro2.dart';



import 'package:pet/screens/wholesaler/Dashboard.dart';
import 'package:pet/screens/wholesaler/login.dart';
import 'package:pet/screens/wholesaler/myOrderPage.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/wholeprofile.dart';

import 'package:pet/screens/wholesaler/wholefavourite.dart';
import 'package:pet/screens/wholesaler/wholetranscation.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class drawerWholeSaler extends StatefulWidget {
  const drawerWholeSaler({
    super.key,
  });

  @override
  State<drawerWholeSaler> createState() => _drawerWholeSalerState();
}

class _drawerWholeSalerState extends State<drawerWholeSaler> {
  WholeMyOrderController wholemyordercontroller = Get.put(WholeMyOrderController());

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
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        children: [
           Container(height:MediaQuery.of(context).size.height*0.2,

                child: DrawerHeader(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap:(){
                        // Get.to(Profile());
                      },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
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
            alignment: Alignment.topCenter,
                children:[
                    Padding(
                  padding: EdgeInsets.only(bottom: 20),
               child:CircleAvatar(
                radius:35,
                backgroundColor: Colors.transparent,
                  child: Image.asset("assets/image/boyprofile3.png"),
                ),),
               
                Positioned(
                 
                  bottom: 10,
                  child: Image.asset("assets/image/drawer2.png",height: 25,),
              
                ) 
              ]),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text(
                                                  "User",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                                          color:MyColors.white),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "user123@gmail.com",
                                                  style: TextStyle(
                                            color:MyColors.white,fontSize: 16),
                                                ),
                                              ]),
                                        ],
                                      ),

                                    ]),

                              ]),
                        ),
                      ),
                    ],
                  ),
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
        Get.to(WholeSalerProfile());
        break;
      case 2:
      await wholemyordercontroller.init();
      Get.to(MyOrderWhole());
        break;
      case 3:
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
        Get.offAll(LoginWhole());
        break;
    }
  }
}
