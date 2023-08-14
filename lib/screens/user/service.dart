import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/service_controller.dart';
import 'package:pet/screens/drawer.dart';
import 'package:pet/screens/user/ordersummary.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pet/controllers/user_controller/userServicesAddAppointmentController.dart';
import 'package:pet/controllers/user_controller/userServicesAddVeterinaryController.dart';
import 'package:pet/screens/user/userServicesAddAppointment.dart';
import 'package:pet/screens/user/userServicesAddVeterinary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  //  
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  // ServiceController servicecontroller = Get.put(ServiceController());
  final HomeuserController homeusercontroller = Get.put(HomeuserController());

  final UserServicesAddAppointmentController
      userServicesAddUserServicesAddAppointmentController =
      Get.put(UserServicesAddAppointmentController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _drawerkey,
      drawer: drawer(),
             appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:20.0,top: 15,bottom: 15),
            child: GestureDetector(
               onTap: () {
              _drawerkey.currentState!.openDrawer();
            },
              child: Image.asset(
                "assets/image/menu2.png",
              ),
            ),
          ),
          title: Center(
              child:Text("Services",style:  CustomTextStyle.appbartext,)
          ),
        actions: [
        

                  
          Stack(
            children: [
              InkWell(
                  onTap: () {
                     Get.to(NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
                SizedBox(width: 20),
 Stack(
            children: [
              InkWell(
                  onTap: () {
                      Get.to(AddToCardUser());
                   
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
    
        ],  ),

        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Image.asset("assets/image/bgimg1.png"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          GetBuilder<HomeuserController>(
              init: homeusercontroller,
              builder: (_) {
                return homeusercontroller.userServicesModel == null
                    ? SizedBox()
                    : Container(
                        // height: 600,
                        child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    //  childAspectRatio: 4 / 4,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    mainAxisExtent: 100),
                            itemCount: homeusercontroller
                                .userServicesModel!.data!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              var item = homeusercontroller
                                  .userServicesModel!.data![index];
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.image ?? ""}";

                              return GestureDetector(
                                onTap: () async {
                                  // String url =
                                  //     Constants.GET_SERVICES_CATEGORIES +
                                  //         "/" +
                                  //         item.id.toString();
                                  // homeusercontroller.getServicesCategories(url);

                                  userServicesAddUserServicesAddAppointmentController
                                      .clearFields();
                                  userServicesAddUserServicesAddAppointmentController
                                      .updateServiceId(item.id!);
                                  userServicesAddUserServicesAddAppointmentController
                                      .init();
                                  await userServicesAddUserServicesAddAppointmentController
                                      .fetchAppointmentSlots(item.id!);
                                  print(item);
                                  Get.to(
                                      () => UserServicesAddAppointmentState());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: MyColors.white),
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath,
                                        fit: BoxFit.cover,
                                        // width: 61,
                                        // height: 75,
                                        placeholder: (context, url) => Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ),
                                        // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                    Text(
                                      item.name!,
                                      style: CustomTextStyle.popinssmall0,
                                    )
                                  ],
                                ),
                              );
                              //
                            }));

                // // GridView(
                //             physics: NeverScrollableScrollPhysics(),
                //             scrollDirection: Axis.vertical,
                //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 4,
                //                 crossAxisSpacing: 15,
                //                 mainAxisSpacing: 15,
                //                 mainAxisExtent: 100),
                //             children: [
                //               Column(
                //                 children: [
                //                   Container(
                //                     height: 60,
                //                     width: 60,
                //                     decoration: BoxDecoration(
                //                         border: Border.all(color: Colors.black26, width: 1),
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white),
                //                   ),
                //                   Text(
                //                     "Brush",
                //                     style: CustomTextStyle.popinssmall0,
                //                   )
                //                 ],
                //               ),
                //               Column(
                //                 children: [
                //                   Container(
                //                     height: 60,
                //                     width: 60,
                //                     decoration: BoxDecoration(
                //                         border: Border.all(color: Colors.black26, width: 1),
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white),
                //                   ),
                //                   Text(
                //                     "Nail Cutter",
                //                     style: CustomTextStyle.popinssmall0,
                //                   )
                //                 ],
                //               ),
                //               Column(
                //                 children: [
                //                   Container(
                //                     height: 60,
                //                     width: 60,
                //                     decoration: BoxDecoration(
                //                         border: Border.all(color: Colors.black26, width: 1),
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white),
                //                   ),
                //                   Text(
                //                     "Comb",
                //                     style: CustomTextStyle.popinssmall0,
                //                   )
                //                 ],
                //               ),
                //               Column(
                //                 children: [
                //                   Container(
                //                     height: 60,
                //                     width: 60,
                //                     decoration: BoxDecoration(
                //                         border: Border.all(color: Colors.black26, width: 1),
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white),
                //                   ),
                //                   Text(
                //                     "Slicker",
                //                     style: CustomTextStyle.popinssmall0,
                //                   )
                //                 ],
                //               ),
                //             ],
                //             padding: EdgeInsets.all(5),
                //             shrinkWrap: true,
                //           );
              })

