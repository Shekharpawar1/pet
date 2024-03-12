import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';

import 'package:pet/controllers/wholesaler_controller/wholesaler_ourbrand_filter_controller.dart';
import 'package:pet/others/Filter.dart';


import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/Filter.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class WholeSalerFilterScreenUI extends StatelessWidget {
  WholeSalerFilterScreenUI({super.key});
  final WholeSalerOurBrandFilterController filterController = Get.put(WholeSalerOurBrandFilterController());
   WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
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
            child: Icon(
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
              
              WholeSalerOurBrandFilterController filtercontroller = Get.put(WholeSalerOurBrandFilterController());
              filtercontroller.init();
              Get.to(FilterScreenWhole());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffffcc00)),
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
      body: GetBuilder<WholeSalerOurBrandFilterController>(
          init: filterController,
          builder: (_) {
            return Stack(
              children: [
                   filterController.filteredProducts.isEmpty
                    ?  Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                    
                filterController.filteredProducts.isEmpty
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(15),
                        // height: 600,
                        child: GridView.builder(
                            // primary: false,
                            // shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15.0,
                                    mainAxisSpacing: 15.0,
                                    mainAxisExtent: 285),
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
                                  Constants.PRODUCT_HOME_IMAGE_PATH +
                                      "/${item.image!}";

                              // var imagePath =
                              //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                             
                              return InkWell(
                                onTap: () async {
                                WholeProductDetailsController
                                    wholeproductdetailsController =
                                    Get.put(WholeProductDetailsController());
                                wholeproductdetailsController.viewproduct(
                                  item.id ?? 0,
                                );
                                print("productid${item.id ?? 0}");
                                await wholeproductdetailsController.init();
                                Get.to(ProductDetailswhole());
                             
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: 140,
                                    // height: 700,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: MyColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // Offset of the shadow
                                        ),
                                      ],
                                      // color: MyColors.white
                                    ),
                                    child: Column(
                                      children: [
                                        // InkWell(
                                        //   onTap: () {
                                        //     homeusercontroller
                                        //         .addItemToWishList(
                                        //             item.id!);
                                        //   },
                                        //   child: Padding(
                                        //     padding:
                                        //         const EdgeInsets.all(
                                        //             8.0),
                                        //     child: Align(
                                        //         alignment: Alignment
                                        //             .centerRight,
                                        //         child: Icon(homeusercontroller
                                        //                 .wishListItemsId
                                        //                 .contains(
                                        //                     item.id!)
                                        //             ? Icons.favorite
                                        //             : Icons
                                        //                 .favorite_border)),
                                        //   ),
                                        // ),

                                        Container(
                                          height: 125,

                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(30),
                                          //     color: MyColors.white),
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath,
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
                                                    item.description
                                                                .toString()
                                                                .length <
                                                            30
                                                        ? item.description!
                                                        : item.description!
                                                            .substring(0, 19),
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
                                                               (item.discount !="0.00"&& item.discount !="0"&&item.discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.wholePrice.toString(),
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
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ): const  SizedBox(),
                                                                   
                                                                   
                                                        // Row(
                                                        //   children: [
                                                        //     Text(
                                                        //         "₹${item.wholePrice}",
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
                                                                "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                         
                                                                // "₹" +
                                                                //     item.wholePrice!,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: Get.width *
                                                                    0.054),
                                                            InkWell(
                                                              onTap: () {
                                                                //                  productdeatilscontroller.viewproductHome(
                                                                //                   item.id??0,item.name??'',"1kg",1 ,item.wholePrice??'',item.image!);
                                                                //                   await productdeatilscontroller
                                                                // .addProductHome();
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
                                ),
                              );
                            }),
                      ),
                filterController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.1), // Adjust the opacity as needed
                        ),
                      )
                    : SizedBox(),
                filterController.showLoading
                    ? Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : SizedBox(),
              ],
            );
          }),
    );
  }
}
