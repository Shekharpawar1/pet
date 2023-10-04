import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class MyOrderUser extends StatelessWidget {
  MyOrderUser({super.key});

  final MyOrderController myordercontroller = Get.put(MyOrderController());
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: const Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 16,
            color: MyColors.black,
            fontWeight: FontWeight.w700,
          ),
        )),
        actions: [
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                      Get.to(const NotificationUser());
//                   },
//                   child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),

//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

//                       ],
//                     )),

//             ],
//           ),

//                 SizedBox(width: 20),
//  Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                       Get.to(const AddToCardUser());

//                   },
//                   child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

//                       ],
//                     )),

//             ],
//           ),

//     SizedBox(width: 20,)
        ],
      ),
      body: GetBuilder<MyOrderController>(
          init: myordercontroller,
          builder: (_) {
            return myordercontroller.myorderModel!.data!.isEmpty ||
                    myordercontroller.myorderModel == null
                ? SizedBox(
                    child: Center(
                        child: Image.asset("assets/image/nodataimg.png",
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width)))
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        itemCount: myordercontroller.myorderModel!.data!.length,
                        itemBuilder: (context, index) {
                          var item = myordercontroller.myorderModel!.data![
                              myordercontroller.myorderModel!.data!.length -
                                  1 -
                                  index];

                          print(
                              "=======>>>>>>>>>>>>  len  ${item.paymentMethod}");
                          print(
                              "=======>>>>>>>>>>>>  coupon  ${item.couponCode}");
                          // String imagePath =
                          //       Constants.PRODUCT_HOME_IMAGE_PATH +
                          //           "/${item.!}";
                          return myordercontroller.myorderModel!.data == null
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () async {
                                    myordercontroller.addorder(item.id ?? 0);
                                    print("Orderid ${item.id}");
                                    myordercontroller.orderdetailsinit();
                                    userreviewcontroller.reviewAdd(
                                        0, item.id ?? 0);
                                    await userreviewcontroller.init();
                                    // print(   ""+(item.callback![0].userProfile![0]
                                    //           .fName ??
                                    //       ''),);
                                    Get.to(OrderDetailsUser(
                                      orderId: item.id ?? 0,
                                      couponcode: item.couponCode ?? '',
                                      paymentmethod: item.paymentMethod ?? '',
                                      orderstatus: item.orderStatus ?? '',
                                      orderAmount: item.orderAmount,
                                      // fname: item.callback![0].userProfile![0]
                                      //         .fName ??
                                      //     '',
                                      // lname: item.callback![0].userProfile![0]
                                      //         .lName ??
                                      //     '',
                                      // phone: item.callback![0].userProfile![0]
                                      //         .phone ??
                                      //     '',
                                      // email: item.callback![0].userProfile![0]
                                      //         .email ??
                                      //     '',
                                      address: item.deliveryAddress ?? '',
                                      delivered: item.delivered ?? '',
                                    ));
                                    print("Name");
                                    print(item.callback![0].userProfile![0]
                                            .fName ??
                                        '');
                                  },
                                  child: Container(
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.22,
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
                                                Text(
                                                  "CouponCode : ${item.couponCode ?? ''}",
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
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
    );
  }
}
