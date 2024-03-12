import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pet/models/usersModel/ProductDetailsModel.dart' as suggestions;
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart';
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
import 'package:share_plus/share_plus.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, this.id, this.image});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  // dynamic itemdetails;
  final int? id;

  String? image;
  final List kg = [1, 2, 5];
  final MyCartController mycartController = Get.put(MyCartController());
  final MyOrderController myordercontroller = Get.put(MyOrderController());
  final ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());

  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());

 
  @override
  void onInit() {
  
      productdetailscontroller.init();
      productdetailscontroller.suggestioninit();
      
  }

  @override
  Widget build(BuildContext context) {
    // productdetailscontroller.isProductInCart();
print("IDgDDD ${id}");
    return Stack(
      children: [
        Scaffold(
           appBar:CustomAppBarback(title:"Product Details"),
            body: 
         
           RefreshIndicator(
            
            onRefresh: () async {
                 UserReviewController userreviewController = Get.put(UserReviewController());
 
                await userreviewController.init();
                                                   
                         await     productdetailscontroller.init();
                           await  productdetailscontroller.suggestioninit();
             },
             child: ListView( physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
               
              shrinkWrap: true,
              primary: true,
              children: [
                 (productdetailscontroller.productdetailmodel == null  )
              
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
                        return   productdetailscontroller.productdetailmodel == null  ? const SizedBox():
                         Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: MyColors.lightbg,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(500))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: productdetailscontroller.productdetailmodel!.data!.images ==[]||productdetailscontroller.productdetailmodel!.data!.images == null||productdetailscontroller.productdetailmodel!.data!.images!.isEmpty?
                                 FullScreenWidget(
                                                  disposeLevel:
                                                      DisposeLevel.High,
                                    child: CachedNetworkImage(
                                                                  imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.image.toString()}",
                                                                  // width: 61,
                                                                  // height: 75,

                                                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                                                  ), // Replace with your own placeholder widget
                                                                  errorWidget: (context, url, error) => const Icon(Icons
                                      .error), // Replace with your own error widget
                                                                ),
                                  )
                            :
                               FullScreenWidget(
                                                  disposeLevel:
                                                      DisposeLevel.High,
                                 child: CachedNetworkImage(
                                  imageUrl: "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller.productdetailmodel!.data!.images![productdetailscontroller.selectImages??0].toString()}",
                                  // width: 61,
                                  // height: 75,

                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ), // Replace with your own placeholder widget
                                  errorWidget: (context, url, error) => const Icon(Icons
                                      .error), // Replace with your own error widget
                                                             ),
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
                    


                  
              
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                productdetailscontroller.productdetailmodel == null
                    ? const SizedBox()
                    : 
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                    GetBuilder<ProductDetailsController>(
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
                               
                            return Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    ? Center(child: const Text("No Related Image"))
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
                                                            print("Image"+ "${Constants.BASE_URL}//storage/app/public/product/${e}");
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
                                                                  imageUrl:  "${Constants.BASE_URL}//storage/app/public/product/${e}",
                                                                      // "${Constants.BASE_URL}/storage/app/public/product/${e.replaceAll("\\", "")}",
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
                                       
                                        
                                       
                                      ),
                             // Spacer(),
                              ],
                            );
                          }),
                                   
                    
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
                               
                      ]),
                    ),
         
              // productdetailscontroller.productdetailmodel == null ||  productdetailscontroller.productdetailmodel!.data == null 
              //       ? const SizedBox()
              //       :
                     
                     GetBuilder<ProductDetailsController>(
                        init: productdetailscontroller,
                        builder: (_) {

                          // final variations = productdetailscontroller
                          //     .productdetailmodel!.data!.variations!.length;
                            
                          return 
                          
                              

                                      (productdetailscontroller.productdetailmodel == null )?
                                      SizedBox(

             ):
                            
                              Padding(
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
                                             

(
  
                                              productdetailscontroller
                                                              .productdetailmodel!
                                                              .data!
                                                              .variations ==
                                                          [] || productdetailscontroller
                                                              .productdetailmodel!
                                                              .data!
                                                              .variations!.isEmpty
                                                      )
                                                  
                                                  ? Text("No Variants")
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
                                                 
                                                            onChanged: (variantFile
                                                                    .Variations?
                                                                variants) async {
                                                              await productdetailscontroller
                                                                  .updateVariants(
                                                                      variants!);
                                                            },
                                                            
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
                                                       (productdetailscontroller.productdetailmodel!.data!.discount == 0)?
                                                            const SizedBox():
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
                                                                                  0).toInt()}",
           
                                                                  //  (     (productdetailscontroller.productList.price)! * (productdetailscontroller.productList.discount!)/100).toString()
           
                                                                  style: CustomTextStyle
                                                                      .discounttext)
                                                              : Text(
                                                                  "₹${(productdetailscontroller.selectedvariants?.price ??
                                                                                  0) *
                                                                              (productdetailscontroller.sizecount ??
                                                                                  0).toInt()}",
           
                                                                  //  (     (productdetailscontroller.productList.price)! * (productdetailscontroller.productList.discount!)/100).toString()
           
                                                                  style: CustomTextStyle
                                                                      .discounttext),
                                                          const SizedBox(width: 3),
                                                          
                                                           
                                                          Text(
                                                              "Save${productdetailscontroller.productdetailmodel!.data!.discount!.toString()}%",
                                                              style: CustomTextStyle
                                                                  .popinstextsmal2222red)
                                                         
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
                                                                      .toInt().toString(),
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
                                                                              100)).toInt()
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
                                      Expanded(
                                        child: Text(
                                          productdetailscontroller
                                              .productdetailmodel!.data!.name
                                              .toString(),
                                               maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyle.popinstext,
                                        ),
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
                                      Expanded(
                                        child: Text(
                                          productdetailscontroller
                                              .productdetailmodel!.data!.petsbreedsId
                                              .toString(),
                                               maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                          style: CustomTextStyle.popinstext,
                                        ),
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
            userreviewcontroller
                                                      .userReviewModel ==null?const SizedBox():
               GetBuilder<UserReviewController>(
                                      init: userreviewcontroller,
                                      builder: (_) {
                                        return  userreviewcontroller
                                                      .userReviewModel ==
                                                  null &&
                                              userreviewcontroller
                                                      .userReviewModel!.data ==
                                                  null
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
                                               animationDuration: const Duration(
                                                   milliseconds: 5000),
                                               
                                               starOffColor:
                                                   const Color(0xffe7e8ea),
                                               starColor: MyColors.yellow,
                                             ),
                                             const SizedBox(width: 10),
                                            
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
                               
                             
                                 
                                
                                 
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.04),
           
                                  Container(
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
                                                  (productdetailscontroller.productdetailmodel!.data!.discount == 0)?
                                                        const SizedBox():
                                              (productdetailscontroller.productdetailmodel!.data!.variations == []||productdetailscontroller
                                                          .selectedvariants
                                                          ?.price ==
                                                      null)
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
                                            
                                               (productdetailscontroller.productdetailmodel!.data!.discount == 0)?
                                                        const SizedBox():
                                                   Text(
                                                      "Save${productdetailscontroller.productdetailmodel!.data!.discount.toString()}%",
                                                      style: CustomTextStyle
                                                          .popinstextsmal2222red),
                                            
                                              const SizedBox(width: 10),
                                              (productdetailscontroller.productdetailmodel!.data!.variations == [] || productdetailscontroller
                                                          .selectedvariants
                                                          ?.price ==
                                                      null)
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
                                                              .toInt().toString(),
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
                                                            .toInt() .toString(),
                                                      // (widget.itemdetails.price),
                                                      style: CustomTextStyle
                                                          .appbartext),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
         
          
(productdetailscontroller.productdetailmodel!.data!.variations!.isEmpty)?
          Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      int store_Id=productdetailscontroller.productdetailmodel!.data!.storeId  ?? 0;
                                                    print("store_id${productdetailscontroller.productdetailmodel!.data!.storeId}");
                                                       mycartController.clearFields();
                 mycartController.updateTotal();
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
                                                          variant: (productdetailscontroller.productdetailmodel!.data!.variations!.isEmpty)?"0": (productdetailscontroller
                                                              .selectedvariants!.type != null)?productdetailscontroller
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                          quantity:
                                                              (productdetailscontroller
                                                                  .sizecount),
                                                          price:

                                                          (productdetailscontroller.selectedvariants?.price != null)?
                                                          ((productdetailscontroller.selectedvariants?.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
                                                              (((productdetailscontroller.selectedvariants?.price ?? 0) *
                                                               productdetailscontroller.sizecount! ?? 0) * 
                                                               (productdetailscontroller.productdetailmodel!.data!.discount!) / 100)):
                                                               (((productdetailscontroller.productdetailmodel!.data!.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
              (((productdetailscontroller.productdetailmodel!.data!.price ?? 0) *productdetailscontroller. sizecount! ?? 0) *
                  (productdetailscontroller.productdetailmodel!.data!.discount!) /
                  100))).toDouble());
                                                          //  ((productdetailscontroller.selectedvariants?.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
                                                          //     (((productdetailscontroller.selectedvariants?.price ?? 0) * productdetailscontroller.sizecount! ?? 0) * (productdetailscontroller.productdetailmodel!.data!.discount!) / 100)));
           
                                                      Get.to(BuyNowAddToCardUser(
                                                          data: foo,storeid:store_Id));
                                                        //   tax: (productdetailscontroller.selectedvariants?.price)!* 0.05.toInt()));
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


           final storage = GetStorage();
        
           storage.write('productItem', productdetailscontroller.productdetailmodel!.data!.discount??0);
      print("ProductDiscount");
      print(storage.read('productItem').toString());
  mycartController.updateTotal();
                                                           
                                                                         await productdetailscontroller
                                                                  .addProduct();
                                                              mycartController.init();
                                                            mycartController.updateTotal();

                                                    
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
                                         
                                
                                        : Column(
                                           children: [
                                             (    productdetailscontroller.selectedvariants!.stock == 0)?
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
              child: productdetailscontroller.productdetailmodel!.data!.variations== []?SizedBox():
               Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
               color: MyColors.grey),
                    color: const Color.fromRGBO(
               255, 255, 255, 0.10),
                  
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
          
                  onChanged:
             (variantFile.Variations?
                 variants) async {
                    await productdetailscontroller
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
                                        // Get.back();
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
                       :   Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
int store_id=     productdetailscontroller.productdetailmodel!
    .data!
    .storeId ?? 0;
                                                      print("store_Id ${productdetailscontroller.productdetailmodel!
                                                          .data!
                                                          .storeId.toString()}");
                                                       mycartController.clearFields();
                 mycartController.updateTotal();
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
                                                          variant: (productdetailscontroller.productdetailmodel!.data!.variations!.isEmpty)?"0": (productdetailscontroller
                                                              .selectedvariants!.type != null)?productdetailscontroller
                                                              .selectedvariants!
                                                              .type
                                                              .toString():"",
                                                          quantity:
                                                              (productdetailscontroller
                                                                  .sizecount),
                                                          price: 
                                                          (productdetailscontroller.selectedvariants?.price != null)?
                                                          ((productdetailscontroller.selectedvariants?.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
                                                              (((productdetailscontroller.selectedvariants?.price ?? 0) *
                                                               productdetailscontroller.sizecount! ?? 0) * 
                                                               (productdetailscontroller.productdetailmodel!.data!.discount!) / 100)):
                                                               (((productdetailscontroller.productdetailmodel!.data!.price ?? 0) * (productdetailscontroller.sizecount ?? 0) -
              (((productdetailscontroller.productdetailmodel!.data!.price ?? 0) *productdetailscontroller. sizecount! ?? 0) *
                  (productdetailscontroller.productdetailmodel!.data!.discount!) /
                  100))).toDouble());
                                                              
                                                              
           
                                                      Get.to(BuyNowAddToCardUser(
                                                          data: foo,storeid:store_id
                                                          ));
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
//                                                        


           final storage = GetStorage();
        
           storage.write('productItem', productdetailscontroller.productdetailmodel!.data!.discount??0);
      print("ProductDiscount");
      print(storage.read('productItem').toString());
  mycartController.updateTotal();
                                                           
                                                                         await productdetailscontroller
                                                                  .addProduct();
                                                              mycartController.init();
                                                            mycartController.updateTotal();

                                                    
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





                                         
            ]
                                         )  ,



                                              
           
                                     ] ),
                                      )
                                  ),
                                  



                                  
