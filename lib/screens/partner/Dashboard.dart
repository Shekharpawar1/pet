import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/dashBoard_controller.dart';
import 'package:pet/controllers/partner_controller/partnerprofile_controller.dart';

import 'package:pet/screens/partner/balance.dart';
import 'package:pet/screens/partner/totalProductPartner.dart';
import 'package:pet/screens/partner/drawerpartner.dart';
import 'package:pet/screens/partner/partnerpendingcomplete.dart';
import 'package:pet/screens/partner/pending.dart';
import 'package:pet/screens/partner/totalorder.dart';
import 'package:pet/screens/partner/wholesaler_view.dart';
import 'package:pet/screens/partner/widget/wholeAppBar.dart';
import 'package:pet/screens/salesman/balance.dart';
import 'package:pet/screens/salesman/complete.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/totalorder.dart';
import 'package:pet/screens/salesman/wholesaler_view.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/balance.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/totalorder.dart';

class DashboardPartner extends StatefulWidget {
  const DashboardPartner({super.key});

  @override
  State<DashboardPartner> createState() => _DashboardPartnerState();
}

class _DashboardPartnerState extends State<DashboardPartner> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  int len = 0;
  
// PartnerProfileController profilecontroller = Get.put(PartnerProfileController());
  PartnerDashBoardController partnerDashBoardController = Get.put(PartnerDashBoardController());
  @override
  Widget build(BuildContext context) {
    partnerDashBoardController.TotalOrderinit() ;
    partnerDashBoardController.init();
    return Scaffold(
      key: _drawerkey,
      drawer: drawerpartner(),
      appBar: CustomAppBarPartner(
        drawerKey : _drawerkey
      ),
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GetBuilder<PartnerDashBoardController>(
                init: partnerDashBoardController,
                builder: (_) {
                  return ListView(
                    shrinkWrap: true,
                    primary: true,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async  {
                              await partnerDashBoardController.init();
                              int len = partnerDashBoardController
                                  .partnertotalProductModel!.data!.length;
                              print("=========>>>>>>> Totalwholeseller $len");
                              Get.to(ProductWholesellerpartner());
                            },
                            child: Container(
                              width: 103,
                              height: 92,
                              decoration: BoxDecoration(
                                  color: Color(0xff008FFF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      partnerDashBoardController
                                          .partnertotalProductModel!.data!.length
                                          .toString(),
                                      style: CustomTextStyle.boldStyle1),
                                  Center(
                                    child: Text("Total Product",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyle.popinstextsmall12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
      
      partnerDashBoardController .partnertotalOrderModel!.data!.forEach((e) {
      if(e.orderStatus == "pending" && e.paymentMethod == "paid" ){
      len += int.parse(e.orderAmount ?? "0") + int.parse(e.orderAmount ?? "0");
      }
      });
                              Get.to(Balancepartner());
                            },
                            child: Container(
                              width: 103,
                              height: 92,
                              decoration: BoxDecoration(
                                color: Color(0xffFFCC00),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(len.toString(), style: CustomTextStyle.boldStyle1),
                                  Center(
                                    child: Text("Transactions",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyle.popinstextsmall12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                         
                          InkWell(
                            onTap: () async {
                              await partnerDashBoardController.TotalOrderinit();
                              int len = partnerDashBoardController
                                  .partnertotalOrderModel!.data!.length;
                              print("=========>>>>>>> TotalOrderseller $len");
                              Get.to(TotalOrderpartner());
                            },
                            child: Container(
                              width: 103,
                              height: 92,
                              decoration: BoxDecoration(
                                color: Color(0xffA7D441),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      partnerDashBoardController
                                          .partnertotalOrderModel!.data!.length
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
                          )
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
   InkWell(
                        onTap: () async {
                          await partnerDashBoardController.init();
                          int len = partnerDashBoardController.partnertotalOrderModel!.data!
                              .where((element) => element.orderStatus == "confirmed")
                              .toList()
                              .length;
                          print("=========>>>>>>> confirmed $len");
                          Get.to(partnerPendingCompleteSreen(
                              data: partnerDashBoardController.partnertotalOrderModel!.data!
                                  .where(
                                      (element) => element.orderStatus == "confirmed")
                                  .toList())
                                  );
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
                                  Text("Current Order",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
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
                                            child: Text((partnerDashBoardController
                                                    .partnertotalOrderModel!.data!
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          await partnerDashBoardController.init();
                          int len = partnerDashBoardController.partnertotalOrderModel!.data!
                              .where((element) => element.orderStatus == "pending")
                              .toList()
                              .length;
                          print("=========>>>>>>> pendinglength $len");
                          Get.to(partnerPendingCompleteSreen(
                              data: partnerDashBoardController.partnertotalOrderModel!.data!
                                  .where(
                                      (element) => element.orderStatus == "pending")
                                  .toList())
                                  );
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
                                  Text("Pending Order",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
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
                                            child: Text((partnerDashBoardController
                                                    .partnertotalOrderModel!.data!
                                                    .where((element) =>
                                                        element.orderStatus ==
                                                        "pending")
                                                    .toList()
                                                    .length)
                                                .toString()))),
                                  )
                               
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: ()  async{
                          await partnerDashBoardController.init();
                          int len = partnerDashBoardController.partnertotalOrderModel!.data!
                              .where(
                                  (element) => element.orderStatus == "delivered")
                              .toList()
                              .length;
                          print("=========>>>>>>> completelength $len");
                          Get.to(partnerPendingCompleteSreen(
                              data: partnerDashBoardController.partnertotalOrderModel!.data!
                                  .where((element) =>
                                      element.orderStatus == "delivered")
                                  .toList())
                                  );
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
                                  Text("Completed Order",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
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
                                            child: Text((partnerDashBoardController
                                                    .partnertotalOrderModel!.data!
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.08,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     // Get.to(SalesWholeSalerScreen());
                      //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                      //   },
                      //   child: Center(
                      //     child: Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       height: MediaQuery.of(context).size.height * 0.08,
                      //       decoration: BoxDecoration(
                      //           color: MyColors.yellow,
                      //           borderRadius: BorderRadius.circular(25)),
                      //       child: Center(
                      //           child: Text(
                      //         "Create Order",
                      //         style: CustomTextStyle.mediumtextreem,
                      //       )),
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                }),
          ),
        
          GetBuilder<PartnerDashBoardController>(
                init: partnerDashBoardController,
                builder: (_) {
                  return partnerDashBoardController.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.1), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
          
            GetBuilder<PartnerDashBoardController>(
                init: partnerDashBoardController,
                builder: (_) {
                  return partnerDashBoardController.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.white, // Color of the progress bar
                            size: 50.0, // Size of the progress bar
                          ),
                        )
                      : SizedBox();
                }),
          
        
        ],
      ),
     );
  }
}
