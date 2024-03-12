
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salesmanFilterController.dart';
import 'package:pet/controllers/salesman_controller/salessubcateogries_controller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/subcateogries_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/salesman/salesmanFilterUI.dart';
import 'package:pet/screens/salesman/salesmanSearachScreen.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/user/filterScreen.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/searchScreen.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class SalesAlltoyPage extends StatefulWidget {
  const SalesAlltoyPage( {super.key});

  @override
  State<SalesAlltoyPage> createState() => _SalesAlltoyPageState();
}

class _SalesAlltoyPageState extends State<SalesAlltoyPage> {
    // SubCategoryController subcategorycontroller = Get.put(SubCategoryController());
  TextEditingController _searchcontroller = TextEditingController();
  //   final HomeuserController homeusercontroller = Get.put(HomeuserController());
  // ProductDetailsController productdeatilscontroller =
  SalesMyCartController addtocartController = Get.put(SalesMyCartController());
   SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());
      final SalesSubCategoryController salessubcategorycontroller =
      Get.put(SalesSubCategoryController());
       final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:CustomAppBarSalesWholeback(title:"All Toys"),


        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            shrinkWrap: true,
            children: [

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 265,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(17),

                            // border: Border.all(color:brandcolor ),

                            color: MyColors.white,
                          ),
                          child: TextFormField( onTap: () {
                          homesalecontroller.clearSearchData();
                          Get.to(SalesManSearchScreen());
                        },
                        readOnly: true,
                            controller: _searchcontroller,
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

                        //  SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            // Get.to(FilterScreen());
                        SalesManFilterController filtercontroller =
                            Get.put(SalesManFilterController());
                        // filtercontroller.init();
                        filtercontroller.loadDefaultData();
                        filtercontroller.clearFields();
                        // Get.to(FilterScreen());
                        Get.to(SalesManFilterScreenUI());
                          },
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffcc00)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/image/filter3.png",
                                ),
                              )),
                        )
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
     
                    GetBuilder<SalesSubCategoryController>(
                        init: salessubcategorycontroller,
                        builder: (_) {
                          return
                            salessubcategorycontroller.salestoyModel == null ||
                                salessubcategorycontroller.salestoyModel!.data ==
                                    null ||
                                salessubcategorycontroller
                                    .salestoyModel!.data!.isEmpty
                            ? SizedBox()
                            :
                          
                           GridView.builder(
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
                              itemCount: salessubcategorycontroller
                                      .combinedList.length,
                                  // .clamp(0, 4),
                              itemBuilder: (BuildContext ctx, index) {
                                var item = salessubcategorycontroller
                                      .combinedList![index];

                                var imagePath =
                                    "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                return salessubcategorycontroller
                                                .salestoyModel ==
                                            null ||
                                        salessubcategorycontroller
                                                .salestoyModel!.data ==
                                            null  
                                    ? SizedBox()
                                    : 
                                    
                                                    InkWell(

onTap: ()async{
   salesProductDetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print(
                                                    "productid${item.id ?? 0}");
                                                await salesProductDetailsController
                                                    .init();
                                                Get.to(ProductDetailssale());
},                                                      child: Container(
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
                                                                        init: homesalecontroller,
                                                                        builder: (_) {
                                                         return InkWell(
                                                            onTap: () {
                                                              homesalecontroller
                                                                  .fethUserId();
                                                              homesalecontroller
                                                                  .addItemToWishList(
                                                                      item.id!);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Align(
                                                                  alignment: Alignment
                                                                      .centerRight,
                                                                  child: Icon(homesalecontroller
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
),  SizedBox(height: 5),
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
                                                                              "₹ ${((double.parse( item.wholePrice ?? '')) - ((double.parse( item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                                                    
                                                                              // "₹" +
                                                                              //      item.wholePrice!,
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
                                                                                     addtocartController.init();
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
                                                    );
                                         
                                    // Container(
                                    //     // height:
                                    //     //     MediaQuery.of(context).size.width *
                                    //     //         0.7,
                                    //     // width: MediaQuery.of(context).size.width * 0.46,
                                    //     decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(25),
                                    //       color: MyColors.white,
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color:
                                    //               Colors.grey.withOpacity(0.3),
                                    //           spreadRadius: 3,
                                    //           blurRadius: 7,
                                    //           offset: Offset(
                                    //               0, 3), // Offset of the shadow
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     child: Column(
                                    //       children: [
                                    //         Stack(
                                    //           children: [
                                    //             Container(
                                    //               height: 125,

                                    //               // decoration: BoxDecoration(
                                    //               //     borderRadius: BorderRadius.circular(30),
                                    //               //     color: MyColors.white),
                                    //               child: Center(
                                    //                 child: CachedNetworkImage(
                                    //                   imageUrl: imagePath,
                                    //                   // width: 61,
                                    //                   // height: 75,
                                    //                   placeholder:
                                    //                       (context, url) =>
                                    //                           Center(
                                    //                     child:
                                    //                         CircularProgressIndicator(),
                                    //                   ), // Replace with your own placeholder widget
                                    //                   errorWidget: (context,
                                    //                           url, error) =>
                                    //                       Icon(Icons
                                    //                           .error), // Replace with your own error widget
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             InkWell(
                                    //               onTap: () {
                                    //                 homesalecontroller
                                    //                     .addItemToWishList(
                                    //                         homesalecontroller
                                    //                             .salesPropertiesModel!
                                    //                             .data![index]
                                    //                             .id!);
                                    //               },
                                    //               child: Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(
                                    //                         8.0),
                                    //                 child: Align(
                                    //                     alignment:
                                    //                         Alignment.topRight,
                                    //                     child: Icon(homesalecontroller
                                    //                             .wishListItemsId
                                    //                             .contains(homesalecontroller
                                    //                                 .salesPropertiesModel!
                                    //                                 .data![
                                    //                                     index]
                                    //                                 .id!)
                                    //                         ? Icons.favorite
                                    //                         : Icons
                                    //                             .favorite_border,color:Colors.red)),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),

                                    //         // SizedBox(height: 15,),

                                    //         Padding(
                                    //           padding:
                                    //               const EdgeInsets.all(5.0),
                                    //           child: Column(
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.start,
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Text(item.name ?? '',
                                    //                   style: CustomTextStyle
                                    //                       .popinsmedium),
                                    //               Text(
                                    //                   item.description
                                    //                       .toString(),
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
                                    //                                item.wholePrice ??
                                    //                                   '',
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
                                    //                                   "Save${item.discount ?? ''}",
                                    //                                   style: CustomTextStyle
                                    //                                       .popinstextsmal2222),
                                    //                             ),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                       SizedBox(height: 5),
                                    //                       Text(
                                    //                         "₹ ${((double.parse( item.wholePrice ?? '')) - ((double.parse( item.wholePrice ?? "")) * (double.parse(item.discount ?? "")) / 100)).toDouble()}",

                                    //                         // "₹ ${((int.parse( item.wholePrice ?? '0')) - ( (int.parse( item.wholePrice ?? "0"))*(int.parse(item.discount ?? "0")) / 100)).toString()}",
                                    //                         // "₹ ${(( item.wholePrice!) -(( item.wholePrice!)*(item.discount!))/100).toString()}",
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
                                    //       ],
                                    //     ),
                                    //   );
                             
                             
                              });
                        }),
                 
     ],
          ),
        )
 
    
    );
  }
}