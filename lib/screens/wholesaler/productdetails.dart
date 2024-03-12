import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';
import 'package:pet/screens/wholesaler/buyNowAddtoCart.dart';
import 'package:pet/screens/wholesaler/notification.dart';

import 'package:pet/models/wholesalerModel/mycartListModel.dart' as MyOrder;

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
   ProductDetailswhole({super.key,this.id});

  int? id;
//  dynamic itemdetails;
  @override
  State<ProductDetailswhole> createState() => _ProductDetailswholeState();
}

class _ProductDetailswholeState extends State<ProductDetailswhole> {
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
      
  TextEditingController emailController = TextEditingController();
       final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
       WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  // WholeReviewController wholeReviewController =
  //     Get.put(WholeReviewController());
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
      WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
       var imagePath;
     var imagesPath;
  List kg = [1, 2, 5];
  //  var imagePath =
  //       "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${widget.itemdetails.image ?? ""}";
  @override
  Widget build(BuildContext context) {
    // wholeproductdetailsController.isProductInCart();
    // var imagePath =
    //     // "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
    //     "${Constants.BASE_URL}/storage/app/public/product/${wholeproductdetailsController!.productdetailwholemodel!.data!.image ?? ''}";
    return Stack(
      children: [
        Scaffold(
           appBar: CustomAppBarWholeback(
       title: "Product Details",
      ),body:
       ListView(
            shrinkWrap: true,
            primary: true,
            children: [
                   wholeproductdetailsController!.productdetailwholemodel == null ||  wholeproductdetailsController!.productdetailwholemodel == "" || wholeproductdetailsController!.productdetailwholemodel!.data == null
            
              ? Center(
                child: SizedBox(
                                        child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))),
              )
                                  :
              Stack(
                children: [

                   GetBuilder<WholeProductDetailsController>(
                  init: wholeproductdetailsController,
                  builder: (_) {
                      return    wholeproductdetailsController!.productdetailwholemodel == null ||  wholeproductdetailsController!.productdetailwholemodel!.data == null ?SizedBox():
                       Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: MyColors.lightbg,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(500))),
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: wholeproductdetailsController!.productdetailwholemodel!.data!.images == ''|| wholeproductdetailsController.productdetailwholemodel!.data!.images == null|| wholeproductdetailsController!.productdetailwholemodel!.data!.images!.isEmpty?
                                FullScreenWidget(
                                                  disposeLevel:
                                                      DisposeLevel.High,
                                  child: CachedNetworkImage(
                                                              imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${wholeproductdetailsController!.productdetailwholemodel!.data!.image.toString()}",
                                                              // width: 61,
                                                              // height: 75,
                                                            
                                                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                                              ), // Replace with your own placeholder widget
                                                              errorWidget: (context, url, error) => Icon(Icons
                                    .error), // Replace with your own error widget
                                                            ),
                                )
                          :
                             FullScreenWidget(
                                                  disposeLevel:
                                                      DisposeLevel.High,
                               child: CachedNetworkImage(
                                imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${wholeproductdetailsController!.productdetailwholemodel!.data!.images![wholeproductdetailsController.selectImages??0].toString()}",
                                // width: 61,
                                // height: 75,
                                                         
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ), // Replace with your own placeholder widget
                                errorWidget: (context, url, error) => Icon(Icons
                                    .error), // Replace with your own error widget
                                                         ),
                             ),
                          ));
                    }
                  ),
                  // Container(
                  //     height: MediaQuery.of(context).size.height * 0.4,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //         color: MyColors.lightbg,
                  //         borderRadius: BorderRadius.only(
                  //             bottomRight: Radius.circular(500))),
                  //     child: Padding(
                  //       padding: EdgeInsets.only(top: 15.0),
                  //       child: 
                  //       CachedNetworkImage(
                  //         imageUrl: imagePath,
                  //         // width: 61,
                  //         // height: 75,
                  //         placeholder: (context, url) => Center(
                  //           child: CircularProgressIndicator(),
                  //         ), // Replace with your own placeholder widget
                  //         errorWidget: (context, url, error) => Icon(Icons
                  //             .error), // Replace with your own error widget
                  //       ),
                  //     )),

