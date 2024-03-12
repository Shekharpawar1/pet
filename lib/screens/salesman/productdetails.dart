import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salesreview_controller.dart';
// import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/salesman/buyNowAddtoCartSales.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/models/salesmanModel/salesProductDetailsModel.dart' as variantFile;

import 'package:pet/models/salesmanModel/salesmycartListModel.dart'as MyOrder;
import 'package:pet/screens/salesman/ordersummary.dart';
// import 'package:pet/screens/salesman/ordersummary1.dart';
import 'package:pet/screens/salesman/paymentsales.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ordersummary.dart';
import 'package:pet/screens/user/notification.dart';

class ProductDetailssale extends StatefulWidget {
   ProductDetailssale({super.key, this.id,});
//  dynamic itemdetails;
int? id;
//  String? image;
  @override
  State<ProductDetailssale> createState() => _ProductDetailssaleState();
}

class _ProductDetailssaleState extends State<ProductDetailssale> {
 final SalesProductDetailsController salesproductdetailscontroller =
      Get.put(SalesProductDetailsController());
 SalesReviewController salesReviewController = Get.put(SalesReviewController());
 final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
 SalesMyCartController mycartController = Get.put(SalesMyCartController());
  final SalesReviewController userreviewcontroller =
      Get.put(SalesReviewController());
 bool isProductInCartBool = false;
  List kg = [1, 2, 5];
 void onClose() {
    salesproductdetailscontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // var imagePath =
    // // "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
    //     "${Constants.BASE_URL}/storage/app/public/product/${salesproductdetailscontroller!.salesproductdetailmodel!.data!.image??''}";
    return Scaffold(
      appBar:CustomAppBarSalesWholeback(title : "Product Details"),
        body:
        
         ListView(
          physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        primary: true,
        children: [


               ( salesproductdetailscontroller!.salesproductdetailmodel == null)
              
                ? Center(
                  child: SizedBox(
                                          child:Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)),
                )
                                    :
          Stack(
            children: [
               salesproductdetailscontroller!.salesproductdetailmodel == null ||  salesproductdetailscontroller!.salesproductdetailmodel!.data == null ? const SizedBox():
                                  GetBuilder<SalesProductDetailsController>(
                  init: salesproductdetailscontroller,
                  builder: (_) {
                      return   salesproductdetailscontroller!.salesproductdetailmodel == null || salesproductdetailscontroller!.salesproductdetailmodel!.data == null ?SizedBox():
                        Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: MyColors.lightbg,
                          borderRadius:
                              BorderRadius.only(bottomRight: Radius.circular(500))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: salesproductdetailscontroller!.salesproductdetailmodel!.data!.images == ''|| salesproductdetailscontroller!.salesproductdetailmodel!.data!.images == null||  salesproductdetailscontroller!.salesproductdetailmodel!.data!.images!.isEmpty?
                             FullScreenWidget(
                                                  disposeLevel:
                                                      DisposeLevel.High,
                                child: CachedNetworkImage(
                                imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${ salesproductdetailscontroller.salesproductdetailmodel!.data!.image.toString()}",
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
                                imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${salesproductdetailscontroller!.salesproductdetailmodel!.data!.images![salesproductdetailscontroller.selectImages??0].toString()}",
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
           
           GetBuilder<HomeSalesController>(
                      init: homesalecontroller,
                      builder: (_) {
                 return InkWell(
                                                      onTap: () {
                                                        homesalecontroller
                                                            .addItemToWishList(
                                                                salesproductdetailscontroller!.salesproductdetailmodel!.data!.id!);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Icon(homesalecontroller
                                                                        .wishListItemsId
                                                                    .contains(
                                                                       salesproductdetailscontroller!.salesproductdetailmodel!.data!.id!)
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

          salesproductdetailscontroller!.salesproductdetailmodel == null
                  ? SizedBox()
                  : GetBuilder<SalesProductDetailsController>(
                      init: salesproductdetailscontroller,
                      builder: (_) {
                        final images =
          salesproductdetailscontroller!.salesproductdetailmodel!.data!.images;

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
                              
          salesproductdetailscontroller!.salesproductdetailmodel!.data!
                                              .images ==
                                          '' ||
                                     
          salesproductdetailscontroller!.salesproductdetailmodel!
                                              .data!
                                              .images ==
                                          null ||
                                    
          salesproductdetailscontroller!.salesproductdetailmodel!
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
salesproductdetailscontroller .selectImagesProduct(
                                                              salesproductdetailscontroller
                                              .salesproductdetailmodel!
                                                                  .data!
                                                                  .images!
                                                                  .indexOf(e));
                                                      // var tab = e
                                                      print("IamgeSelect");
                                                      print(salesproductdetailscontroller
                                              .salesproductdetailmodel!
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
                                                                color: salesproductdetailscontroller
                                                                            .selectImages ==
                                                                        salesproductdetailscontroller
                                                                            .salesproductdetailmodel!
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
                                    color: (salesproductdetailscontroller
                                              .salesproductdetailmodel!
                                                .data!
                                                .veg ==
                                            1)
                                        ? Colors.red
                                        : Colors.green,
                                    size: 30,
                                  ),
                                  Icon(Icons.circle,
                                      color: (salesproductdetailscontroller
                                              .salesproductdetailmodel!
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
             
        
          
          GetBuilder<SalesProductDetailsController>(
              init: salesproductdetailscontroller,
              builder: (_) {
                 final variations = salesproductdetailscontroller.salesproductdetailmodel!.data!.variations!.length;
               
                print("variations ${variations}");
                return 
             (salesproductdetailscontroller!.salesproductdetailmodel!.data == null )?SizedBox(

             ):


                
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Size", style: CustomTextStyle.popinstext),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         


(
                                          salesproductdetailscontroller.salesproductdetailmodel!
                                                          .data!
                                                          .variations ==
                                                      [] || salesproductdetailscontroller.salesproductdetailmodel!
                                                          .data!
                                                          .variations!.isEmpty
                                                  )
                                             
                                              ? Text("No Variants"):
                      
                                              Expanded(
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
                                                            salesproductdetailscontroller
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
                                                            salesproductdetailscontroller
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
                                        
                                                        onChanged: (variantFile
                                                                .Variations?
                                                            variants) async {
                                                          await salesproductdetailscontroller
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [


                                       (salesproductdetailscontroller
                                                            .selectedvariants
                                                            ?.wholeprice ==
                                                        null)?
                                                           Text(
                                       
                                         ((salesproductdetailscontroller
                                                                            .salesproductdetailmodel!
                                                                            .data!.wholePrice ??
                                                                        0) *
                                                                    (salesproductdetailscontroller
                                                                            .sizecount ??
                                                                        0))
                                                                .toStringAsFixed(2),
                            
                                           style: CustomTextStyle.discounttext):
                                   
                                     Text(
                                       
                                      ((salesproductdetailscontroller
                                                                            .selectedvariants
                                                                            ?.wholeprice ??
                                                                        0) *
                                                                    (salesproductdetailscontroller
                                                                            .sizecount ??
                                                                        0))
                                                                .toStringAsFixed(2),
                        
                                           style: CustomTextStyle.discounttext),
                                      SizedBox(width: 3),
                                    
                                       SizedBox(width:3),
                                           Text(
                                        
                                              "Save${salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!.toString()}%",
                                              style: CustomTextStyle
                                                  .popinstextsmal2222red),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                         

                            salesproductdetailscontroller
                                                        .selectedvariants
                                                        ?.wholeprice ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((salesproductdetailscontroller.salesproductdetailmodel!.data!
                                                                        .wholePrice!) *
                                                                    (salesproductdetailscontroller
                                                                            .sizecount ??
                                                                        0) -
                                                                (((salesproductdetailscontroller.salesproductdetailmodel!.data!.wholePrice!) *
                                                                            salesproductdetailscontroller
                                                                                .sizecount ??
                                                                        0) *
                                                                    (salesproductdetailscontroller.salesproductdetailmodel!.data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
                                                    //  "₹"+(  (     (wholeproductdetailscontroller.productdetailwholemodel!.data!.price)! * (wholeproductdetailscontroller.productdetailwholemodel!.data!.discount!)/100)* wholeproductdetailscontroller.sizecount).toString(),
                                                    //  "₹${wholeproductdetailscontroller.productdetailwholemodel!.data!.price.toString()}",
                                                    style: CustomTextStyle
                                                        .popinstext,
                                                  )
                                                : 
                                   Text(
                                    
                                   "₹" +
                                                        ((salesproductdetailscontroller
                                                                            .selectedvariants
                                                                            ?.wholeprice ??
                                                                        0) *
                                                                    (salesproductdetailscontroller
                                                                            .sizecount ??
                                                                        0) -
                                                                (((salesproductdetailscontroller.selectedvariants?.wholeprice ??
                                                                                0) *
                                                                            salesproductdetailscontroller
                                                                                .sizecount ??
                                                                        0) *
                                                                    (salesproductdetailscontroller
                                                                      .salesproductdetailmodel!.data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
                                  
                                  
                                  //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
                                    //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
                                    style: CustomTextStyle.popinstext,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          salesproductdetailscontroller
                                              .decrementSize();
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(Icons.remove,
                                              size: 15, color: Colors.black),
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
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                              child: Text(
                                            salesproductdetailscontroller.sizecount
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ))),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          salesproductdetailscontroller
                                              .incrementSize();
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              //shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: MyColors.yellow),
                                          child: Icon(Icons.add,
                                              size: 15, color: Colors.black),
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
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        "Product details",
                        style: CustomTextStyle.popinstext,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                      salesproductdetailscontroller.salesproductdetailmodel!.data!.description.toString(),
                        style: CustomTextStyle.popinssmall0,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),

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
                                    Expanded(
                                  
                                      child: Text(
                                                                             salesproductdetailscontroller.salesproductdetailmodel!.data!.name
                                                                              .toString(),
                                                                              maxLines: 1,
                                                                           overflow: TextOverflow.ellipsis,    
                                                                          style: CustomTextStyle.popinstext,
                                                                        ),
                                    )
                                    ,
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
                                       salesproductdetailscontroller.salesproductdetailmodel!.data!.brandId
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
                                      ( salesproductdetailscontroller.salesproductdetailmodel!
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
                                       salesproductdetailscontroller.salesproductdetailmodel!
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
                                        0.02),

                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.02),

                      // Row(
                      //   children: [
                      //     Text(
                      //       "Item From ",
                      //       style: CustomTextStyle.popinslight,
                      //     ),
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width * 0.2,
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
                          height: MediaQuery.of(context).size.height * 0.05),
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
                          height: MediaQuery.of(context).size.height * 0.01),
   salesReviewController
                            .salesReviewModel==null?const SizedBox():
                     GetBuilder<SalesReviewController>(
                                    init: salesReviewController,
                                    builder: (_) {
                                      return  salesReviewController
                                                    .salesReviewModel ==
                                                null &&
                                           salesReviewController
                                                    .salesReviewModel!.data ==
                                                null
                                        // userreviewcontroller.userReviewModel!.data!.isEmpty
                                        ? SizedBox(): ListView.builder(
                                           primary: false,
                                            shrinkWrap: true,
                                       itemCount:   salesReviewController
                                                    .salesReviewModel!
                                                    .data!
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              var item =  salesReviewController
                                                    .salesReviewModel!
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
     // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),

                      Container(
                        // height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyColors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                    salesproductdetailscontroller.selectedvariants?.price == null?
                                 Text(
    "₹"+ ( (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*(salesproductdetailscontroller.sizecount??0)).toString(),
                                      // "₹" + widget.itemdetails.price.toString(),
                                      style: CustomTextStyle.discounttext): Text(
    "₹"+ ( (salesproductdetailscontroller.selectedvariants?.price??0)*(salesproductdetailscontroller.sizecount??0)).toString(),
                                      // "₹" + widget.itemdetails.price.toString(),
                                      style: CustomTextStyle.discounttext),
                                  SizedBox(width: 3),
                                  // Container(
                                  //   height: 20,
                                  //   width: 40,
                                  //   decoration: BoxDecoration(
                                  //       color: MyColors.red,
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       border:
                                  //           Border.all(color: MyColors.red)),
                                  //   child: Center(
                                  //     child: 
                                      Text(
                                          // item.discount.toString(),
                                         "Save${salesproductdetailscontroller.salesproductdetailmodel!.data!.discount.toString()}%",
                                          style: CustomTextStyle
                                              .popinstextsmal2222red),
                                  //   ),
                                  // ),
                                  SizedBox(width: 10),
                                  //  salesproductdetailscontroller.selectedvariants?.price == null?
                                  // Text(
                                  //   "₹"+
                                  //   (
                                  //     (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*(salesproductdetailscontroller.sizecount??0)-
                                  //   (( (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
                                  //   ).toString(),
                                  // // (widget.itemdetails.price),
                                  //     style: CustomTextStyle.appbartext):
                                   salesproductdetailscontroller
                                                        .selectedvariants
                                                        ?.wholeprice ==
                                                    null
                                                ? Text(
                                                    "₹" +
                                                        ((salesproductdetailscontroller.salesproductdetailmodel!.data!
                                                                        .wholePrice!) *
                                                                    (salesproductdetailscontroller
                                                                            .sizecount ??
                                                                        0) -
                                                                (((salesproductdetailscontroller.salesproductdetailmodel!.data!.wholePrice!) *
                                                                            salesproductdetailscontroller
                                                                                .sizecount ??
                                                                        0) *
                                                                    (salesproductdetailscontroller.salesproductdetailmodel!.data!
                                                                        .discount!) /
                                                                    100))
                                                            .toStringAsFixed(2),
                                                    style: CustomTextStyle
                                                        .popinstext,
                                                  )
                                                :
                                       Text(
                                    "₹"+
                                    (
                                      (salesproductdetailscontroller.selectedvariants?.wholeprice??0)*(salesproductdetailscontroller.sizecount??0)-
                                    (( (salesproductdetailscontroller.selectedvariants?.wholeprice??0)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
                                    ).toStringAsFixed(2),
                                  // (widget.itemdetails.wholeprice),
                                      style: CustomTextStyle.appbartext),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                          


                          
(salesproductdetailscontroller.salesproductdetailmodel!.data!.variations!.isEmpty)?

Row(
                                children: [
                                      InkWell(
                                        onTap: ()async {
                                          mycartController. clearFields();
                                      //      salesproductdetailscontroller.fethUserId();
                                      //  await salesproductdetailscontroller.addProduct();
                                      //       mycartController.init();
    MyOrder.Datum foo = MyOrder.Datum(
                                                    
                                                      userId:salesproductdetailscontroller.wholesellerID??0,
                                                      id:salesproductdetailscontroller.salesproductdetailmodel!
                                                                        .data!
                                                                        .id,

                                                      image:salesproductdetailscontroller.salesproductdetailmodel!
                                                                        .data!
                                                                        .image,
                                                                        itemName:salesproductdetailscontroller.salesproductdetailmodel!.data!.name ,
                                                                        variant:
                                                                        (salesproductdetailscontroller.salesproductdetailmodel!.data!.variations!.isEmpty)?"0": (salesproductdetailscontroller
                                                              .selectedvariants!.type != null)?salesproductdetailscontroller
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                                //         (salesproductdetailscontroller
                                                                //   .selectedvariants!.type != null)? salesproductdetailscontroller.selectedvariants!
                                                                // .type.toString():"",
                                                                //          salesproductdetailscontroller.selectedvariants!
                                                                // .type.toString(),
                                                                        quantity:(salesproductdetailscontroller.sizecount),
                                                                        price: 
                                                                        
              //                                                           ((salesproductdetailscontroller.selectedvariants!.wholeprice ?? 0) * (salesproductdetailscontroller.sizecount ?? 0) -
              // (((salesproductdetailscontroller.selectedvariants!.wholeprice ?? 0) * salesproductdetailscontroller.sizecount! ?? 0) *
              //     (salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!) /
              //     100)).toDouble()


              (salesproductdetailscontroller.selectedvariants?.wholeprice != null)?
                                                                        ((salesproductdetailscontroller.selectedvariants?.wholeprice ?? 0) * (salesproductdetailscontroller.sizecount ?? 0) -
              (((salesproductdetailscontroller.selectedvariants?.wholeprice ?? 0) * salesproductdetailscontroller.sizecount! ?? 0) *
                  (salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!) /
                  100)):(((salesproductdetailscontroller.salesproductdetailmodel!.data!.wholePrice ?? 0) * (salesproductdetailscontroller.sizecount ?? 0) -
              (((salesproductdetailscontroller.salesproductdetailmodel!.data!.wholePrice ?? 0) * salesproductdetailscontroller.sizecount! ?? 0) *
                  (salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!) /
                  100)))
          .toDouble()
    

                                                                         );

                                             Get.to(BuyNowAddToCardSaleswhole(
data: foo,
   tax:salesproductdetailscontroller.salesproductdetailmodel!
                                                            .data!
                                                            .tax!
                                             ));
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   PaymentSales(

//                                                     price:
// salesproductdetailscontroller.selectedvariants?.price == null?
//    (
//                                       (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*(salesproductdetailscontroller.sizecount??0)-
//                                     (( (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
//                                     ).toString()
//                                                         :(
//                                       (salesproductdetailscontroller.selectedvariants?.price??0)*(salesproductdetailscontroller.sizecount??0)-
//                                     (( (salesproductdetailscontroller.selectedvariants?.price??0)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
//                                     ).toString(),
//                                                   )));
                                       
                                       
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width *
                                              0.4,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          decoration: BoxDecoration(
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
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
                                                style:
                                                    CustomTextStyle.mediumtextreem,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                       
                                      Spacer(),

                                     GetBuilder<SalesProductDetailsController>(
                  init: salesproductdetailscontroller,
                  builder: (_) {   
                            return      InkWell(
                                        onTap: () async {
// mycartController.adddiscount( 
      
//   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
  
  
//   );
// salesproductdetailscontroller.clearFields();
  salesproductdetailscontroller.fethUserId();
   final storage = GetStorage();
           //   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
        
           //   );
           storage.write('productItemsales', salesproductdetailscontroller.salesproductdetailmodel!.data!.discount??0);
      print("ProductDiscount");
      print(storage.read('productItemsales').toString());
  mycartController.updateTotal();
                                       await salesproductdetailscontroller.addProduct();
                                       mycartController.updateTotal();
                                            mycartController.init();
                                            Get.to(AddToCardSales());

                                          // if ( salesproductdetailscontroller
                                          //                     .isProductInCartBool) {
                                          //                   mycartController.init();
                                          //                  Get.to(AddToCardSales());
                                          //                 } else {
                                          //                   await salesproductdetailscontroller
                                          //                       .addProduct();
                                          //                   await salesproductdetailscontroller
                                          //                       .salesisProductInCart();
                                          //                 }
                                        
                               
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
                                          width: MediaQuery.of(context).size.width *
                                              0.4,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          decoration: BoxDecoration(
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
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
                                                //  salesproductdetailscontroller
                                                                        // .isProductInCartBool
                                                                    // ? "Go To Cart"
                                                                    // :
                                                                    "Add To Cart",
                                                style:
                                                    CustomTextStyle.mediumtextreem,
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
                                     salesproductdetailscontroller.selectedvariants!.stock == 0?
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
                                           salesproductdetailscontroller.salesproductdetailmodel!.data!.name
                                                .toString(),
                                            style: CustomTextStyle.popinstext,
                                          ),
           
           salesproductdetailscontroller.salesproductdetailmodel!.data == null?
                 const SizedBox():
           
                 Form( 
                      key: salesproductdetailscontroller.formKey,
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
             salesproductdetailscontroller
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
             salesproductdetailscontroller
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
                    await salesproductdetailscontroller
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
                                       salesproductdetailscontroller.emailController,
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
                                                     salesproductdetailscontroller.validateForm(context).then(
                                (isValid) async {
                                      if (isValid) {
                                        // print("Valid form");
           
                                        try {
                                            await    salesproductdetailscontroller.addNotify();
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
                                        onTap: ()async {
                                          mycartController. clearFields();
                                      //      salesproductdetailscontroller.fethUserId();
                                      //  await salesproductdetailscontroller.addProduct();
                                      //       mycartController.init();
    MyOrder.Datum foo = MyOrder.Datum(
                                                    
                                                      userId:salesproductdetailscontroller.wholesellerID??0,
                                                      id:salesproductdetailscontroller.salesproductdetailmodel!
                                                                        .data!
                                                                        .id,

                                                      image:salesproductdetailscontroller.salesproductdetailmodel!
                                                                        .data!
                                                                        .image,
                                                                        itemName:salesproductdetailscontroller.salesproductdetailmodel!.data!.name ,
                                                                        variant:
                                                                        (salesproductdetailscontroller.salesproductdetailmodel!.data!.variations!.isEmpty)?"0": (salesproductdetailscontroller
                                                              .selectedvariants!.type != null)?salesproductdetailscontroller
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                                //          salesproductdetailscontroller.selectedvariants!
                                                                // .type.toString(),
                                                                        quantity:(salesproductdetailscontroller.sizecount),
                                                                        price: ((salesproductdetailscontroller.selectedvariants!.wholeprice ?? 0) * (salesproductdetailscontroller.sizecount ?? 0) -
              (((salesproductdetailscontroller.selectedvariants!.wholeprice ?? 0) * salesproductdetailscontroller.sizecount! ?? 0) *
                  (salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!) /
                  100)).toDouble()
    

                                                                         );

                                             Get.to(BuyNowAddToCardSaleswhole(
data: foo,
   tax:salesproductdetailscontroller.salesproductdetailmodel!
                                                            .data!
                                                            .tax!
                                             ));
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   PaymentSales(

//                                                     price:
// salesproductdetailscontroller.selectedvariants?.price == null?
//    (
//                                       (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*(salesproductdetailscontroller.sizecount??0)-
//                                     (( (salesproductdetailscontroller.salesproductdetailmodel!.data!.price!)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
//                                     ).toString()
//                                                         :(
//                                       (salesproductdetailscontroller.selectedvariants?.price??0)*(salesproductdetailscontroller.sizecount??0)-
//                                     (( (salesproductdetailscontroller.selectedvariants?.price??0)*salesproductdetailscontroller.sizecount??0)*(salesproductdetailscontroller.salesproductdetailmodel!.data!.discount!)/100)
//                                     ).toString(),
//                                                   )));
                                       
                                       
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width *
                                              0.4,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          decoration: BoxDecoration(
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
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
                                                style:
                                                    CustomTextStyle.mediumtextreem,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                       
                                      Spacer(),

                                     GetBuilder<SalesProductDetailsController>(
                  init: salesproductdetailscontroller,
                  builder: (_) {   
                            return      InkWell(
                                        onTap: () async {
// mycartController.adddiscount( 
      
//   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
  
  
//   );
// salesproductdetailscontroller.clearFields();
  salesproductdetailscontroller.fethUserId();
   final storage = GetStorage();
           //   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
        
           //   );
           storage.write('productItemsales', salesproductdetailscontroller.salesproductdetailmodel!.data!.discount??0);
      print("ProductDiscount");
      print(storage.read('productItemsales').toString());
  mycartController.updateTotal();
                                       await salesproductdetailscontroller.addProduct();
                                       mycartController.updateTotal();
                                            mycartController.init();
                                            Get.to(AddToCardSales());

                                          // if ( salesproductdetailscontroller
                                          //                     .isProductInCartBool) {
                                          //                   mycartController.init();
                                          //                  Get.to(AddToCardSales());
                                          //                 } else {
                                          //                   await salesproductdetailscontroller
                                          //                       .addProduct();
                                          //                   await salesproductdetailscontroller
                                          //                       .salesisProductInCart();
                                          //                 }
                                        
                               
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
                                          width: MediaQuery.of(context).size.width *
                                              0.4,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          decoration: BoxDecoration(
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
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
                                                //  salesproductdetailscontroller
                                                                        // .isProductInCartBool
                                                                    // ? "Go To Cart"
                                                                    // :
                                                                    "Add To Cart",
                                                style:
                                                    CustomTextStyle.mediumtextreem,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                  })
                               
                                ],
                              ),
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
    );
  }

}