import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:share_plus/share_plus.dart';

class FilterScreenUI extends StatelessWidget {
  FilterScreenUI({super.key});
  final FilterController filterController = Get.put(FilterController());
    ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
       MyCartController mycartController = Get.put(MyCartController());
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  @override
  void onInit() {
    filterController.loadDefaultData();
    // super.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              // _drawerkey.currentState!.openDrawer();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),
        actions: [
          GestureDetector(
            onTap: () {
              FilterController filtercontroller = Get.put(FilterController());
              filtercontroller.init();
              Get.to(FilterScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffffcc00)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/image/filter3.png",
                    ),
                  )),
            ),
          )
        ],
      ),
      body: GetBuilder<FilterController>(
          init: filterController,
          builder: (_) {
            return Stack(
              children: [
                filterController.filteredProducts.isEmpty
                    ?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                
                        child:
                         Container(
                           child: GridView.builder(
                              // primary: false,
                              // shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 280),
                              itemCount: filterController.filteredProducts
                                  .length, // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                // gridDelegate:
                                //     SliverGridDelegateWithMaxCrossAxisExtent(
                                //         maxCrossAxisExtent: 150,
                                //      childAspectRatio: 3 / 2,
                                //         mainAxisExtent: 285,
                                //         crossAxisSpacing: 15,
                                //         mainAxisSpacing: 15),
                                // itemCount: homeusercontroller
                                //     .userPropertiesModel!.data!.length
                                //     .clamp(0, 4),
                                // itemBuilder: (BuildContext ctx, index) {
                         
                                var item =
                                    filterController.filteredProducts![index];
                                String imagePath =
                                    "${Constants.PRODUCT_HOME_IMAGE_PATH}/${item.image!}";
                         
                                // var imagePath =
                                //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                print(imagePath);
                                return InkWell(
                                  onTap: () async {
                                  
                                    ProductDetailsController
                                        productdeatilscontroller =
                                        Get.put(ProductDetailsController());
                                       productdeatilscontroller.dispose();
                                    productdeatilscontroller.viewproduct(
                                      item.id ?? 0,
                                    );
                                    // print("productid${item.id ?? 0}");
                                    await productdeatilscontroller.init();
                                    Get.to(ProductDetails());
                                    // Get.to( ProductDetails());
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //           ));
                                  },
                                  child: Container(
                                    width: 140,
                                    // height: 700,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
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
                                      borderRadius: BorderRadius.circular(25),
                                      // color: MyColors.white,
                                      boxShadow: [
                                      BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
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
                                                                                      
                                                Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item.image.toString(), item.name.toString(),  item.price.toString());

    // Share.share(itemAll.toString());
  
  },
),


Spacer(),
      GetBuilder<HomeuserController>(
                                            init: homeusercontroller,
                                            builder: (_) {
                                              return InkWell(
                                                onTap: () {
                                                  homeusercontroller
                                                      .addItemToWishList(
                                                          item.id!);
                         
                                                  homeusercontroller.init();
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(
                                                        homeusercontroller
                                                                .wishListItemsId
                                                                .contains(
                                                                    item.id!)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              );
                                            }),
                         
                                                                                   
]),
                                        
                                     Container(
                                          height: 125,
                                          decoration: const BoxDecoration(
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
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons
                                                    .error), // Replace with your own error widget
                                          ),
                                        ),
                         
                                        // SizedBox(height: 15,),
                         
                                        Container(
                                          // height: 140,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 5, top: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(item.name!,
                                                   maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                                    style: CustomTextStyle
                                                        .popinsmedium),
                                                    Text(
  item.description!.length < 20
      ? item.description!
      : item.description!.substring(0, item.description!.length),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: CustomTextStyle.popinssmall0,
),  SizedBox(height: 5),
                                                            const SizedBox(height: 5),
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
                                                         (item.discount !="0.00"&& item.discount !="0"&&item.discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.price.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        
                                                                         SizedBox(width:3),
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                      
                                                                      ],
                                                                    ):const  SizedBox(),
                                                                    
                                                        // Row(
                                                        //   children: [
                                                        //     Text(
                                                        //         "₹${item.price}",
                                                        //         style: CustomTextStyle
                                                        //             .discounttext),
                                                        //     const SizedBox(width: 2),
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
                                                        //           "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                        //         style: CustomTextStyle
                                                        //             .popinstextsmal2222red),
                                                        //     //   ),
                                                        //     // ),
                                                        //   ],
                                                        // ),
                                                        const SizedBox(height: 5),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.23,
                                                              child: Text(
                                                                "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                         
                                                                // "₹" +
                                                                //     item.price!,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: Get.width *
                                                                    0.054),
                                                            InkWell(
                                                              onTap: ()async {
                                                                productdeatilscontroller.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.price ?? ''),(item.image).toString(),"yes");
     await productdeatilscontroller.addProductHome();
                                                            mycartController.init();
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            5.0),
                                                                child: Container(
                                                                    width: 35,
                                                                    height: 35,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        color: const Color(
                                                                            0xffffcc00)),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/image/bag2.png",
                                                                        height:
                                                                            25,
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
                         
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //     width: 140,
                                  //     // height: 700,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       color: MyColors.white,
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //           color: Colors.grey.withOpacity(0.3),
                                  //           spreadRadius: 3,
                                  //           blurRadius: 7,
                                  //           offset:
                                  //               Offset(0, 3), // Offset of the shadow
                                  //         ),
                                  //       ],
                                  //       // color: MyColors.white
                                  //     ),
                                  //     child: Column(
                                  //       children: [
                                  //         // InkWell(
                                  //         //   onTap: () {
                                  //         //     homeusercontroller
                                  //         //         .addItemToWishList(
                                  //         //             item.id!);
                                  //         //   },
                                  //         //   child: Padding(
                                  //         //     padding:
                                  //         //         const EdgeInsets.all(
                                  //         //             8.0),
                                  //         //     child: Align(
                                  //         //         alignment: Alignment
                                  //         //             .centerRight,
                                  //         //         child: Icon(homeusercontroller
                                  //         //                 .wishListItemsId
                                  //         //                 .contains(
                                  //         //                     item.id!)
                                  //         //             ? Icons.favorite
                                  //         //             : Icons
                                  //         //                 .favorite_border)),
                                  //         //   ),
                                  //         // ),
                         
                                  //         Container(
                                  //           height: 125,
                         
                                  //           // decoration: BoxDecoration(
                                  //           //     borderRadius: BorderRadius.circular(30),
                                  //           //     color: MyColors.white),
                                  //           child: CachedNetworkImage(
                                  //             imageUrl: imagePath,
                                  //             // width: 61,
                                  //             // height: 75,
                                  //             placeholder: (context, url) => Center(
                                  //               child: CircularProgressIndicator(),
                                  //             ), // Replace with your own placeholder widget
                                  //             errorWidget: (context, url, error) =>
                                  //                 Icon(Icons
                                  //                     .error), // Replace with your own error widget
                                  //           ),
                                  //         ),
                         
                                  //         // SizedBox(height: 15,),
                         
                                  //         Container(
                                  //           // height: 140,
                                  //           child: Padding(
                                  //             padding: const EdgeInsets.only(
                                  //                 left: 10.0, right: 5, top: 5),
                                  //             child: Column(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.start,
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Text(item.name!,
                                  //                     style:
                                  //                         CustomTextStyle.popinsmedium),
                                  //                 Text(
                                  //                     item.description
                                  //                                 .toString()
                                  //                                 .length <
                                  //                             30
                                  //                         ? item.description!
                                  //                         : item.description!
                                  //                             .substring(0, 19),
                                  //                     style:
                                  //                         CustomTextStyle.popinssmall0),
                                  //                 SizedBox(height: 5),
                                  //                 Row(
                                  //                   mainAxisAlignment:
                                  //                       MainAxisAlignment.spaceBetween,
                                  //                   children: [
                                  //                     Column(
                                  //                       crossAxisAlignment:
                                  //                           CrossAxisAlignment.start,
                                  //                       children: [
                                  //                         Row(
                                  //                           children: [
                                  //                             Text(
                                  //                                 "₹" +
                                  //                                     item.price
                                  //                                         .toString(),
                                  //                                 style: CustomTextStyle
                                  //                                     .discounttext),
                                  //                             SizedBox(width: 10),
                                  //                             Container(
                                  //                               height: 20,
                                  //                               width: 40,
                                  //                               decoration: BoxDecoration(
                                  //                                   color: MyColors.red,
                                  //                                   borderRadius:
                                  //                                       BorderRadius
                                  //                                           .circular(
                                  //                                               10),
                                  //                                   border: Border.all(
                                  //                                       color: MyColors
                                  //                                           .red)),
                                  //                               child: Center(
                                  //                                 child: Text(
                                  //                                     // item.discount.toString(),
                                  //                                       "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                  //                                     style: CustomTextStyle
                                  //                                         .popinstextsmal2222),
                                  //                               ),
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                         SizedBox(height: 5),
                                  //                         Text(
                                  //                           "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                         
                                  //                           // "₹" +
                                  //                           //     item.price!,
                                  //                           style: CustomTextStyle
                                  //                               .popinsmedium,
                                  //                         ),
                                  //                       ],
                                  //                     ),
                         
                                  //                     Padding(
                                  //                       padding: const EdgeInsets.only(
                                  //                           right: 5.0),
                                  //                       child: Container(
                                  //                           width: 35,
                                  //                           height: 35,
                                  //                           decoration: BoxDecoration(
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(10),
                                  //                               color:
                                  //                                   Color(0xffffcc00)),
                                  //                           child: Padding(
                                  //                             padding:
                                  //                                 EdgeInsets.all(5.0),
                                  //                             child: Image.asset(
                                  //                               "assets/image/bag2.png",
                                  //                               height: 25,
                                  //                             ),
                                  //                           )),
                                  //                     )
                                  //                     // Image.asset(
                                  //                     //   "assets/image/yellowbag.png",
                                  //                     //   height: 80,
                                  //                     // )
                                  //                   ],
                                  //                 )
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                );
                              }),
                         ),
                      ),
                filterController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.1), // Adjust the opacity as needed
                        ),
                      )
                    : const SizedBox(),
                filterController.showLoading
                    ? const Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
    );
  }
}


void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}