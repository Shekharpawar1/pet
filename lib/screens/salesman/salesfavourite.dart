import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salesfavourite_controller.dart';
import 'package:pet/controllers/user_controller/userfavourite_controller.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class Salesfavourite extends StatefulWidget {
  const Salesfavourite({super.key});

  @override
  State<Salesfavourite> createState() => _SalesfavouriteState();
}

class _SalesfavouriteState extends State<Salesfavourite> {
  TextEditingController _searchcontroller = TextEditingController();
  SalesfavouriteController salesrfavouriteController =
      Get.put(SalesfavouriteController());
       final SalesProductDetailsController salesproductdetailscontroller =
      Get.put(SalesProductDetailsController());
         SalesMyCartController mycartController = Get.put(SalesMyCartController());

  @override
  void initState() {
    super.initState();
    salesrfavouriteController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
         appBar: CustomAppBarSalesWholeback(title: "WishList",), 
         body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              primary: true,
              children: [


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      GetBuilder<SalesfavouriteController>(
                          init: salesrfavouriteController,
                          builder: (_) {
                            return salesrfavouriteController.wishList == null ||
                                    salesrfavouriteController.wishList!.data ==
                                        null
                                ? SizedBox()
                                : GridView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15.0,
                                            mainAxisSpacing: 15.0,
                                            mainAxisExtent: 285),
                                    itemCount: salesrfavouriteController
                                        .wishList!
                                        .data!
                                        .length, // Set the number of cards you want to display.
                                    itemBuilder: (context, index) {
                                      var item = salesrfavouriteController
                                          .wishList!.data![index];
                                      String imagePath =
                                          Constants.PRODUCT_HOME_IMAGE_PATH +
                                              "/${item.storeId![0].image!}";
                                      return 
                                      salesrfavouriteController
                                          .wishList!.data![index] == null? SizedBox():

                                              Container(
                                                width: 140,
                                                // height: 700,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // MyColors.white
                                                      //     .withOpacity(0.1),
                                                      MyColors.white,
                                                      MyColors.white,
                                                      // MyColors.white,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  // color: MyColors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // Offset of the shadow
                                                    ),
                                                  ],
                                                  // color: MyColors.white
                                                ),
                                                child: Column(
                                                  children: [


       InkWell(
                                                      onTap: () {
                                                           salesrfavouriteController
                                                          .removeItemFromWishList(
                                                              item.itemId!);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Icon(
                                                                Icons.favorite,
                                                              color: Colors.red)),
                                                      ),
                                                    ),
                  
                                                
                                                


                                                    Container(
                                                      height: 125,
                                                      decoration: BoxDecoration(
                                                          // gradient:
                                                          //     LinearGradient(
                                                          //   colors: [
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //   ],
                                                          //   begin:
                                                          //       Alignment.topLeft,
                                                          //   end: Alignment
                                                          //       .bottomRight,
                                                          // ),
                                                          ),
                                                      // decoration: BoxDecoration(
                                                      //     borderRadius: BorderRadius.circular(30),
                                                      //     color: MyColors.white),
                                                      child: CachedNetworkImage(
                                                        imageUrl: imagePath,
                                                        // width: 61,
                                                        // height: 75,
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ), // Replace with your own placeholder widget
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons
                                                                .error), // Replace with your own error widget
                                                      ),
                                                    ),

                                                    // SizedBox(height: 15,),

                                                    Container(
                                                      // height: 140,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 5,
                                                                top: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(item.storeId![0].name??'',
                                                              maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium),
                                                            Text(
                                                                item.storeId![0].description
                                                                            .toString()
                                                                            .length <
                                                                        30
                                                                    ? item
                                                                       .storeId![0] .description!
                                                                    : item
                                                                       .storeId![0] .description!
                                                                        .substring(
                                                                            0,
                                                                            19),
                                                                style: CustomTextStyle
                                                                    .popinssmall0),
                                                            SizedBox(height: 5),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    // Row(
                                                                    //   children: [
                                                                    //     Text(
                                                                    //         "₹" +
                                                                    //             item.storeId![0].price.toString(),
                                                                    //         style: CustomTextStyle.discounttext),
                                                                    //     SizedBox(
                                                                    //         width:
                                                                    //             2),
                                                                       
                                                                    //     Text(
                                                                    //         // item.discount.toString(),
                                                                    //         "Save${item.storeId![0].discount.toString()}%",
                                                                    //         style:
                                                                    //             CustomTextStyle.popinstextsmal2222red),
                                                                    //     //   ),
                                                                    //     // ),
                                                                    //   ],
                                                                    // ),

                                                                      (item.storeId![0].discount !="0.00"&& item.storeId![0].discount !="0"&&item.storeId![0].discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.storeId![0].wholePrice.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                       
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                               "Save${item.storeId![0].discount.toString()}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ): const  SizedBox(),
                                                               
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              Get.width * 0.23,
                                                                          child:
                                                                              Text(
                                                                             "₹ ${(((item.storeId![0].price!)) - (((item.storeId![0].price!)) * ((item.storeId![0].discount!)) / 100)).toDouble()}",
                                                                            // "₹" +
                                                                            //     item.price!,
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                               onTap: () async{
                                                            //                  salesproductdetailscontroller.viewproductHome(
                                                            //                   item.id??0,item.storeId![0].name??'',"1kg",1 ,item.storeId![0].price as double,item.storeId![0].image??'', "yes");
                                                            //                   await salesproductdetailscontroller
                                                            // .addProduct();
                                                            // async{
                                                                salesproductdetailscontroller.viewproductHome(item.id??0,item.storeId![0].name??'',"1kg",1,item.storeId![0].price as double,item.storeId![0].image??'',"yes");
                                                                              
                                                                                        await salesproductdetailscontroller.addProductHome();
                                                                                     mycartController.init();
                                                                      
                                                                            },
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 0.0),
                                                                            child: Container(
                                                                                width: 35,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(5.0),
                                                                                  child: Image.asset(
                                                                                    "assets/image/bag2.png",
                                                                                    height: 25,
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),

                                                                // Image.asset(
                                                                //   "assets/image/yellowbag.png",
                                                                //   height: 80,
                                                                // )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                         
                                      // Container(
                                      //    width: 140,
                                      //         // height: 700,
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(25),
                                      //           color: MyColors.white,
                                      //           boxShadow: [
                                      //             BoxShadow(
                                      //               color: Colors.grey
                                      //                   .withOpacity(0.3),
                                      //               spreadRadius: 3,
                                      //               blurRadius: 7,
                                      //               offset: Offset(0,
                                      //                   3), // Offset of the shadow
                                      //             ),
                                      //           ],
                                      //           // color: MyColors.white
                                      //         ),
                                      //   child: Column(
                                      //     children: [
                                      //       Stack(
                                      //           children: [
                                      //             Container(
                                      //               width: MediaQuery.of(context)
                                      //                   .size
                                      //                   .width,
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           30),
                                      //                   color: MyColors.white),
                                      //               child: CachedNetworkImage(
                                      //                 // https://canine.hirectjob.in/storage/app/public/product/2023-07-24-64be42a3db7e9.png
                                      //                 imageUrl:
                                      //                     imagePath, // Replace with your image URL
                                      //                 // fit: BoxFit.fill,
                                      //               height: 125,
                                      //                 placeholder:
                                      //                     (context, url) =>
                                      //                         Center(
                                      //                   child: SpinKitCircle(
                                      //                     color: Colors
                                      //                         .white, // Color of the progress bar
                                      //                     size:
                                      //                         50.0, // Size of the progress bar
                                      //                   ),
                                      //                 ), // Placeholder widget while loading
                                      //                 errorWidget: (context, url,
                                      //                         error) =>
                                      //                     Icon(Icons
                                      //                         .error), // Widget to show on error
                                      //               ),
                                      //             ),
                                      //             InkWell(
                                      //               onTap: () {
                                      //                 salesrfavouriteController
                                      //                     .removeItemFromWishList(
                                      //                         item.itemId!);
                                      //               },
                                      //               child: Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         8.0),
                                      //                 child: Align(
                                      //                     alignment: Alignment
                                      //                         .centerRight,
                                      //                     child: Icon(
                                      //                        Icons.favorite,
                                      //                       color:
                                      //                           MyColors.red,
                                      //                     )),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      
                                      //         // SizedBox(height: 15,),
                                      
                                      //         Padding(
                                      //          padding:
                                      //                     const EdgeInsets.only(
                                      //                         left: 10.0,
                                      //                         right: 5,
                                      //                         top: 5),
                                      //           child: Column(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment.start,
                                      //             children: [
                                      //               Text(item.storeId![0].name!,
                                      //                   style: CustomTextStyle
                                      //                       .popinsmedium),
                                      //               Text(
                                      //                   item.storeId![0]
                                      //                       .description!,
                                      //                   style: CustomTextStyle
                                      //                       .popinssmall0),
                                      //               SizedBox(height: 5),
                                      //               Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .spaceBetween,
                                      //                 children: [
                                      //                   Column(
                                      //                     crossAxisAlignment:
                                      //                         CrossAxisAlignment
                                      //                             .start,
                                      //                     children: [
                                      //                       Row(
                                      //                         children: [
                                      //                           Text(
                                      //                              "₹" + item
                                      //                                   .storeId![
                                      //                                       0]
                                      //                                   .price
                                      //                                   .toString(),
                                      //                               style: CustomTextStyle
                                      //                                   .discounttext),
                                      //                           SizedBox(
                                      //                               width: 10),
                                      //                           Container(
                                      //                             height: 18,
                                      //                             width: 40,
                                      //                             decoration: BoxDecoration(
                                      //                                 color:
                                      //                                     MyColors
                                      //                                         .red,
                                      //                                 borderRadius:
                                      //                                     BorderRadius.circular(
                                      //                                         10),
                                      //                                 border: Border.all(
                                      //                                     color: MyColors
                                      //                                         .red)),
                                      //                             child: Center(
                                      //                               child: Text(
                                      //                                   // item.discount.toString(),
                                      //                                  "Save"+ item
                                      //                                       .storeId![
                                      //                                           0]
                                      //                                       .discount
                                      //                                       .toString()+"%",
                                      //                                   style: CustomTextStyle
                                      //                                       .popinstextsmal2222),
                                      //                             ),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                       SizedBox(height: 5),
                                      //                       Text(
                                      //                     "₹ ${(((item.storeId![0].price!)) - (((item.storeId![0].price!)) * ((item.storeId![0].discount!)) / 100)).toDouble()}",
                                      
                                      //                       // "₹" +  item.storeId![0]
                                      //                       //       .price
                                      //                       //       .toString() ,
                                      //                         style: CustomTextStyle
                                      //                             .popinsmedium,
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                   Padding(
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                                 .only(
                                      //                             right: 5.0),
                                      //                     child: Container(
                                      //                         width: 35,
                                      //                         height: 35,
                                      //                         decoration: BoxDecoration(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         10),
                                      //                             color: Color(
                                      //                                 0xffffcc00)),
                                      //                         child: Padding(
                                      //                           padding:
                                      //                               EdgeInsets
                                      //                                   .all(5.0),
                                      //                           child:
                                      //                               Image.asset(
                                      //                             "assets/image/bag2.png",
                                      //                             height: 25,
                                      //                           ),
                                      //                         )),
                                      //                   )
                                      //                 ],
                                      //               )
                                      //             ],
                                      //           ),
                                      //         )
                                      //      ],
                                      //   ),
                                      // );





});
                          })
                    ],
                  ),
                ),
              ],
            ),

            GetBuilder<SalesfavouriteController>(
                init: salesrfavouriteController,
                builder: (_) {
                  return salesrfavouriteController.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.5), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
            // Progress bar
            GetBuilder<SalesfavouriteController>(
                init: salesrfavouriteController,
                builder: (_) {
                  return salesrfavouriteController.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.white, // Color of the progress bar
                            size: 50.0, // Size of the progress bar
                          ),
                        )
                      : SizedBox();
                }),
          ],
        ));
  }
}
