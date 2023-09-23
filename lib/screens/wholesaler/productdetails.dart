import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';
import 'package:pet/screens/wholesaler/notification.dart';

import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/payment.dart';
import 'package:pet/screens/wholesaler/wholesalerdrawer.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ordersummary.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/models/wholesalerModel/ProductDetailsWholeModel.dart'
    as variantFile;

class ProductDetailswhole extends StatefulWidget {
  const ProductDetailswhole({super.key});
//  dynamic itemdetails;
  @override
  State<ProductDetailswhole> createState() => _ProductDetailswholeState();
}

class _ProductDetailswholeState extends State<ProductDetailswhole> {
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
       final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
       WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  // WholeReviewController wholeReviewController =
  //     Get.put(WholeReviewController());
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
      WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
  List kg = [1, 2, 5];
  //  var imagePath =
  //       "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${widget.itemdetails.image ?? ""}";
  @override
  Widget build(BuildContext context) {
    // wholeproductdetailsController.isProductInCart();
    var imagePath =
        // "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
        "${Constants.BASE_URL}/storage/app/public/product/${wholeproductdetailsController!.productdetailwholemodel!.data!.image ?? ''}";
    return Stack(
      children: [
        Scaffold(
           appBar: CustomAppBarWholeback(
       
      ),body: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: MyColors.lightbg,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(500))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: CachedNetworkImage(
                          imageUrl: imagePath,
                          // width: 61,
                          // height: 75,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ), // Replace with your own placeholder widget
                          errorWidget: (context, url, error) => Icon(Icons
                              .error), // Replace with your own error widget
                        ),
                      )),
                   InkWell(
                                                  onTap: () {
                                                    wholehomecontroller
                                                        .addItemToWishList(
                                                             wholeproductdetailsController!.productdetailwholemodel!.data!.id!);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(wholehomecontroller
                                                                .wishListItemsId
                                                                .contains(
                                                                   wholeproductdetailsController!.productdetailwholemodel!.data!.id!)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,color:Colors.red)),
                                                  ),
                                                ),

                    
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: kg
                          .sublist(0, 3)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // var tab = e
                                  //
                                  //  e  *  ( widget.itemdetails.price) ;
                                  //  wholeproductdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: wholeproductdetailsController
                                                    .isAdding
                                                ? MyColors.pink
                                                : MyColors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath,
                                            width: 61,
                                            height: 75,
                                            placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons
                                                    .error), // Replace with your own error widget
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      // Text("$e Kg",
                                      //     style: CustomTextStyle.popinssmall0)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      // [
                      //   Container(
                      //     child: Column(
                      //       children: [
                      //         Container(
                      //           height: 60,
                      //           width: 60,
                      //           decoration: BoxDecoration(
                      //               color: MyColors.pink,
                      //               borderRadius: BorderRadius.circular(15)),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: CachedNetworkImage(
                      //               imageUrl: imagePath,
                      //               width: 61,
                      //               height: 75,
                      //               placeholder: (context, url) => Center(
                      //                 child: CircularProgressIndicator(),
                      //               ), // Replace with your own placeholder widget
                      //               errorWidget: (context, url, error) => Icon(Icons
                      //                   .error), // Replace with your own error widget
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         Text("2 Kg", style: CustomTextStyle.popinssmall0)
                      //       ],
                      //     ),
                      //   ),
                      //  ],
                    ),
                  
                   Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.crop_square_sharp, color:(wholeproductdetailsController
                                                  .productdetailwholemodel!
                                                  .data!
                                                  .veg ==
                                              1)
                                          ? Colors.red:Colors.green, size: 30,),
            Icon(Icons.circle, color:(wholeproductdetailsController
                                                  .productdetailwholemodel!
                                                  .data!
                                                  .veg ==
                                              1)
                                          ? Colors.red: Colors.green, size: 10),
          ],
        ),
             
                  ],
                ),
              ),

              GetBuilder<WholeProductDetailsController>(
                  init: wholeproductdetailsController,
                  builder: (_) {
                    final variations = wholeproductdetailsController
                        .productdetailwholemodel!.data!.variations!.length;
                    // var product = productdetailscontro
                    // printller.productList.length;
                    return (wholeproductdetailsController!
                                .productdetailwholemodel!.data ==
                            null)
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Size", style: CustomTextStyle.popinstext),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Row(
                                    //   children: kg
                                    //       .sublist(0, 3)
                                    //       .map(
                                    //         (e) => Padding(
                                    //           padding: const EdgeInsets.all(8.0),
                                    //           child: GestureDetector(
                                    //             onTap: () {
                                    //               // var tab = e
                                    //               //
                                    //               //  e  *  ( widget.itemdetails.price) ;
                                    //               //  wholeproductdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                                    //             },
                                    //             child: Container(
                                    //               child: Column(
                                    //                 children: [
                                    //                   Container(
                                    //                     height: 60,
                                    //                     width: 60,
                                    //                     decoration: BoxDecoration(
                                    //                         color: wholeproductdetailscontroller
                                    //                                 .isAdding
                                    //                             ? MyColors.pink
                                    //                             : MyColors.grey,
                                    //                         borderRadius:
                                    //                             BorderRadius.circular(15)),
                                    //                     child: Padding(
                                    //                       padding: const EdgeInsets.all(8.0),
                                    //                       child: CachedNetworkImage(
                                    //                         imageUrl: imagePath,
                                    //                         width: 61,
                                    //                         height: 75,
                                    //                         placeholder: (context, url) =>
                                    //                             Center(
                                    //                           child:
                                    //                               CircularProgressIndicator(),
                                    //                         ), // Replace with your own placeholder widget
                                    //                         errorWidget: (context, url,
                                    //                                 error) =>
                                    //                             Icon(Icons
                                    //                                 .error), // Replace with your own error widget
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: 5,
                                    //                   ),
                                    //                   Text("$e Kg",
                                    //                       style: CustomTextStyle.popinssmall0)
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       )
                                    //       .toList(),
                                    //   // [
                                    //   //   Container(
                                    //   //     child: Column(
                                    //   //       children: [
                                    //   //         Container(
                                    //   //           height: 60,
                                    //   //           width: 60,
                                    //   //           decoration: BoxDecoration(
                                    //   //               color: MyColors.pink,
                                    //   //               borderRadius: BorderRadius.circular(15)),
                                    //   //           child: Padding(
                                    //   //             padding: const EdgeInsets.all(8.0),
                                    //   //             child: CachedNetworkImage(
                                    //   //               imageUrl: imagePath,
                                    //   //               width: 61,
                                    //   //               height: 75,
                                    //   //               placeholder: (context, url) => Center(
                                    //   //                 child: CircularProgressIndicator(),
                                    //   //               ), // Replace with your own placeholder widget

                                    wholeproductdetailsController
                                                    .productdetailwholemodel!
                                                    .data!
                                                    .variations ==
                                                null &&
                                            wholeproductdetailsController
                                                    .productdetailwholemodel!
                                                    .data!
                                                    .variations ==
                                                ""
                                        // && wholeproductdetailscontroller.productdetailwholemodel!.data!.variations!.isEmpty
                                        // ? Center(
                                        //     child: SpinKitCircle(
                                        //       color:
                                        //           Colors.white, // Color of the progress bar
                                        //       size: 50.0, // Size of the progress bar
                                        //     ),
                                        //   )
                                        ? SizedBox()
                                        : Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: MyColors.grey),
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 0.10),
                                                    // boxShadow: [
                                                    //   BoxShadow(
                                                    //     offset: const Offset(0.0, 0.0),
                                                    //     color: Color.fromRGBO(255, 255, 255, 0.10),
                                                    //     blurRadius: 0.0,
                                                    //     spreadRadius: 0.0,
                                                    //   ),
                                                    // ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: DropdownButtonFormField<
                                                    variantFile.Variations>(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.type!.isEmpty) {
                                                      return 'Please select a tpye';
                                                    }
                                                    return null;
                                                  },
                                                  // value: wholeproductdetailscontroller.dropdownsize,
                                                  value:
                                                      wholeproductdetailsController
                                                          .selectedvariants,
                                                  decoration: InputDecoration(
                                                    hintText: "Kg",
                                                    hintStyle: TextStyle(
                                                      color: MyColors.black,
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 5),
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    // iconColor: MyColors.white,
                                                  ),
                                                  icon: Center(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: MyColors.black,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: MyColors.black),
                                                  items:
                                                      wholeproductdetailsController
                                                          .variantslist!
                                                          .map((variantFile
                                                                  .Variations
                                                              variants) {
                                                    return DropdownMenuItem<
                                                        variantFile.Variations>(
                                                      value: variants,
                                                      child: Text(
                                                          variants.type ?? ''),
                                                    );
                                                  }).toList(),
