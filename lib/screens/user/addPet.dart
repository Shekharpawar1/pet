import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myPetListController.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/drawer.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
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
  void initState() {
    userMyPetListController.clearFields();
    userMyPetListController.init();
    notificationcontroller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
             key: _drawerkey,
      drawer: drawer(),
           appBar:CustomAppBar(drawerKey: _drawerkey),
//             appBar: AppBar(
//               elevation: 0,
//               automaticallyImplyLeading: false,
//               backgroundColor: MyColors.green,
//               // leading: Padding(
//               //   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
//               //   child:   InkWell(onTap: (){
//               //     Navigator.pop(context);
//               //   },
//               //     child: Icon(Icons.arrow_back_ios,color: black,size: 20,

//               //     ),
//               //   ),
//               // ),

//               actions: [
//                 Stack(
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Get.to(NotificationUser());
//                         },
//                         child: Center(
//                           child: Icon(
//                             Icons.notifications,
//                             color: MyColors.black,
//                           ),
//                         )),
//                     Positioned(
//                         top: 10.0,
//                         right: 0,
//                         child: Stack(
//                           children: <Widget>[
//                             Icon(Icons.brightness_1,
//                                 size: 15.0, color: MyColors.red),
//                             Positioned(
//                                 top: 3.0,
//                                 right: 4.0,
//                                 child: Center(
//                                   child: Text(
//                                     ('5').toString(),
//                                     // list.length.toString(),
//                                     style: TextStyle(
//                                         color: MyColors.white,
//                                         fontSize: 8.0,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 )),
//                           ],
//                         )),
//                   ],
//                 ),

//                 SizedBox(width: 20),

//                 Stack(
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Get.to(AddToCardUser());
//                         },
//                         child: Center(
//                             child: SvgPicture.asset(
//                           "assets/image/bag.svg",
//                           color: Colors.black,
//                         ))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//                     Positioned(
//                         top: 10.0,
//                         right: 0,
//                         child: Stack(
//                           children: <Widget>[
//                             Icon(Icons.brightness_1,
//                                 size: 15.0, color: MyColors.red),
//                             Positioned(
//                                 top: 3.0,
//                                 right: 4.0,
//                                 child: Center(
//                                   child: Text(
//                                     ('5').toString(),
//                                     // list.length.toString(),
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 8.0,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 )),
//                           ],
//                         )),
//                   ],
//                 ),

//                 SizedBox(
//                   width: 20,
//                 )

//                 // ],
//                 //   InkWell(
//                 //       onTap: () {
//                 //         Get.to(NotificationUser());
//                 //       },
//                 //       child: SvgPicture.asset(
//                 //         "assets/image/notification.svg",
//                 //         color: MyColors.white,
//                 //       )),
//                 //   // Image.asset("assets/image/cartimg.png"),
//                 //   SizedBox(width: 20),
//                 //   Padding(
//                 //     padding: EdgeInsets.only(right: 20.0),
//                 //     child: SvgPicture.asset(
//                 //       "assets/image/bag.svg",
//                 //       color: MyColors.white,
//                 //     ),
//                 //   ),
//               ],

