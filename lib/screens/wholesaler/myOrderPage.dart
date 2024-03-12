import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';

import 'package:pet/screens/wholesaler/orderDetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class MyOrderWhole extends StatelessWidget {
  MyOrderWhole({super.key});

  WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
        final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
         final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
  
  @override
  Widget build(BuildContext context) {
    wholemyordercontroller.init();
    return Scaffold(
      appBar: CustomAppBarWholeOnlyback(title:"My Orders"),
//       AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_left, color: MyColors.black)),
//         ),
//         title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child: Text(
          
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         )),
//         actions: [
// //           Stack(
// //             children: [
// //               InkWell(
// //                   onTap: () {
// //                      Get.to(const NotificationUser());
// //                   },
// //                   child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),

// //  Positioned(
// //  top: 10.0,right: 0,
// //                     child:  Stack(
// //                       children: <Widget>[
// //                          Icon(
// //                             Icons.brightness_1,
// //                             size: 15.0, color: MyColors.red),
// //                          Positioned(
// //                             top: 3.0,
// //                             right: 4.0,
// //                             child:  Center(
// //                               child:  Text(('5').toString(),
// //                                 // list.length.toString(),
// //                                 style:  TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 8.0,
// //                                     fontWeight: FontWeight.w500
// //                                 ),
// //                               ),
// //                             )),

// //                       ],
// //                     )),

// //             ],
// //           ),

// //                 SizedBox(width: 20),
// //  Stack(
// //             children: [
// //               InkWell(
// //                   onTap: () {
// //                       Get.to(const AddToCardUser());

// //                   },
// //                   child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // // (getCardModel!.data!.isEmpty)?
// // // SizedBox():
// //  Positioned(
// //  top: 10.0,right: 0,
// //                     child:  Stack(
// //                       children: <Widget>[
// //                          Icon(
// //                             Icons.brightness_1,
// //                             size: 15.0, color: MyColors.red),
// //                          Positioned(
// //                             top: 3.0,
// //                             right: 4.0,
// //                             child:  Center(
// //                               child:  Text(('5').toString(),
// //                                 // list.length.toString(),
// //                                 style:  TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 8.0,
// //                                     fontWeight: FontWeight.w500
// //                                 ),
// //                               ),
// //                             )),

// //                       ],
// //                     )),

// //             ],
// //           ),

