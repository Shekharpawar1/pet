import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salesourbranddetailscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';

// import 'package:pet/screens/user/notification.dart';
// import 'package:pet/screens/user/ordersummary.dart';
// import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class WholeSalesOurBrandDetails extends StatelessWidget {
  WholeSalesOurBrandDetails({super.key});
//  WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
 SalesOurBrandDetailsController salesOurBrandDetailsController =
      Get.put(SalesOurBrandDetailsController());
      SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());
           final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
//   WholeProductDetailsController wholeproductdetailsController =
//       Get.put(WholeProductDetailsController());
// OurBrandDetailsWholeController salesOurBrandDetailsController = Get.put(OurBrandDetailsWholeController());

  @override
  Widget build(BuildContext context) {
    salesOurBrandDetailsController.ourproductinit();
    // var imagePath = "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${ourbranddeatilscontrroller.brandlogo??''}";
    return Scaffold(
        appBar: CustomAppBarSalesWholeback(
          title: "Our Brand Product",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            primary: true,
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
                    child: TextFormField(
                      controller: salesOurBrandDetailsController.searchcontroller,
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
                  Container(
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
                      ))
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),

// Container(
//    height: MediaQuery.of(context).size.height * 0.08,
//   child:   GetBuilder<OurBrandDetailsController>(

//                         init: ourbranddeatilscontrroller,

//                         builder: (_) {

//                           return

//                        ListView.builder(

//                                   primary: false,

//                                   scrollDirection: Axis.horizontal,

//                                   shrinkWrap: true,

//                                   itemCount: ourbranddeatilscontrroller

//                                       .usersubmodel!.data!.length,

//                                   itemBuilder: (context, index) {

//   //  final isSelected = subcategorycontroller.selectedIndex == index;

//                                     var item = ourbranddeatilscontrroller

//                                         .usersubmodel!.data![index];

//                                     // print(item.name!);

//                                     var imagePath =

//                                         "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";

//                                     print(imagePath);

//                                     return

//                                      !ourbranddeatilscontrroller.propertysubloaded
//                             ? SizedBox():
//                                      Padding(

//                                       padding: const EdgeInsets.all(8.0),

//                                       child: InkWell(

//                                         onTap: () {
//     //  subcategorycontroller.addproduct(item.id??0);
// //   ourbranddeatilscontrroller.updateSelectedIndex(item.id??0);
// //   print("===>${item.id}") ;
// // ourbranddeatilscontrroller.ourproductinit();

//                                         },

//                                         child: Container(

//                         height: 40,

//                        width: 180,

//                         decoration: BoxDecoration(

//                             color: (ourbranddeatilscontrroller.selectedIndex == item.id
//                              )
//                                                       ? MyColors.yellow
//                                                       : Colors.white,

//                             borderRadius: BorderRadius.circular(10)),

//                         child: Padding(

//                           padding: const EdgeInsets.all(5.0),

//                           child: Row(

//                             mainAxisAlignment: MainAxisAlignment.start,

//                             children: [

//                               // Image.asset("assets/image/dog1.png"),

//                                CachedNetworkImage(

//                                               imageUrl: imagePath,

//                                               // width: 61,

//                                               // height: 75,

//                                               placeholder: (context, url) =>

//                                                   Center(

//                                                 child:

//                                                     CircularProgressIndicator(),

//                                               ), // Replace with your own placeholder widget

//                                               errorWidget: (context, url,

//                                                       error) =>

//                                                   Icon(Icons

//                                                       .error), // Replace with your own error widget

//                                             ),

//                               SizedBox(

//                                 width: 5,

//                               ),

//                               Text(item.name.toString(), style: CustomTextStyle.popinssmall)

//                             ],

//                           ),

//                         ),

//                       ),

//                                       ),

//                                       //  Stack(

//                                       //   children: [

//                                       //     Container(

//                                       //       width: 69,

//                                       //       height: 75,

//                                       //       decoration: BoxDecoration(

//                                       //         borderRadius: BorderRadius.circular(23),

//                                       //         color: item,

//                                       //         boxShadow: [

//                                       //           BoxShadow(

//                                       //             color: Colors.grey.withOpacity(0.3),

//                                       //             spreadRadius: 2,

//                                       //             blurRadius: 5,

//                                       //             offset: Offset(

//                                       //                 0, 3), // Offset of the shadow

//                                       //           ),

//                                       //         ],

//                                       //       ),

//                                       //     ),

//                                       //   ],

//                                       // )

//                                     );

//                                   },

//                                 );

//                         }),
// ),

//      SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//    child: Row(mainAxisAlignment: MainAxisAlignment.start,
//      children: [
//   Container(
//     height: 40,width: 90,
// decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.circular(10)),
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//       Image.asset("assets/image/dog1.png"),
//       SizedBox(width: 10,),
//       Text("Dog",style:  CustomTextStyle.popinssmall)

//         ],
//       ),
//     ),
//   ),
// SizedBox(width:15),
//  Container(
//     height: 40,width: 90,
// decoration: BoxDecoration(color:MyColors.lightblue,borderRadius: BorderRadius.circular(10)),
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//       Image.asset("assets/image/catimg.png"),
//       SizedBox(width: 10,),
//       Text("Cat",style:  CustomTextStyle.popinssmall)

//         ],
//       ),
//     ),
//   ),

// SizedBox(width: 15,),

// Container(
//     height: 40,width: 90,
// decoration: BoxDecoration(color:MyColors.pinklight1
// ,borderRadius: BorderRadius.circular(10)),
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//       // Image.asset("assets/image/catimg.png"),
//       SizedBox(width: 10,),
//       Text("Rabbit",style:  CustomTextStyle.popinssmall)

//         ],
//       ),
//     ),
//   ),

//        SizedBox(height: MediaQuery.of(context).size.height*0.03),

//    ],),
//  ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: GetBuilder<SalesOurBrandDetailsController>(
                    init: salesOurBrandDetailsController,
                    builder: (_) {
                      return

                          //  ourbranddeatilscontrroller.userPropertiesourbrandModel == null|| ourbranddeatilscontrroller.userPropertiesourbrandModel!.data == null
                          //     ? SizedBox(child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))):

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
                              itemCount: salesOurBrandDetailsController
                                  .salesPropertiesModel!
                                  .data!
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
                                var item = salesOurBrandDetailsController
                                    .salesPropertiesModel!.data![index];
                                print("Name,Brand");
                                print(item.name);
                                print(item.brandId);
                                var imagePath =
                                    "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                print(imagePath);
                                return
                                    //             ourbranddeatilscontrroller.ourbrandproductLoaded
                                    // ? Center(
                                    //     child: SpinKitCircle(
                                    //       color: Colors.black, // Color of the progress bar
                                    //       size: 30.0, // Size of the progress bar
                                    //     ),
                                    //   )
                                    // :
                                    //  ourbranddeatilscontrroller.userPropertiesourbrandModel!.data == null
                                    //                     ? SizedBox(child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))):
                                    InkWell(
                                  onTap: ()async {
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
                                  child: Container(
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
                                      borderRadius: BorderRadius.circular(25),
                                      // color: MyColors.white,
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
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "₹" +
                                                                   item.wholePrice
                                                                        .toString(),
                                                                style: CustomTextStyle
                                                                    .discounttext),
                                                            SizedBox(width: 2),
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
                                                                style: CustomTextStyle
                                                                    .popinstextsmal2222red),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
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
                                                                //    item.wholePrice!,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    Get.width *
                                                                        0.054),
                                                            InkWell(
                                                              onTap: () async {
                                                                //  productdeatilscontroller.viewproductHome(
                                                                //   item.id??0,item.name??'',"1kg",1 ,item.price??'',item.image!);
                                                                //   await productdeatilscontroller
                                                                // .addProductHome();
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                        width:
                                                                            35,
                                                                        height:
                                                                            35,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                10),
                                                                            color: Color(
                                                                                0xffffcc00)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Image.asset(
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
                                );
                           
                           
                              });
                    }),
              ),

              //    GridView(
              //                                                     physics:
              //                                                     NeverScrollableScrollPhysics(),
              //                                                     scrollDirection:
              //                                                     Axis.vertical,
              //                                                     gridDelegate:
              //                                                     SliverGridDelegateWithFixedCrossAxisCount(
              //                                                         crossAxisCount:
              //                                                         2,
              //                                                         crossAxisSpacing:
              //                                                         15,
              //                                                         mainAxisSpacing:
              //                                                         15,
              //                                                         mainAxisExtent:
              //                                                         270),
              //                                                     children: [

              //               InkWell(onTap: (){
              //                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
              //               },
              //                 child: Container(

              //                           height:MediaQuery.of(context).size.width*0.7,

              //                           width: MediaQuery.of(context).size.width*0.46,

              //                           decoration: BoxDecoration(

              //                             borderRadius: BorderRadius.circular(25),
              //                 color:MyColors.white
              //                           ),

              //                         child: Column(children: [

              //                         Container(

              //                           decoration: BoxDecoration(

              //                             borderRadius: BorderRadius.circular(30),
              //                   color:MyColors.white

              //                           ),
              //                           child:
              //                           Image.asset("assets/image/food.png",fit: BoxFit.cover,height: 135),
              //                         ),

              //                         // SizedBox(height: 15,),

              //                           Padding(
              //                             padding: const EdgeInsets.all(5.0),
              //                             child: Column( mainAxisAlignment: MainAxisAlignment.start,
              //                             crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                              Text(
              //                       'Mars Petcare Inc',
              //                       style:  CustomTextStyle.  popinsmedium

              //                     ),
              //                         Text(
              //                       'Lorem Ipsum is simply dummy',
              //                       style:  CustomTextStyle.  popinssmall0

              //                     ),
              //                 // SizedBox(height: 3),

              //                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                   children: [

              //                   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

              //                   Image.asset("assets/image/yellowbag.png",height: 55,)

              //                 ],)
              //                 ],
              //                             ),
              //                           )

              //                         ],),

              //                         ),
              //               ),
              //       Container(

              //           height:MediaQuery.of(context).size.width*0.7,

              //           width: MediaQuery.of(context).size.width*0.46,

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(30),
              // color:MyColors.white
              //           ),

              //         child: Column(children: [

              //                       Container(

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(30),
              //   color:MyColors.white

              //           ),
              //                         child:
              //                         Image.asset("assets/image/dog2.png",fit: BoxFit.cover,height: 135),
              //                       ),

              //         // SizedBox(height: 15,),

              //           Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: Column( mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //              Text(
              //                     'Mars Petcare Inc',
              //                     style:  CustomTextStyle.  popinsmedium

              //                   ),
              //                       Text(
              //                     'Lorem Ipsum is simply dummy',
              //                     style:  CustomTextStyle.  popinssmall0

              //                   ),
              //               // SizedBox(height: 3),

              //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                 children: [

              //                 Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

              //                 Image.asset("assets/image/yellowbag.png",height: 55,)

              //               ],)
              //               ],
              //             ),
              //           )

              //         ],),

              //         ),

              //               Container(

              //           height:MediaQuery.of(context).size.width*0.7,

              //           width: MediaQuery.of(context).size.width*0.46,

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(25),
              // color:MyColors.white
              //           ),

              //         child: Column(children: [

              //                       Container(

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(30),
              //   color:MyColors.white

              //           ),
              //                         child:
              //                         Image.asset("assets/image/food3.png",fit: BoxFit.cover,height: 135),
              //                       ),

              //         // SizedBox(height: 15,),

              //           Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: Column( mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //              Text(
              //                     'Mars Petcare Inc',
              //                     style:  CustomTextStyle.  popinsmedium

              //                   ),
              //                       Text(
              //                     'Lorem Ipsum is simply dummy',
              //                     style:  CustomTextStyle.  popinssmall0

              //                   ),
              //               // SizedBox(height: 3),

              //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                 children: [

              //                 Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

              //                 Image.asset("assets/image/yellowbag.png",height: 55,)

              //               ],)
              //               ],
              //             ),
              //           )

              //         ],),

              //         ),
              //       Container(

              //           height:MediaQuery.of(context).size.width*0.7,

              //           width: MediaQuery.of(context).size.width*0.46,

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(30),
              // color:MyColors.white
              //           ),

              //         child: Column(children: [

              //                       Container(

              //           decoration: BoxDecoration(

              //             borderRadius: BorderRadius.circular(30),
              //   color:MyColors.white

              //           ),
              //                         child:
              //                         Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
              //                       ),

              //         // SizedBox(height: 15,),

              //           Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: Column( mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //              Text(
              //                     'Mars Petcare Inc',
              //                     style:  CustomTextStyle.  popinsmedium

              //                   ),
              //                       Text(
              //                     'Lorem Ipsum is simply dummy',
              //                     style:  CustomTextStyle.  popinssmall0

              //                   ),
              //               // SizedBox(height: 3),

              //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                 children: [

              //                 Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

              //                 Image.asset("assets/image/yellowbag.png",height: 55,)

              //               ],)
              //               ],
              //             ),
              //           )

              //         ],),

              //         ),

              //                                                     ],
              //                                                     padding:
              //                                                     EdgeInsets.all(
              //                                                         5),
              //                                                     shrinkWrap: true,
              //                                                   ),
            ],
          ),
        ));
  }
}
