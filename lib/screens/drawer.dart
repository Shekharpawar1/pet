import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/user/Mypetdetails.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/profile.dart';
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
    "My Transaction",
    "Logout"
  ];

  static final List<IconData> _listViewIcons = [
    Icons.person,
    Icons.shopping_bag_outlined,
    Icons.notifications,
    Icons.favorite,
    Icons.pets,
    Icons.cleaning_services,
    Icons.payment_outlined,
    Icons.logout,
  ];

  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        children: [
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
        Get.to(ServicePage());
        break;
      case 6:
        Get.to(Usertranscation());
        break;
      case 7:
        await GetStorage().erase();
        Get.offAll(LoginUser());
        break;
    }
  }
}