//  GetBuilder<ServiceController>(
//                       init: servicecontroller,
//                       builder: (_) {
// return  Container(
//                         // height: 600,
//                         child: GridView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 4,
//                                 //  childAspectRatio: 4 / 4,
//                                 crossAxisSpacing: 15,

//                   mainAxisSpacing: 15,
//                   mainAxisExtent: 100),
//                             itemCount: servicecontroller
//                                 .getServiceList!.length

//                                 ,
//                             itemBuilder: (BuildContext ctx, index) {
//       var item = servicecontroller.
//                                    getServiceList[index];
//                               return
//                                 Column(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black26, width: 1),
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyColors.white),
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                      item["title"],
//                       style: CustomTextStyle.popinssmall0,
//                     )
//                   ],
//                 );
//   //
//                             }));

//   // // GridView(
//   //             physics: NeverScrollableScrollPhysics(),
//   //             scrollDirection: Axis.vertical,
//   //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //                 crossAxisCount: 4,
//   //                 crossAxisSpacing: 15,
//   //                 mainAxisSpacing: 15,
//   //                 mainAxisExtent: 100),
//   //             children: [
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Brush",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Nail Cutter",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Comb",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Slicker",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //             ],
//   //             padding: EdgeInsets.all(5),
//   //             shrinkWrap: true,
//   //           );

//                       })

          //       Container(
          //         height: MediaQuery.of(context).size.height*0.3,
          //  width: MediaQuery.of(context).size.height*0.5 ,

          //       padding: EdgeInsets.all(12.0),
          //       child: GridView.builder(
          //         itemCount: 6,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 4,
          //             // mainAxisExtent: 5,
          //             crossAxisSpacing: 15.0,
          //             mainAxisSpacing: 10.0  ,
          //             mainAxisExtent: 100
          //         ),
          //         itemBuilder: (BuildContext context, int index){
          //           return  Column(
          //             children: [
          //               Container(
          //                 height: 60,width:60,
          //                 decoration:BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15),
          //                 border: Border.all(color: Colors.black26)
          //               )
          //                              ,),

          //                              SizedBox(height: 3,),
          //            Text("Brush")

          //             ],
          //           );
          //         },
          //       )),
          ,

          Text(
            "Doctor",
            style: CustomTextStyle.popinstext,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.26,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 0.3),
                  borderRadius: BorderRadius.circular(25),
                  color: MyColors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/image/doctorgirl.png"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cameron Williamson",
                              style: CustomTextStyle.popinsbold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/image/footprint.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Pharmacology",
                                  style: CustomTextStyle.popinssmall0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Pharmacology",
                              style: CustomTextStyle.popinssmall0,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/image/whitestar.svg"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        UserServicesAddVeterinaryController
                            userServicesAddVeterinaryController =
                            Get.put(UserServicesAddVeterinaryController());
                        userServicesAddVeterinaryController.clearFields();
                        userServicesAddVeterinaryController.init();
                        Get.to(UserServicesAddVeterinary());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: MyColors.yellow,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "Appointment",
                          style: CustomTextStyle.mediumtextreem,
                        )),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
      )),
    );
  }
}