// //     SizedBox(width: 20,)
//         ],
//       ),
      body:   RefreshIndicator(
key: _refreshIndicatorKey,
// displacement: -0.1,

              onRefresh: () async {
                _refreshIndicatorKey.currentState?.show(atTop: false);
            // await     notificationcontroller.init();
      // await mycartController.init();
      wholemyordercontroller.init();
   
                  
  //  homeusercontroller. getWishinit();
  //   homeusercontroller.fetchWishList();
                await Future.delayed(Duration(seconds: 2));
              },
        child:GetBuilder<WholeMyOrderController>(
            init: wholemyordercontroller,
            
            builder: (_) {
              return wholemyordercontroller.wholemyorderModel == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          itemCount: wholemyordercontroller
                              .wholemyorderModel!.data!.length,
                          itemBuilder: (context, index) {
                            var item = wholemyordercontroller
                                .wholemyorderModel!.data![wholemyordercontroller
                                    .wholemyorderModel!.data!.length -
                                1 -
                                index];
      
                            print(
                                "=======>>>>>>>>>>>>  len  ${item.paymentMethod}");
                            print(
                                "=======>>>>>>>>>>>>  coupon  ${item.couponCode}");
                            // String imagePath =
                            //       Constants.PRODUCT_HOME_IMAGE_PATH +
                            //           "/${item.!}";
                            return wholemyordercontroller
                                        .wholemyorderModel!.data ==
                                    null
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async{
                                      wholemyordercontroller
                                          .addorder(item.id ?? 0);
                                      print("Orderid ${item.id}");
                                       wholemyordercontroller.clearFields();
        await   wholemyordercontroller.orderdetailsinit();
        
   final userProfile = item.callback != null && item.callback!.isNotEmpty
        ? item.callback![0].userProfile
        : null;
    final firstName = userProfile != null 
        ? userProfile[0].fName ?? 'No Name'
        : 'No Name';
    final lastName = userProfile != null 
        ? userProfile[0].lName ?? 'No Name'
        : 'No Name';
    final phone = userProfile != null
        ? userProfile[0].phone ?? 'No Number'
        : 'No Number';
    final email = userProfile != null
        ? userProfile[0].email ?? 'No Email'
        : 'No Email';

                                       wholereviewcontroller.reviewAdd(
                                            item.callback![0].itemId??0, item.id ?? 0);
                                        await wholereviewcontroller.init();
                                        wholereviewcontroller.reviewAdd(
                                          item.id ?? 0,
                                          (                                    wholemyordercontroller
      .wholeorderdetailsModel!
                                                  .data![0].orderId ??
                                              0));
                                 
                                      Get.to(OrderDetailswhole(
                                          orderId: item.id ?? 0,
                                          couponcode: item.couponCode ?? '',
                                          paymentmethod: item.paymentMethod ?? '',
                                          orderstatus: item.orderStatus ?? '',
                                          
                                             orderAmount: item.orderAmount,
                                       fname: firstName,
                                        lname: lastName,
                                        phone: phone,
                                        email: email,
                                       
                                          address: item.deliveryAddress??'',
                                          delivered: item.delivered??'',
                                          // username:( item.callback![0].userProfile![0].fName??''),
                                          // usernumber:  item.callback![0].userProfile![0].phone??'',
                                          // lastname : item.callback![0].userProfile![0].lName??'',
                                          deliverycharge: item.deliveryCharge??'',
                                          
                                          ));
                                    },
                                    child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        // height:
                                        //     MediaQuery.of(context).size.height *
                                        //         0.2,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: MyColors.grey, width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: MyColors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  width: Get.width * 0.24,
                                                  child: Image.asset(
                                                    "assets/image/logocanine.png",
                                                    // height: 80,
                                                  ),
                                                  //  CachedNetworkImage(
                                                  //               imageUrl:imagePath,
                                                  //                         //  fit: BoxFit.cover,
                                                  //               // width: 61,
                                                  //               // height: 75,
                                                  //               placeholder: (context, url) => Center(
                                                  //                 child: CircularProgressIndicator(),
                                                  //               ), // Replace with your own placeholder widget
                                                  //               errorWidget: (context, url, error) =>
                                                  //                   Icon(Icons
                                                  //                       .error), // Replace with your own error widget
                                                  //             ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "OrderId: ${(item.id ?? 0).toString()}",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  // Text(
                                                  //   "CouponCode : ${item.couponCode ?? ''}",
                                                  //   style: CustomTextStyle
                                                  //       .popinsmedium,
                                                  // ),
                                                  Text(
                                                    "Payment Status: ${item.paymentMethod ?? ''}",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  Text(
                                                      "Order Status: ${item.orderStatus ?? ''}",
                                                      style: CustomTextStyle
                                                          .popinsmedium),
                                                  Text(
                                                      "Order Type: ${(item.orderType ?? 0)}"
                                                          .toString(),
                                                      style: CustomTextStyle
                                                          .popinsmedium),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount: ${item.orderAmount ?? ''}",
                                                        style: CustomTextStyle
                                                            .popinsmedium,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )));
      
                            //  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            // Text(item.paymentMethod!, style: TextStyle(color: Colors.black),),
                            // Padding(
                            //   padding: const EdgeInsets.all(15.0),
                            //   child: CachedNetworkImage(
                            //               imageUrl: imagePath, fit: BoxFit.cover,
                            //               // width: 61,
                            //               // height: 75,
                            //               placeholder: (context, url) => Center(
                            //                 child: CircularProgressIndicator(),
                            //               ), // Replace with your own placeholder widget
                            //               errorWidget: (context, url, error) =>
                            //                   Icon(Icons
                            //                       .error), // Replace with your own error widget
                            //             ),
                            // ),
                            //  for(int j =0; j<myordercontroller
                            //                     .myorderModel!.data![index].callback!.length; j++)
                            // ...item.callback!.map((e) {
                            //   print("=====>>>>> zebra ff ${e.itemDetails![0].image.toString()}");
                            //    String imagePath = Constants.PRODUCT_HOME_IMAGE_PATH +"/${e.itemDetails![0].image.toString()}";
                            //   //  var imagePath  = Constants.PRODUCT_HOME_IMAGE_PATH +
                            //   //               "/${e.itemDetails![0].image!}";
      
                            //   return
      
                            // } ).toList(),
                            // ]);
                          }),
                    );
            }),
      ),
    );
  }
}
