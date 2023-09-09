import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/order_tracker_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';
import 'package:pet/screens/wholesaler/locationScreenWhole.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

import '../user/locationScreenUser.dart';

class OrderDetailswhole extends StatefulWidget {
  OrderDetailswhole(
      {super.key,
      this.orderId,
      this.couponcode,
      this.paymentmethod,
      this.orderstatus});
  int? orderId;
  String? couponcode;
  String? paymentmethod;
  String? orderstatus;

  @override
  State<OrderDetailswhole> createState() => _OrderDetailswholeState();
}

class _OrderDetailswholeState extends State<OrderDetailswhole> {
  WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
  final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
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
                child: Icon(Icons.arrow_left, color: MyColors.black)),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
              child: Text(
            "Order Details",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
          actions: [
            Stack(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(NotificationWhole());
                    },
                    child: Center(
                      child: Icon(Icons.notifications, color: MyColors.black),
                    )),
                Positioned(
                    top: 10.0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                        Positioned(
                            top: 3.0,
                            right: 4.0,
                            child: Center(
                              child: Text(
                                ('5').toString(),
                                // list.length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500),
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
                      Get.to(AddToCardwhole());
                    },
                    child: Center(
                        child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
                Positioned(
                    top: 10.0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                        Positioned(
                            top: 3.0,
                            right: 4.0,
                            child: Center(
                              child: Text(
                                ('5').toString(),
                                // list.length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    )),
              ],
            ),
            SizedBox(
              width: 20,
            )
            // InkWell(
            //     onTap: () {
            //       Get.to(NotificationWhole());
            //     },
            //     child: SvgPicture.asset("assets/image/notification.svg")),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: GetBuilder<WholeMyOrderController>(
                init: wholemyordercontroller,
                builder: (_) {
                  return wholemyordercontroller.wholeorderdetailsModel!.data ==
                          null||
                                        wholemyordercontroller.wholeorderdetailsModel!.data ==
                                            null ||
                                        wholemyordercontroller.wholeorderdetailsModel!.data!.isEmpty
                                    ? const SizedBox()
                      : ListView(
                          shrinkWrap: false,
                          primary: true,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/image/logocanine.png",
                                  height: 80,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Canine Products",
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                    Text(
                                      "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                                      style: CustomTextStyle.popinssmall0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(children: [
                              Container(
                                  width: 134,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFCEE8FC),
                                          Color.fromRGBO(206, 232, 252, 0.00),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(37)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/image/file.png"),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "download invoice",
                                          style: CustomTextStyle.popinssmall01,
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  width: 147,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFFBF1C8),
                                          Color.fromRGBO(251, 241, 200, 0.00),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(37)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/image/file.png"),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "download summary",
                                          style: CustomTextStyle.popinssmall01,
                                        )
                                      ],
                                    ),
                                  ))
                            ]),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Container(
                              width: 335,
                              // height: 300,
                              decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(21)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          //alignment: Alignment.topRight,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color: MyColors.yellow,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomLeft:
                                                      Radius.circular(20))),
                                          child: Center(
                                              child: Text(
                                            widget.orderstatus.toString(),
                                            style: CustomTextStyle
                                                .popinstextsmall12,
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),

                                  ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: wholemyordercontroller
                                          .wholeorderdetailsModel!.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = wholemyordercontroller
                                            .wholeorderdetailsModel!
                                            .data![index];
                                        String imagePath = Constants
                                                .PRODUCT_HOME_IMAGE_PATH +
                                            "/${item.itemDetails![0].image ?? ''}";
 wholereviewcontroller.reviewAdd(item.id??0, (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].orderId ??
                                                0));
                                        print("====>>>>imagepath ${imagePath}");
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: MyColors.grey,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: MyColors.white),
                                          child: Row(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl: imagePath,
                                                fit: BoxFit.cover,
                                                // width: 61,
                                                // height: 75,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ), // Replace with your own placeholder widget
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Icon(Icons
                                                        .error), // Replace with your own error widget
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item.variant ?? '',
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                                Text(item.discountType ?? '',
                                                    style: CustomTextStyle
                                                        .popinssmall0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.totalAddOnPrice ??
                                                          '',
                                                      style: CustomTextStyle
                                                          .popinsmedium,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ]),
                                        );
                                      }),

                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05),

