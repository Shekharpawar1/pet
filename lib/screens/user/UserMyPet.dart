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
    userMyPetListController.init();
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
                Get.to(const NotificationUser());
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
            return userMyPetListController.petListModel != null &&
                    userMyPetListController.petListModel!.data != null
                ? ListView.builder(
                    // physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount:
                        userMyPetListController.petListModel!.data!.length,
                    itemBuilder: (context, index) {
                      var pet =
                          userMyPetListController.petListModel!.data![index];
                      return (userMyPetListController.petListModel!.data! ==
                              null)
                          ? SizedBox()
                          :
                          //  Container(
                          //    child: Stack(
                          //    alignment: Alignment.topLeft,
                          //    children: <Widget>[
                          //      Padding(
                          //        padding: EdgeInsets.only(top: 10),
                          //        child: Container(
                          //          width:400,
                          //          height: 150,
                          //          margin: EdgeInsets.all(16.0),
                          //          child: Card(
                          //            shape: RoundedRectangleBorder(
                          //            borderRadius: BorderRadius.circular(20),
                          //            ),
                          //            color: Colors.white,
                          //            child: ListView(
                          //               shrinkWrap: true,
                          //         // primary: false,
                          //            children: [
                          //              Row(mainAxisAlignment: MainAxisAlignment.end,
                          //               children: [

                          //      Align(alignment: Alignment.topRight,
                          //        child: Container(
                          //              //alignment: Alignment.topRight,
                          //              height: MediaQuery.of(context).size.height*0.03,
                          //              width: MediaQuery.of(context).size.width*0.4,
                          //              decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
                          //           child: Center(child: Text("${pet.dob.toString()}",style: CustomTextStyle.popinssmall0,)), ),
                          //      ),

                          //              ],),

                          //            SizedBox(height: 10,),
                          //  Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
                          //  SizedBox(height: 3,),
                          //  Text("${pet.petsType.toString()}",style:CustomTextStyle.popinssmall1,),
                          //  SizedBox(height: 3,),

                          //            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //            crossAxisAlignment: CrossAxisAlignment.start,
                          //            children: [
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         Text("${pet.petName.toString()}",style: CustomTextStyle.popinstext,),
                          //   Text("${pet.gender.toString()}",style: CustomTextStyle.popinssmall0,),
                          //    Text("${pet.age.toString()}",style: CustomTextStyle.popinssmall0,),

                          //       ],
                          //     ),
                          //   ),

                          //              Row(
                          //    mainAxisAlignment: MainAxisAlignment.end,
                          //    crossAxisAlignment: CrossAxisAlignment.start,

                          //    children: [
                          //  Image.asset("assets/image/edit0.png"),

                          //  Image.asset("assets/image/delete0.png")
                          //  ],),
                          //            ],
                          //            )

                          //            ],
                          //            ),
                          //          ),
                          //        ),
                          //      ),

                          //   Container(
                          //        height: 100,
                          //        width: 100,
                          //        decoration: BoxDecoration(
                          //          // shape: BoxShape.circle,
                          //          // border: Border.all(
                          //          //   color: Colors.black12,
                          //          // ),
                          //          color: Colors.transparent,
                          //          image: DecorationImage(
                          //            fit: BoxFit.cover,

                          //           image:AssetImage("assets/image/cutedogi2.png")

                          //          ),
                          //        ),
                          //      ),

                          //    ],
                          //  ),
                          //  );

                          Padding(
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
                : SizedBox();
            // Show Loading
            // userMyPetListController.showLoading
            //     ? BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //         child: Container(
            //           color: Colors.black
            //               .withOpacity(0.5), // Adjust the opacity as needed
            //         ),
            //       )
            //     : SizedBox(),
            // userMyPetListController.showLoading
            //     ? Center(
            //         child: SpinKitCircle(
            //           color: Colors.white, // Color of the progress bar
            //           size: 50.0, // Size of the progress bar
            //         ),
            //       )
            //     : SizedBox(),
            //   ],
            // );
          }),
    );
  }
}
