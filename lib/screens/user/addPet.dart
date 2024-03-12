import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myPetListController.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/drawer.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  UserMyPetListController userMyPetListController =
      Get.put(UserMyPetListController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());

  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  // void initState() {

  //   super.initState();
  // }
  @override
  void onInit() {
    userMyPetListController.clearFields();
    userMyPetListController.init();
    // notificationcontroller.init();

    //  cancelmessage =  storage.read('cancelmessage');
  }

  @override
  Widget build(BuildContext context) {
    userMyPetListController.init();
    return Stack(
      children: [
        Scaffold(
            key: _drawerkey,
            drawer: drawer(),
            backgroundColor: MyColors.white,
            appBar: CustomAppBarGreenDrawer(drawerKey: _drawerkey),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your logic here when the button is pressed
                print('Add Pets Button Pressed');
                Get.to(AddMypet());
              },
              tooltip: 'Add Pets',

              child: Icon(Icons.add), // Add your desired icon here
            ),
            body: GetBuilder<UserMyPetListController>(
              init: userMyPetListController,
              // initState: (_) {},
              builder: (_) {
                return userMyPetListController.petListModel == null ||
                        userMyPetListController.petListModel!.data == null ||
                        userMyPetListController.petListModel!.data!.isEmpty
                    ? InkWell(
                        onTap: () {
                          print('Add Pets Button Pressed');
                          Get.to(AddMypet());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child:
                                    Image.asset("assets/image/dogImage.gif")),
                            SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MyColors.yellow,
                                    borderRadius: BorderRadius.circular(25)),
                                // Yellow background color
                                padding: EdgeInsets.all(
                                    16.0), // Padding to provide some space
                                child: Center(
                                  child: Text(
                                    'Add Pet',
                                    style: CustomTextStyle.popinssmall,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                              height: 155,
                              decoration: BoxDecoration(
                                  color: MyColors.green,
                                  image: DecorationImage(
                                      image: AssetImage(
                                    "assets/image/girlwithdog.png",
                                  )))),

                          // ListView(
                          //     primary: false,
                          //     shrinkWrap: true,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     children: [

                          ListView(
                            shrinkWrap: true,
                            primary: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                ),
                                child: SingleChildScrollView(
                                  child: ListView.builder(
                                    // physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: userMyPetListController
                                        .petListModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      var pet = userMyPetListController
                                          .petListModel!.data![index];
                                      return (userMyPetListController
                                                  .petListModel!.data ==
                                              null)
                                          ? const SizedBox()
                                          : ListView(
                                              shrinkWrap: true,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 15.0),
                                                  child: Container(
                                                    // height: MediaQuery.of(context)
                                                    //     .size
                                                    //     .height*0.85,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,

                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: Container(
                                                              width: 400,
                                                              height: 160,
                                                              margin: EdgeInsets
                                                                  .all(10.0),
                                                              child: Card(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.topRight,
                                                                          child:
                                                                              Container(
                                                                            //alignment: Alignment.topRight,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.03,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            decoration:
                                                                                BoxDecoration(color: MyColors.yellow, borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "${pet.age.toString()}",
                                                                              style: CustomTextStyle.popinssmall0,
                                                                            )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "Date of Birth: ${pet.dob.toString()}",
                                                                      style: CustomTextStyle
                                                                          .popinssmall1,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Text(
                                                                      "Pet Name: ${pet.petName.toString()}",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: CustomTextStyle
                                                                          .popinssmall1,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "${pet.petsType.toString()}",
                                                                                style: CustomTextStyle.popinstext,
                                                                              ),
                                                                              Text(
                                                                                "${pet.gender.toString()}",
                                                                                style: CustomTextStyle.popinssmall0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 70,
                                                            width: 70,
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: Constants
                                                                      .USER_PET_IMAGE_PATH +
                                                                  "/" +
                                                                  pet.image!,
                                                              width: 50,
                                                              height: 50,
                                                              placeholder:
                                                                  (context,
                                                                          url) =>
                                                                      Center(
                                                                child: Center(
                                                                  child:
                                                                      SpinKitCircle(
                                                                    color: Colors
                                                                        .blue, // Color of the progress bar
                                                                    size:
                                                                        50.0, // Size of the progress bar
                                                                  ),
                                                                ),
                                                              ), // Replace with your own placeholder widget
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .pets), // Replace with your own error widget
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
              },
            )),

        GetBuilder<UserMyPetListController>(
            init: userMyPetListController,
            builder: (_) {
              return userMyPetListController.showLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Adjust the opacity as needed
                      ),
                    )
                  : SizedBox();
            }),
        // Progress bar
        GetBuilder<UserMyPetListController>(
            init: userMyPetListController,
            builder: (_) {
              return userMyPetListController.showLoading
                  ? Center(
                      child: SpinKitCircle(
                        color: Colors.white, // Color of the progress bar
                        size: 50.0, // Size of the progress bar
                      ),
                    )
                  : SizedBox();
            }),
      ],
    );
  }
}
