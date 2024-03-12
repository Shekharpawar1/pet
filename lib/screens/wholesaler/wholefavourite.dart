import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/userfavourite_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholefavourite_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class wholefavourite extends StatefulWidget {
  const wholefavourite({super.key});

  @override
  State<wholefavourite> createState() => _wholefavouriteState();
}

class _wholefavouriteState extends State<wholefavourite> {
  TextEditingController _searchcontroller = TextEditingController();
 WholefavouriteController wholefavouriteController =
      Get.put(WholefavouriteController());
        WholeProductDetailsController wholeproductdetailsController = Get.put(WholeProductDetailsController());


  @override
  void initState() {
    super.initState();
    wholefavouriteController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
     
      appBar: CustomAppBarWholeback(
           title: "Wishlist",
      ),
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
                      GetBuilder<WholefavouriteController>(
                          init: wholefavouriteController,
                          builder: (_) {
                            return wholefavouriteController.wishList  == null 
                            ||
                                    wholefavouriteController.wishList!.data ==
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
                                    itemCount:wholefavouriteController.wishList!.data!
                                        .length, // Set the number of cards you want to display.
                                    itemBuilder: (context, index) {
                                     var item = wholefavouriteController.wishList!.data![index]
                                        ;
                                         
                                      String imagePath =
                                          Constants.PRODUCT_HOME_IMAGE_PATH +
                                              "/${item.storeId![0].image!}";
//  var storeInfo = wholefavouriteController.wishList!.data![index].storeId![0];
//     // Access the name of the store
//     String storeName = storeInfo.name.toString();
//       print(storeName);
//        print("storeName");


                                      return
                                   
                                     ( wholefavouriteController
                                          .wishList!.data![index].storeId == []||wholefavouriteController
                                          .wishList!.data![index].storeId!.length == 0)? const SizedBox():
                                      InkWell(
                                         onTap: () async {
                                            wholeproductdetailsController
                                                .viewproduct(
                                              item.id ?? 0,
                                            );
                                            print("productid${item.id ?? 0}");
                                            await wholeproductdetailsController
                                                .init();
                                            Get.to(ProductDetailswhole(
                                              
                                            ));
                                         
                                            
                                          },
                                        child: 
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
                                                          wholefavouriteController
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
                                                                            //  "Save${item.storeId![0].discount.toString()}%",
                                                                           (item.storeId![0].discount !="0.00" && item.storeId![0].discount !="0" && item.storeId![0].discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.storeId![0].wholePrice.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        // Container(
                                                                        // height:
                                                                        //     20,
                                                                        // width: 48,
                                                                        // decoration: BoxDecoration(
                                                                        //     color: MyColors
                                                                        //         .red,
                                                                        //     borderRadius: BorderRadius.circular(
                                                                        //         10),
                                                                        //     border:
                                                                        //         Border.all(color: MyColors.red)),
                                                                        // child:
                                                                        //     Center(
                                                                        //   child:
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                             "Save${item.storeId![0].discount.toString()}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ): const  SizedBox(),
                                                                   
                                                                   
                                                                    // Row(
                                                                    //   children: [
                                                                    //     Text(
                                                                    //         "₹" +
                                                                    //             item.storeId![0].price.toString(),
                                                                    //         style: CustomTextStyle.discounttext),
                                                                    //     SizedBox(
                                                                    //         width:
                                                                    //             2),
                                                                    //     // Container(
                                                                    //     // height:
                                                                    //     //     20,
                                                                    //     // width: 48,
                                                                    //     // decoration: BoxDecoration(
                                                                    //     //     color: MyColors
                                                                    //     //         .red,
                                                                    //     //     borderRadius: BorderRadius.circular(
                                                                    //     //         10),
                                                                    //     //     border:
                                                                    //     //         Border.all(color: MyColors.red)),
                                                                    //     // child:
                                                                    //     //     Center(
                                                                    //     //   child:
                                                                    //     Text(
                                                                    //         // item.discount.toString(),
                                                                    //         "Save${item.storeId![0].discount.toString()}%",
                                                                    //         style:
                                                                    //             CustomTextStyle.popinstextsmal2222red),
                                                                    //     //   ),
                                                                    //     // ),
                                                                    //   ],
                                                                    // ),
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
                                                                             wholeproductdetailsController.viewproductHome(
                                                                              item.id??0,item.storeId![0].name??'',"1kg",1 ,item.storeId![0].price as double,item.storeId![0].image??'',"yes");
                                                                              await wholeproductdetailsController
                                                            .addProductHome();
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
                                              ),
                                         
                                        
                                        // Container(
                                        //  width: 140,
                                        //       // height: 700,
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(25),
                                        //         color: MyColors.white,
                                        //         boxShadow: [
                                        //           BoxShadow(
                                        //             color: Colors.grey
                                        //                 .withOpacity(0.3),
                                        //             spreadRadius: 3,
                                        //             blurRadius: 7,
                                        //             offset: Offset(0,
                                        //                 3), // Offset of the shadow
                                        //           ),
                                        //         ],
                                        //         // color: MyColors.white
                                        //       ),
                                        //      child: Column(
                                        //     children: [
                                        //       Stack(
                                        //         children: [
                                        //           Container(
                                        //             width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width,
                                        //             decoration: BoxDecoration(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                         30),
                                        //                 color: MyColors.white),
                                        //             child: CachedNetworkImage(
                                        //               // https://canine.hirectjob.in/storage/app/public/product/2023-07-24-64be42a3db7e9.png
                                        //               imageUrl:
                                        //                   imagePath, // Replace with your image URL
                                        //               // fit: BoxFit.fill,
                                        //             height: 125,
                                        //               placeholder:
                                        //                   (context, url) =>
                                        //                       Center(
                                        //                 child: SpinKitCircle(
                                        //                   color: Colors
                                        //                       .white, // Color of the progress bar
                                        //                   size:
                                        //                       50.0, // Size of the progress bar
                                        //                 ),
                                        //               ), // Placeholder widget while loading
                                        //               errorWidget: (context, url,
                                        //                       error) =>
                                        //                   Icon(Icons
                                        //                       .error), // Widget to show on error
                                        //             ),
                                        //           ),
                                        //           InkWell(
                                        //             onTap: () {
                                        //               wholefavouriteController
                                        //                   .removeItemFromWishList(
                                        //                       item.itemId!);
                                        //             },
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(
                                        //                       8.0),
                                        //               child: Align(
                                        //                   alignment: Alignment
                                        //                       .centerRight,
                                        //                   child: Icon(
                                        //                      Icons.favorite,
                                        //                     // color:
                                        //                     //     MyColors.bgcolor,
                                        //                   )),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                      
                                        //       // SizedBox(height: 15,),
                                      
                                        //       Padding(
                                        //        padding:
                                        //                   const EdgeInsets.only(
                                        //                       left: 10.0,
                                        //                       right: 5,
                                        //                       top: 5),
                                        //         child: Column(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           children: [
                                        //             Text(item.storeId![0].name!,
                                        //                 style: CustomTextStyle
                                        //                     .popinsmedium),
                                        //             Text(
                                        //                 item.storeId![0]
                                        //                     .description!,
                                        //                 style: CustomTextStyle
                                        //                     .popinssmall0),
                                        //             SizedBox(height: 5),
                                        //             Row(
                                        //               mainAxisAlignment:
                                        //                   MainAxisAlignment
                                        //                       .spaceBetween,
                                        //               children: [
                                        //                 Column(
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .start,
                                        //                   children: [
                                        //                     Row(
                                        //                       children: [
                                        //                         Text(
                                        //                            "₹" + item
                                        //                                 .storeId![
                                        //                                     0]
                                        //                                 .price
                                        //                                 .toString(),
                                        //                             style: CustomTextStyle
                                        //                                 .discounttext),
                                        //                         SizedBox(
                                        //                             width: 10),
                                        //                         Container(
                                        //                           height: 18,
                                        //                           width: 40,
                                        //                           decoration: BoxDecoration(
                                        //                               color:
                                        //                                   MyColors
                                        //                                       .red,
                                        //                               borderRadius:
                                        //                                   BorderRadius.circular(
                                        //                                       10),
                                        //                               border: Border.all(
                                        //                                   color: MyColors
                                        //                                       .red)),
                                        //                           child: Center(
                                        //                             child: Text(
                                        //                                 // item.discount.toString(),
                                        //                                "Save"+ item
                                        //                                     .storeId![
                                        //                                         0]
                                        //                                     .discount
                                        //                                     .toString()+"%",
                                        //                                 style: CustomTextStyle
                                        //                                     .popinstextsmal2222),
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                     SizedBox(height: 5),
                                        //                     Text(
                                        //                   "₹ ${(((item.storeId![0].price!)) - (((item.storeId![0].price!)) * ((item.storeId![0].discount!)) / 100)).toDouble()}",
                                      
                                        //                     // "₹" +  item.storeId![0]
                                        //                     //       .price
                                        //                     //       .toString() ,
                                        //                       style: CustomTextStyle
                                        //                           .popinsmedium,
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //                 Padding(
                                        //                   padding:
                                        //                       const EdgeInsets
                                        //                               .only(
                                        //                           right: 5.0),
                                        //                   child: Container(
                                        //                       width: 35,
                                        //                       height: 35,
                                        //                       decoration: BoxDecoration(
                                        //                           borderRadius:
                                        //                               BorderRadius
                                        //                                   .circular(
                                        //                                       10),
                                        //                           color: Color(
                                        //                               0xffffcc00)),
                                        //                       child: Padding(
                                        //                         padding:
                                        //                             EdgeInsets
                                        //                                 .all(5.0),
                                        //                         child:
                                        //                             Image.asset(
                                        //                           "assets/image/bag2.png",
                                        //                           height: 25,
                                        //                         ),
                                        //                       )),
                                        //                 )
                                        //               ],
                                        //             )
                                        //           ],
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                      
                                      );
                                    });
                          })
                    ],
                  ),
                ),
              ],
            ),

            GetBuilder<WholefavouriteController>(
                init: wholefavouriteController,
                builder: (_) {
                  return wholefavouriteController.showLoading
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
            GetBuilder<WholefavouriteController>(
                init: wholefavouriteController,
                builder: (_) {
                  return wholefavouriteController.showLoading
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