//               // title: Text(
//               //   "My Pet",
//               //   style: CustomTextStyle.appbartextwhite,
//               // ),
//             ),
         
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
            body:
           
             GetBuilder<UserMyPetListController>(
              init: userMyPetListController,
              // initState: (_) {},
              builder: (_) {
                return userMyPetListController.petListModel != null ||
                        userMyPetListController.petListModel!.data != null
                    || userMyPetListController
                                      .petListModel!.data!.isEmpty?
            Center(child: Image.asset("assets/image/dogImage.gif"))

            :
                    
                    Stack(
                        children: [
                          ListView(
                            primary: true,
                            shrinkWrap: false,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Container(
                                // height: MediaQuery.of(context).size.height,

                                decoration: BoxDecoration(
                                    color: MyColors.green,
                                    image: DecorationImage(
                                        image: AssetImage(
                                      "assets/image/girlwithdog.png",
                                    ))),
                                child:
                                    // ListView(
                                    //     primary: false,
                                    //     shrinkWrap: true,
                                    //     physics: const NeverScrollableScrollPhysics(),
                                    //     children: [

                                    ListView.builder(
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
                                        : Padding(
                                            padding:
                                                EdgeInsets.only(top: 200.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: MyColors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Stack(
                                                  alignment: Alignment.topLeft,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Container(
                                                        width: 400,
                                                        height: 150,
                                                        margin: EdgeInsets.all(
                                                            16.0),
                                                        child: Card(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          color: Colors.white,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        Container(
                                                                      //alignment: Alignment.topRight,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.03,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.4,
                                                                      decoration: BoxDecoration(
                                                                          color: MyColors
                                                                              .yellow,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20),
                                                                              bottomLeft: Radius.circular(20))),
                                                                      child: Center(
                                                                          child: Text(
                                                                        "${pet.age.toString()}",
                                                                        style: CustomTextStyle
                                                                            .popinssmall0,
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
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
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "${pet.petsType.toString()}",
                                                                          style:
                                                                              CustomTextStyle.popinstext,
                                                                        ),
                                                                        Text(
                                                                          "${pet.gender.toString()}",
                                                                          style:
                                                                              CustomTextStyle.popinssmall0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // Row(
                                                                  //   mainAxisAlignment:
                                                                  //       MainAxisAlignment
                                                                  //           .end,
                                                                  //   crossAxisAlignment:
                                                                  //       CrossAxisAlignment
                                                                  //           .start,
                                                                  //   children: [
                                                                  //     Image.asset(
                                                                  //         "assets/image/edit0.png"),
                                                                  //     Image.asset(
                                                                  //         "assets/image/delete0.png")
                                                                  //   ],
                                                                  // ),
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
                                                      child: CachedNetworkImage(
                                                        imageUrl: Constants
                                                                .USER_PET_IMAGE_PATH +
                                                            "/" +
                                                            pet.image!,
                                                        width: 50,
                                                        height: 50,
                                                        placeholder:
                                                            (context, url) =>
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
                                                                url, error) =>
                                                            Icon(Icons
                                                                .pets), // Replace with your own error widget
                                                      ),

                                                      // decoration: BoxDecoration(
                                                      //   // shape: BoxShape.circle,
                                                      //   // border: Border.all(
                                                      //   //   color: Colors.black12,
                                                      //   // ),
                                                      //   color: Colors.transparent,
                                                      //   image:

                                                      //   //  DecorationImage(
                                                      //   //     fit: BoxFit.cover,
                                                      //   //     image: AssetImage(
                                                      //   //         "assets/image/cutedogi2.png")),
                                                      // ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    // : SizedBox();
              },
            )

            //         appBar: AppBar(
            //             elevation: 0,
            //           backgroundColor:green,
            // // leading: Padding(
            // //   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
            // //   child:   InkWell(onTap: (){
            // //     Navigator.pop(context);
            // //   },
            // //     child: Icon(Icons.arrow_back_ios,color: black,size: 20,

            // //     ),
            // //   ),
            // // ),

            //             actions: [
            //             SvgPicture.asset("assets/image/notification.svg",color:MyColors.white,),
            //             // Image.asset("assets/image/cartimg.png"),
            //             SizedBox(width: 20),
            //             Padding(
            //               padding:  EdgeInsets.only(right:20.0),
            //               child: SvgPicture.asset("assets/image/bag.svg",color:MyColors.white,),
            //             ),

            //           ],

            //         title: Text("My Pet",style: CustomTextStyle.appbartextwhite,),
            //         ),

//         body:  Stack(children: [

//           Container(height: MediaQuery.of(context).size.height*0.4,

//           width: MediaQuery.of(context).size.width,
//             child: Image.asset("assets/image/girlwithdog.png",fit: BoxFit.cover,)),

//               Center(
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).size.height*0.06,),
// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child:   Row(crossAxisAlignment: CrossAxisAlignment.center,

//   mainAxisAlignment: MainAxisAlignment.spaceBetween,

//     children: [

//       Icon(Icons.arrow_back_ios_new,color: MyColors.white,size: 20,),

//      Text("My Pet",style: CustomTextStyle.appbartextwhite,),

//      Row(
//        children: [
//          SvgPicture.asset("assets/image/notification.svg",color: MyColors.white,),
//                   // Image.asset("assets/image/cartimg.png"),
//                   SizedBox(width: 20),
//                   Padding(
//                     padding:  EdgeInsets.only(right:0.0),
//                     child: SvgPicture.asset("assets/image/bag.svg",color:MyColors. white,),
//                   ),
//        ],
//      ),

//   ],),
// ),

//                   ],
//                 ),
//               ),

//           ListView(

//             children:[

//               Padding(
//             padding:  EdgeInsets.only(top:200.0),
//             child: Container(
//           height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//  decoration: BoxDecoration(color: MyColors.white,
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
//               ),

//               child: Padding(
//                 padding:  EdgeInsets.all(20),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,

//                   children: [

//                    Stack(
//   alignment: Alignment.topLeft,
//   children: <Widget>[
//     Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Container(
//         width:400,
//         height: 150,
//         margin: EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           ),
//           color: Colors.white,
//           child: Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.end,
//              children: [

//     Align(alignment: Alignment.topRight,
//       child: Container(
//             //alignment: Alignment.topRight,
//             height: MediaQuery.of(context).size.height*0.03,
//             width: MediaQuery.of(context).size.width*0.4,
//             decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
//          child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
//     ),

//             ],),

//           SizedBox(height: 10,),
// Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),
// Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),

//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//  Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//      children: [
//        Text("Jumba",style: CustomTextStyle.popinstext,),
//  Text("Female",style: CustomTextStyle.popinssmall0,),
//      ],
//    ),
//  ),

//             Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   crossAxisAlignment: CrossAxisAlignment.start,

//   children: [
// Image.asset("assets/image/edit0.png"),

// Image.asset("assets/image/delete0.png")
// ],),
//           ],
//           )

//           ],
//           ),
//         ),
//       ),
//     ),
//  Container(
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(
//         // shape: BoxShape.circle,
//         // border: Border.all(
//         //   color: Colors.black12,
//         // ),
//         color: Colors.transparent,
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image:AssetImage("assets/image/cutedogi2.png")

//         ),
//       ),
//     ),

//   ],
// ),

//    Stack(
//   alignment: Alignment.topLeft,
//   children: <Widget>[
//     Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Container(
//         width:400,
//         height: 150,
//         margin: EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           ),
//           color: Colors.white,
//           child: Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.end,
//              children: [

//     Align(alignment: Alignment.topRight,
//       child: Container(
//             //alignment: Alignment.topRight,
//             height: MediaQuery.of(context).size.height*0.03,
//             width: MediaQuery.of(context).size.width*0.4,
//             decoration: BoxDecoration(color:MyColors. bgcolor,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
//          child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
//     ),

//             ],),

//           SizedBox(height: 10,),
// Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),
// Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),

//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//  Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//      children: [
//        Text("Jumba",style: CustomTextStyle.popinstext,),
//  Text("Female",style: CustomTextStyle.popinssmall0,),
//      ],
//    ),
//  ),

//             Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   crossAxisAlignment: CrossAxisAlignment.start,

//   children: [
// Image.asset("assets/image/edit0.png"),

// Image.asset("assets/image/delete0.png")
// ],),
//           ],
//           )

//           ],
//           ),
//         ),
//       ),
//     ),
//  Container(
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(
//         // shape: BoxShape.circle,
//         // border: Border.all(
//         //   color: Colors.black12,
//         // ),
//         color: Colors.transparent,
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image:AssetImage("assets/image/cutedogi.png")

//                   // SvgPicture.asset("assets/image/avatardogyellow.svg"),
//           // AssetImage("assets/image/avatardogyellow.png")

//         ),
//       ),
//     ),

//   ],
// ),

// // Container(
// //   // margin: EdgeInsets.all(10),
// //   height: MediaQuery.of(context).size.height*0.3,
// //   width: MediaQuery.of(context).size.width,

// //   decoration: BoxDecoration(color:MyColors.white,
// //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
// //                 ),
// // child: Row(children: [
// // Column(children: [
// //  Image.asset("assets/image/cutedog.png"),

// //  Text("Jumba",style: CustomTextStyle.popinstext,),
// //   Text("Female",style: CustomTextStyle.popinssmall0,)
// // ],),

// //   Column(crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //     Positioned(right: 0,
// //       child: Container(
// //         // alignment: Alignment.topRight,
// //         height: MediaQuery.of(context).size.height*0.03,
// //         width: MediaQuery.of(context).size.width*0.4,
// //         decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
// //        child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
// //     )
// // ,

// // SizedBox(height: 3,),
// // Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
// // SizedBox(height: 3,),
// // Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
// // SizedBox(height: 3,),
// // Row(
// //   //mainAxisAlignment: MainAxisAlignment.end,

// //   children: [
// // Image.asset("assets/image/edit0.png"),

// // Image.asset("assets/image/delete0.png")
// // ],)

// //   ],)
// // ]),

// // )

//                           ],),
//               ),),
//             ),

//             ]    )

//           ],),

            ),

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
