import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/user/buynowaddcard.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/models/usersModel/mycartListModel.dart' as MyOrder;
import 'package:pet/models/usersModel/ProductDetailsModel.dart' as variantFile;
import 'package:pet/screens/user/userAllReview.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ordersummary.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:pet/screens/user/notification.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, this.id});
  // dynamic itemdetails;
  final int? id;

  final ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());
  final MyOrderController myordercontroller = Get.put(MyOrderController());
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  final MyCartController mycartController = Get.put(MyCartController());
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void onClose() {
    productdetailscontroller.dispose();
  }

  final List kg = [1, 2, 5];

  @override
  Widget build(BuildContext context) {
    productdetailscontroller.isProductInCart();

    // "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
    return Stack(
      children: [
        Scaffold(
           appBar:CustomAppBarback(),
            body: 
          
           RefreshIndicator(
            
            onRefresh: () async {
                // _refreshIndicatorKey.currentState?.show(atTop: false);
                // await homeusercontroller.init();
                 UserReviewController userreviewController = Get.put(UserReviewController());
 
                await userreviewController
                                                    .init();
                // await Future.delayed(Duration(seconds: 2));
              },
             child: ListView( physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
               
              shrinkWrap: true,
              primary: true,
              children: [
                 productdetailscontroller.productdetailmodel == null ||  productdetailscontroller.productdetailmodel!.data == null
              
                ? Center(
                  child: SizedBox(
                                          child:Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)),
                )
                                    :
                Stack(
                  children: [
           
                  GetBuilder<ProductDetailsController>(
                    init: productdetailscontroller,
                    builder: (_) {
                        return   productdetailscontroller.productdetailmodel == null || productdetailscontroller.productdetailmodel!.data == null ?const SizedBox():
                         Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: MyColors.lightbg,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(500))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: productdetailscontroller.productdetailmodel!.data!.images == ''||productdetailscontroller.productdetailmodel!.data!.images == null||productdetailscontroller.productdetailmodel!.data!.images!.isEmpty?
                                  CachedNetworkImage(
                                imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.image.toString()}",
                                // width: 61,
                                // height: 75,
                              
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ), // Replace with your own placeholder widget
                                errorWidget: (context, url, error) => const Icon(Icons
                                    .error), // Replace with your own error widget
                              )
                            :
                               CachedNetworkImage(
                                imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.images![productdetailscontroller.selectImages??0].toString()}",
                                // width: 61,
                                // height: 75,
                              
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ), // Replace with your own placeholder widget
                                errorWidget: (context, url, error) => const Icon(Icons
                                    .error), // Replace with your own error widget
                              ),
                            ));
                      }
                    ),
                         GetBuilder<HomeuserController>(
                    init: homeusercontroller,
                    builder: (_) {
                          return InkWell(
                                                        onTap: () {
                                                          homeusercontroller
                                                              .addItemToWishList(
                                                                    productdetailscontroller.productdetailmodel!.data!.id!);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Icon(homeusercontroller
                                                                      .wishListItemsId
                                                                      .contains(
                                                                          productdetailscontroller.productdetailmodel!.data!.id!)
                                                                  ? Icons.favorite
                                                                  : Icons
                                                                      .favorite_border,color:Colors.red)),
                                                        ),
                                                      );
                        }
                      ),
                    GetBuilder<ProductDetailsController>(
                        init: productdetailscontroller,
                        builder: (_) {
                          return productdetailscontroller.productdetailmodel ==
                                      null ||
                                  productdetailscontroller
                                          .productdetailmodel!.data ==
                                      null
                              ? const SizedBox()
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: MyColors.lightbg,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(500))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: productdetailscontroller
                                                    .productdetailmodel!
                                                    .data!
                                                    .images ==
                                                '' ||
                                            productdetailscontroller
                                                    .productdetailmodel!
                                                    .data!
                                                    .images ==
                                                null ||
                                            productdetailscontroller
                                                .productdetailmodel!
                                                .data!
                                                .images!
                                                .isEmpty
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.image.toString()}",
                                            // width: 61,
                                            // height: 75,
           
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons
                                                    .error), // Replace with your own error widget
                                          )
                                        : CachedNetworkImage(
                                            imageUrl:
                                                "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.images![productdetailscontroller.selectImages ?? 0].toString()}",
                                            // width: 61,
                                            // height: 75,
           
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons
                                                    .error), // Replace with your own error widget
                                          ),
                                  ));
                        }),
                    GetBuilder<HomeuserController>(
                        init: homeusercontroller,
                        builder: (_) {
                          return InkWell(
                            onTap: () {
                              homeusercontroller.addItemToWishList(
                                  productdetailscontroller
                                      .productdetailmodel!.data!.id!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                      homeusercontroller.wishListItemsId.contains(
                                              productdetailscontroller
                                                  .productdetailmodel!.data!.id!)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red)),
                            ),
                          );
                        }),
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                productdetailscontroller.productdetailmodel == null
                    ? const SizedBox()
                    : GetBuilder<ProductDetailsController>(
                        init: productdetailscontroller,
                        builder: (_) {
                          final images = productdetailscontroller
                              .productdetailmodel!.data!.images;
           
                          if (images == null || images.isEmpty) {
                            print("No images available");
                            return const Text("No Images");
                          }
           
                          final imageCount = images.length;
           
                          if (imageCount < 3) {
                            print(
                                "Not enough images available (found $imageCount)");
                          }
           
                          final sublistStart = 0;
                          final sublistEnd = imageCount >= 3 ? 3 : imageCount;
           
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                productdetailscontroller.productdetailmodel!.data!
                                                .images ==
                                            '' ||
                                        productdetailscontroller
                                                .productdetailmodel!
                                                .data!
                                                .images ==
                                            null ||
                                        productdetailscontroller
                                            .productdetailmodel!
                                            .data!
                                            .images!
                                            .isEmpty
                                    ? const Text("No Related Image")
                                    : Row(
                                        children:
                                            // productdetailscontroller.productdetailmodel!.data!.images!
                                            //     .sublist(0, 3)
                                            //     .map(
                                            //       (e) =>
                                            images
                                                .sublist(sublistStart, sublistEnd)
                                                .map(
                                                  (e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // print(productdetailscontroller.productdetailmodel!.data!.images!.indexOf(e));
                                                        productdetailscontroller
                                                            .selectImagesProduct(
                                                                productdetailscontroller
                                                                    .productdetailmodel!
                                                                    .data!
                                                                    .images!
                                                                    .indexOf(e));
                                                        // var tab = e
                                                        print("IamgeSelect");
                                                        print(productdetailscontroller
                                                            .productdetailmodel!
                                                            .data!
                                                            .images!
                                                            .indexOf(e));
                                                        //  e  *  ( widget.itemdetails.price) ;
                                                        //  productdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                                                      },
                                                      child: Container(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 60,
                                                              width: 60,
                                                              decoration: BoxDecoration(
                                                                  color: productdetailscontroller
                                                                              .selectImages ==
                                                                          productdetailscontroller
                                                                              .productdetailmodel!
                                                                              .data!
                                                                              .images!
                                                                              .indexOf(
                                                                                  e)
                                                                      ? MyColors
                                                                          .pink
                                                                      : MyColors
                                                                          .grey,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      image: DecorationImage(
                                                                          image:
                                                                              imageProvider,
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  imageUrl:
                                                                      "${Constants.BASE_URL}/storage/app/public/product/${e.replaceAll("\\", "")}",
                                                                  //  imagesPath.replaceAll("\\", ""),
                                                                  fit:
                                                                      BoxFit.fill,
                                                                  // width: 61,
                                                                  // height: 75,
                                                                  placeholder:
                                                                      (context,
                                                                              url) =>
                                                                          const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ), // Replace with your own placeholder widget
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(Icons
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
                                    Icon(
                                      Icons.crop_square_sharp,
                                      color: (productdetailscontroller
                                                  .productdetailmodel!
                                                  .data!
                                                  .veg ==
                                              1)
                                          ? Colors.red
                                          : Colors.green,
                                      size: 30,
                                    ),
                                    Icon(Icons.circle,
                                        color: (productdetailscontroller
                                                    .productdetailmodel!
                                                    .data!
                                                    .veg ==
                                                1)
                                            ? Colors.red
                                            : Colors.green,
                                        size: 10),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
               
                productdetailscontroller.productdetailmodel == null
                    ? const SizedBox()
                    : GetBuilder<ProductDetailsController>(
                        init: productdetailscontroller,
                        builder: (_) {
                          final variations = productdetailscontroller
                              .productdetailmodel!.data!.variations!.length;
                          // var product = productdetailscontro
                          // printller.productList.length;
                          return (productdetailscontroller!
                                      .productdetailmodel!.data ==
                                  null)
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Size",
                                          style: CustomTextStyle.popinstext),
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
                                          //               //  productdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                                          //             },
                                          //             child: Container(
                                          //               child: Column(
                                          //                 children: [
                                          //                   Container(
                                          //                     height: 60,
                                          //                     width: 60,
                                          //                     decoration: BoxDecoration(
                                          //                         color: productdetailscontroller
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
                                          //   //               errorWidget: (context, url, error) => Icon(Icons
                                          //   //                   .error), // Replace with your own error widget
                                          //   //             ),
                                          //   //           ),
                                          //   //         ),
                                          //   //         SizedBox(
                                          //   //           height: 5,
                                          //   //         ),
                                          //   //         Text("2 Kg", style: CustomTextStyle.popinssmall0)
                                          //   //       ],
                                          //   //     ),
                                          //   //   ),
                                          //   //  ],
                                          // ),
                                          productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .variations ==
                                                      null &&
                                                  productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .variations ==
                                                      ""
                                              // && productdetailscontroller.productdetailmodel!.data!.variations!.isEmpty
                                              // ? Center(
                                              //     child: SpinKitCircle(
                                              //       color:
                                              //           Colors.white, // Color of the progress bar
                                              //       size: 50.0, // Size of the progress bar
                                              //     ),
                                              //   )
                                              ? const SizedBox()
                                              : Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  MyColors.grey),
                                                          color: const Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              0.10),
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     offset: const Offset(0.0, 0.0),
                                                          //     color: Color.fromRGBO(255, 255, 255, 0.10),
                                                          //     blurRadius: 0.0,
                                                          //     spreadRadius: 0.0,
                                                          //   ),
                                                          // ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40)),
                                                      child:
                                                          DropdownButtonFormField<
                                                              variantFile
                                                                  .Variations>(
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.type!
                                                                  .isEmpty) {
                                                            return 'Please select a tpye';
                                                          }
                                                          return null;
                                                        },
                                                        // value: productdetailscontroller.dropdownsize,
                                                        value:
                                                            productdetailscontroller
                                                                .selectedvariants,
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText: "Kg",
                                                          hintStyle: TextStyle(
                                                            color: MyColors.black,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          5),
                                                          border:
                                                              InputBorder.none,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          // iconColor: MyColors.white,
                                                        ),
                                                        icon: const Center(
                                                          child: Icon(
                                                            Icons.arrow_drop_down,
                                                            color: MyColors.black,
                                                          ),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                MyColors.black),
                                                        items:
                                                            productdetailscontroller
                                                                .variantslist!
                                                                .map((variantFile
                                                                        .Variations
                                                                    variants) {
                                                          return DropdownMenuItem<
                                                              variantFile
                                                                  .Variations>(
                                                            value: variants,
                                                            child: Text(
                                                                variants.type ??
                                                                    ''),
                                                          );
                                                        }).toList(),
           //                                    items:   productdetailscontroller.productdetailmodel!.data!.variations!.map<DropdownMenuItem<String>>(
           //   (var variant) {
           //     return DropdownMenuItem<String>(
           //       value: variant.type,
           //       child: Text(variant.type.toString() ),
           //     );
           //   },
           // ).toList() ?? [],
                                                        // items: productdetailscontroller
                                                        //     .productdetailsmodel.data.variations
                                                        //     .map((String variant) {
                                                        //   return DropdownMenuItem<String>(
                                                        //     value: variant,
                                                        //     child: Text(variant),
                                                        //   );
                                                        // }).toList(),
                                                        onChanged: (variantFile
                                                                .Variations?
                                                            variants) async {
                                                          await productdetailscontroller
                                                              .updateVariants(
                                                                  variants!);
                                                        },
                                                        // onChanged: (String? value)  {
                                                        //   productdetailscontroller.addVariant(value);
                                                        //   // productdetailscontroller
                                                        //   //     .updateSize(value ?? "");
                                                        //   // Perform actions when country is changed
                                                        // },
                                                      ),
                                                    ),
                                                  ),
                                                ),
           
                                          const SizedBox(
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
                                                      productdetailscontroller
                                                                  .selectedvariants
                                                                  ?.price ==
                                                              null
                                                          ? Text(
                                                              "₹${(productdetailscontroller
                                                                              .productdetailmodel!
                                                                              .data!
                                                                              .price!) *
                                                                          (productdetailscontroller.sizecount ??
                                                                              0)}",
           
                                                              //  (     (productdetailscontroller.productList.price)! * (productdetailscontroller.productList.discount!)/100).toString()
           
                                                              style: CustomTextStyle
                                                                  .discounttext)
                                                          : Text(
                                                              "₹${(productdetailscontroller.selectedvariants?.price ??
                                                                              0) *
                                                                          (productdetailscontroller.sizecount ??
                                                                              0)}",
           
                                                              //  (     (productdetailscontroller.productList.price)! * (productdetailscontroller.productList.discount!)/100).toString()
           
                                                              style: CustomTextStyle
                                                                  .discounttext),
                                                      const SizedBox(width: 3),
                                                      // Container(
                                                      //   height: 20,
                                                      //   width: 40,
                                                      //   decoration: BoxDecoration(
                                                      //       color: MyColors.red,
                                                      //       borderRadius:
                                                      //           BorderRadius.circular(
                                                      //               10),
                                                      //       border: Border.all(
                                                      //           color: MyColors.red)),
                                                      //   child: Center(
                                                      //     child:
                                                      Text(
                                                          "Save${productdetailscontroller.productdetailmodel!.data!.discount!.toString()}%",
                                                          style: CustomTextStyle
                                                              .popinstextsmal2222red),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  productdetailscontroller
                                                              .selectedvariants
                                                              ?.price ==
                                                          null
                                                      ? Text(
                                                          "₹" +
                                                              ((productdetailscontroller
                                                                              .productdetailmodel!
                                                                              .data!
                                                                              .price!) *
                                                                          (productdetailscontroller.sizecount ??
                                                                              0) -
                                                                      (((productdetailscontroller.productdetailmodel!.data!.price!) * productdetailscontroller.sizecount! ??
                                                                              0) *
                                                                          (productdetailscontroller
                                                                              .productdetailmodel!
                                                                              .data!
                                                                              .discount!) /
                                                                          100))
                                                                  .toString(),
                                                          //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
                                                          //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
                                                          style: CustomTextStyle
                                                              .popinstext,
                                                        )
                                                      : Text(
                                                          "₹" +
                                                              ((productdetailscontroller.selectedvariants?.price ??
                                                                              0) *
                                                                          (productdetailscontroller.sizecount ??
                                                                              0) -
                                                                      (((productdetailscontroller.selectedvariants?.price ?? 0) * productdetailscontroller.sizecount! ??
                                                                              0) *
                                                                          (productdetailscontroller
                                                                              .productdetailmodel!
                                                                              .data!
                                                                              .discount!) /
                                                                          100))
                                                                  .toString(),
                                                          //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
                                                          //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
                                                          style: CustomTextStyle
                                                              .popinstext,
                                                        ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          productdetailscontroller
                                                              .decrementSize();
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              color:
                                                                  MyColors.yellow,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: const Icon(
                                                              Icons.remove,
                                                              size: 15,
                                                              color:
                                                                  Colors.black),
                                                          //  Icon(
                                                          //   Icons.minimize,
                                                          //   size: 8,
                                                          //   color: Colors.white,
                                                          // ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      Container(
                                                          width: 30,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(50),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            productdetailscontroller
                                                                .sizecount
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          productdetailscontroller
                                                              .incrementSize();
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  //shape: BoxShape.rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: MyColors
                                                                      .yellow),
                                                          child: const Icon(Icons.add,
                                                              size: 15,
                                                              color:
                                                                  Colors.black),
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
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.04),
           //                                     Text(
           //                                       "Product details",
           //                                       style: CustomTextStyle.popinstext,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.01),
           //                                     Text(
           //                                       productdetailscontroller
           //                                           .productdetailmodel!.data!.description
           //                                           .toString(),
           //                                       style: CustomTextStyle.popinssmall0,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           
           //                                     Text(
           //                                       "About Us",
           //                                       style: CustomTextStyle.popinstext,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.01),
           //                                     Row(
           //                                       children: [
           //                                         SizedBox(
           //                                           width: 100,
           //                                           child: Text(
           //                                             "Brand",
           //                                             style: CustomTextStyle.popinslight,
           //                                           ),
           //                                         ),
           //                                         SizedBox(
           //                                           width: MediaQuery.of(context)
           //                                                   .size
           //                                                   .width *
           //                                               0.1,
           //                                         ),
           //                                         Text(
           //                                           productdetailscontroller
           //                                               .productdetailmodel!.data!.name
           //                                               .toString(),
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                       ],
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Divider(
           //                                       color: MyColors.lightdivider,
           //                                       thickness: 1,
           //                                       height: 1,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Row(
           //                                       children: [
           //                                         SizedBox(
           //                                           width: 100,
           //                                           child: Text(
           //                                             "Petsbreeds",
           //                                             style: CustomTextStyle.popinslight,
           //                                           ),
           //                                         ),
           //                                         SizedBox(
           //                                           width: MediaQuery.of(context)
           //                                                   .size
           //                                                   .width *
           //                                               0.1,
           //                                         ),
           //                                         Text(
           //                                           productdetailscontroller
           //                                               .productdetailmodel!
           //                                               .data!
           //                                               .petsbreedsId
           //                                               .toString(),
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                       ],
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Divider(
           //                                       color: MyColors.lightdivider,
           //                                       thickness: 1,
           //                                       height: 1,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           
           //                                     Row(
           //                                       children: [
           //                                         Text(
           //                                           "lifeStage",
           //                                           style: CustomTextStyle.popinslight,
           //                                         ),
           //                                         SizedBox(
           //                                           width: MediaQuery.of(context)
           //                                                   .size
           //                                                   .width *
           //                                               0.2,
           //                                         ),
           //                                         Text(
           //                                           productdetailscontroller
           //                                               .productdetailmodel!
           //                                               .data!
           //                                               .lifeStageId
           //                                               .toString(),
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                       ],
           //                                     ),
           //                                     // Petsbreeds
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Divider(
           //                                       color: MyColors.lightdivider,
           //                                       thickness: 1,
           //                                       height: 1,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           
           //                                     Row(
           //                                       children: [
           //                                         SizedBox(
           //                                           width: 100,
           //                                           child: Text(
           //                                             "Diet type",
           //                                             style: CustomTextStyle.popinslight,
           //                                           ),
           //                                         ),
           //                                         SizedBox(
           //                                           width: MediaQuery.of(context)
           //                                                   .size
           //                                                   .width *
           //                                               0.10,
           //                                         ),
           //                                         Text(
           //                                           (productdetailscontroller
           //                                                       .productdetailmodel!
           //                                                       .data!
           //                                                       .veg ==
           //                                                   0)
           //                                               ? "Veg"
           //                                               : "Nonveg",
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                       ],
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Divider(
           //                                       color: MyColors.lightdivider,
           //                                       thickness: 1,
           //                                       height: 1,
           //                                     ),
           //                                     // SizedBox(
           //                                     //     height: MediaQuery.of(context).size.height *
           //                                     //         0.02),
           
           //                                     // Row(
           //                                     //   children: [
           //                                     //     Text(
           //                                     //       "Age Range",
           //                                     //       style: CustomTextStyle.popinslight,
           //                                     //     ),
           //                                     //     SizedBox(
           //                                     //       width: MediaQuery.of(context).size.width *
           //                                     //           0.18,
           //                                     //     ),
           //                                     //     Text(
           //                                     //       "",
           //                                     //       // productdetailscontroller.productList.agerange
           //                                     //       //     .toString(),
           //                                     //       style: CustomTextStyle.popinstext,
           //                                     //     ),
           //                                     //   ],
           //                                     // ),
           
           //                                     // SizedBox(
           //                                     //     height: MediaQuery.of(context).size.height *
           //                                     //         0.02),
           //                                     // Divider(
           //                                     //   color: MyColors.lightdivider,
           //                                     //   thickness: 1,
           //                                     //   height: 1,
           //                                     // ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           
           //                                     Row(
           //                                       children: [
           //                                         SizedBox(
           //                                           width: 100,
           //                                           child: Text(
           //                                             "Traget Species",
           //                                             style: CustomTextStyle.popinslight,
           //                                           ),
           //                                         ),
           //                                         SizedBox(
           //                                           width: MediaQuery.of(context)
           //                                                   .size
           //                                                   .width *
           //                                               0.1,
           //                                         ),
           //                                         Text(
           //                                           productdetailscontroller
           //                                               .productdetailmodel!
           //                                               .data!
           //                                               .module!
           //                                               .moduleName
           //                                               .toString(),
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                       ],
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           //                                     Divider(
           //                                       color: MyColors.lightdivider,
           //                                       thickness: 1,
           //                                       height: 1,
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.02),
           
           //                                     // Row(
           //                                     //   children: [
           //                                     //     Text(
           //                                     //       "Item From ",
           //                                     //       style: CustomTextStyle.popinslight,
           //                                     //     ),
           //                                     //     SizedBox(
           //                                     //       width: MediaQuery.of(context).size.width *
           //                                     //           0.2,
           //                                     //     ),
           //                                     //     Text(
           //                                     //       "",
           //                                     //       style: CustomTextStyle.popinstext,
           //                                     //     ),
           //                                     //   ],
           //                                     // ),
           //                                     //           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           //                                     //  Divider(color: lightdivider,thickness: 1,height: 1,),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.05),
           //                                     Row(
           //                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //                                       children: [
           //                                         Text(
           //                                           "Product Review",
           //                                           style: CustomTextStyle.popinstext,
           //                                         ),
           //                                         // InkWell(
           //                                         //   onTap: () {
           //                                         //     Get.to(UserAllReview());
           //                                         //   },
           //                                         //   child: Text(
           //                                         //     "See All",
           //                                         //     style: CustomTextStyle.popinstext,
           //                                         //   ),
           //                                         // )
           //                                       ],
           //                                     ),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.01),
           
           //                                     GetBuilder<UserReviewController>(
           //                                         init: userreviewcontroller,
           //                                         builder: (_) {
           //                                           return userreviewcontroller
           //                                                           .userReviewModel ==
           //                                                       null &&
           //                                                   userreviewcontroller
           //                                                           .userReviewModel!
           //                                                           .data ==
           //                                                       null
           //                                               // userreviewcontroller.userReviewModel!.data!.isEmpty
           //                                               ? SizedBox()
           //                                               : ListView.builder(
           //                                                   primary: false,
           //                                                   shrinkWrap: true,
           //                                                   itemCount:
           //                                                       userreviewcontroller
           //                                                               .userReviewModel!
           //                                                               .data!
           //                                                               .length ??
           //                                                           0,
           //                                                   itemBuilder:
           //                                                       (context, index) {
           //                                                     var item =
           //                                                         userreviewcontroller
           //                                                             .userReviewModel!
           //                                                             .data![index];
           // //                                             print("UserName");
           // // print((item.callback![0].userProfile![0].fName??''));
           //                                                     return
           
           //                                                         //  (wholemyordercontroller.wholemyorderModel!.data == null)?SizedBox():
           //                                                         //  (item.callback![0].userDetails!.comment == null)?SizedBox():
           //                                                         ListView(
           //                                                       primary: false,
           //                                                       shrinkWrap: true,
           //                                                       children: [
           //                                                         // Text(
           //                                                         //   "bbbb",
           //                                                         //   style: CustomTextStyle
           //                                                         //       .popinssmall0,
           //                                                         // ),
           // // (e.userDetails!.comment == null) ? Text("No Comment"):
           //                                                         Text(
           //                                                           (item.comment ?? '')
           //                                                               .toString(),
           //                                                           style: CustomTextStyle
           //                                                               .popinssmall0,
           //                                                         ),
           //                                                         SizedBox(
           //                                                             height: MediaQuery.of(
           //                                                                         context)
           //                                                                     .size
           //                                                                     .height *
           //                                                                 0.01),
           //                                                         Row(
           //                                                           children: [
           //                                                             RatingStars(
           //                                                               value:
           //                                                                   (item.rating ??
           //                                                                           0)
           //                                                                       .toDouble(),
           //                                                               // onValueChanged: (v) {
           //                                                               //   //
           //                                                               //   setState(() {
           //                                                               //     value = v;
           //                                                               //   });
           //                                                               // },
           //                                                               starBuilder: (index,
           //                                                                       color) =>
           //                                                                   Icon(
           //                                                                 Icons.star,
           //                                                                 color: color,
           //                                                                 size: 15,
           //                                                               ),
           //                                                               starCount: 5,
           //                                                               starSize: 20,
           //                                                               // valueLabelColor: const Color(0xff9b9b9b),
           //                                                               // valueLabelTextStyle: const TextStyle(
           //                                                               //     color: Colors.white,
           //                                                               //     fontWeight: FontWeight.w400,
           //                                                               //     fontStyle: FontStyle.normal,
           //                                                               //     fontSize: 12.0),
           //                                                               // valueLabelRadius: 10,
           //                                                               maxValue: 5,
           //                                                               starSpacing: 0.5,
           //                                                               maxValueVisibility:
           //                                                                   true,
           //                                                               valueLabelVisibility:
           //                                                                   false,
           //                                                               animationDuration:
           //                                                                   Duration(
           //                                                                       milliseconds:
           //                                                                           5000),
           //                                                               // valueLabelPadding:
           //                                                               //     const EdgeInsets.symmetric(
           //                                                               //         vertical: 1, horizontal: 8),
           //                                                               // valueLabelMargin:
           //                                                               //     const EdgeInsets.only(right: 8),
           //                                                               starOffColor:
           //                                                                   const Color(
           //                                                                       0xffe7e8ea),
           //                                                               starColor:
           //                                                                   MyColors
           //                                                                       .yellow,
           //                                                             ),
           //                                                             SizedBox(width: 10),
           //                                                             // Image.asset(item["image"],
           //                                                             //     height: 30),
           //                                                             Column(
           //                                                               crossAxisAlignment:
           //                                                                   CrossAxisAlignment
           //                                                                       .start,
           //                                                               children: [
           //                                                                 Text(
           //                                                                   item
           //                                                                           .userId![
           //                                                                               0]
           //                                                                           .fName
           //                                                                           .toString() +
           //                                                                       " " +
           //                                                                       item
           //                                                                           .userId![
           //                                                                               0]
           //                                                                           .lName
           //                                                                           .toString(),
           //                                                                   style: CustomTextStyle
           //                                                                       .popinstext,
           //                                                                 ),
           //                                                                 // Row(
           //                                                                 //   children: [
           //                                                                 //     Icon(
           //                                                                 //       Icons
           //                                                                 //           .person_2_outlined,
           //                                                                 //       size: 13,
           //                                                                 //     ),
           //                                                                 //     Text(
           //                                                                 //      ( item.callback![0].itemDetails![0].ratingCount??0).toString(),
           //                                                                 //       style: CustomTextStyle
           //                                                                 //           .popinssmall0,
           //                                                                 //     ),
           //                                                                 //   ],
           //                                                                 // )
           //                                                               ],
           //                                                             )
           //                                                           ],
           //                                                         ),
           
           //                                                         SizedBox(
           //                                                             height: MediaQuery.of(
           //                                                                         context)
           //                                                                     .size
           //                                                                     .height *
           //                                                                 0.02),
           //                                                         Divider(
           //                                                           color: MyColors
           //                                                               .lightdivider,
           //                                                           thickness: 1,
           //                                                           height: 1,
           //                                                         ),
           //                                                         SizedBox(
           //                                                             height: MediaQuery.of(
           //                                                                         context)
           //                                                                     .size
           //                                                                     .height *
           //                                                                 0.02),
           //                                                       ],
           //                                                     );
           //                                                   },
           //                                                 );
           //                                         }),
           
           //                                     // GetBuilder<UserReviewController>(
           //                                     //     init: userreviewcontroller,
           //                                     //     builder: (_) {
           //                                     //       return ListView.builder(
           //                                     //         primary: false,
           //                                     //         shrinkWrap: true,
           //                                     //         itemCount: userreviewcontroller
           //                                     //             .getreviewList.length,
           //                                     //         itemBuilder: (context, index) {
           //                                     //           var item = userreviewcontroller
           //                                     //               .getreviewList[index];
           
           //                                     //           return ListView(
           //                                     //             primary: false,
           //                                     //             shrinkWrap: true,
           //                                     //             children: [
           //                                     //               Text(
           //                                     //                 item["title"],
           //                                     //                 style: CustomTextStyle
           //                                     //                     .popinssmall0,
           //                                     //               ),
           //                                     //               SizedBox(
           //                                     //                   height: MediaQuery.of(context)
           //                                     //                           .size
           //                                     //                           .height *
           //                                     //                       0.01),
           //                                     //               Row(
           //                                     //                 children: [
           //                                     //                   RatingStars(
           //                                     //                     value: userreviewcontroller
           //                                     //                         .value!,
           //                                     //                     // onValueChanged: (v) {
           //                                     //                     //   //
           //                                     //                     //   setState(() {
           //                                     //                     //     value = v;
           //                                     //                     //   });
           //                                     //                     // },
           //                                     //                     starBuilder:
           //                                     //                         (index, color) => Icon(
           //                                     //                       Icons.star,
           //                                     //                       color: color,
           //                                     //                       size: 15,
           //                                     //                     ),
           //                                     //                     starCount: 5,
           //                                     //                     starSize: 20,
           //                                     //                     // valueLabelColor: const Color(0xff9b9b9b),
           //                                     //                     // valueLabelTextStyle: const TextStyle(
           //                                     //                     //     color: Colors.white,
           //                                     //                     //     fontWeight: FontWeight.w400,
           //                                     //                     //     fontStyle: FontStyle.normal,
           //                                     //                     //     fontSize: 12.0),
           //                                     //                     // valueLabelRadius: 10,
           //                                     //                     maxValue: 5,
           //                                     //                     starSpacing: 0.5,
           //                                     //                     maxValueVisibility: true,
           //                                     //                     valueLabelVisibility: false,
           //                                     //                     animationDuration: Duration(
           //                                     //                         milliseconds: 5000),
           //                                     //                     // valueLabelPadding:
           //                                     //                     //     const EdgeInsets.symmetric(
           //                                     //                     //         vertical: 1, horizontal: 8),
           //                                     //                     // valueLabelMargin:
           //                                     //                     //     const EdgeInsets.only(right: 8),
           //                                     //                     starOffColor:
           //                                     //                         const Color(0xffe7e8ea),
           //                                     //                     starColor: MyColors.yellow,
           //                                     //                   ),
           //                                     //                   SizedBox(width: 10),
           //                                     //                   Image.asset(item["image"],
           //                                     //                       height: 30),
           //                                     //                   Column(
           //                                     //                     crossAxisAlignment:
           //                                     //                         CrossAxisAlignment
           //                                     //                             .start,
           //                                     //                     children: [
           //                                     //                       Text(
           //                                     //                         item["name"],
           //                                     //                         style: CustomTextStyle
           //                                     //                             .popinstext,
           //                                     //                       ),
           //                                     //                       Row(
           //                                     //                         children: [
           //                                     //                           Icon(
           //                                     //                             Icons
           //                                     //                                 .person_2_outlined,
           //                                     //                             size: 13,
           //                                     //                           ),
           //                                     //                           Text(
           //                                     //                             item["count"],
           //                                     //                             style: CustomTextStyle
           //                                     //                                 .popinssmall0,
           //                                     //                           ),
           //                                     //                         ],
           //                                     //                       )
           //                                     //                     ],
           //                                     //                   )
           //                                     //                 ],
           //                                     //               ),
           //                                     //               SizedBox(
           //                                     //                   height: MediaQuery.of(context)
           //                                     //                           .size
           //                                     //                           .height *
           //                                     //                       0.02),
           //                                     //               Divider(
           //                                     //                 color: MyColors.lightdivider,
           //                                     //                 thickness: 1,
           //                                     //                 height: 1,
           //                                     //               ),
           //                                     //               SizedBox(
           //                                     //                   height: MediaQuery.of(context)
           //                                     //                           .size
           //                                     //                           .height *
           //                                     //                       0.02),
           //                                     //             ],
           //                                     //           );
           //                                     //         },
           //                                     //       );
           //                                     //     }),
           
           //                                     // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
           //                                     SizedBox(
           //                                         height:
           //                                             MediaQuery.of(context).size.height *
           //                                                 0.04),
           
           //                                     Container(
           //                                       // height: MediaQuery.of(context).size.height * 0.09,
           //                                       width: MediaQuery.of(context).size.width,
           //                                       decoration: BoxDecoration(
           //                                           borderRadius:
           //                                               BorderRadius.circular(25),
           //                                           color: MyColors.white),
           //                                       child: Padding(
           //                                         padding: const EdgeInsets.all(8.0),
           //                                         child: Column(
           //                                           mainAxisAlignment:
           //                                               MainAxisAlignment.spaceBetween,
           //                                           children: [
           //                                             Row(
           //                                               children: [
           //                                                 productdetailscontroller
           //                                                             .selectedvariants
           //                                                             ?.price ==
           //                                                         null
           //                                                     ? Text(
           //                                                         "₹" +
           //                                                             ((productdetailscontroller
           //                                                                         .productdetailmodel!
           //                                                                         .data!
           //                                                                         .price!) *
           //                                                                     (productdetailscontroller
           //                                                                             .sizecount ??
           //                                                                         0))
           //                                                                 .toString(),
           //                                                         // "₹" + widget.itemdetails.price.toString(),
           //                                                         style: CustomTextStyle
           //                                                             .discounttext)
           //                                                     : Text(
           //                                                         "₹" +
           //                                                             ((productdetailscontroller
           //                                                                             .selectedvariants
           //                                                                             ?.price ??
           //                                                                         0) *
           //                                                                     (productdetailscontroller
           //                                                                             .sizecount ??
           //                                                                         0))
           //                                                                 .toString(),
           //                                                         // "₹" + widget.itemdetails.price.toString(),
           //                                                         style: CustomTextStyle
           //                                                             .discounttext),
           //                                                 SizedBox(width: 3),
           //                                                 // Container(
           //                                                 //   height: 20,
           //                                                 //   width: 40,
           //                                                 //   decoration: BoxDecoration(
           //                                                 //       color: MyColors.red,
           //                                                 //       borderRadius:
           //                                                 //           BorderRadius.circular(10),
           //                                                 //       border: Border.all(
           //                                                 //           color: MyColors.red)),
           //                                                 //   child: Center(
           //                                                 //     child:
           //                                                      Text(
           //                                                         "Save${productdetailscontroller.productdetailmodel!.data!.discount!.toString()}%",
           //                                                         style: CustomTextStyle
           //                                                             .popinstextsmal2222red),
           //                                                 //   ),
           //                                                 // ),
           //                                               ],
           //                                             ),
           //                                             SizedBox(height: 5),
           //                                             productdetailscontroller
           //                                                         .selectedvariants
           //                                                         ?.price ==
           //                                                     null
           //                                                 ? Text(
           //                                                     "₹" +
           //                                                         ((productdetailscontroller
           //                                                                         .productdetailmodel!
           //                                                                         .data!
           //                                                                         .price!) *
           //                                                                     (productdetailscontroller
           //                                                                             .sizecount ??
           //                                                                         0) -
           //                                                                 (((productdetailscontroller.productdetailmodel!.data!.price!) *
           //                                                                             productdetailscontroller
           //                                                                                 .sizecount! ??
           //                                                                         0) *
           //                                                                     (productdetailscontroller
           //                                                                         .productdetailmodel!
           //                                                                         .data!
           //                                                                         .discount!) /
           //                                                                     100))
           //                                                             .toString(),
           //                                                     //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
           //                                                     //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
           //                                                     style: CustomTextStyle
           //                                                         .popinstext,
           //                                                   )
           //                                                 : Text(
           //                                                     "₹" +
           //                                                         ((productdetailscontroller
           //                                                                             .selectedvariants
           //                                                                             ?.price ??
           //                                                                         0) *
           //                                                                     (productdetailscontroller
           //                                                                             .sizecount ??
           //                                                                         0) -
           //                                                                 (((productdetailscontroller.selectedvariants?.price ??
           //                                                                                 0) *
           //                                                                             productdetailscontroller
           //                                                                                 .sizecount! ??
           //                                                                         0) *
           //                                                                     (productdetailscontroller
           //                                                                         .productdetailmodel!
           //                                                                         .data!
           //                                                                         .discount!) /
           //                                                                     100))
           //                                                             .toString(),
           //                                                     //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
           //                                                     //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
           //                                                     style: CustomTextStyle
           //                                                         .popinstext,
           //                                                   ),
           //                                             Row(
           //                                               children: [
           //                                                 GestureDetector(
           //                                                   onTap: () {
           //                                                     productdetailscontroller
           //                                                         .decrementSize();
           //                                                   },
           //                                                   child: Container(
           //                                                     width: 25,
           //                                                     height: 25,
           //                                                     decoration: BoxDecoration(
           //                                                         shape:
           //                                                             BoxShape.rectangle,
           //                                                         color: MyColors.yellow,
           //                                                         borderRadius:
           //                                                             BorderRadius
           //                                                                 .circular(10)),
           //                                                     child: Icon(Icons.remove,
           //                                                         size: 15,
           //                                                         color: Colors.black),
           //                                                     //  Icon(
           //                                                     //   Icons.minimize,
           //                                                     //   size: 8,
           //                                                     //   color: Colors.white,
           //                                                     // ),
           //                                                   ),
           //                                                 ),
           //                                                 SizedBox(
           //                                                   width: 3,
           //                                                 ),
           //                                                 Container(
           //                                                     width: 30,
           //                                                     height: 40,
           //                                                     decoration: BoxDecoration(
           //                                                       borderRadius:
           //                                                           BorderRadius.circular(
           //                                                               50),
           //                                                     ),
           //                                                     child: Center(
           //                                                         child: Text(
           //                                                       productdetailscontroller
           //                                                           .sizecount
           //                                                           .toString(),
           //                                                       style: TextStyle(
           //                                                           fontWeight:
           //                                                               FontWeight.w500),
           //                                                     ))),
           //                                                 SizedBox(
           //                                                   width: 3,
           //                                                 ),
           //                                                 GestureDetector(
           //                                                   onTap: () {
           //                                                     productdetailscontroller
           //                                                         .incrementSize();
           //                                                   },
           //                                                   child: Container(
           //                                                     width: 25,
           //                                                     height: 25,
           //                                                     decoration: BoxDecoration(
           //                                                         //shape: BoxShape.rectangle,
           //                                                         borderRadius:
           //                                                             BorderRadius
           //                                                                 .circular(10),
           //                                                         color: MyColors.yellow),
           //                                                     child: Icon(Icons.add,
           //                                                         size: 15,
           //                                                         color: Colors.black),
           //                                                   ),
           //                                                 ),
           //                                               ],
           //                                             )
           //                                           ],
           //                                         ),
           //                                       // ],
           //                                     )
           //                                   // ],
           //                                 ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.04),
                                  Text(
                                    "Product details",
                                    style: CustomTextStyle.popinstext,
                                  ),
           //  SizedBox(
                                    //   height: MediaQuery.of(context).size.height *
                                    //       0.01),
                                    // Text(
                                    //     productdetailscontroller
                                    //         .productdetailmodel!.data!.name
                                    //         .toString(),
                                    //     style: CustomTextStyle.popinstext,
                                    //   ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.01),
                                  Text(
                                    productdetailscontroller
                                        .productdetailmodel!.data!.description
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
           
                                            Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          "Name",
                                          style: CustomTextStyle.popinslight,
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.1,
                                      ),
                                      Text(
                                        productdetailscontroller
                                            .productdetailmodel!.data!.name
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  const Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                       SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
           
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
                                        productdetailscontroller
                                            .productdetailmodel!.data!.brandId
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  const Divider(
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
                                        productdetailscontroller
                                            .productdetailmodel!.data!.petsbreedsId
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  const Divider(
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
                                       productdetailscontroller
                                            .productdetailmodel!.data!.lifeStageId
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  // Petsbreeds
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  const Divider(
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
                                        (productdetailscontroller
                                                    .productdetailmodel!
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
                                  const Divider(
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
                                        productdetailscontroller
                                            .productdetailmodel!
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
                                  const Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
           
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "Item From ",
                                  //       style: CustomTextStyle.popinslight,
                                  //     ),
                                  //     SizedBox(
                                  //       width: MediaQuery.of(context).size.width *
                                  //           0.2,
                                  //     ),
                                  //     Text(
                                  //       "",
                                  //       style: CustomTextStyle.popinstext,
                                  //     ),
                                  //   ],
                                  // ),
                                  //           SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                  //  Divider(color: lightdivider,thickness: 1,height: 1,),
           
                
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
           
               GetBuilder<UserReviewController>(
                                      init: userreviewcontroller,
                                      builder: (_) {
                                        return  userreviewcontroller
                                                      .userReviewModel ==
                                                  null &&
                                              userreviewcontroller
                                                      .userReviewModel!.data ==
                                                  null
                                          // userreviewcontroller.userReviewModel!.data!.isEmpty
                                          ? const SizedBox(): ListView.builder(
                                             primary: false,
                                              shrinkWrap: true,
                                         itemCount: userreviewcontroller
                                                      .userReviewModel!
                                                      .data!
                                                      .length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                var item = userreviewcontroller
                                                    .userReviewModel!
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
                                               animationDuration: const Duration(
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
                                             const SizedBox(width: 10),
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
                                                const Divider(
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
                               
                                  // GetBuilder<UserReviewController>(
                                  //     init: userreviewcontroller,
                                  //     builder: (_) {
                                  //       return ListView.builder(
                                  //         primary: false,
                                  //         shrinkWrap: true,
                                  //         itemCount: userreviewcontroller
                                  //             .getreviewList.length,
                                  //         itemBuilder: (context, index) {
                                  //           var item = userreviewcontroller
                                  //               .getreviewList[index];
           
                                  //           return ListView(
                                  //             primary: false,
                                  //             shrinkWrap: true,
                                  //             children: [
                                  //               Text(
                                  //                 item["title"],
                                  //                 style: CustomTextStyle
                                  //                     .popinssmall0,
                                  //               ),
                                  //               SizedBox(
                                  //                   height: MediaQuery.of(context)
                                  //                           .size
                                  //                           .height *
                                  //                       0.01),
                                  //               Row(
                                  //                 children: [
                                  //                   RatingStars(
                                  //                     value: userreviewcontroller
                                  //                         .value!,
                                  //                     // onValueChanged: (v) {
                                  //                     //   //
                                  //                     //   setState(() {
                                  //                     //     value = v;
                                  //                     //   });
                                  //                     // },
                                  //                     starBuilder:
                                  //                         (index, color) => Icon(
                                  //                       Icons.star,
                                  //                       color: color,
                                  //                       size: 15,
                                  //                     ),
                                  //                     starCount: 5,
                                  //                     starSize: 20,
                                  //                     // valueLabelColor: const Color(0xff9b9b9b),
                                  //                     // valueLabelTextStyle: const TextStyle(
                                  //                     //     color: Colors.white,
                                  //                     //     fontWeight: FontWeight.w400,
                                  //                     //     fontStyle: FontStyle.normal,
                                  //                     //     fontSize: 12.0),
                                  //                     // valueLabelRadius: 10,
                                  //                     maxValue: 5,
                                  //                     starSpacing: 0.5,
                                  //                     maxValueVisibility: true,
                                  //                     valueLabelVisibility: false,
                                  //                     animationDuration: Duration(
                                  //                         milliseconds: 5000),
                                  //                     // valueLabelPadding:
                                  //                     //     const EdgeInsets.symmetric(
                                  //                     //         vertical: 1, horizontal: 8),
                                  //                     // valueLabelMargin:
                                  //                     //     const EdgeInsets.only(right: 8),
                                  //                     starOffColor:
                                  //                         const Color(0xffe7e8ea),
                                  //                     starColor: MyColors.yellow,
                                  //                   ),
                                  //                   SizedBox(width: 10),
                                  //                   Image.asset(item["image"],
                                  //                       height: 30),
                                  //                   Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Text(
                                  //                         item["name"],
                                  //                         style: CustomTextStyle
                                  //                             .popinstext,
                                  //                       ),
                                  //                       Row(
                                  //                         children: [
                                  //                           Icon(
                                  //                             Icons
                                  //                                 .person_2_outlined,
                                  //                             size: 13,
                                  //                           ),
                                  //                           Text(
                                  //                             item["count"],
                                  //                             style: CustomTextStyle
                                  //                                 .popinssmall0,
                                  //                           ),
                                  //                         ],
                                  //                       )
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //               SizedBox(
                                  //                   height: MediaQuery.of(context)
                                  //                           .size
                                  //                           .height *
                                  //                       0.02),
                                  //               Divider(
                                  //                 color: MyColors.lightdivider,
                                  //                 thickness: 1,
                                  //                 height: 1,
                                  //               ),
                                  //               SizedBox(
                                  //                   height: MediaQuery.of(context)
                                  //                           .size
                                  //                           .height *
                                  //                       0.02),
                                  //             ],
                                  //           );
                                  //         },
                                  //       );
                                  //     }),
                                 
                                  // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                              productdetailscontroller
                                                          .selectedvariants
                                                          ?.price ==
                                                      null
                                                  ? Text(
                                                      "₹" +
                                                          ((productdetailscontroller
                                                                      .productdetailmodel!
                                                                      .data!
                                                                      .price!) *
                                                                  (productdetailscontroller
                                                                          .sizecount ??
                                                                      0))
                                                              .toString(),
                                                      // "₹" + widget.itemdetails.price.toString(),
                                                      style: CustomTextStyle
                                                          .discounttext)
                                                  : Text(
                                                      "₹" +
                                                          ((productdetailscontroller
                                                                          .selectedvariants
                                                                          ?.price ??
                                                                      0) *
                                                                  (productdetailscontroller
                                                                          .sizecount ??
                                                                      0))
                                                              .toString(),
                                                      // "₹" + widget.itemdetails.price.toString(),
                                                      style: CustomTextStyle
                                                          .discounttext),
                                              const SizedBox(width: 3),
                                              // Container(
                                              //   height: 20,
                                              //   width: 40,
                                              //   decoration: BoxDecoration(
                                              //       color: MyColors.red,
                                              //       borderRadius:
                                              //           BorderRadius.circular(10),
                                              //       border: Border.all(
                                              //           color: MyColors.red)),
                                              //   child: Center(
                                              //     child:
                                                   Text(
                                                      // item.discount.toString(),
                                                      "Save${productdetailscontroller.productdetailmodel!.data!.discount.toString()}%",
                                                      style: CustomTextStyle
                                                          .popinstextsmal2222red),
                                              //   ),
                                              // ),
                                              const SizedBox(width: 10),
                                              productdetailscontroller
                                                          .selectedvariants
                                                          ?.price ==
                                                      null
                                                  ? Text(
                                                      "₹" +
                                                          ((productdetailscontroller
                                                                          .productdetailmodel!
                                                                          .data!
                                                                          .price!) *
                                                                      (productdetailscontroller.sizecount ??
                                                                          0) -
                                                                  (((productdetailscontroller.productdetailmodel!.data!.price!) * productdetailscontroller.sizecount! ?? 0) *
                                                                      (productdetailscontroller
                                                                          .productdetailmodel!
                                                                          .data!
                                                                          .discount!) /
                                                                      100))
                                                              .toString(),
                                                      // (widget.itemdetails.price),
                                                      style: CustomTextStyle
                                                          .appbartext)
                                                  : Text(
                                                      "₹" +
                                                          ((productdetailscontroller.selectedvariants?.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
                                                                  (((productdetailscontroller.selectedvariants?.price ?? 0) * productdetailscontroller.sizecount! ?? 0) *
                                                                      (productdetailscontroller
                                                                          .productdetailmodel!
                                                                          .data!
                                                                          .discount!) /
                                                                      100))
                                                              .toString(),
                                                      // (widget.itemdetails.price),
                                                      style: CustomTextStyle
                                                          .appbartext),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
           
                                             productdetailscontroller.selectedvariants!.stock == 0?
                                  Row(
                                    children: [
                                      Container(
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.25,
                                                      
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.06,
                                                      decoration: BoxDecoration(
                                                          color: MyColors.red,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  25)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                        children: [
                                                          // Image.asset(
                                                          //   "assets/image/bagadd.png",
                                                          //   height: 25,
                                                          // ),
                                                          // SizedBox(
                                                          //   width: 10,
                                                          // ),
                                                          Text(
                                                            "Sold Out",
                                                            style: CustomTextStyle
                                                                .mediumtextwhite,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                      GestureDetector(onTap: () async{
                                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                            
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
           Align(alignment: Alignment.topRight,
           child:InkWell(
             onTap: (){
               Get.back();
             },
             child: const Icon(Icons.cancel_rounded))),
                               Text(
                                        productdetailscontroller
                                            .productdetailmodel!.data!.name
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
           
            productdetailscontroller
                 .productdetailmodel!.data == null?
                 const SizedBox():
           
                 Form( 
                      key: productdetailscontroller.formKey,
                  child: 
                 
                   Column(
                        children: [
                          Padding(
              padding:
                  const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
               color: MyColors.grey),
                    color: const Color.fromRGBO(
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
                   15)),
                child: DropdownButtonFormField<
                    variantFile.Variations>(
                  validator: (value) {
                    if (value == null ||
               value.type!.isEmpty) {
             return 'Please select a tpye';
                    }
                    return null;
                  },
                  // value: productdetailscontroller.dropdownsize,
                  value:
             productdetailscontroller
                 .selectedvariants,
                  decoration: const InputDecoration(
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
                  icon: const Center(
                    child: Icon(
             Icons.arrow_drop_down,
             color: MyColors.black,
                    ),
                  ),
                  style: const TextStyle(
             fontSize: 16,
             color: MyColors.black),
                  items:
             productdetailscontroller
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
           //                                    items:   productdetailscontroller.productdetailmodel!.data!.variations!.map<DropdownMenuItem<String>>(
           //   (var variant) {
           //     return DropdownMenuItem<String>(
           //       value: variant.type,
           //       child: Text(variant.type.toString() ),
           //     );
           //   },
           // ).toList() ?? [],
                  // items: productdetailscontroller
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
                    await productdetailscontroller
               .updateVariants(
                   variants!);
                  },
                  // onChanged: (String? value)  {
                  //   productdetailscontroller.addVariant(value);
                  //   // productdetailscontroller
                  //   //     .updateSize(value ?? "");
                  //   // Perform actions when country is changed
                  // },
                ),
              ),
            ),
           
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              //                    width: 335,
                              // height: 45,
                              decoration: BoxDecoration(
                             border: Border.all(
               color: MyColors.grey),
                                  // color: Color.fromRGBO(255, 255, 255, 0.10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     offset: const Offset(0.0, 0.0),
                                  //     color: Color.fromRGBO(255, 255, 255, 0.10),
                                  //     blurRadius: 0.0,
                                  //     spreadRadius: 0.0,
                                  //   ),
                                  // ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                controller:
                                    productdetailscontroller.emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: MyColors.black,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color:MyColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),),
                    
                     
                     
                const SizedBox(height: 10,),
                                Center(
                                  child: ElevatedButton(
                                    
                                            onPressed:() async {
                                              //  productdetailscontroller.clearPopUpFields();
                                                 productdetailscontroller.validateForm(context).then(
                                (isValid) async {
                                  if (isValid) {
                                    // print("Valid form");
           
                                    try {
                                        await    productdetailscontroller.addNotify();
                                        Get.back();
                                    } catch (e) {
                                      Get.snackbar(
                                        'Error',
                                        'Something Went Wrong: $e',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  } 
                                });
                                      
                                            },
                                            child: const Text('Notify me when available'),
                                          ),
                                ), ],
                              ),
                            );
                          },
                        );
           
                                      },
                                        child: Container(
                                                        width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                        height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        decoration: BoxDecoration(
                                                            color: MyColors.green,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    25)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: [
                                                            // Image.asset(
                                                            //   "assets/image/bagadd.png",
                                                            //   height: 25,
                                                            // ),
                                                            // SizedBox(
                                                            //   width: 10,
                                                            // ),
                                                            Text(
                                                              "Notify me when available",
                                                              style: CustomTextStyle
                                                                  .mediumtextwhite,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                      ),
                                   
                                   
                                   
                                    ],
                                  )
                               :
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder:
                                                  //             (context) =>
                                                  //                 PaymentUser(
                                                  //                   price: productdetailscontroller
                                                  //                               .selectedvariants
                                                  //                               ?.price ==
                                                  //                           null
                                                  //                       ? ((productdetailscontroller.productdetailmodel!.data!.price!) *
                                                  //                                   (productdetailscontroller.sizecount ??
                                                  //                                       0) -
                                                  //                               (((productdetailscontroller.productdetailmodel!.data!.price!) * productdetailscontroller.sizecount ?? 0) *
                                                  //                                   (productdetailscontroller
                                                  //                                       .productdetailmodel!.data!.discount!) /
                                                  //                                   100))
                                                  //                           .toString()
                                                  //                       : ((productdetailscontroller.selectedvariants?.price ?? 0) *
                                                  //                                   (productdetailscontroller.sizecount ??
                                                  //                                       0) -
                                                  //                               (((productdetailscontroller.selectedvariants?.price ?? 0) * productdetailscontroller.sizecount ?? 0) *
                                                  //                                   (productdetailscontroller.productdetailmodel!.data!.discount!) /
                                                  //                                   100))
                                                  //                           .toString(),
                                                  //                 )));
                                                  // await productdetailscontroller
                                                  // .addProduct();
                                                  // mycartController.init();
                                                  MyOrder.Datum foo = MyOrder.Datum(
                                                      userId: productdetailscontroller
                                                          .userId,
                                                      id: productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .id,
                                                      image: productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .image,
                                                      itemName: productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .name,
                                                      variant: productdetailscontroller
                                                          .selectedvariants!
                                                          .type
                                                          .toString(),
                                                      quantity:
                                                          (productdetailscontroller
                                                              .sizecount),
                                                      price: ((productdetailscontroller.selectedvariants?.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
                                                          (((productdetailscontroller.selectedvariants?.price ?? 0) * productdetailscontroller.sizecount! ?? 0) * (productdetailscontroller.productdetailmodel!.data!.discount!) / 100)));
           
                                                  Get.to(BuyNowAddToCardUser(
                                                      data: foo,
                                                      tax: productdetailscontroller
                                                          .productdetailmodel!
                                                          .data!
                                                          .tax!));
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
                                                      color: MyColors.yellow,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(25)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/image/bagadd.png",
                                                        height: 25,
                                                      ),
                                                      const SizedBox(
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
                                              const Spacer(),
                                              GetBuilder<
                                                      ProductDetailsController>(
                                                  init:
                                                      productdetailscontroller,
                                                  builder: (_) {
                                                    return InkWell(
                                                      onTap: () async {
           // mycartController.adddiscount(
           
           //   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
           
           //   );
                                                        if (productdetailscontroller
                                                            .isProductInCartBool) {
                                                          mycartController.init();
                                                           mycartController.updateTotal();
                                                          Get.to(const AddToCardUser());
                                                        } else {
                                                          await productdetailscontroller
                                                              .addProduct();
                                                          await productdetailscontroller
                                                              .isProductInCart();
                                                        }
                                                        // ?   :
           
                                                        // await productdetailscontroller
                                                        //     .addProduct();
                                                        // Get.to(
                                                        //     const AddToCardUser());
                                                        // mycartController
                                                        //     .init();
                                                        //     productdetailscontroller.addToCart(
           
                                                        // productdetailscontroller.productdetailmodel!.data!.name.toString(),
                                                        //              productdetailscontroller.sizecount.toString(),
                                                        //              productdetailscontroller.selectedVariants.toString()
                                                        //               );
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) =>
                                                        //             AddToCardUser()));
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        decoration: BoxDecoration(
                                                            color: MyColors
                                                                .yellow,
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
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              productdetailscontroller
                                                                      .isProductInCartBool
                                                                  ? "Go To Cart"
                                                              :
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
                                          ),
                                     ] ),
                                      )
                                  )],
                                  ),
                                );
                        })
              ],
                     ),
           ),
        ),
        GetBuilder<ProductDetailsController>(
            init: productdetailscontroller,
            builder: (_) {
              return productdetailscontroller.showLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.1), // Adjust the opacity as needed
                      ),
                    )
                  : const SizedBox();
            }),
        // Progress bar
        GetBuilder<ProductDetailsController>(
            init: productdetailscontroller,
            builder: (_) {
              return productdetailscontroller.showLoading
                  ? const Center(
                      child: SpinKitCircle(
                        color: Colors.white, // Color of the progress bar
                        size: 50.0, // Size of the progress bar
                      ),
                    )
                  : const SizedBox();
            }),
      ],
    );
  }
}
