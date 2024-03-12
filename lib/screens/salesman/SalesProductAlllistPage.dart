import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/productdetails.dart';

class SalesProductAlllistPage extends StatefulWidget {
  const SalesProductAlllistPage({super.key});

  @override
  State<SalesProductAlllistPage> createState() => _SalesProductAlllistPageState();
}

class _SalesProductAlllistPageState extends State<SalesProductAlllistPage> {
  final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
    TextEditingController _searchcontroller = TextEditingController();
   SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());
        SalesMyCartController mycartController = Get.put(SalesMyCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: 
        CustomAppBarSalesWholeback(
          title: "All Products",
        )
        
//         AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           leading: Padding(
//             padding: EdgeInsets.only(left: 5.0, top: 10, bottom: 10, right: 0),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(
//                 Icons.arrow_back_ios,
//                 color: MyColors.black,
//                 size: 20,
//               ),
//             ),
//           ),
//           title: Center(
//               child: Text(
//             "All Products",
//             style: CustomTextStyle.appbartext,
//           )),
        
//     actions: [
        

                  
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                      Get.to(const NotificationUser());
//                   },
//                   child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

                  
//                       ],
//                     )),


//             ],
//           ),
    
//                 SizedBox(width: 20),
//  Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                       Get.to(const AddToCardUser());
                   
//                   },
//                   child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

                  
//                       ],
//                     )),


//             ],
//           ),
    
//     SizedBox(width: 20,)
    
//         ], 
       
//         ),
     
     
       , body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            shrinkWrap: true,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height*0.02),
 Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,          
          children: [

          Container(
             height:45,
          width:265,
                   decoration: BoxDecoration(
          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(17),
          
                        // border: Border.all(color:brandcolor ),
          
             color:MyColors.white,
       
          
                    ),
          
           
            
            child: TextFormField(
                                  controller: _searchcontroller,
                                                style: TextStyle(fontSize: 14,color: MyColors.voliet, fontFamily: "SF-Pro-Display",),
          
                               decoration: InputDecoration(
                                     
                                       contentPadding: EdgeInsets.only(left: 15),
                                      fillColor:MyColors.white,
                                      focusColor:MyColors.white,
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
                                      hintText:"Search",
                                      prefixIcon:Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset("assets/image/searchnormal.png",width: 10,),
                                      ),
                                    
                                      hintStyle:
                                      TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                      
                                      ),
                                ),
          ),
     
    //  SizedBox(width: 10,),
     GestureDetector(
       onTap: () {
                   FilterController filtercontroller = Get.put(FilterController());
filtercontroller.init();
                        Get.to(FilterScreen());
                    },
       child: Container(width: 45,
     height: 45,
     decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(15),
     color: Color(0xffffcc00)),
     child: Padding(
       padding: const EdgeInsets.all(10.0),
       child:   Image.asset("assets/image/filter3.png",),
     )),
     )

         ],),
     
     
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              !homesalecontroller.propertyLoaded
                  ? SizedBox()
                  : Container(
                          //  height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
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
                              itemCount: homesalecontroller
                                  .salesPropertiesModel!.data!.length
                                 , // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                // gridDelegate:
                                //     SliverGridDelegateWithMaxCrossAxisExtent(
                                //         maxCrossAxisExtent: 150,
                                //      childAspectRatio: 3 / 2,
                                //         mainAxisExtent: 285,
                                //         crossAxisSpacing: 15,
                                //         mainAxisSpacing: 15),
                                // itemCount: homesalecontroller
                                //     .userPropertiesModel!.data!.length
                                //     .clamp(0, 4),
                                // itemBuilder: (BuildContext ctx, index) {
                                var item = homesalecontroller
                                    .salesPropertiesModel!.data![index];

                                 
                                var imagePath =
                                       "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                
                                return InkWell(
                                  onTap: () async{
                                      salesProductDetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print(
                                                    "productid${item.id ?? 0}");
                                                await salesProductDetailsController
                                                    .init();
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

                    


                                                    Container(
                                                      height: 125,
                                                      decoration: BoxDecoration(
                                                         
                                                          ),
                                                      child: CachedNetworkImage(
                                                        imageUrl: imagePath,
                                                      
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ), 
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
                                         
                                  //  Container(
                                  //   width: 140,
                                  //   // height: 700,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(25),
                                  //     color: MyColors.white,
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //         color: Colors.grey.withOpacity(0.3),
                                  //         spreadRadius: 3,
                                  //         blurRadius: 7,
                                  //         offset: Offset(
                                  //             0, 3), // Offset of the shadow
                                  //       ),
                                  //     ],
                                  //     // color: MyColors.white
                                  //   ),
                                  //   child: Column(
                                  //     children: [
                                  //       Padding(
                                  //         padding: const EdgeInsets.all(8.0),
                                  //         child: Align(
                                  //             alignment: Alignment.centerRight,
                                  //             child:
                                  //                 Icon(Icons.favorite_border,color:Colors.red)),
                                  //       ),

                                  //       Container(
                                  //         height: 125,

                                  //         // decoration: BoxDecoration(
                                  //         //     borderRadius: BorderRadius.circular(30),
                                  //         //     color: MyColors.white),
                                  //         child: CachedNetworkImage(
                                  //           imageUrl: imagePath,
                                  //           // width: 61,
                                  //           // height: 75,
                                  //           placeholder: (context, url) =>
                                  //               Center(
                                  //             child:
                                  //                 CircularProgressIndicator(),
                                  //           ), // Replace with your own placeholder widget
                                  //           errorWidget: (context, url,
                                  //                   error) =>
                                  //               Icon(Icons
                                  //                   .error), // Replace with your own error widget
                                  //         ),
                                  //       ),

                                  //       // SizedBox(height: 15,),

                                  //       Container(
                                  //         // height: 140,
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.only(
                                  //               left: 10.0, right: 5, top: 5),
                                  //           child: Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.start,
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               Text(item.name!,
                                  //                   style: CustomTextStyle
                                  //                       .popinsmedium),
                                  //               Text(
                                  //                  item.description
                                  //                                       .toString()
                                  //                                       .length <
                                  //                                   30
                                  //                               ?  item.description!
                                  //                               : item.description!.substring(0, 19),
                                                            
                                  //                   // item.description.toString(),
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
                                  //                               "₹" +
                                  //                                   item.wholePrice
                                  //                                       .toString(),
                                  //                               style: CustomTextStyle
                                  //                                   .discounttext),
                                  //                           SizedBox(width: 10),
                                  //                           Container(
                                  //                             height: 20,
                                  //                             width: 40,
                                  //                             decoration: BoxDecoration(
                                  //                                 color:
                                  //                                     MyColors
                                  //                                         .red,
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             10),
                                  //                                 border: Border.all(
                                  //                                     color: MyColors
                                  //                                         .red)),
                                  //                             child: Center(
                                  //                               child: Text(
                                  //                                   // item.discount.toString(),
                                  //                                    "Save${item.discount??''}",
                                  //                                   style: CustomTextStyle
                                  //                                       .popinstextsmal2222),
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                       SizedBox(height: 5),
                                  //                       Text("₹ ${((double.parse(item.wholePrice ?? '')) - ( (double.parse(item.wholePrice ?? ""))*(double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                  //                         style: CustomTextStyle
                                  //                             .popinsmedium,
                                  //                       ),
                                  //                     ],
                                  //                   ),

                                  //                   Padding(
                                  //                     padding:
                                  //                         const EdgeInsets.only(
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
                                  //                               EdgeInsets.all(
                                  //                                   5.0),
                                  //                           child: Image.asset(
                                  //                             "assets/image/bag2.png",
                                  //                             height: 25,
                                  //                           ),
                                  //                         )),
                                  //                   )
                                  //                   // Image.asset(
                                  //                   //   "assets/image/yellowbag.png",
                                  //                   //   height: 80,
                                  //                   // )
                                  //                 ],
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                               
                                );
                              }),
                        )
                 ],
          ),
        ));
  }
}
