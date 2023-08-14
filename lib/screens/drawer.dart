import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/screens/user/Mypetdetails.dart';
import 'package:pet/screens/user/UserMyPet.dart';
import 'package:pet/screens/user/allveterniary.dart';
import 'package:pet/screens/user/myservices.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/userprofile.dart';
import 'package:pet/screens/user/service.dart';
import 'package:pet/screens/user/userfavourite.dart';
import 'package:pet/screens/user/usertranscation.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class drawer extends StatefulWidget {
  const drawer({
    super.key,
  });

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  static final List<String> _listViewData = [
    "Profile",
    "My Order",
    "Notifications",
    "Favourite",
    "My Pet",
    "My Services",
    "Veterniary",
    "My Transaction"
  ];

  static final List<IconData> _listViewIcons = [
    Icons.person,
    Icons.shopping_bag_outlined,
    Icons.notifications,
    Icons.favorite,
    Icons.pets,
    Icons.cleaning_services,
    Icons.pets_sharp, 
     Icons.payment_outlined,
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

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Get.to(UserProfile());
        break;
      case 1:
      Get.to(OrderDetailsUser());
        break;
      case 2:
        Get.to(NotificationUser());
        break;
      case 3:
        Get.to(Userfavourite());
        break;
      case 4:
        Get.to(MyPetDetails());
        break;
      case 5:
      Get.to(Myservices());
        break;
           case 6:
      Get.to(AllVeterniary());
        break;
     case 7:
      Get.to(Usertranscation());
        break;
    }
  }
}