//                                    items:   wholeproductdetailscontroller.productdetailwholemodel!.data!.variations!.map<DropdownMenuItem<String>>(
//   (var variant) {
//     return DropdownMenuItem<String>(
//       value: variant.type,
//       child: Text(variant.type.toString() ),
//     );
//   },
// ).toList() ?? [],
                                                  // items: wholeproductdetailscontroller
                                                  //     .productdetailsmodel.data.variations
                                                  //     .map((String variant) {
                                                  //   return DropdownMenuItem<String>(
                                                  //     value: variant,
                                                  //     child: Text(variant),
                                                  //   );
                                                  // }).toList(),
                                                  onChanged:
                                                      (variantFile.Variations?
                                                          variants) async {
                                                    await wholeproductdetailsController
                                                        .updateVariants(
                                                            variants!);
                                                  },
                                                  // onChanged: (String? value)  {
                                                  //   wholeproductdetailscontroller.addVariant(value);
                                                  //   // wholeproductdetailscontroller
                                                  //   //     .updateSize(value ?? "");
                                                  //   // Perform actions when country is changed
                                                  // },
                                                ),
                                              ),
                                            ),
                                          ),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                wholeproductdetailsController
                                                            .selectedvariants
                                                            ?.price ==
                                                        null
                                                    ? Text(
                                                        "₹" +
                                                            ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .price!) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0))
                                                                .toString(),

                                                        //  (     (wholeproductdetailscontroller.productList.price)! * (wholeproductdetailscontroller.productList.discount!)/100).toString()

                                                        style: CustomTextStyle
                                                            .discounttext)
                                                    : Text(
                                                        "₹" +
                                                            ((wholeproductdetailsController
                                                                            .selectedvariants
                                                                            ?.price ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0))
                                                                .toString(),

                                                        //  (     (wholeproductdetailscontroller.productList.price)! * (wholeproductdetailscontroller.productList.discount!)/100).toString()

                                                        style: CustomTextStyle
                                                            .discounttext),
                                                SizedBox(width: 3),
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: MyColors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: MyColors.red)),
                                                  child: Center(
                                                    child: Text(
                                                        "Save${wholeproductdetailsController.productdetailwholemodel!.data!.discount!.toString()}%",
                                                        style: CustomTextStyle
                                                            .popinstextsmal2222),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            wholeproductdetailsController
                                                        .selectedvariants
                                                        ?.price ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .price!) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.productdetailwholemodel!.data!.price!) *
                                                                            wholeproductdetailsController
                                                                                .sizecount ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toString(),
                                                    //  "₹"+(  (     (wholeproductdetailscontroller.productdetailwholemodel!.data!.price)! * (wholeproductdetailscontroller.productdetailwholemodel!.data!.discount!)/100)* wholeproductdetailscontroller.sizecount).toString(),
                                                    //  "₹${wholeproductdetailscontroller.productdetailwholemodel!.data!.price.toString()}",
                                                    style: CustomTextStyle
                                                        .popinstext,
                                                  )
                                                : Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                            .selectedvariants
                                                                            ?.price ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.selectedvariants?.price ??
                                                                                0) *
                                                                            wholeproductdetailsController
                                                                                .sizecount ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toString(),
                                                    //  "₹"+(  (     (wholeproductdetailscontroller.productdetailwholemodel!.data!.price)! * (wholeproductdetailscontroller.productdetailwholemodel!.data!.discount!)/100)* wholeproductdetailscontroller.sizecount).toString(),
                                                    //  "₹${wholeproductdetailscontroller.productdetailwholemodel!.data!.price.toString()}",
                                                    style: CustomTextStyle
                                                        .popinstext,
                                                  ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    wholeproductdetailsController
                                                        .decrementSize();
                                                  },
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        color: MyColors.yellow,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Icon(Icons.remove,
                                                        size: 15,
                                                        color: Colors.black),
                                                    //  Icon(
                                                    //   Icons.minimize,
                                                    //   size: 8,
                                                    //   color: Colors.white,
                                                    // ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Container(
                                                    width: 30,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      wholeproductdetailsController
                                                          .sizecount
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ))),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    wholeproductdetailsController
                                                        .incrementSize();
                                                  },
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        //shape: BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: MyColors.yellow),
                                                    child: Icon(Icons.add,
                                                        size: 15,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Text(
                                  "Product details",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Text(
                                  wholeproductdetailsController
                                      .productdetailwholemodel!
                                      .data!
                                      .description
                                      .toString(),
                                  style: CustomTextStyle.popinssmall0,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),

                                Text(
                                  "About Us",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                    SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Brand",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Text(
                                      wholeproductdetailsController
                                      .productdetailwholemodel!.data!.name
                                          .toString(),
                                      style: CustomTextStyle.popinstext,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Divider(
                                  color: MyColors.lightdivider,
                                  thickness: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
 Row(
                                  children: [
                                    SizedBox(width: 100,
                                      child: Text(
                                        "Petsbreeds",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Text(
                                      wholeproductdetailsController
                                      .productdetailwholemodel!.data!.petsbreedsId
                                          .toString(),
                                      style: CustomTextStyle.popinstext,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Divider(
                                  color: MyColors.lightdivider,
                                  thickness: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),

                                Row(
                                  children: [
                                    Text(
                                      "lifeStage",
                                      style: CustomTextStyle.popinslight,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    Text(
                                     wholeproductdetailsController
                                      .productdetailwholemodel!.data!.lifeStageId
                                          .toString(),
                                      style: CustomTextStyle.popinstext,
                                    ),
                                  ],
                                ),
                                // Petsbreeds
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Divider(
                                  color: MyColors.lightdivider,
                                  thickness: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),

                                Row(
                                  children: [
                                    SizedBox(width: 100,
                                      child: Text(
                                        "Diet type",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.10,
                                    ),
                                    Text(
                                      ( wholeproductdetailsController
                                      .productdetailwholemodel!
                                                  .data!
                                                  .veg ==
                                              0)
                                          ? "Veg"
                                          : "Nonveg",
                                      style: CustomTextStyle.popinstext,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Divider(
                                  color: MyColors.lightdivider,
                                  thickness: 1,
                                  height: 1,
                                ),
                                // SizedBox(
                                //     height: MediaQuery.of(context).size.height *
                                //         0.02),

                                // Row(
                                //   children: [
                                //     Text(
                                //       "Age Range",
                                //       style: CustomTextStyle.popinslight,
                                //     ),
                                //     SizedBox(
                                //       width: MediaQuery.of(context).size.width *
                                //           0.18,
                                //     ),
                                //     Text(
                                //       "",
                                //       // productdetailscontroller.productList.agerange
                                //       //     .toString(),
                                //       style: CustomTextStyle.popinstext,
                                //     ),
                                //   ],
                                // ),
                            
                                // SizedBox(
                                //     height: MediaQuery.of(context).size.height *
                                //         0.02),
                                // Divider(
                                //   color: MyColors.lightdivider,
                                //   thickness: 1,
                                //   height: 1,
                                // ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),

                                Row(
                                  children: [
                                    SizedBox(width: 100,
                                      child: Text(
                                        "Traget Species",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Text(
                                       wholeproductdetailsController
                                      .productdetailwholemodel!
                                          .data!
                                          .module!
                                          .moduleName
                                          .toString(),
                                      style: CustomTextStyle.popinstext,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Divider(
                                  color: MyColors.lightdivider,
                                  thickness: 1,
                                  height: 1,
                                ),
                                 SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product Review",
                                      style: CustomTextStyle.popinstext,
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Get.to(UserAllReview());
                                    //   },
                                    //   child: Text(
                                    //     "See All",
                                    //     style: CustomTextStyle.popinstext,
                                    //   ),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
// wholemyordercontroller.wholemyorderModel ==  null? SizedBox():
                          
    GetBuilder<WholeReviewController>(
                                    init: wholereviewcontroller,
                                    builder: (_) {
                                      return  wholereviewcontroller
                                                    .wholeReviewModel ==
                                                null &&
                                           wholereviewcontroller
                                                    .wholeReviewModel!.data ==
                                                null
                                        // userreviewcontroller.userReviewModel!.data!.isEmpty
                                        ? SizedBox(): ListView.builder(
                                           primary: false,
                                            shrinkWrap: true,
                                       itemCount: wholereviewcontroller
                                                    .wholeReviewModel!
                                                    .data!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              var item = wholereviewcontroller
                                                    .wholeReviewModel!
                                                  .data![index];
//                                             print("UserName");
// print((item.callback![0].userProfile![0].fName??''));
                                          return

                                          //  (wholemyordercontroller.wholemyorderModel!.data == null)?SizedBox():
                                    //  (item.callback![0].userDetails!.comment == null)?SizedBox():
                                        ListView(
                                            primary: false,
                                            shrinkWrap: true,
                                            children: [
                                              // Text(
                                              //   "bbbb",
                                              //   style: CustomTextStyle
                                              //       .popinssmall0,
                                              // ),
// (e.userDetails!.comment == null) ? Text("No Comment"):
                                              Text(
                                                (item.comment??'').toString(),
                                                style: CustomTextStyle
                                                    .popinssmall0,
                                              ),
                                              SizedBox(
                                           height: MediaQuery.of(context)
                                                   .size
                                                   .height *
                                               0.01),
                                              Row(
                                         children: [
                                           RatingStars(
                                             value: (item.rating??0).toDouble(),
                                             // onValueChanged: (v) {
                                             //   //
                                             //   setState(() {
                                             //     value = v;
                                             //   });
                                             // },
                                             starBuilder:
                                                 (index, color) => Icon(
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
                                             maxValue: 5,
                                             starSpacing: 0.5,
                                             maxValueVisibility: true,
                                             valueLabelVisibility: false,
                                             animationDuration: Duration(
                                                 milliseconds: 5000),
                                             // valueLabelPadding:
                                             //     const EdgeInsets.symmetric(
                                             //         vertical: 1, horizontal: 8),
                                             // valueLabelMargin:
                                             //     const EdgeInsets.only(right: 8),
                                             starOffColor:
                                                 const Color(0xffe7e8ea),
                                             starColor: MyColors.yellow,
                                           ),
                                           SizedBox(width: 10),
                                           // Image.asset(item["image"],
                                           //     height: 30),
                                           Column(
                                             crossAxisAlignment:
                                                 CrossAxisAlignment
                                                     .start,
                                             children: [
                                               Text(
                                                 item.userId![0].fName.toString()+" "+  item.userId![0].lName.toString(),
                                                 style: CustomTextStyle
                                                     .popinstext,
                                               ),
                                               // Row(
                                               //   children: [
                                               //     Icon(
                                               //       Icons
                                               //           .person_2_outlined,
                                               //       size: 13,
                                               //     ),
                                               //     Text(
                                               //      ( item.callback![0].itemDetails![0].ratingCount??0).toString(),
                                               //       style: CustomTextStyle
                                               //           .popinssmall0,
                                               //     ),
                                               //   ],
                                               // )
                                             ],
                                           )
                                         ],
                                              ),
                                             
                                              SizedBox(
                                           height: MediaQuery.of(context)
                                                   .size
                                                   .height *
                                               0.02),
                                              Divider(
                                         color: MyColors.lightdivider,
                                         thickness: 1,
                                         height: 1,
                                              ),
                                              SizedBox(
                                           height: MediaQuery.of(context)
                                                   .size
                                                   .height *
                                               0.02),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                    ),
        // // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),

                                Container(
                                  // height: MediaQuery.of(context).size.height * 0.09,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: MyColors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            wholeproductdetailsController
                                                        .selectedvariants
                                                        ?.price ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                    .productdetailwholemodel!
                                                                    .data!
                                                                    .price!) *
                                                                (wholeproductdetailsController
                                                                        .sizecount ??
                                                                    0))
                                                            .toString(),
                                                    // "₹" + widget.itemdetails.price.toString(),
                                                    style: CustomTextStyle
                                                        .discounttext)
                                                : Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                        .selectedvariants
                                                                        ?.price ??
                                                                    0) *
                                                                (wholeproductdetailsController
                                                                        .sizecount ??
                                                                    0))
                                                            .toString(),
                                                    // "₹" + widget.itemdetails.price.toString(),
                                                    style: CustomTextStyle
                                                        .discounttext),
                                            SizedBox(width: 3),
                                            // Container(
                                            //   height: 20,
                                            //   width: 40,
                                            //   // decoration: BoxDecoration(
                                            //   //     color: MyColors.red,
                                            //   //     borderRadius:
                                            //   //         BorderRadius.circular(10),
                                            //   //     border: Border.all(
                                            //   //         color: MyColors.red)),
                                            //   child: Center(
                                                // child:
                                                 Text(
                                                    // item.discount.toString(),
                                                    "Save${wholeproductdetailsController.productdetailwholemodel!.data!.discount.toString()}%",
                                                    style: CustomTextStyle
                                                        .popinstextsmal2222red),
                                            //   ),
                                            // ),
                                            SizedBox(width: 10),
                                            wholeproductdetailsController
                                                        .selectedvariants
                                                        ?.price ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .price!) *
                                                                    (wholeproductdetailsController.sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.productdetailwholemodel!.data!.price!) * wholeproductdetailsController.sizecount ?? 0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toString(),
                                                    // (widget.itemdetails.price),
                                                    style: CustomTextStyle
                                                        .appbartext)
                                                : Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController.selectedvariants?.price ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
                                                                (((wholeproductdetailsController.selectedvariants?.price ?? 0) * wholeproductdetailsController.sizecount ?? 0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toString(),
                                                    // (widget.itemdetails.price),
                                                    style: CustomTextStyle
                                                        .appbartext),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder:
                                                //             (context) =>
                                                //                 Paymentwhole(
                                                //                   price: wholeproductdetailsController
                                                //                               .selectedvariants
                                                //                               ?.price ==
                                                //                           null
                                                //                       ? ((wholeproductdetailsController.productdetailwholemodel!.data!.price!) * (wholeproductdetailsController.sizecount ?? 0) - (((wholeproductdetailsController.productdetailwholemodel!.data!.price!) * wholeproductdetailsController.sizecount ?? 0) * (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) / 100))
                                                //                           .toString()
                                                //                       : ((wholeproductdetailsController.selectedvariants?.price ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
                                                //                               (((wholeproductdetailsController.selectedvariants?.price ?? 0) * wholeproductdetailsController.sizecount ?? 0) * (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) / 100))
                                                //                           .toString(),
                                                //                 )));
                                                await wholeproductdetailsController
                                                    .addProduct();
                                               mycartwholeController.init();
                                                        Get.to(const AddToCardwhole());
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    color: MyColors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/image/bagadd.png",
                                                      height: 25,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Buy Now",
                                                      style: CustomTextStyle
                                                          .mediumtextreem,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            GetBuilder<
                                                    WholeProductDetailsController>(
                                                init:
                                                    wholeproductdetailsController,
                                                builder: (_) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      // await wholeproductdetailsController
                                                      //     .addProduct();
                                                      // mycartwholeController
                                                      //     .init();
                                                      // Get.to(AddToCardwhole());
                                                     
                                                      await wholeproductdetailsController
                                                    .addProduct();
                                                        mycartwholeController.init();
                                                        Get.to(const AddToCardwhole());
                                             
                                                      
                                                    //   if (wholeproductdetailsController
                                                    //       .isProductInCartBool) {
                                                    //       mycartwholeController.init();
                                                    //    Get.to( AddToCardwhole());
                                                    //   } else {
                                                    //       await wholeproductdetailsController
                                                    // .addProduct();
                                                    //     await wholeproductdetailsController
                                                    //         .isProductInCart();
                                                    //   }

                                                      //     wholeproductdetailscontroller.addToCart(

                                                      // wholeproductdetailscontroller.productdetailwholemodel!.data!.name.toString(),
                                                      //              wholeproductdetailscontroller.sizecount.toString(),
                                                      //              wholeproductdetailscontroller.selectedVariants.toString()
                                                      //               );
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             AddToCardUser()));
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              MyColors.yellow,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/image/bagadd.png",
                                                            height: 25,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            // wholeproductdetailsController
                                                            //         .isProductInCartBool
                                                            //     ? "Go To Cart"
                                                                // : 
                                                                "Add To Cart",
                                                            style: CustomTextStyle
                                                                .mediumtextreem,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                  })
            ],
          ),
        ),
        GetBuilder<WholeProductDetailsController>(
            init: wholeproductdetailsController,
            builder: (_) {
              return wholeproductdetailsController.showLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.1), // Adjust the opacity as needed
                      ),
                    )
                  : SizedBox();
            }),
        // Progress bar
        GetBuilder<WholeProductDetailsController>(
            init: wholeproductdetailsController,
            builder: (_) {
              return wholeproductdetailsController.showLoading
                  ? Center(
                      child: SpinKitCircle(
                        color: Colors.white, // Color of the progress bar
                        size: 50.0, // Size of the progress bar
                      ),
                    )
                  : SizedBox();
            }),
      ],
    );
  }
}
