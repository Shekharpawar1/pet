import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/dashboard_controller.dart';
import 'package:pet/controllers/salesman_controller/salesprofile_controller.dart';

import 'package:pet/screens/salesman/balance.dart';
import 'package:pet/screens/salesman/complete.dart';
import 'package:pet/screens/salesman/drawersalesman.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/pending.dart';
import 'package:pet/screens/salesman/salespendingcomplete.dart';
import 'package:pet/screens/salesman/totalorder.dart';
import 'package:pet/screens/salesman/wholesaler_view.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/balance.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/totalorder.dart';

class DashboardSales extends StatefulWidget {
  const DashboardSales({super.key});

  @override
  State<DashboardSales> createState() => _DashboardSalesState();
}

class _DashboardSalesState extends State<DashboardSales> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  DashBoardController dashBoardController = Get.put(DashBoardController());
  SalesProfileController salesprofilecontroller =
      Get.put(SalesProfileController());
  int len = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: drawerSalesMan(),
    appBar:CustomAppBarSales(drawerKey: _drawerkey,title: "DashBoard",), // backgroundcolor:MyColors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GetBuilder<DashBoardController>(
                init: dashBoardController,
                builder: (_) {
                  return  dashBoardController.total1wholesellerModel == null || dashBoardController.totalordersellerModel == null? SizedBox():
                  ListView(
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
                            onTap: () async {
                              await dashBoardController.init();
                              int len = dashBoardController
                                  .total1wholesellerModel!.data!.length;
                              print("=========>>>>>>> Totalwholeseller $len");
                              Get.to(SalesWholeSalerScreen());
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
                                      dashBoardController
                                          .total1wholesellerModel!.data!.length
                                          .toString(),
                                      style: CustomTextStyle.boldStyle1),
                                  Center(
                                    child: Text("Total Wholeseller",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyle.popinstextsmall12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
      
                              // int len = 0;
      dashBoardController .totalordersellerModel!.data!.forEach((e) {
      if(e.orderStatus == "pending" && e.paymentMethod == "paid" ){
      len += int.parse(e.orderAmount ?? "0") + int.parse(e.orderAmount ?? "0");
      }
      });
                              Get.to(Balancesales());
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
                              await dashBoardController.sellerinit();
                              int len = dashBoardController
                                  .totalordersellerModel!.data!.length;
                              print("=========>>>>>>> TotalOrderseller $len");
                              Get.to(TotalOrdersales());
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
                                      dashBoardController
                                          .totalordersellerModel!.data!.length
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
                          await dashBoardController.sellerinit();
                          int len = dashBoardController.totalordersellerModel!.data!
                              .where((element) => element.orderStatus == "pending")
                              .toList()
                              .length;
                          print("=========>>>>>>> pendinglength $len");
                          Get.to(SalesPendingCompleteSreen(
                              data: dashBoardController.totalordersellerModel!.data!
                                  .where(
                                      (element) => element.orderStatus == "pending")
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
                                  Text("Pending",
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
                                            child: Text((dashBoardController
                                                    .totalordersellerModel!.data!
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
                        onTap: () async {
                          await dashBoardController.sellerinit();
                          int len = dashBoardController.totalordersellerModel!.data!
                              .where(
                                  (element) => element.orderStatus == "delivered")
                              .toList()
                              .length;
                          print("=========>>>>>>> completelength $len");
                          Get.to(SalesPendingCompleteSreen(
                              data: dashBoardController.totalordersellerModel!.data!
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
                                  Text("Completed",
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
                                            child: Text((dashBoardController
                                                    .totalordersellerModel!.data!
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SalesWholeSalerScreen());
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
                              "Create Order",
                              style: CustomTextStyle.mediumtextreem,
                            )),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        
          GetBuilder<DashBoardController>(
                init: dashBoardController,
                builder: (_) {
                  return dashBoardController.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.1), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
            // Progress bar
            GetBuilder<DashBoardController>(
                init: dashBoardController,
                builder: (_) {
                  return dashBoardController.showLoading
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
