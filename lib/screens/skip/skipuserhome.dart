// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pet/screens/skip/cartscreen.dart';
// import 'package:pet/screens/skip/skipusercontroller.dart';
// import 'package:pet/utils/colors.dart';
// import 'package:pet/utils/fontstyle.dart';

// import '../../utils/constants.dart';

// class SkipUserHome extends StatelessWidget {
//   final controller = Get.put(SkipUserController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SkipUserController>(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10, top: 10),
//               child: GestureDetector(
//                 onTap: () {
//                   print(controller.cartlist.length);
//                    controller.countingprice();
//                    Get.to(SkipCartScreen());
//                 },
//                 child: Container(
//                   width: 25,
//                   child: Stack(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             print(controller.cartlist.length);
//                              controller.countingprice();
//                             Get.to(SkipCartScreen());
                           
//                           },
//                           child: SvgPicture.asset("assets/image/bag.svg")),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Container(
//                           height: 12,
//                           width: 12,
//                           decoration: BoxDecoration(
//                               color: Colors.red, shape: BoxShape.circle),
//                           child: Center(
//                             child: Text(
//                               controller.cartlist.length.toString(),
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 8),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body:
        
        
//          SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 14,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.65,
//                         child: Text(
//                           "Find the pet you love on around you easily",
//                           style: CustomTextStyle.popinstext,
//                         )),
//                     Spacer(),
//                     Image.asset("assets/image/boyprofile3.png", height: 75)
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 CarouselSlider.builder(
//                     itemCount: controller.userBannerModel!.data!.length,
//                     options: CarouselOptions(
//                       aspectRatio: 16 / 9,
//                       viewportFraction: 1,
//                       initialPage: 0,
//                       enableInfiniteScroll: true,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                     ),
//                     itemBuilder: (context, index, realIdx) {
//                       var item = controller.userBannerModel!.data![index];
//                       var imagePath =
//                           "${Constants.BANNER_IMAGE_PATH}${item.image ?? ""}";
//                       return Container(
//                         height: 140,
//                         child: CachedNetworkImage(
//                           imageUrl: imagePath, fit: BoxFit.cover,
//                           // width: 61,
//                           // height: 75,
//                           placeholder: (context, url) => Center(
//                             child: CircularProgressIndicator(),
//                           ), // Replace with your own placeholder widget
//                           errorWidget: (context, url, error) => Icon(Icons
//                               .error), // Replace with your own error widget
//                         ),
//                       );
//                     }),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       height: 45,
//                       width: 265,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(17),

//                         // border: Border.all(color:brandcolor ),

//                         color: MyColors.white,
//                       ),
//                       child: TextFormField(
//                         onTap: () {
//                           // homeusercontroller.clearSearchData();
//                           // Get.to(SearchScreen());
//                         },
//                         readOnly: true,
//                         // controller: _searchcontroller,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: MyColors.voliet,
//                           fontFamily: "SF-Pro-Display",
//                         ),
//                         decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 15),
//                             fillColor: MyColors.white,
//                             focusColor: MyColors.white,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               // borderRadius: BorderRadius.circular(50),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               //  borderRadius: BorderRadius.circular(50),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               //  borderRadius: BorderRadius.circular(50),
//                             ),
//                             hintText: "Search",
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Image.asset(
//                                 "assets/image/searchnormal.png",
//                                 width: 10,
//                               ),
//                             ),
//                             hintStyle: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400)),
//                       ),
//                     ),

//                     GestureDetector(
//                       onTap: () {
//                         // FilterController filtercontroller =
//                         //     Get.put(FilterController());
//                         // // filtercontroller.init();
//                         // filtercontroller.loadDefaultData();
//                         // filtercontroller.clearFields();
//                         // // Get.to(FilterScreen());
//                         // filtercontroller.init();
//                         // Get.to(FilterScreenUI());
//                         // Get.to(FilterScreen());
//                       },
//                       child: Container(
//                           width: 45,
//                           height: 45,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Color(0xffffcc00)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Image.asset(
//                               "assets/image/filter3.png",
//                             ),
//                           )),
//                     )

//                     // )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 130,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView(
//                     primary: false,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       ListView.builder(
//                         primary: false,
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: controller.userCategoriesModel!.data!.length,
//                         itemBuilder: (context, index) {
//                           var item =
//                               controller.userCategoriesModel!.data![index];
//                           // print(item.name!);
//                           var imagePath =
//                               "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
//                           // print(imagePath);

//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InkWell(
//                               onTap: () async {
//                                 print(
//                                     "========>>>>>>>>>>> ###### ${item.name}");
//                                 // subcategorycontroller
//                                 //     .addproduct(item.id ?? 0);
//                                 // subcategorycontroller
//                                 //     .currentCategory(
//                                 //         item.name ?? "");
//                                 //  subcategorycontroller
//                                 //     .productInitByCategory();

//                                 // Get.to(() => Allcategory());
//                               },
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     child: CachedNetworkImage(
//                                       imageUrl: imagePath,
//                                       width: 61,
//                                       height: 75,
//                                       placeholder: (context, url) => Center(
//                                         child: CircularProgressIndicator(),
//                                       ), // Replace with your own placeholder widget
//                                       errorWidget: (context, url, error) =>
//                                           Icon(Icons
//                                               .error), // Replace with your own error widget
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(item.name!,
//                                       style: CustomTextStyle.popinssmall)
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "New Arrivals",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         // ProductDetailsController productdeatilscontroller =
//                         //     Get.put(ProductDetailsController());

//                         // Get.to(() => const ProductAlllistPage());
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GridView.builder(
//                     primary: false,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 15.0,
//                             mainAxisSpacing: 15.0,
//                             mainAxisExtent: 280),
//                     itemCount: controller.userPropertiesModel!.data!.length
//                         .clamp(0,
//                             4), // Set the number of cards you want to display.
//                     itemBuilder: (context, index) {
//                       // gridDelegate:
//                       //     SliverGridDelegateWithMaxCrossAxisExtent(
//                       //         maxCrossAxisExtent: 150,
//                       //      childAspectRatio: 3 / 2,
//                       //         mainAxisExtent: 285,
//                       //         crossAxisSpacing: 15,
//                       //         mainAxisSpacing: 15),
//                       // itemCount: homeusercontroller
//                       //     .userPropertiesModel!.data!.length
//                       //     .clamp(0, 4),
//                       // itemBuilder: (BuildContext ctx, index) {

//                       var item = controller.userPropertiesModel!.data![index];
//                       String imagePath =
//                           Constants.PRODUCT_HOME_IMAGE_PATH + "/${item.image!}";

//                       // var imagePath =
//                       //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
//                       // print(imagePath);
//                       return
//                       controller.userPropertiesModel == null
//                             ? const SizedBox()
                           
//                                 :
                      
//                        InkWell(
//                         onTap: () async {
//                           //  productdeatilscontroller.dispose();
//                           // productdeatilscontroller
//                           //     .viewproduct(
//                           //   item.id ?? 0,
//                           // );

//                           // // print("productid${item.id ?? 0}");
//                           // await productdeatilscontroller
//                           //     .init();
//                           // userreviewController.reviewAdd(
//                           //       item.id ?? 0, 0);
//                           // await userreviewController
//                           //     .init();
//                           // Get.to(ProductDetails(id:item.id??0, image:item.image??''));
//                           // Get.to( ProductDetails());
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) =>
//                           //           ));
//                         },
//                         child: Container(
//                           width: 140,
//                           // height: 700,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 // _getRandomColor(),
//                                 // _getRandomColor(),
//                                 // _getRandomColor(),
//                                 // _getRandomColor(),
//                                 // MyColors.white
//                                 //     .withOpacity(0.1),
//                                 MyColors.white,
//                                 MyColors.white,
//                                 // MyColors.white,
//                               ],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                             ),
//                             borderRadius: BorderRadius.circular(25),
//                             // color: MyColors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 spreadRadius: 3,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3), // Offset of the shadow
//                               ),
//                             ],
//                             // color: MyColors.white
//                           ),
//                           child: Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   // homeusercontroller
//                                   //     .addItemToWishList(
//                                   //         item.id!);

//                                   //     homeusercontroller.init();
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: Icon(Icons.favorite_border,
//                                         color: Colors.red),
//                                   ),
//                                 ),
//                               ),

//                               Container(
//                                 height: 125,
//                                 decoration: BoxDecoration(),
//                                 // decoration: BoxDecoration(
//                                 //     borderRadius: BorderRadius.circular(30),
//                                 //     color: MyColors.white),
//                                 child: CachedNetworkImage(
//                                   imageUrl: imagePath,
//                                   // width: 61,
//                                   // height: 75,
//                                   placeholder: (context, url) => Center(
//                                     child: CircularProgressIndicator(),
//                                   ), // Replace with your own placeholder widget
//                                   errorWidget: (context, url, error) => Icon(Icons
//                                       .error), // Replace with your own error widget
//                                 ),
//                               ),

//                               // SizedBox(height: 15,),

//                               Container(
//                                 // height: 140,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10.0, right: 5, top: 5),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(item.name!,
//                                        maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                           style: CustomTextStyle.popinsmedium),
//                                       Text(
//                                           item.description.toString().length <
//                                                   30
//                                               ? item.description!
//                                               : item.description!
//                                                   .substring(0, 19),
//                                           style: CustomTextStyle.popinssmall0),
//                                       SizedBox(height: 5),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                       "₹" +
//                                                           item.price.toString(),
//                                                       style: CustomTextStyle
//                                                           .discounttext),
//                                                   SizedBox(width: 2),
//                                                   // Container(
//                                                   // height:
//                                                   //     20,
//                                                   // width: 48,
//                                                   // decoration: BoxDecoration(
//                                                   //     color: MyColors
//                                                   //         .red,
//                                                   //     borderRadius: BorderRadius.circular(
//                                                   //         10),
//                                                   //     border:
//                                                   //         Border.all(color: MyColors.red)),
//                                                   // child:
//                                                   //     Center(
//                                                   //   child:
//                                                   Text(
//                                                       // item.discount.toString(),
//                                                       "Save${double.parse(item.discount ?? '').toStringAsFixed(0)}%",
//                                                       style: CustomTextStyle
//                                                           .popinstextsmal2222red),
//                                                   //   ),
//                                                   // ),
//                                                 ],
//                                               ),
//                                               SizedBox(height: 5),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   SizedBox(
//                                                     width: Get.width * 0.23,
//                                                     child: Text(
//                                                       "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

//                                                       // "₹" +
//                                                       //     item.price!,
//                                                       style: CustomTextStyle
//                                                           .popinsmedium,
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                       width: Get.width * 0.054),
//                                                   InkWell(
//                                                     onTap: () async {
//                                                       // controller.cartlist = [];
//                                                       controller.cartlist.add({
//                                                         "item_id": item.id,
//                                                         "item_name": item.name,
//                                                         "variant": 1,
//                                                         "quantity": 1,
//                                                         "image": item.image
//                                                             .toString(),
//                                                         "price": item.price,
//                                                         "actualprice":
//                                                             item.price,
//                                                       });

//                                                       GetStorage().write(
//                                                           "cartlist",
//                                                           controller.cartlist);
//                                                       List a = GetStorage()
//                                                           .read("cartlist");
//                                                       controller.update();
//                                                       print(a);

//                                                       //                  productdeatilscontroller.viewproductHome(
//                                                       //                   item.id??0,item.name??'',"1kg",1,double.parse(item.price ?? ''),item.image??'');
//                                                       //                   await productdeatilscontroller.addProductHome();
//                                                       // mycartController.init();
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               right: 5.0),
//                                                       child: Container(
//                                                           width: 35,
//                                                           height: 35,
//                                                           decoration: BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                               color: Color(
//                                                                   0xffffcc00)),
//                                                           child: Padding(
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     5.0),
//                                                             child: Image.asset(
//                                                               "assets/image/bag2.png",
//                                                               height: 25,
//                                                             ),
//                                                           )),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ],
//                                           ),

//                                           // Image.asset(
//                                           //   "assets/image/yellowbag.png",
//                                           //   height: 80,
//                                           // )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Our Brand",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         // Get.to(() => AllbrandPage(
//                         //     data: homeusercontroller.userBrandModel!.data!
//                         //         .where((element) => element.canine == 1)
//                         //         .toList()));
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 250,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView.builder(
//                     primary: false,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     itemCount: controller.userBrandModel!.data!
//                         .where((element) => element.canine == 1)
//                         .toList()
//                         .length,
//                     itemBuilder: (context, index) {
//                       var item = controller.userBrandModel!.data!
//                           .where((element) => element.canine == 1)
//                           .toList()[index];
//                       // print(item.name!);
//                       var imagePath =
//                           "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
//                       var imageLogoPath =
//                           "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
//                       // print(imagePath);
//                       return InkWell(
//                         onTap: () async {
// //                                       Ourbranddetailscontroller
// //                                           .addproduct(item.id ?? 0,item.title??'',
// //                                               item.logo ?? '');
// //                                       //  subcategorycontroller.addproduct(item.id??0) ;
// // await Ourbranddetailscontroller.ourproductinit();
// //                                       Get.to( OurBrandDetails());
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                 // height: MediaQuery.of(context)
//                                 //         .size
//                                 //         .width *
//                                 //     0.55,
//                                 // width: MediaQuery.of(context)
//                                 //         .size
//                                 //         .width *
//                                 //     0.46,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   // color: MyColors.white
//                                 ),
//                                 child: Stack(
//                                   alignment: Alignment.topCenter,
//                                   children: [
//                                     // SizedBox(height: 140,),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.width *
//                                               0.6,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.46,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                           color: Colors.transparent),
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 top: 25.0),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                                 gradient: LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color(0xFFFFF0BA),
//                                                     Color.fromRGBO(
//                                                         252, 233, 166, 0.00),
//                                                   ],
//                                                 ),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl: imagePath,
//                                                 // width: 50,
//                                                 height: 135,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ), // Replace with your own placeholder widget
//                                                 errorWidget: (context, url,
//                                                         error) =>
//                                                     Icon(Icons
//                                                         .error), // Replace with your own error widget
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           Text(item.title!,
//                                               style:
//                                                   CustomTextStyle.popinssmall0)
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 3,
//                                       child: Container(
//                                         height: 50,
//                                         width: 60,
//                                         decoration: BoxDecoration(
//                                             color:
//                                                 Colors.white.withOpacity(0.3),
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         child:
//                                             // Image.asset(
//                                             //   item["logo"],
//                                             //   height: 50,
//                                             // ),
//                                             CachedNetworkImage(
//                                           imageUrl: imageLogoPath,
//                                           // width: 50,
//                                           height: 50,
//                                           placeholder: (context, url) => Center(
//                                             child: CircularProgressIndicator(),
//                                           ), // Replace with your own placeholder widget
//                                           errorWidget: (context, url, error) =>
//                                               Icon(Icons
//                                                   .error), // Replace with your own error widget
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Shop By Brand",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         // Get.to(AllShopbrandPage(
//                         //     data: homeusercontroller.userBrandModel!.data!
//                         //         .where((element) => element.canine == 0)
//                         //         .toList()));
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 250,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView.builder(
//                     primary: false,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     itemCount: controller.userBrandModel!.data!
//                         .where((element) => element.canine == 0)
//                         .toList()
//                         .length,
//                     itemBuilder: (context, index) {
//                       var item = controller.userBrandModel!.data!
//                           .where((element) => element.canine == 0)
//                           .toList()[index];
//                       // print(item.name!);
//                       var imagePath =
//                           "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
//                       var imageLogoPath =
//                           "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
//                       // print(imagePath);
//                       return InkWell(
//                         onTap: () {
//                           //                                           Ourbranddetailscontroller
//                           //                                               .addproduct(item.id ?? 0,
//                           //                                               item.title??'',
//                           //                                                   item.logo ?? '');
//                           // Ourbranddetailscontroller.productinit();
//                           //                                           Get.to(ShopBrandDetails());
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.width * 0.55,
//                                 width: MediaQuery.of(context).size.width * 0.46,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   // color: MyColors.white
//                                 ),
//                                 child: Stack(
//                                   alignment: Alignment.topCenter,
//                                   children: [
//                                     // SizedBox(height: 140,),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.width *
//                                               0.6,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.46,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                           color: Colors.transparent),
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 top: 25.0),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                                 gradient: LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color(0xFFFFF0BA),
//                                                     Color.fromRGBO(
//                                                         252, 233, 166, 0.00),
//                                                   ],
//                                                 ),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl: imagePath,
//                                                 // width: 50,
//                                                 height: 135,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ), // Replace with your own placeholder widget
//                                                 errorWidget: (context, url,
//                                                         error) =>
//                                                     Icon(Icons
//                                                         .error), // Replace with your own error widget
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           Text(item.title!,
//                                               style:
//                                                   CustomTextStyle.popinssmall0)
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 3,
//                                       child: Container(
//                                         height: 50,
//                                         width: 60,
//                                         decoration: BoxDecoration(
//                                             color:
//                                                 Colors.white.withOpacity(0.3),
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         child:
//                                             // Image.asset(
//                                             //   item["logo"],
//                                             //   height: 50,
//                                             // ),
//                                             CachedNetworkImage(
//                                           imageUrl: imageLogoPath,
//                                           // width: 50,
//                                           height: 50,
//                                           placeholder: (context, url) => Center(
//                                             child: CircularProgressIndicator(),
//                                           ), // Replace with your own placeholder widget
//                                           errorWidget: (context, url, error) =>
//                                               Icon(Icons
//                                                   .error), // Replace with your own error widget
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Toys",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         // subcategorycontroller.producttoys();
//                         // Get.to(AlltoyPage());
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GridView.builder(
//                     primary: false,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 15.0,
//                         mainAxisSpacing: 15.0,
//                         mainAxisExtent: 280),
//                     itemCount:
//                         controller.usertoyModel!.data!.length.clamp(0, 4),
//                     itemBuilder: (BuildContext ctx, index) {
//                       var item1 = controller.usertoyModel!.data![index];

//                       var imagePath =
//                           "${Constants.BASE_URL}/storage/app/public/product/${item1.image ?? ""}";
//                       return controller.usertoyModel == null ||
//                               controller.usertoyModel!.data == null
//                           ? SizedBox()
//                           : InkWell(
//                               onTap: () async {
//                                 //        productdeatilscontroller.dispose();
//                                 //          productdeatilscontroller
//                                 //         .viewproduct(
//                                 //       item1.id ?? 0,
//                                 //     );
//                                 //      print("productippToysppd${item1.id ?? 0}");
//                                 // await productdeatilscontroller.init();
//                                 // Get.to(ProductDetails(
//                                 //  id: item1.id??0,
//                                 // ));
//                               },
//                               child: Container(
//                                 width: 140,
//                                 // height: 700,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       // _getRandomColor(),
//                                       // _getRandomColor(),
//                                       // _getRandomColor(),
//                                       // _getRandomColor(),
//                                       // MyColors.white
//                                       //     .withOpacity(0.1),
//                                       MyColors.white,
//                                       MyColors.white,
//                                       // MyColors.white,
//                                     ],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                   ),
//                                   borderRadius: BorderRadius.circular(25),
//                                   // color: MyColors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.3),
//                                       spreadRadius: 3,
//                                       blurRadius: 7,
//                                       offset:
//                                           Offset(0, 3), // Offset of the shadow
//                                     ),
//                                   ],
//                                   // color: MyColors.white
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         //  homeusercontroller
//                                         //      .addItemToWishList(
//                                         //          item1.id!);

//                                         //      homeusercontroller.init();
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Align(
//                                           alignment: Alignment.centerRight,
//                                           child: Icon(Icons.favorite_border,
//                                               color: Colors.red),
//                                         ),
//                                       ),
//                                     ),

//                                     Container(
//                                       height: 125,
//                                       decoration: BoxDecoration(
//                                           // gradient:
//                                           //     LinearGradient(
//                                           //   colors: [
//                                           //     _getRandomColor(),
//                                           //     _getRandomColor(),
//                                           //     _getRandomColor(),
//                                           //     _getRandomColor(),
//                                           //   ],
//                                           //   begin:
//                                           //       Alignment.topLeft,
//                                           //   end: Alignment
//                                           //       .bottomRight,
//                                           // ),
//                                           ),
//                                       // decoration: BoxDecoration(
//                                       //     borderRadius: BorderRadius.circular(30),
//                                       //     color: MyColors.white),
//                                       child: CachedNetworkImage(
//                                         imageUrl: imagePath,
//                                         // width: 61,
//                                         // height: 75,
//                                         placeholder: (context, url) => Center(
//                                           child: CircularProgressIndicator(),
//                                         ), // Replace with your own placeholder widget
//                                         errorWidget: (context, url, error) =>
//                                             Icon(Icons
//                                                 .error), // Replace with your own error widget
//                                       ),
//                                     ),

//                                     // SizedBox(height: 15,),

//                                     Container(
//                                       // height: 140,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10.0, right: 5, top: 5),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(item1.name!,
//                                                 style: CustomTextStyle
//                                                     .popinsmedium),
//                                             Text(
//                                                 item1.description
//                                                             .toString()
//                                                             .length <
//                                                         30
//                                                     ? item1.description!
//                                                     : item1.description!
//                                                         .substring(0, 19),
//                                                 style: CustomTextStyle
//                                                     .popinssmall0),
//                                             SizedBox(height: 5),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Text(
//                                                             "₹" +
//                                                                 item1.price
//                                                                     .toString(),
//                                                             style: CustomTextStyle
//                                                                 .discounttext),
//                                                         SizedBox(width: 2),
//                                                         // Container(
//                                                         // height:
//                                                         //     20,
//                                                         // width: 48,
//                                                         // decoration: BoxDecoration(
//                                                         //     color: MyColors
//                                                         //         .red,
//                                                         //     borderRadius: BorderRadius.circular(
//                                                         //         10),
//                                                         //     border:
//                                                         //         Border.all(color: MyColors.red)),
//                                                         // child:
//                                                         //     Center(
//                                                         //   child:
//                                                         Text(
//                                                             // item.discount.toString(),
//                                                             "Save${item1.discount.toString()}%",
//                                                             style: CustomTextStyle
//                                                                 .popinstextsmal2222red),
//                                                         //   ),
//                                                         // ),
//                                                       ],
//                                                     ),
//                                                     SizedBox(height: 5),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         SizedBox(
//                                                           width:
//                                                               Get.width * 0.23,
//                                                           child: Text(
//                                                             "₹ ${((double.parse(item1.price ?? '')) - ((double.parse(item1.price ?? "")) * (double.parse(item1.discount ?? "0")) / 100)).toDouble()}",

//                                                             // "₹" +
//                                                             //     item.price!,
//                                                             style: CustomTextStyle
//                                                                 .popinsmedium,
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                             width: Get.width *
//                                                                 0.054),
//                                                         InkWell(
//                                                           onTap: () async {
//                                                             //                    productdeatilscontroller.viewproductHome(
//                                                             //                   item1.id??0,item1.name??'',"1kg",1 ,double.parse(item1.price ?? ''),item1.image??'');
//                                                             //                   await productdeatilscontroller.addProductHome();
//                                                             // mycartController.init();
//                                                           },
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     right: 5.0),
//                                                             child: Container(
//                                                                 width: 35,
//                                                                 height: 35,
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     color: Color(
//                                                                         0xffffcc00)),
//                                                                 child: Padding(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .all(
//                                                                               5.0),
//                                                                   child: Image
//                                                                       .asset(
//                                                                     "assets/image/bag2.png",
//                                                                     height: 25,
//                                                                   ),
//                                                                 )),
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),

//                                                 // Image.asset(
//                                                 //   "assets/image/yellowbag.png",
//                                                 //   height: 80,
//                                                 // )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                     }),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Product By Partner",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         // Get.to(AllProdctbybrandPage());
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 250,
//                   child: ListView.builder(
//                     primary: false,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     itemCount: controller.userProductPartnerModel!.data!.length,
//                     itemBuilder: (context, index) {
//                       var item =
//                           controller.userProductPartnerModel!.data![index];

//                       // print(item.name!);
//                       var imagePath =
//                           "${Constants.BASE_URL}/storage/app/public/store/cover/${item.coverPhoto ?? ""}";
//                       var imageLogoPath =
//                           "${Constants.BASE_URL}/storage/app/public/store/${item.logo ?? ""}";

//                       return InkWell(
//                         onTap: () async {
//                           // homeusercontroller
//                           //     .viewpartner(item.id ?? 0);
//                           // await homeusercontroller
//                           //     .partnerIteminit();
//                           // Get.to(ProductByPartnerDetails());
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.width * 0.55,
//                                 width: MediaQuery.of(context).size.width * 0.46,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   // color: MyColors.white
//                                 ),
//                                 child: Stack(
//                                   alignment: Alignment.topCenter,
//                                   children: [
//                                     // SizedBox(height: 140,),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.width *
//                                               0.6,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.46,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                           color: Colors.transparent),
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 top: 25.0),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                                 gradient: LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color(0xFFFFF0BA),
//                                                     Color.fromRGBO(
//                                                         252, 233, 166, 0.00),
//                                                   ],
//                                                 ),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl: imagePath,
//                                                 // width: 50,
//                                                 height: 135,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ), // Replace with your own placeholder widget
//                                                 errorWidget: (context, url,
//                                                         error) =>
//                                                     Icon(Icons
//                                                         .error), // Replace with your own error widget
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           Text(item.name!,
//                                               style:
//                                                   CustomTextStyle.popinssmall0)
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 3,
//                                       child: Container(
//                                         height: 50,
//                                         width: 60,
//                                         decoration: BoxDecoration(
//                                             color:
//                                                 Colors.white.withOpacity(0.3),
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         child:
//                                             // Image.asset(
//                                             //   item["logo"],
//                                             //   height: 50,
//                                             // ),
//                                             CachedNetworkImage(
//                                           imageUrl: imageLogoPath,
//                                           // width: 50,
//                                           height: 50,
//                                           placeholder: (context, url) => Center(
//                                             child: CircularProgressIndicator(),
//                                           ), // Replace with your own placeholder widget
//                                           errorWidget: (context, url, error) =>
//                                               Icon(Icons
//                                                   .error), // Replace with your own error widget
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Services",
//                       style: CustomTextStyle.popinstext,
//                     ),

//                     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

//                     InkWell(
//                       onTap: () {
//                         //Get.to(ServicePage());
//                       },
//                       child: Text('See All',
//                           style: TextStyle(
//                               color: MyColors.bgcolor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GridView.builder(
//                   primary: false,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       //  childAspectRatio: 4 / 4,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                       mainAxisExtent: 100),
//                   itemCount: controller.userServicesModel!.data!.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     var item = controller.userServicesModel!.data![index];
//                     var imagePath =
//                         "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.image ?? ""}";

//                     return GestureDetector(
//                       onTap: () async {
//                         // // String url = Constants
//                         // //         .GET_SERVICES_CATEGORIES +
//                         // //     "/" +
//                         // //     item.id.toString();
//                         // // homeusercontroller
//                         // //     .getServicesCategories(url);

//                         // // Get.to(
//                         // //     () => ServicesCategoryPage());

//                         // userServicesAddUserServicesAddAppointmentController
//                         //     .clearFields();
//                         // userServicesAddUserServicesAddAppointmentController
//                         //     .updateServiceId(item.id!);
//                         // userServicesAddUserServicesAddAppointmentController
//                         //     .init();
//                         // await userServicesAddUserServicesAddAppointmentController
//                         //     .fetchAppointmentSlots(item.id!);
//                         // print(item);
//                         // Get.to(() =>
//                         //     UserServicesAddAppointmentState());
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 60,
//                             width: 60,
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: Colors.black26, width: 1),
//                                 borderRadius: BorderRadius.circular(25),
//                                 color: MyColors.white),
//                             child: CachedNetworkImage(
//                               imageUrl: imagePath,
//                               fit: BoxFit.cover,
//                               // width: 61,
//                               // height: 75,
//                               placeholder: (context, url) => const Center(
//                                 child: CircularProgressIndicator(),
//                               ), // Replace with your own placeholder widget
//                               errorWidget: (context, url, error) => const Icon(Icons
//                                   .error), // Replace with your own error widget
//                             ),
//                           ),
//                           Text(
//                             item.name!,
//                             textAlign: TextAlign.center,
//                             style: CustomTextStyle.popinssmall0,
//                           )
//                         ],
//                       ),
//                     );
//                     //
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