   GetBuilder<WholeHomeController>(
                  init: wholehomecontroller,
                  builder: (_) {
    return     InkWell(
    
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
    
                                                    );
  }
),

                    
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                   wholeproductdetailsController!.productdetailwholemodel == null
                  ? SizedBox()
                  : GetBuilder<WholeProductDetailsController>(
                      init: wholeproductdetailsController,
                      builder: (_) {
                        final images = wholeproductdetailsController!.productdetailwholemodel!.data!.images;

                        if (images == null || images.isEmpty) {
                          print("No images available");
                          return Text("No Images");
                        }

                        final imageCount = images.length;

                        if (imageCount < 3) {
                          print(
                              "Not enough images available (found $imageCount)");
                        }

                        final sublistStart = 0;
                        final sublistEnd = imageCount >= 3 ? 3 : imageCount;

                        return Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               wholeproductdetailsController!.productdetailwholemodel!.data!
                                              .images ==
                                          '' ||
                                       wholeproductdetailsController!.productdetailwholemodel!
                                              .data!
                                              .images ==
                                          null ||
                                    wholeproductdetailsController!.productdetailwholemodel!
                                          .data!
                                          .images!
                                          .isEmpty
                                  ? Text("No Related Image")
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
                                                      wholeproductdetailsController
                                                          .selectImagesProduct(
                                                             wholeproductdetailsController!.productdetailwholemodel!
                                                                  .data!
                                                                  .images!
                                                                  .indexOf(e));
                                                      // var tab = e
                                                      print("IamgeSelect");
                                                      print(wholeproductdetailsController!.productdetailwholemodel!
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
                                                                color: wholeproductdetailsController
                                                                            .selectImages ==
                                                                        wholeproductdetailsController!.productdetailwholemodel!
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
                                                                        Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ), // Replace with your own placeholder widget
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
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
                                    
                                    ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.crop_square_sharp,
                                    color: ( wholeproductdetailsController!.productdetailwholemodel!
                                                .data!
                                                .veg ==
                                            1)
                                        ? Colors.red
                                        : Colors.green,
                                    size: 30,
                                  ),
                                  Icon(Icons.circle,
                                      color: ( wholeproductdetailsController!.productdetailwholemodel!
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
             
  wholeproductdetailsController
                        .productdetailwholemodel == null
                  ? SizedBox():
              GetBuilder<WholeProductDetailsController>(
                  init: wholeproductdetailsController,
                  builder: (_) {
                    final variations = wholeproductdetailsController
                        .productdetailwholemodel!.data!.variations!.length;
                    return 
                        wholeproductdetailsController!
                                .productdetailwholemodel ==
                                      null ||
                                 wholeproductdetailsController!
                                .productdetailwholemodel !.data ==
                                      null
                              ? const SizedBox()
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
                                         
                                  

                                              (   wholeproductdetailsController
                                                    .productdetailwholemodel!
                                                          .data!
                                                          .variations ==
                                                      [] || wholeproductdetailsController
                                                    .productdetailwholemodel!
                                                          .data!
                                                          .variations!.isEmpty)
                                      
                                         ? Text("No Variants")
                                              :  Expanded(
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

                                                  onChanged:
                                                      (variantFile.Variations?
                                                          variants) async {
                                                    await wholeproductdetailsController
                                                        .updateVariants(
                                                            variants!);
                                                  },
                                                 
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

(wholeproductdetailsController.productdetailwholemodel!.data!.discount == 0)?
                                                            const SizedBox():
                                            
                                            Row(
                                              children: [
                                                wholeproductdetailsController
                                                            .selectedvariants
                                                            ?.wholeprice ==
                                                        null
                                                    ? Text(
                                                        "₹" +
                                                            ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .wholePrice!) *
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
                                                                            ?.wholeprice ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0))
                                                                .toStringAsFixed(2),

                                                        //  (     (wholeproductdetailscontroller.productList.price)! * (wholeproductdetailscontroller.productList.discount!)/100).toString()

                                                        style: CustomTextStyle
                                                            .discounttext),
                                                SizedBox(width: 3),
                                              
                                                     Text(
                                                        "Save${wholeproductdetailsController.productdetailwholemodel!.data!.discount!.toString()}%",
                                                        style: CustomTextStyle
                                                            .popinstextsmal2222red),
                                                  
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            wholeproductdetailsController
                                                        .selectedvariants
                                                        ?.wholeprice ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .wholePrice!) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice!) *
                                                                            wholeproductdetailsController
                                                                                .sizecount ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
                                                    //  "₹"+(  (     (wholeproductdetailscontroller.productdetailwholemodel!.data!.price)! * (wholeproductdetailscontroller.productdetailwholemodel!.data!.discount!)/100)* wholeproductdetailscontroller.sizecount).toString(),
                                                    //  "₹${wholeproductdetailscontroller.productdetailwholemodel!.data!.price.toString()}",
                                                    style: CustomTextStyle
                                                        .popinstext,
                                                  )
                                                : Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                            .selectedvariants
                                                                            ?.wholeprice ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                            .sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.selectedvariants?.wholeprice ??
                                                                                0) *
                                                                            wholeproductdetailsController
                                                                                .sizecount ??
                                                                        0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
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
                                        "Name",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        wholeproductdetailsController
                                        .productdetailwholemodel!.data!.name
                                            .toString(),   maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyle.popinstext,
                                      ),
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
                                      .productdetailwholemodel!.data!.brandId
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
                                  children: [
                                    Text(
                                      "Product Review",
                                      style: CustomTextStyle.popinstext,
                                    ),
                                   
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
wholereviewcontroller.wholeReviewModel ==  null? SizedBox():
                          
    GetBuilder<WholeReviewController>(
                                    init: wholereviewcontroller,
                                    builder: (_) {
                                      return  wholereviewcontroller
                                                    .wholeReviewModel ==
                                                null &&
                                           wholereviewcontroller
                                                    .wholeReviewModel!.data ==
                                                null ? SizedBox(): ListView.builder(
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
                                          return

                                          ListView(
                                            primary: false,
                                            shrinkWrap: true,
                                            children: [
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
                                           
                                             starBuilder:
                                                 (index, color) => Icon(
                                               Icons.star,
                                               color: color,
                                               size: 15,
                                             ),
                                             starCount: 5,
                                             starSize: 20,
                                             
                                             maxValue: 5,
                                             starSpacing: 0.5,
                                             maxValueVisibility: true,
                                             valueLabelVisibility: false,
                                             animationDuration: Duration(
                                                 milliseconds: 5000),
                                             
                                             starOffColor:
                                                 const Color(0xffe7e8ea),
                                             starColor: MyColors.yellow,
                                           ),
                                           SizedBox(width: 10),
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
                                                        ?.wholeprice ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                    .productdetailwholemodel!
                                                                    .data!
                                                                    .wholePrice!) *
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
                                                                        ?.wholeprice ??
                                                                    0) *
                                                                (wholeproductdetailsController
                                                                        .sizecount ??
                                                                    0))
                                                            .toString(),
                                                    // "₹" + widget.itemdetails.price.toString(),
                                                    style: CustomTextStyle
                                                        .discounttext),
                                            SizedBox(width: 3),
                                          
                                                 Text(
                                                    "Save${wholeproductdetailsController.productdetailwholemodel!.data!.discount!.toString()}%",
                                                    style: CustomTextStyle
                                                        .popinstextsmal2222red),
                                            
                                            SizedBox(width: 10),
                                           (wholeproductdetailsController
                                                                        .productdetailwholemodel!.data!.variations == [] || wholeproductdetailsController
                                                          .selectedvariants
                                                          ?.price ==
                                                      null)
                                                ? Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .wholePrice!) *
                                                                    (wholeproductdetailsController.sizecount ??
                                                                        0) -
                                                                (((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice!) * wholeproductdetailsController.sizecount ?? 0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toString(),
                                                    // (widget.itemdetails.price),
                                                    style: CustomTextStyle
                                                        .appbartext)
                                                : 
                                                Text(
                                                    "₹" +
                                                        ((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
                                                                (((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * wholeproductdetailsController.sizecount ?? 0) *
                                                                    (wholeproductdetailsController
                                                                        .productdetailwholemodel!
                                                                        .data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
                                                    // (widget.itemdetails.price),
                                                    style: CustomTextStyle
                                                        .appbartext),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),



(wholeproductdetailsController.productdetailwholemodel!.data!.variations!.isEmpty)?
              Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    print("store_Id ${wholeproductdetailsController.productdetailwholemodel!
                                                        .data!
                                                        .storeId.toString()}");
    mycartwholeController.clearFields();
                 mycartwholeController.updateTotal();
                                                  MyOrder.Datum foo = MyOrder.Datum(
                                                    
                                                      userId:wholeproductdetailsController.wholesalerID??0,
                                                      id:wholeproductdetailsController.productdetailwholemodel!
                                                                        .data!
                                                                        .id,

                                                      image:wholeproductdetailsController.productdetailwholemodel!
                                                                        .data!
                                                                        .image,
                                                                        itemName:wholeproductdetailsController.productdetailwholemodel!.data!.name ,
                                                                        variant:
                                                                         (wholeproductdetailsController.productdetailwholemodel!.data!.variations!.isEmpty)?"0": (wholeproductdetailsController
                                                              .selectedvariants!.type != null)?wholeproductdetailsController
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                                  quantity:(wholeproductdetailsController.sizecount),
                                                                        price: 


    (wholeproductdetailsController.selectedvariants?.wholeprice != null)?
                                                                        ((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
              (((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * wholeproductdetailsController.sizecount! ?? 0) *
                  (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) /
                  100)):(((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
              (((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice ?? 0) * wholeproductdetailsController.sizecount! ?? 0) *
                  (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) /
                  100)))
          .toDouble());

                                                                    
                                                    

                                            
                                                            Get.to( BuyNowAddToCardwhole(
data:foo,
tax:  wholeproductdetailsController.productdetailwholemodel!
                                                                .data!
                                                                .tax!

                                                            ));
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
                                                        
                                                             mycartwholeController.clearFields();
                                                          await wholeproductdetailsController
                                                        .addProduct();
                                                        mycartwholeController.updateTotal();
                                                            mycartwholeController.init();
                                                            mycartwholeController.updateTotal();
                                                            Get.to(const AddToCardwhole());
                                                 
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
                                            ):
                                        
                                       Column(
                                         children: [
                                           wholeproductdetailsController
                                             .selectedvariants!.stock == 0?
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
                                                            
                                                            Text(
                                                              "Sold Out",
                                                              style: CustomTextStyle
                                                                  .mediumtextwhite,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
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
                            
                             Text(
                                             wholeproductdetailsController
                                              .productdetailwholemodel!.data!.name
                                              .toString(),
                                      style: CustomTextStyle.popinstext,
                                    ),

    wholeproductdetailsController.productdetailwholemodel!.data == null?
               SizedBox():
  Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: MyColors.grey),
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.10),
                                                       
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
                                                      onChanged:
                                                          (variantFile.Variations?
                                                              variants) async {
                                                        await wholeproductdetailsController
                                                            .updateVariants(
                                                                variants!);
                                                      },
                                                      
                                                    ),
                                                  ),
                                                ),
                                             
        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                       border: Border.all(
             color: MyColors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          controller:
                                 wholeproductdetailsController.emailController,
                          decoration: InputDecoration(
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
                          style: TextStyle(
                            fontSize: 16,
                            color:MyColors.black,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 10,),
                              Center(
                                child: ElevatedButton(
                                  
                                              onPressed:() async {
                                                //  productdetailscontroller.clearPopUpFields();
                                            await       wholeproductdetailsController.addNotify();
                                              },
                                              child: Text('Notify me when available'),
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
                                                  onTap: () async {
                                                  
    mycartwholeController.clearFields();
                 mycartwholeController.updateTotal();
                                                  MyOrder.Datum foo = MyOrder.Datum(
                                                    
                                                      userId:wholeproductdetailsController.wholesalerID??0,
                                                      id:wholeproductdetailsController.productdetailwholemodel!
                                                                        .data!
                                                                        .id,

                                                      image:wholeproductdetailsController.productdetailwholemodel!
                                                                        .data!
                                                                        .image,
                                                                        itemName:wholeproductdetailsController.productdetailwholemodel!.data!.name ,
                                                                        variant:
                                                                      (wholeproductdetailsController.productdetailwholemodel!.data!.variations!.isEmpty)?"0": (wholeproductdetailsController
                                                              .selectedvariants!.type != null)?wholeproductdetailsController
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                                        quantity:(wholeproductdetailsController.sizecount),
                                                                        price: 
                                                                        
    (wholeproductdetailsController.selectedvariants?.wholeprice != null)?
                                                                        ((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
              (((wholeproductdetailsController.selectedvariants?.wholeprice ?? 0) * wholeproductdetailsController.sizecount! ?? 0) *
                  (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) /
                  100)):(((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice ?? 0) * (wholeproductdetailsController.sizecount ?? 0) -
              (((wholeproductdetailsController.productdetailwholemodel!.data!.wholePrice ?? 0) * wholeproductdetailsController.sizecount! ?? 0) *
                  (wholeproductdetailsController.productdetailwholemodel!.data!.discount!) /
                  100)))
          .toDouble());                      
                                                    

                                                            Get.to( BuyNowAddToCardwhole(
data:foo,
tax:  wholeproductdetailsController.productdetailwholemodel!
                                                                .data!
                                                                .tax!

                                                            ));
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
                                                             mycartwholeController.clearFields();
                                                          await wholeproductdetailsController
                                                        .addProduct();
                                                        mycartwholeController.updateTotal();
                                                            mycartwholeController.init();
                                                            mycartwholeController.updateTotal();
                                                            Get.to(const AddToCardwhole());
                                                 
                                                          
                                                      
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
                                         ],
                                       ),
                                       






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
