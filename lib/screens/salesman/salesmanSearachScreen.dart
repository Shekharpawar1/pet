import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class SalesManSearchScreen extends StatelessWidget {
  SalesManSearchScreen({super.key});
  final HomeSalesController homesalescontroller = Get.put(HomeSalesController());
  TextEditingController textController = TextEditingController();
  SalesMyCartController mycartController = Get.put(SalesMyCartController());
   SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Search",
         style: CustomTextStyle.appbartext,
        ),
        centerTitle: true,
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
        // actions: [
        //   GestureDetector(
        //                 onTap: () {
        //                   FilterController filtercontroller =
        //                       Get.put(FilterController());
        //                   filtercontroller.init();
        //                   Get.to(FilterScreen());
        //                 },
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: Container(
        //                       width: 45,
        //                       height: 25,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(15),
        //                           color: Color(0xffffcc00)),
        //                       child: Padding(
        //                         padding: const EdgeInsets.all(10.0),
        //                         child: Image.asset(
        //                           "assets/image/filter3.png",
        //                         ),
        //                       )),
        //                 ),
        //               )
        // ],
      ),
      body: GetBuilder<HomeSalesController>(
        init: homesalescontroller,
        builder: (_) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            shrinkWrap: false,
            children: [
              // SizedBox(height: Get.height * 0.01),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20, top: 15.0),
                child: Container(
                  // height: 45,
                  width: Get.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // Offset of the shadow
                      ),
                    ],
                    // border: Border.all(color:brandcolor ),

                    color: MyColors.white,
                  ),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (value) {
                      homesalescontroller.searchDataFilter(
                          homesalescontroller.salesPropertiesModel,
                          value.trim().toString());
                    },
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.voliet,
                      fontFamily: "SF-Pro-Display",
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        fillColor: MyColors.white,
                        focusColor: MyColors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          //  borderRadius: BorderRadius.circular(50),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          //  borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: "Search",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/image/searchnormal.png",
                            width: 10,
                          ),
                        ),
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              // SizedBox(height: Get.height * 0.01),
              // TextField(
              //   onChanged: (value) {
              //     homesalescontroller.searchDataFilter(
              //         homesalescontroller.userPropertiesModel,
              //         value.trim().toString());
              //   },
              // ),
              homesalescontroller.searchScreenData.isEmpty
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0,
                                  mainAxisExtent: 285),
                          itemCount: homesalescontroller.searchScreenData
                              .length, // Set the number of cards you want to display.
                          itemBuilder: (context, index) {
                            // gridDelegate:
                            //     SliverGridDelegateWithMaxCrossAxisExtent(
                            //         maxCrossAxisExtent: 150,
                            //      childAspectRatio: 3 / 2,
                            //         mainAxisExtent: 285,
                            //         crossAxisSpacing: 15,
                            //         mainAxisSpacing: 15),
                            // itemCount: homesalescontroller
                            //     .userPropertiesModel!.data!.length
                            //     .clamp(0, 4),
                            // itemBuilder: (BuildContext ctx, index) {

                            var item =
                                homesalescontroller.searchScreenData![index];
                            String imagePath =
                                Constants.PRODUCT_HOME_IMAGE_PATH +
                                    "/${item.image!}";

                            // var imagePath =
                            //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                            // print(imagePath);
                            return InkWell(
                              onTap: () async {
                                 SalesProductDetailsController
                                      salesProductDetailsController =
                                      Get.put(SalesProductDetailsController());
                                  salesProductDetailsController.viewproduct(
                                    item.id ?? 0,
                                  );
                                  print("productid${item.id ?? 0}");
                                  await salesProductDetailsController.init();
                                  Get.to(ProductDetailssale());
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
                      
                      
                         GetBuilder<HomeSalesController>(
                        init: homesalescontroller,
                        builder: (_) {
                           return InkWell(
                                                              onTap: () {

                                                                homesalescontroller
                                                                    .fethUserId();
                                                          homesalescontroller
                                              .addItemToWishList(
                                                  item.id!);
                                                                         

                                                            homesalescontroller.init();
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8.0),
                                                                child: Align(
                                                                    alignment: Alignment
                                                                        .centerRight,
                                                                    child: Icon(homesalescontroller
                                                                            .wishListItemsId
                                                                            .contains(
                                                                                item
                                                                                    .id!)
                                                                        ? Icons.favorite
                                                                        : Icons
                                                                            .favorite_border,color:Colors.red)),
                                                              ),
                                                            );
                         }
                       ),
                      
                            //  InkWell(
                            //                                                 onTap: () {
                            //                                                   wholehomecontroller
                            //                                                       .addItemToWishList(
                            //                                                           item.id!);
                            //                                                 },
                            //                                                 child: Padding(
                            //                                                   padding:
                            //                                                       const EdgeInsets.all(
                            //                                                           8.0),
                            //                                                   child: Align(
                            //                                                       alignment: Alignment
                            //                                                           .centerRight,
                            //                                                       child: Icon(wholehomecontroller
                            //                                                               .wishListItemsId
                            //                                                               .contains(
                            //                                                                   item.id!)
                            //                                                           ? Icons.favorite
                            //                                                           : Icons
                            //                                                               .favorite_border,color:Colors.red)),
                            //                                                 ),
                            //                                               ),
                                      
                                                    
                                                    
                      
                      
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
),   
                                                               
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
                                                                        
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
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
                                                                                "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                      
                                                                                // "₹" +
                                                                                //     item.wholePrice!,
                                                                                style:
                                                                                    CustomTextStyle.popinsmedium,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                                width:
                                                                                    Get.width * 0.054),
                                                                            InkWell(
                                                                                   onTap: () async{
                                                                salesProductDetailsController.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.wholePrice ?? ''),(item.image??'').toString(),"yes");
                                                                              
                                                                                        await salesProductDetailsController.addProductHome();
                                                                                     mycartController.init();
                                                                             
                                                                           
                                                                                },
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets.only(right: 5.0),
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
                              //           offset: Offset(
                              //               0, 3), // Offset of the shadow
                              //         ),
                              //       ],
                              //       // color: MyColors.white
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         // InkWell(
                              //         //   onTap: () {
                              //         //     homesalescontroller
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
                              //         //         child: Icon(homesalescontroller
                              //         //                 .wishListItemsId
                              //         //                 .contains(
                              //         //                     item.id!)
                              //         //             ? Icons.favorite
                              //         //             : Icons
                              //         //                 .favorite_border,color:Colors.red)),
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
                              //                     style: CustomTextStyle
                              //                         .popinsmedium),
                              //                 Text(
                              //                     item.description
                              //                                 .toString()
                              //                                 .length <
                              //                             18
                              //                         ? item.description!
                              //                         : item.description!
                              //                             .substring(0, 19),
                              //                     style: CustomTextStyle
                              //                         .popinssmall0),
                              //                 SizedBox(height: 5),
                              //                 Row(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment
                              //                           .spaceBetween,
                              //                   children: [
                              //                     Column(
                              //                       crossAxisAlignment:
                              //                           CrossAxisAlignment
                              //                               .start,
                              //                       children: [
                              //                         Row(
                              //                           children: [
                              //                             Text(
                              //                                 "₹" +
                              //                                     item.wholePrice
                              //                                         .toString(),
                              //                                 style: CustomTextStyle
                              //                                     .discounttext),
                              //                             SizedBox(width: 10),
                              //                             Container(
                              //                               height: 20,
                              //                               width: 40,
                              //                               decoration: BoxDecoration(
                              //                                   color: MyColors
                              //                                       .red,
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
                              //                           "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                              //                           // "₹" +
                              //                           //     item.wholePrice!,
                              //                           style: CustomTextStyle
                              //                               .popinsmedium,
                              //                         ),
                              //                       ],
                              //                     ),

                              //                     Padding(
                              //                       padding:
                              //                           const EdgeInsets.only(
                              //                               right: 5.0),
                              //                       child: Container(
                              //                           width: 35,
                              //                           height: 35,
                              //                           decoration: BoxDecoration(
                              //                               borderRadius:
                              //                                   BorderRadius
                              //                                       .circular(
                              //                                           10),
                              //                               color: Color(
                              //                                   0xffffcc00)),
                              //                           child: Padding(
                              //                             padding:
                              //                                 EdgeInsets.all(
                              //                                     5.0),
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
            ],
          );
        },
      ),
    );
  }
}