SizedBox(height: 20,),

(  productdetailscontroller.productdetailmodel == null|| productdetailscontroller.productdetailmodel!.data!.suggestionProduct!.isEmpty || productdetailscontroller.productdetailmodel!.data!.suggestionProduct == [])?
SizedBox():
                                              Column(
crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                             


          
                 Container(
                   decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
                   child:Padding(
                     padding: const EdgeInsets.only(top:15.0,bottom: 15,right:8,left:8),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                   
                   
                        Text("Frequently Bought Together", 
                                                    style: CustomTextStyle.popinstext,),
                   
                                                                       
                   SizedBox(height: 15,),
                   GridView.builder(
                         primary: false,
                         shrinkWrap: true,
                        //  scrollDirection: Axis.vertical,
                         physics:
                             const NeverScrollableScrollPhysics(),
                         gridDelegate:
                             const SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 3,
                                 crossAxisSpacing: 10.0,
                                 mainAxisSpacing: 10.0,
                                mainAxisExtent: 160 ),
                         itemCount: productdetailscontroller
                             .productdetailmodel!.data!.suggestionProduct!.length,
                            //  .clamp(0,
                            //      4), // Set the number of cards you want to display.
                         itemBuilder: (context, index) {
                          
                                    
                           var item = productdetailscontroller
                             .productdetailmodel!.data!.suggestionProduct![productdetailscontroller
                             .productdetailmodel!.data!.suggestionProduct!.length -
                                  1 -
                                  index];
                           String imagePath = Constants
                                   .PRODUCT_HOME_IMAGE_PATH +
                               "/${item.image!}";
                                    
                         
                           return GestureDetector(
                             onTap: () async {
                                // productdetailscontroller.dispose();
                               productdetailscontroller
                                   .viewproduct(
                                 item.id ?? 0,
                               );
                                    
                               await productdetailscontroller
                                   .suggestioninit();
                              
                             },
                             child: Container(
                             
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   colors: [
                                    
                                     MyColors.white,
                                     MyColors.white,
                                    
                                   ],
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                 ),
                                 borderRadius:
                                     BorderRadius.circular(25),
                                 
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
                               ),
                               child: Column(
                                 children: [
                                    
                                    
                                    
                                   Container(
                                    //  height: 125,
                                 
                                     child: CachedNetworkImage(
                                       imageUrl: imagePath,
                                       width: 50,
                                       height: 50,
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
                                    
                                    
                                   Container(
                                     child: Padding(
                                       padding:
                                           const EdgeInsets
                                                       .only(
                                               left: 10.0,
                                               top: 5),
                                       child: Column(
                                         mainAxisAlignment:
                                             MainAxisAlignment
                                                 .start,
                                         crossAxisAlignment:
                                             CrossAxisAlignment
                                                 .start,
                                         children: [
                                           Text( item.name??'',
                                                             
                                                                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                                               style: CustomTextStyle
                                                       .popinsmedium),
                                           Text(
                                               item.description
                                                               .toString()
                                                               .length <
                                                           10
                                                       ? item
                                                           .description!
                                                       : item
                                                           .description!
                                                           .substring(
                                                               0,
                                                               19),
                     maxLines: 1, 
                     overflow: TextOverflow.ellipsis,
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
                                                             (item.discount !="0.00"&& item.discount !=0 &&item.discount !="0.0")?
                                                 
                                                       Column( crossAxisAlignment:
                                                         CrossAxisAlignment
                                                             .start,
                                                         children: [
                                                           Text(
                                                               "₹" +
                                                                   item.price.toString(),
                                                               style: CustomTextStyle.discounttext),
                                                          //  SizedBox(
                                                          //      width:
                                                          //          2),
                                                           
                                                            // SizedBox(width:3),
                                                           Text(
                                                               // item.discount.toString(),
                                                                 "Save${((item.discount??0).toInt()).toStringAsFixed(0)}%",
                                                               style:
                                                                   CustomTextStyle.popinstextsmal2222red),
                                                           //   ),
                                                           // ),
                                                         ],
                                                       ):const  SizedBox(),
                                                       SizedBox(
                                                           height:
                                                               3),
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
                                     "₹${((item.price??0) - ((item.price??0)* ((item.discount??0) / 100))).toInt().toString()}",
                                     
                                                               style:
                                                                   CustomTextStyle.popinsmedium,
                                                             ),
                                                           ),
                                                          
                                                         ],
                                                       ),
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
                             ),
                          
                           );
                         }),

                             
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Total",style: CustomTextStyle.popinstext,),
                              Text(
                                                                     "₹ ${productdetailscontroller
                             .total.toString()}",

                                style: CustomTextStyle.popinstext,),
                           ],
                         ),
                   
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
                                 primary: MyColors.yellow, // Set the background color to yellow
                               ),
                               onPressed: () async {
// List<SuggestionProduct> suggestionProducts = [];
// // SuggestionProduct suggestionProduct = SuggestionProduct();
// Map<String, dynamic> requestData;

 await productdetailscontroller.addProductCombo();



                                                              mycartController.init();
                                                            mycartController.updateTotal();

                               },
                               child: Text('Add plan',style: CustomTextStyle
                                                                        .mediumtextreem,),
                             ),
                          
                       ],
                     ),
                   )
                   
                     ]),
                   )
                    
            
                 ),




],
                                              ),
              

                                  ],
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


void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}