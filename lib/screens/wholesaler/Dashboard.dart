import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/notification_controller.dart';
import 'package:pet/controllers/wholesaler_controller/profilewhole_controller.dart';
import 'package:pet/controllers/wholesaler_controller/totalorderwhole_controller.dart';
import 'package:pet/screens/wholesaler/wholesalerdrawer.dart';
import 'package:pet/screens/wholesaler/complete.dart';
import 'package:pet/screens/wholesaler/pendingcomplete.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/balance.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/totalorder.dart';

class DashboardWhole extends StatefulWidget {
  const DashboardWhole({super.key});

  @override
  State<DashboardWhole> createState() => _DashboardWholeState();
}

class _DashboardWholeState extends State<DashboardWhole> {
  WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
  WholeTotalOrderController wholetotalordercontroller =
      Get.put(WholeTotalOrderController());
  int len = 0;
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
WholeProfileController wholeProfileController = Get.put(WholeProfileController());
WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());

  @override
  void onInit() {
  
    wholenotificationcontroller.notifyinit();
      wholemyordercontroller.init();
      
       
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: const drawerWholeSaler(),
      appBar: CustomAppBarWhole(
        drawerKey: _drawerkey,
      ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 0.0, top: 15, bottom: 15),
//           child: GestureDetector(
//             onTap: () {
//               _drawerkey.currentState!.openDrawer();
//             },
//             child: Image.asset(
//               "assets/image/menu2.png",
//             ),
//           ),
//         ),
//         title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child: Text(
//           "DashBoard",
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         )),
//         actions: [
//           //  SvgPicture.asset("assets/image/girl.svg"),

//           // SizedBox(width: 20),l
//           GetBuilder<WholeProfileController>(
//               init: wholeProfileController,
//               builder: (_) {
//                 return 
//                 wholeProfileController
//                               .wholemyprofilemodel == null || wholeProfileController
//                               .wholemyprofilemodel!.data == null || wholeProfileController
//                               .wholemyprofilemodel!.data!.isEmpty ? SizedBox() :
//                 Padding(
//                   padding: EdgeInsets.only(right: 20.0),
//                   child: CircleAvatar(
//                     radius: 35,
//                     backgroundColor: Colors.transparent,
//                     child: CachedNetworkImage(
//                       imageUrl: "${Constants.SALESMAN_IMAGEPATH_URL}" +
//                           wholeProfileController
//                               .wholemyprofilemodel!
//                               .data![0].image
//                               .toString(),

//                       fit: BoxFit.cover,
//                       // width: 61,
//                       // height: 75,
//                       placeholder: (context, url) => Center(
//                         child: CircularProgressIndicator(),
//                       ), // Replace with your own placeholder widget
//                       errorWidget: (context, url, error) => Icon(
//                           Icons.error), // Replace with your own error widget
//                     ),
//                     //  Image.asset("assets/image/boyprofile3.png"),
//                   ),
//                 );

//                 // Image.asset("assets/image/girl.png")
//               }),
        
