

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/myPetController.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/controllers/user_controller/profile_controller.dart';
import 'package:pet/screens/Mypetdetails.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/addPet.dart';
import 'package:pet/screens/user/userprofile.dart';
import 'package:pet/screens/user/service.dart';
import 'package:pet/screens/user/userMyPet.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/commonscreen.dart';
import 'package:pet/screens/user/userHome.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, this.index});
  int? index;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void initState() {
    _currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  final pages = [
    HomeUser(),
    ServicePage(),
    AddPet(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              // topLeft: Radius.circular(25),
              // topRight: Radius.circular(25),
              ),
        ),
        child: BottomNavigationBar(
          

          elevation: 0,
          backgroundColor: MyColors.bgcolor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColors.yellow,
          // unselectedItemColor: hinttext.withOpacity(.60),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          unselectedItemColor: MyColors.white,
          onTap: (value) {
            print("bottomvalue");
            print(value);
              if (value == 0) {
              MyCartController mycartController = Get.put(MyCartController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());
               notificationcontroller.notifyinit();
               mycartController.init();
            }
            if (value == 2) {
              UserMyPetController userMyPetController =
                  Get.put(UserMyPetController());
              userMyPetController.clearFields();
              userMyPetController.init();
            }
            
            if (value == 3) {
              ProfileController profileController =
                  Get.put(ProfileController());
              profileController.clearFields();
              profileController.myprofile();
            }
            setState(() => _currentIndex = value);
          },
          selectedLabelStyle: CustomTextStyle.popinssmall0,
          unselectedLabelStyle: CustomTextStyle.popinssmall0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/image/home.svg",
                  color: _currentIndex == 0 ? MyColors.yellow : MyColors.white),
              //Icon(Icons.home,color:_currentIndex==0?white:white.withOpacity(.60),),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              //  icon: Image.asset("asset/images/doctor.png",color:_currentIndex==1?buttoncolor:hinttext.withOpacity(.60)),
              icon: SvgPicture.asset("assets/image/service.svg",
                  color: _currentIndex == 1 ? MyColors.yellow : MyColors.white),

              label: 'Service',
            ),
            BottomNavigationBarItem(
              //icon: Image.asset("asset/images/nurse.png",color:_currentIndex==2?buttoncolor:hinttext.withOpacity(.60)),
              icon: SvgPicture.asset("assets/image/petimg.svg",
                  color: _currentIndex == 2 ? MyColors.yellow : MyColors.white),
              label: 'Mypet',
            ),
            BottomNavigationBarItem(
              //  icon: Image.asset("asset/images/ambulance1.png",color:_currentIndex==3?buttoncolor:hinttext.withOpacity(.60)),
              icon: SvgPicture.asset("assets/image/profilepet.svg",
                  color: _currentIndex == 3 ? MyColors.yellow : MyColors.white),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