//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

//                             Divider(
//                               indent: 1,
//                               thickness: 1,
//                             ),

//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

//                             Divider(
//                               indent: 1,
//                               thickness: 1,
//                             ),
//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

// // Divider(indent: 1,thickness: 1,)
//                           ],
//                         ),
//                       )
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                                Text(
                                  "\$50",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Moving Cart",
                                      style: CustomTextStyle.popinssmall014,
                                    ),
                                    Text(
                                      "Additional Services",
                                      style: CustomTextStyle.popinssmallnormal,
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$20",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Discount",
                                      style: CustomTextStyle.popinssmall014,
                                    ),
                                    Text(
                                      "Promo Code: " +
                                          widget.couponcode.toString(),
                                      style: CustomTextStyle.popinssmallnormal,
                                    ),
                                  ],
                                ),
                                Text(
                                  wholemyordercontroller.wholeorderdetailsModel!
                                          .data![0].discountOnItem ??
                                      '',
                                  style: CustomTextStyle.popinssmall014,
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                                Text(
                                  "\$138.00",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Text(
                              "Order Details",
                              style: CustomTextStyle.popinssmall014,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Text(
                              "Order Number",
                              style: CustomTextStyle.popinsboldlight,
                            ),
                            Text(
                              (wholemyordercontroller.wholeorderdetailsModel!
                                          .data![0].orderId ??
                                      0)
                                  .toString(),
                              style: CustomTextStyle.popinsboldlightsmall,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              "Payment",
                              style: CustomTextStyle.popinsboldlight,
                            ),
                            Text(
                              "Paid:" + widget.paymentmethod.toString(),
                              style: CustomTextStyle.popinsboldlightsmall,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              "Date",
                              style: CustomTextStyle.popinsboldlight,
                            ),
                            Text(
                              "10 Feb 2023  10:20 AM",
                              style: CustomTextStyle.popinsboldlightsmall,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              "Phone Number",
                              style: CustomTextStyle.popinsboldlight,
                            ),
                            Text(
                              "10 Feb 2023  10:20 AM",
                              style: CustomTextStyle.popinsboldlightsmall,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              "Deliver To",
                              style: CustomTextStyle.popinsboldlight,
                            ),
                            Text(
                              "10 Feb 2023  10:20 AM",
                              style: CustomTextStyle.popinsboldlightsmall,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                                    SizedBox(height: 15,),
                           Text(
                                      "Product Review",
                                      style: CustomTextStyle.popinstext,
                                    ),
                            
                                        GetBuilder<WholeReviewController>(
                                  init: wholereviewcontroller,
                                  builder: (_) {
                    return
                    wholereviewcontroller.wholeReviewModel == null &&
                            wholereviewcontroller.wholeReviewModel!.data == null 
                            // userreviewcontroller.userReviewModel!.data!.isEmpty
                        ?  SizedBox():
                                    
                                     ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount:   wholereviewcontroller.wholeReviewModel!.data!.length??0,
                                  itemBuilder: (context, index) {
                                    var item =    wholereviewcontroller.wholeReviewModel!.data![index];
                            
                                   
                                    return
                                    
                                       
                                     Column(
                                       children: [
                                          ...item.userId!.map((e) {
                                         print("NameReviewer ${e.fName}");
                                return 
                                         Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 10),
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.18,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: MyColors.grey, width: 0.5),
                    
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: MyColors.white),
                                          child: 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                     Text(
                                                    "${e.fName} ${e.lName}",
                                                    style:
                                                        CustomTextStyle.popinsmedium,
                                                  ),
                                                  Text(
                                                    item.comment ?? '',
                                                    style:
                                                        CustomTextStyle.popinsmedium,
                                                  ),

                                              
                                            
                                                                               InkWell(
                                                                                  onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        // title:
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            // Align(
                                                            //   alignment:
                                                            //       Alignment.topRight,
                                                            //   child: IconButton(
                                                            //     icon: Icon(Icons
                                                            //         .close), // You can use any close icon you prefer
                                                            //     onPressed: () {
                                                            //       Get.back(); // Close the dialog
                                                            //     },
                                                            //   ),
                                                            // ),
                                                            TextField(
                                                              controller:
                                                                  wholereviewcontroller
                                                                      .commentController,
                                                              decoration: InputDecoration(
                                                                hintText: 'description',
                                                              ),
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  wholereviewcontroller
                                                                      .ratingController,
                                                              decoration: InputDecoration(
                                                                hintText: 'Rating',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        actions: <Widget>[
                                                        
                                                          TextButton(
                                                            child: Text('Submit'),
                                                            onPressed: () async {
                                                          //   userreviewcontroller.reviewAdd(orderdetailscontroller, (myordercontroller.orderdetailsModel!
                                                          //     .data![0].orderId ??
                                                          // 0));
                                                              await wholereviewcontroller
                                                                  .reviewinit();
                                                              Navigator.of(context).pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                },
                                              );
                                                                                  },
                                                                                  child:
                                            
                                              // ListView.builder(
                                              //                                 primary: false,
                                              //                                 shrinkWrap: true,
                                              //                                 // scrollDirection: Axis.horizontal,
                                              //                                 itemCount:userreviewcontroller.userReviewModel?.data?.length ?? 0,
                                              //                                 itemBuilder: (context, index) {
                                              //                                   var item = userreviewcontroller
                                              //                                     .userReviewModel!.data![index];
                                              //                              return      userreviewcontroller
                                              //                                     .userReviewModel!.data == null? SizedBox():
                                                                              RatingStars(
                                                value:( item.rating??0).toDouble(),
                                              // onValueChanged: (v) {
                                              //   //
                                              //   setState(() {
                                              //     value = v;
                                              //   });
                                              // },
                                              starBuilder: (index, color) => Icon(
                                                Icons.star,
                                                color: color,
                                                size: 15,
                                              ),
                                              starCount: 5,
                                              starSize: 20,
                                              // valueLabelColor: const Color(0xff9b9b9b),
                                              // valueLabelTextStyle: const TextStyle(
                                              //     color: Colors.white,
                                              //     fontWeight: FontWeight.w400,
                                              //     fontStyle: FontStyle.normal,
                                              //     fontSize: 12.0),
                                              // valueLabelRadius: 10,
                                               maxValue:5,
                                              starSpacing: 0.5,
                                              maxValueVisibility: true,
                                              valueLabelVisibility: false,
                                              animationDuration:
                                                      Duration(milliseconds: 5000),
                                              // valueLabelPadding:
                                              //     const EdgeInsets.symmetric(
                                              //         vertical: 1, horizontal: 8),
                                              // valueLabelMargin:
                                              //     const EdgeInsets.only(right: 8),
                                              starOffColor: const Color(0xffe7e8ea),
                                              starColor: MyColors.yellow,
                                                     ),
                                                    //  }),
                                                                              
                                                                              
                                                                                )
                                                   
                                                                              
                                                  ],
                                              ),
                                            )
                                         
                                    );
                                     })    ],
                                     );
                                 
                                   
                                   
                                    });

                                    
                                    //  InkWell(
                                    //   onTap: () {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (BuildContext context) {
                                    //         return AlertDialog(
                                    //           // title:
                                    //           content: Column(
                                    //             mainAxisSize: MainAxisSize.min,
                                    //             children: [
                                    //               // Align(
                                    //               //   alignment:
                                    //               //       Alignment.topRight,
                                    //               //   child: IconButton(
                                    //               //     icon: Icon(Icons
                                    //               //         .close), // You can use any close icon you prefer
                                    //               //     onPressed: () {
                                    //               //       Get.back(); // Close the dialog
                                    //               //     },
                                    //               //   ),
                                    //               // ),
                                    //               TextField(
                                    //                 controller:
                                    //                     userreviewcontroller
                                    //                         .commentController,
                                    //                 decoration: InputDecoration(
                                    //                   hintText: 'description',
                                    //                 ),
                                    //               ),
                                    //               TextField(
                                    //                 controller:
                                    //                     userreviewcontroller
                                    //                         .ratingController,
                                    //                 decoration: InputDecoration(
                                    //                   hintText: 'Rating',
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //           actions: <Widget>[
                                    //             TextButton(
                                    //               child: Text('Cancel'),
                                    //               onPressed: () {
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //             ),
                                    //             TextButton(
                                    //               child: Text('OK'),
                                    //               onPressed: () async {
                                    //             //   userreviewcontroller.reviewAdd(orderdetailscontroller, (myordercontroller.orderdetailsModel!
                                    //             //     .data![0].orderId ??
                                    //             // 0));
                                    //                 await userreviewcontroller
                                    //                     .reviewinit();
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //             ),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    //   child: RatingStars(
                                    //     value: userreviewcontroller.value!,
                                    //     // onValueChanged: (v) {
                                    //     //   //
                                    //     //   setState(() {
                                    //     //     value = v;
                                    //     //   });
                                    //     // },
                                    //     starBuilder: (index, color) => Icon(
                                    //       Icons.star,
                                    //       color: color,
                                    //       size: 15,
                                    //     ),
                                    //     starCount: 5,
                                    //     starSize: 20,
                                    //     // valueLabelColor: const Color(0xff9b9b9b),
                                    //     // valueLabelTextStyle: const TextStyle(
                                    //     //     color: Colors.white,
                                    //     //     fontWeight: FontWeight.w400,
                                    //     //     fontStyle: FontStyle.normal,
                                    //     //     fontSize: 12.0),
                                    //     // valueLabelRadius: 10,
                                    //     maxValue:5,
                                    //     starSpacing: 0.5,
                                    //     maxValueVisibility: true,
                                    //     valueLabelVisibility: false,
                                    //     animationDuration:
                                    //         Duration(milliseconds: 5000),
                                    //     // valueLabelPadding:
                                    //     //     const EdgeInsets.symmetric(
                                    //     //         vertical: 1, horizontal: 8),
                                    //     // valueLabelMargin:
                                    //     //     const EdgeInsets.only(right: 8),
                                    //     starOffColor: const Color(0xffe7e8ea),
                                    //     starColor: MyColors.yellow,
                                    //   ),
                                    // );
                                  
                                  
                                  }),

                            Text(
                              "Call",
                              style: CustomTextStyle.popinssmall014,
                            ),
                            Card(
                              elevation: 1.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21.0),
                              ),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                      color: MyColors.white,
                                      borderRadius: BorderRadius.circular(21)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Nity Make",
                                              style:
                                                  CustomTextStyle.popinsmedium,
                                            ),
                                            Container(
                                              height: 30, width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: MyColors.yellowcir,
                                                  width: 1.0,
                                                ),
                                              ),
                                              // child:Center(child: Text("05"))
                                            )
                                          ],
                                        ),

                                        // Row(children: [
                                        // SvgPicture.asset("assets/image/yellowstar.svg"),
                                        // SizedBox(width: 5,),
                                        // SvgPicture.asset("assets/image/yellowstar.svg"),
                                        // SizedBox(width: 5,),
                                        // SvgPicture.asset("assets/image/yellowstar.svg"),
                                        // SizedBox(width: 5,),
                                        // SvgPicture.asset("assets/image/yellowstar.svg"),
                                        // SizedBox(width: 5,),
                                        // SvgPicture.asset("assets/image/yellowstar.svg"),
                                        // SizedBox(width: 5,),
                                        // Text("4.5")
                                        // ],)

                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "+91 2536874562",
                                          style: CustomTextStyle.popinssmall01,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            InkWell(
                              onTap: () async {
                                OrderTrackerWholeController
                                    ordertrackcontroller =
                                    Get.put(OrderTrackerWholeController());
                                ordertrackcontroller
                                    .updateOrder(widget.orderId ?? 0);
                                await ordertrackcontroller.init();
                                Get.to(LocationPickerMapWhole1());
                              },
                              child: Center(
                                child: Container(
                                  // width: MediaQuery.of(context).size.width*0.8,

                                  height:
                                      MediaQuery.of(context).size.height * 0.08,

                                  decoration: BoxDecoration(
                                      color: MyColors.yellow,
                                      borderRadius: BorderRadius.circular(25)),

                                  child: Center(
                                      child: Text(
                                    "Track order",
                                    style: CustomTextStyle.mediumtextreem,
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          ],
                        );
                })));
  }
}