//         ],
//       ),
//       // backgroundcolor:MyColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GetBuilder<WholeTotalOrderController>(
                      init: wholetotalordercontroller,
                      builder: (_) {
                        return 
                          wholetotalordercontroller.wholetotalorderModel == null ||
                                  wholetotalordercontroller
                                          .wholetotalorderModel!.data ==
                                      null 
                              ? const SizedBox()
                              :InkWell(
                          onTap: () {
                            wholetotalordercontroller.init();
                            int len = wholetotalordercontroller
                                .wholetotalorderModel!.data!.length;
                            print("=========>>>>>>> totalorder $len");
                            Get.to(const TotalOrder());
                          },
                          child: Container(
                            width: Get.width * 0.43,
                            height: 92,
                            decoration: BoxDecoration(
                                color: const Color(0xff008FFF),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    (wholetotalordercontroller
                                            .wholetotalorderModel!.data!.length)
                                        .toString(),
                                    style: CustomTextStyle.boldStyle1),
                                Center(
                                  child: Text("Total Order",
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.popinstextsmall12),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),

                  GetBuilder<WholeTotalOrderController>(
                      init: wholetotalordercontroller,
                      builder: (_) {
                        return InkWell(
                          onTap: () async {
                            print("Balll");
                           await  wholetotalordercontroller.init();
                           print("Allll");
//             int len = wholetotalordercontroller.wholetotalorderModel!.data!.reduce((prev, now) {
// if(now.orderStatus == "pending"  ){
//   return int.parse(now.orderAmount ?? "0") + int.parse(now.orderAmount ?? "0");
// }
// return 0;
//             });
                            // int len = 0;
                            // wholetotalordercontroller
                            //     .wholetotalorderModel!.data!
                            //     .forEach((e) {
                            //   if (
                            //     // e.orderStatus == "pending" &&
                            //       e.paymentStatus == "unpaid") {
                            //     len += int.parse(e.orderAmount ?? " ").toInt();
                            //     //  +
                            //     //     int.parse(e.orderAmount ?? "0");
                            //     print(len);
                            //   }
                            //  print("=========>>>>>>> ReBalancelen $len");
                            // Get.to(const Balance());
                            // });

                            // print("=========>>>>>>> ReBalancelen $len");
                            // Get.to( Balance());
                          },
                          child: Container(
                            width: Get.width * 0.43,
                            height: 92,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFCC00),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  
                            "₹"+  (  wholetotalordercontroller.totalAmount
                              )
                                              .toString(),
                                    style: CustomTextStyle.boldStyle1),
                                Center(
                                  child: Text("Unpaid Amount",
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.popinstextsmall12),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                  // InkWell(
                  //    onTap: (){
                  //       // Get.to(Homewhole());
                  //     },
                  //   child: Container(

                  //   width: 103,

                  //   height: 92,

                  //   decoration: BoxDecoration(color: Color(0xffA7D441), borderRadius: BorderRadius.circular(20),

                  //   ),

                  //   child:

                  //   Column(crossAxisAlignment: CrossAxisAlignment.center,

                  //   mainAxisAlignment: MainAxisAlignment.center,

                  //   children: [

                  //         Text(

                  //     "105",

                  //     style: CustomTextStyle.boldStyle1

                  //     ),

                  //       Center(

                  //         child: Text(

                  //           "Total Product",textAlign: TextAlign.center,

                  //           style: CustomTextStyle.popinstextsmall12

                  //           ),

                  //       ),

                  //   ],

                  //   ),

                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "My Order",
                style: CustomTextStyle.popinstext,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
             GetBuilder<WholeMyOrderController>(
            init: wholemyordercontroller,
            
            builder: (_) {
                  return InkWell(
                    onTap: () async{
                    await   wholemyordercontroller.init();
                      print("AllWhole");
                      int len = wholemyordercontroller.wholemyorderModel!.data!
                          .where((element) => element.orderStatus == "confirmed")
                          .toList()
                          .length;
                      print("=========>>>>>>> com $len");
                      Get.to(PendingCompleteSreen(
                          data: wholemyordercontroller.wholemyorderModel!.data!
            .where((element) => element.orderStatus == "confirmed")
            .toList()));
                          // data: wholemyordercontroller.wholemyorderModel!.data!
                          //     .where(
                          //         (element) => element.orderStatus == "confirmed")
                          //     .toList()));
                    },
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(37)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Current Order",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              wholemyordercontroller.wholemyorderModel == null ||
                                      wholemyordercontroller
                                              .wholemyorderModel!.data!.isEmpty
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 8),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: MyColors.yellowcir,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Center(
                                              child: Text((wholemyordercontroller
                                                      .wholemyorderModel!.data!
                                                      .where((element) =>
                                                          element.orderStatus ==
                                                          "confirmed")
                                                      .toList()
                                                      .length)
                                                  .toString()))),
                                    )
                            ],
                          ),
                        )),
                  );
                }
              ),
              
             const  SizedBox(
                height: 10,
              ),
             GetBuilder<WholeMyOrderController>(
            init: wholemyordercontroller,
            
            builder: (_) {
                  return InkWell(
                    onTap: ()async {
                     await wholemyordercontroller.init();
                      int len = wholemyordercontroller.wholemyorderModel!.data!
                          .where((element) => element.orderStatus == "pending")
                          .toList()
                          .length;
                      print("=========>>>>>>> $len");
                      Get.to(PendingCompleteSreen(
                          data: wholemyordercontroller.wholemyorderModel!.data!
                              .where((element) => element.orderStatus == "pending")
                              .toList()));
                    },
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(37)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Pending Order",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              wholemyordercontroller.wholemyorderModel == null ||
                                      wholemyordercontroller
                                              .wholemyorderModel!.data ==
                                          null
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 8),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: MyColors.yellowcir,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                            child: Text((wholemyordercontroller
                                                    .wholemyorderModel!.data!
                                                    .where((element) =>
                                                        element.orderStatus ==
                                                        "pending")
                                                    .toList()
                                                    .length)
                                                .toString())),
                                      ))
                            ],
                          ),
                        )),
                  );
                }
              ),
              const SizedBox(
                height: 10,
              ),
            GetBuilder<WholeMyOrderController>(
            init: wholemyordercontroller,
            
            builder: (_) {
               return InkWell(
                          onTap: () async{
                          await  wholemyordercontroller.init();
                            int len = wholemyordercontroller
                                .wholemyorderModel!.data!
                                .where(
                                    (element) => element.orderStatus == "delivered")
                                .toList()
                                .length;
                            print("=========>>>>>>> com44444 $len");
                            Get.to(PendingCompleteSreen(
                                data: wholemyordercontroller
                                    .wholemyorderModel!.data!
                                    .where((element) =>
                                        element.orderStatus == "delivered")
                                    .toList()));
                          },
                          child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(37)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, right: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   const  Text("Completed Order",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                         wholemyordercontroller.wholemyorderModel == null ||
                                          wholemyordercontroller
                                                  .wholemyorderModel!.data ==
                                              null
                                      ? const SizedBox():
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 8),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: MyColors.yellowcir,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Center(
                                              child: Text((wholemyordercontroller
                                                      .wholemyorderModel!.data!
                                                      .where((element) =>
                                                          element.orderStatus ==
                                                          "delivered")
                                                      .toList()
                                                      .length)
                                                  .toString()))),
                                    )
                                  ],
                                ),
                              )),
                        );
             }
           ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              InkWell(
                onTap: () {
                  // Get.put(WholeHomeController());
                  //                       final WholeHomeController wholeuserHomeController =
                  //                           Get.find<WholeHomeController>();
                  //                       wholeuserHomeController.onInit();

                  Get.to( HomeWhole());
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: MyColors.yellow,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text(
                      "New Order",
                      style: CustomTextStyle.mediumtextreem,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
