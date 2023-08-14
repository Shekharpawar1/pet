import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myPetListController.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class UserMyPets extends StatefulWidget {
  const UserMyPets({super.key});

  @override
  State<UserMyPets> createState() => _UserMyPetsState();
}

class _UserMyPetsState extends State<UserMyPets> {
  UserMyPetListController userMyPetListController =
      Get.put(UserMyPetListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          "Pets",
          style: CustomTextStyle.appbartext,
        )),
        actions: [
          InkWell(
              onTap: () {
                Get.to(NotificationUser());
              },
              child: SvgPicture.asset("assets/image/notification.svg")),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/image/bag.svg"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here when the button is pressed
          print('Add Pets Button Pressed');
          Get.to(AddMypet());
        },
        tooltip: 'Add Pets',

        // label: Text('Action'),
        child:
            // Row(
            // mainAxisSize: MainAxisSize.min,
            // children: [
            Icon(Icons.add), // Add your desired icon here
        //   SizedBox(height: 6), // Add some spacing between icon and text
        //   Text('Add Pets'), // Add your desired text here
        // ],
        // ),
      ),
      body: GetBuilder<UserMyPetListController>(
          init: userMyPetListController,
          builder: (context) {
            return Stack(
              children: [
                userMyPetListController.petListModel != null &&
                        userMyPetListController.petListModel!.state != null
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            userMyPetListController.petListModel!.state!.length,
                        itemBuilder: (context, index) {
                          var pet = userMyPetListController
                              .petListModel!.state![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: pet.image!,
                                      width: Get.width * 0.3,
                                      // height: 50,
                                      placeholder: (context, url) => Center(
                                        child: Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .blue, // Color of the progress bar
                                            size:
                                                50.0, // Size of the progress bar
                                          ),
                                        ),
                                      ), // Replace with your own placeholder widget
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons
                                              .pets), // Replace with your own error widget
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Gender: ${pet.gender.toString()}"),
                                        Text("Name: ${pet.petName!}"),
                                        Text("Breed: ${pet.breeds!}"),
                                        Text("Date of Birth: ${pet.dob!}"),
                                        Text("Age: ${pet.age!}"),
                                        Text("Pet Type: ${pet.petsType!}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : SizedBox(),
                // Show Loading
                userMyPetListController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      )
                    : SizedBox(),
                userMyPetListController.showLoading
                    ? Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : SizedBox(),
              ],
            );
          }),
    );
  }
}
