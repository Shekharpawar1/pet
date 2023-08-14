import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class Profilewhole extends StatefulWidget {
  const Profilewhole({super.key});

  @override
  State<Profilewhole> createState() => _ProfilewholeState();
}

class _ProfilewholeState extends State<Profilewhole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
          child: Image.asset(
            "assets/image/menu2.png",
          ),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
          "Profile",
          style: CustomTextStyle.appbartext,
        )),
        actions: [
          InkWell(
              onTap: () {
                Get.to(NotificationUser());
              },
              child: SvgPicture.asset("assets/image/notification.svg")),
          // Image.asset("assets/image/cartimg.png"),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/image/bag.svg"),
          ),
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Stack(alignment: Alignment.topCenter, children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/image/boyprofile3.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/image/drawer2.png",
                    height: 35,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Profile",
                      style: CustomTextStyle.popinstext,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(AddMypet());
                    },
                    title: Text(
                      "My Orders",
                      style: CustomTextStyle.popinstext,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Notifications",
                      style: CustomTextStyle.popinstext,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Messages",
                      style: CustomTextStyle.popinstext,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Favourite",
                      style: CustomTextStyle.popinstext,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
