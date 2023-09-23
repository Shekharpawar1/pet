import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/myOrdersales_controller.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class MyOrderSales extends StatelessWidget {
  MyOrderSales({super.key, this.wholesellerID});
  int? wholesellerID;

  SalesMyOrderController myordercontroller = Get.put(SalesMyOrderController());
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
        body: GetBuilder<SalesMyOrderController>(
            init: myordercontroller,
            builder: (_) {
              return 
            
              myordercontroller.salesmyorderModel
             == null ? SizedBox() :
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount:  myordercontroller.salesmyorderModel!.data!.length,
                    itemBuilder: (context, index) {
                      var item =   myordercontroller.salesmyorderModel!.data![index];

                      print("=======>>>>>>>>>>>>  len  ${item.paymentMethod}");
                       print("=======>>>>>>>>>>>>  coupon  ${item.couponCode}");
                      // String imagePath =
                      //       Constants.PRODUCT_HOME_IMAGE_PATH +
                      //           "/${item.!}";
                      return   myordercontroller.salesmyorderModel!.data == null
                          ? SizedBox()
                          : 
                          

                          InkWell(
                            onTap: (){
                              myordercontroller.addorder(item.id??0);
                              print("OrderidSales ${item.id}");
                             myordercontroller.orderdetailsinit();
                              Get.to(OrderDetailssales(orderId:item.id??0,
                              couponcode: item.couponCode??'',paymentmethod:item.paymentMethod??'',
                              orderstatus:item.orderStatus??''));
                            },
                            child:  
                             Container(
                                    width: 335,
                                    margin:EdgeInsets.only(top: 10,bottom:25),
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      gradient: item.orderStatus == "pending"
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFFFEAD2),
                                                Color.fromRGBO(
                                                    255, 234, 210, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            )
                                          : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFEEEEFF),
                                                Color.fromRGBO(
                                                    238, 238, 255, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                                    color: item.orderStatus ==
                                                            "pending"
                                                        ? MyColors.orange
                                                        : MyColors.green1,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(25),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20))),
                                                child: Center(
                                                    child: Text(
                                                  item.orderStatus.toString(),
                                                  style: CustomTextStyle
                                                      .popinstextsmall12,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/image/logocanine.png",
                                              height: 80,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Order ID : ${item.id.toString()}",
                                                      style: CustomTextStyle
                                                          .popinsmedium,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                    ),
                                                    Positioned(
                                                        right: 0,
                                                        child: Text(
                                                        "₹${item.orderAmount}",
                                                          style: CustomTextStyle
                                                              .popinsmedium,
                                                        )),
                                                  ],
                                                ),
 Text(
                                            "CouponCode : ${  item.couponCode ?? ''}",
                                              style: CustomTextStyle.popinstextsmall123,
                                            ),     
                                            //     Text(
                                            // "Payment Status: ${item.paymentMethod ?? ''}",
                                            //   style: CustomTextStyle.popinstextsmall123,
                                            // ),
                                            Text("Order Status: ${item.orderStatus ?? ''}",
                                                style: CustomTextStyle.popinstextsmall123),
                                            Text(
                                                "Order Type: ${(item.orderType ?? 0)}"
                                                    .toString(),
                                                style: CustomTextStyle.popinstextsmall123), 
                                                                                      Row(
                                                  children: [
                                                    Text(
                                                      "Payment status : ${item.paymentStatus.toString()}",
                                                      style: CustomTextStyle
                                                          .popinssmall0,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                    ),
                                                    // Text("2+ more",style:CustomTextStyle.popinssmall0,),
                                                  ],
                                                ),

                                                // Text("Order By : ${item.userId[0]}",style:CustomTextStyle.popinssmall0,),
                                              ],
                                            ),
                                          ],
                                        )

                                         ])));   //                  Padding(
                                        //  padding: const EdgeInsets.only(left:17),
                                        //  child: Text("Sales Man",style:CustomTextStyle.popinssmall1,),
                                        //                  ),


                                       
                                             
                                               
                            
                  //           Container(
                  //               margin: EdgeInsets.symmetric(vertical: 10),
                  //               height: MediaQuery.of(context).size.height * 0.18,
                  //               width: MediaQuery.of(context).size.width,
                  //               decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(28),
                  //                     gradient: item.orderStatus == "pending"
                  //                         ? LinearGradient(
                  //                             begin: Alignment.topCenter,
                  //                             end: Alignment.bottomCenter,
                  //                             colors: [
                  //                               Color(0xFFFFEAD2),
                  //                               Color.fromRGBO(
                  //                                   255, 234, 210, 0.00),
                  //                             ],
                  //                             stops: [0.0, 1.0],
                  //                           )
                  //                         : LinearGradient(
                  //                             begin: Alignment.topCenter,
                  //                             end: Alignment.bottomCenter,
                  //                             colors: [
                  //                               Color(0xFFEEEEFF),
                  //                               Color.fromRGBO(
                  //                                   238, 238, 255, 0.00),
                  //                             ],
                  //                             stops: [0.0, 1.0],
                  //                           ),
                  //                   ),
                  //               child:

                  //                   Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: Row(
                  //                       children: [

                  //                          Padding(
                  //       padding: const EdgeInsets.all(15.0),
                  //       child: 
                  //        Container(
                  //         width: Get.width * 0.24,
                  //         child:
                  //           Image.asset(
                  //   "assets/image/logocanine.png",
                  //   // height: 80,
                  // ),
                  //         //  CachedNetworkImage(
                  //         //               imageUrl:imagePath,
                  //         //                         //  fit: BoxFit.cover,
                  //         //               // width: 61,
                  //         //               // height: 75,
                  //         //               placeholder: (context, url) => Center(
                  //         //                 child: CircularProgressIndicator(),
                  //         //               ), // Replace with your own placeholder widget
                  //         //               errorWidget: (context, url, error) =>
                  //         //                   Icon(Icons
                  //         //                       .error), // Replace with your own error widget
                  //         //             ),
                       
                  //       ),
                  //     ),
                     
                  //                         Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         children: [
                  //                           Text(
                  //                             "OrderId: ${(item.id ?? 0).toString()}",
                  //                             style: CustomTextStyle.popinsmedium,
                  //                           ),
                  //                           Text(
                  //                           "CouponCode : ${  item.couponCode ?? ''}",
                  //                             style: CustomTextStyle.popinsmedium,
                  //                           ),
                  //                           Text(
                  //                           "Payment Status: ${item.paymentMethod ?? ''}",
                  //                             style: CustomTextStyle.popinsmedium,
                  //                           ),
                  //                           Text("Order Status: ${item.orderStatus ?? ''}",
                  //                               style: CustomTextStyle.popinsmedium),
                  //                           Text(
                  //                               "Order Type: ${(item.orderType ?? 0)}"
                  //                                   .toString(),
                  //                               style: CustomTextStyle.popinsmedium),
                  //                           Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.spaceBetween,
                  //                             children: [
                  //                               Text(
                  //                               "Total Amount: ${ item.orderAmount ??
                  //                                     ''}",
                  //                                 style: CustomTextStyle.popinsmedium,
                  //                               ),
                  //                             ],
                  //                           )
                  //                         ],
                  //                                                         ),
                  //                       ],
                  //                     ),
                  //                   )
                                 
                  //                 ));
                          
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
              }  ),
                          );
                    }),
              );
            
  }
}
