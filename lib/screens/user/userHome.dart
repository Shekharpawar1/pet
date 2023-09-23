import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/profile_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/controllers/user_controller/subcateogries_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/user/AllPageProductbybrand.dart';

import 'package:pet/screens/user/allcategory.dart';
import 'package:pet/screens/user/drawer.dart';
import 'package:pet/screens/user/filterScreen.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/oubranddetails.dart';
import 'package:pet/screens/user/productbypartnerdetails.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/searchScreen.dart';
import 'package:pet/screens/user/service.dart';
import 'package:pet/screens/user/service_categoryPage.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ourbrand.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pet/screens/user/AllbrandPage.dart';
import 'package:pet/screens/user/Allservicepage.dart';
import 'package:pet/screens/user/AlltoyPage.dart';
import 'package:pet/screens/user/ProductAlllistPage.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:video_player/video_player.dart';

class HomeUser extends StatefulWidget {
  HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  TextEditingController _searchcontroller = TextEditingController();
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  SubCategoryController subcategorycontroller =
      Get.put(SubCategoryController());
  UserReviewController userreviewController = Get.put(UserReviewController());
  OurBrandDetailsController Ourbranddetailscontroller =
      Get.put(OurBrandDetailsController());
  MyCartController mycartController = Get.put(MyCartController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());

  ProfileController profilecontroller = Get.put(ProfileController());
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  final List<Color> _randomColors = [
    MyColors.yellowlight,
    Colors.blue,
    Colors.green,
    // Colors.orange,
  ];

  Color _getRandomColor() {
    final random = Random();
    return _randomColors[random.nextInt(_randomColors.length)];
  }

  @override
  void onInit() {
    notificationcontroller.init();
    // super.onInit();
  }

  @override
  Widget build(BuildContext context) {
    homeusercontroller.getWishList();
    homeusercontroller.fetchWishList();
    print(GetStorage().read('id').toString());
    print(GetStorage().read('userData').toString());
    return Scaffold(
      key: _drawerkey,
      drawer: const drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              _drawerkey.currentState!.openDrawer();
            },
            child: Image.asset(
              "assets/image/menu2.png",
            ),
          ),
        ),
      ),
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),
//         ),
// //           title: Center(
// // //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// // //
// //             child:Text("")
// //           ),

//         actions: [
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     Get.to(NotificationUser());
//                   },
//                   child: Center(
//                     child: Icon(Icons.notifications, color: MyColors.black),
//                   )),
//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                       Positioned(
//                           top: 3.0,
//                           right: 4.0,
//                           child: Center(
//                             child: Text(
//                               ("5").toString(),
//                               // list.length.toString(),
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 8.0,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           )),
//                     ],
//                   )),
//             ],
//           ),
//           SizedBox(width: 20),
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                     mycartController.init();
//                     Get.to(AddToCardUser());
//                     // Get.to(AddToCardUser());
//                   },
//                   child:
//                       Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():

//               Positioned(
//                   top: 10.0,
//                   right: 0,
//                   child: Stack(
//                     children: <Widget>[
//                       Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                       GetBuilder<MyCartController>(
//                           init: mycartController,
//                           builder: (_) {
//                             return mycartController.mycartmodel == null ||
//                                     mycartController.mycartmodel!.data ==
//                                         null ||
//                                     mycartController.mycartmodel!.data!.isEmpty
//                                 ? const SizedBox()
//                                 : Positioned(
//                                     top: 3.0,
//                                     right: 4.0,
//                                     child: Center(
//                                       child: Text(
//                                         (mycartController
//                                                 .mycartmodel!.data!.length)
//                                             .toString(),
//                                         // list.length.toString(),
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 8.0,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ));
//                           }),
//                     ],
//                   )),
//             ],
//           ),
//           SizedBox(
//             width: 20,
//           )
//         ],
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(
//         //     bottom: Radius.circular(20),
//         //   ),
//         // ),
//       ),

      // backgroundcolor:MyColors.white,

      body: Padding(
        // padding: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                await homeusercontroller.init();
                await Future.delayed(Duration(seconds: 2));
              },
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                primary: false,
                // shrinkWrap: true,

                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Find the pet you love on around you easily",
                              style: CustomTextStyle.popinstext,
                            )),

                        // Image.asset("assets/image/girl.png")
                        //  SvgPicture.asset("assets/image/girl.svg"),

                        GetBuilder<ProfileController>(
                            init: profilecontroller,
                            builder: (_) {
                              return profilecontroller.myprofilemodel == null ||
                                      profilecontroller.myprofilemodel!.data ==
                                          null ||
                                      profilecontroller
                                          .myprofilemodel!.data!.isEmpty
                                  ? Image.asset("assets/image/boyprofile3.png",
                                      height: 75)
                                  : Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),

                                          // child: CircleAvatar(
                                          //   radius: 35,
                                          //   backgroundColor: Colors.transparent,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                                                    profilecontroller
                                                        .myprofilemodel!
                                                        .data![0]
                                                        .image
                                                        .toString(),
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50,
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
                                          //  Image.asset("assets/image/boyprofile3.png"),
                                          // ),
                                        ),
                                      ));

                              // Image.asset("assets/image/girl.png")
                            }),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GetBuilder<HomeuserController>(
                    init: homeusercontroller,
                    builder: (_) {
                      return homeusercontroller.userBannerModel == null
                          ? SizedBox()
                          : CarouselSlider.builder(
                              itemCount: homeusercontroller
                                  .userBannerModel!.data!.length,
                              options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                              ),
                              itemBuilder: (context, index, realIdx) {
                                var item = homeusercontroller
                                    .userBannerModel!.data![index];

                                var imagePath =
                                    "${Constants.BANNER_IMAGE_PATH}${item.image ?? ""}";
                                return Stack(
                                  children: [
                                    // Image.asset(item["image"]),
                                    Container(
                                      height: 140,
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath, fit: BoxFit.cover,
                                        // width: 61,
                                        // height: 75,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                    // Positioned(
                                    //   top: 30,
                                    //   left: 10,
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         item.title!,
                                    //         style:
                                    //             CustomTextStyle.popinstextsmall12,
                                    //       ),
                                    //       SizedBox(
                                    //           width: MediaQuery.of(context)
                                    //                   .size
                                    //                   .width *
                                    //               0.37,
                                    //           child: Text(
                                    //             item.data!,
                                    //             style: CustomTextStyle
                                    //                 .popinstextsmall12,
                                    //           )),

                                    //       SizedBox(
                                    //         height:
                                    //             MediaQuery.of(context).size.height *
                                    //                 0.02,
                                    //       ),
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             right: 10, bottom: 10),
                                    //         child: Container(
                                    //             width: 80,
                                    //             height: 30,
                                    //             decoration: BoxDecoration(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(15),
                                    //                 color: Color(0xffffcc00)),
                                    //             child: Center(
                                    //                 child: Text(
                                    //               "Shop  Now",
                                    //               style:
                                    //                   CustomTextStyle.popinssmall1,
                                    //             ))),
                                    //       )

                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                );

                                // Container(
                                //   child: Center(
                                //       child: Image.asset( item["image"],
                                //           fit: BoxFit.cover, )),
                                // );
                              });
                    },
                  ),

                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
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
                            onTap: () {
                              homeusercontroller.clearSearchData();
                              Get.to(SearchScreen());
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
                        // GetBuilder<FilterController>(
                        //       // init: filtercontroller,
                        //       builder: (_) {
                        //  return
                        GestureDetector(
                          onTap: () {
                            FilterController filtercontroller =
                                Get.put(FilterController());
                            // filtercontroller.init();
                            filtercontroller.loadDefaultData();
                            filtercontroller.clearFields();
                            // Get.to(FilterScreen());
                            filtercontroller.init();
                            Get.to(FilterScreenUI());
                            Get.to(FilterScreen());
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

                        // )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  //      Row(

                  //       children: [

                  //       Expanded(
                  //         child: Container(
                  //            height: MediaQuery.of(context).size.height*0.07,
                  //       width: MediaQuery.of(context).size.width*0.65,

                  //                   decoration: BoxDecoration(

                  //                       borderRadius: BorderRadius.circular(15),

                  //                       // border: Border.all(color:brandcolor ),

                  //                      color: MyColors.white,
                  //       //                 boxShadow: [ BoxShadow(
                  //       //   color: Color.fromARGB(77, 0, 0, 0),
                  //       //   blurRadius: 20.0,

                  //       // ),]

                  //                   ),

                  //           child: TextFormField(
                  //                                 controller: _searchcontroller,
                  //                                               style: TextStyle(fontSize: 14,color: voliet, fontFamily: "SF-Pro-Display",),

                  //                              decoration: InputDecoration(

                  //                                      contentPadding: EdgeInsets.only(left: 15),
                  //                                     fillcolor:MyColors.white,
                  //                                     focuscolor:MyColors.white,
                  //                                     enabledBorder: OutlineInputBorder(
                  //                                       borderSide: BorderSide.none,
                  //                                       // borderRadius: BorderRadius.circular(50),
                  //                                     ),
                  //                                     focusedBorder: OutlineInputBorder(
                  //                                       borderSide: BorderSide.none,
                  //                                       //  borderRadius: BorderRadius.circular(50),
                  //                                     ),
                  //                                     border: OutlineInputBorder(
                  //                                       borderSide: BorderSide.none,
                  //                                       //  borderRadius: BorderRadius.circular(50),
                  //                                     ),
                  //                                     hintText:"Search",
                  //                                     prefixIcon:Padding(
                  //                                       padding: const EdgeInsets.all(10.0),
                  //                                       child: Image.asset("assets/image/searchnormal.png",width: 10,),
                  //                                     ),

                  //                                     hintStyle:
                  //                                     TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)

                  //                                     ),
                  //                               ),
                  //         ),
                  //       ),

                  // //  SizedBox(width: 10,),
                  //  SizedBox(width: MediaQuery.of(context).size.width*0.27,

                  //   child: SvgPicture.asset("assets/image/filter.svg"))

                  //      ],),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          GetBuilder<HomeuserController>(
                              init: homeusercontroller,
                              builder: (_) {
                                return !homeusercontroller.categoryLoaded
                                    ? SizedBox()
                                    : ListView.builder(
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: homeusercontroller
                                            .userCategoriesModel!.data!.length,
                                        itemBuilder: (context, index) {
                                          var item = homeusercontroller
                                              .userCategoriesModel!
                                              .data![index];
                                          // print(item.name!);
                                          var imagePath =
                                              "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                                          // print(imagePath);

                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                print(
                                                    "========>>>>>>>>>>> ###### ${item.name}");
                                                subcategorycontroller
                                                    .addproduct(item.id ?? 0);
                                                subcategorycontroller
                                                    .currentCategory(
                                                        item.name ?? "");
                                                await subcategorycontroller
                                                    .productInitByCategory();

                                                Get.to(() => Allcategory());
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: CachedNetworkImage(
                                                      imageUrl: imagePath,
                                                      width: 61,
                                                      height: 75,
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
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(item.name!,
                                                      style: CustomTextStyle
                                                          .popinssmall)
                                                ],
                                              ),
                                            ),

                                            //  Stack(
                                            //   children: [
                                            //     Container(
                                            //       width: 69,
                                            //       height: 75,
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(23),
                                            //         color: item,
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //             color: Colors.grey.withOpacity(0.3),
                                            //             spreadRadius: 2,
                                            //             blurRadius: 5,
                                            //             offset: Offset(
                                            //                 0, 3), // Offset of the shadow
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // )
                                          );
                                        },
                                      );
                              }),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Arrivals",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            ProductDetailsController productdeatilscontroller =
                                Get.put(ProductDetailsController());

                            Get.to(() => const ProductAlllistPage());
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // !homeusercontroller.propertyLoaded
                  //     ? SizedBox()
                  //     : GetBuilder<HomeuserController>(
                  //       init: homeusercontroller,
                  //       builder: (_) {
                  //         return
                  GetBuilder<HomeuserController>(
                      init: homeusercontroller,
                      builder: (_) {
                        return homeusercontroller.userPropertiesModel == null
                            ? const SizedBox()
                            : homeusercontroller.propertyLoaded == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Container(
                                      // height: 600,
                                      child: GridView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15.0,
                                                  mainAxisSpacing: 15.0,
                                                  mainAxisExtent: 280),
                                          itemCount: homeusercontroller
                                              .userPropertiesModel!.data!.length
                                              .clamp(0,
                                                  4), // Set the number of cards you want to display.
                                          itemBuilder: (context, index) {
                                            // gridDelegate:
                                            //     SliverGridDelegateWithMaxCrossAxisExtent(
                                            //         maxCrossAxisExtent: 150,
                                            //      childAspectRatio: 3 / 2,
                                            //         mainAxisExtent: 300,
                                            //         crossAxisSpacing: 15,
                                            //         mainAxisSpacing: 15),
                                            // itemCount: homeusercontroller
                                            //     .userPropertiesModel!.data!.length
                                            //     .clamp(0, 4),
                                            // itemBuilder: (BuildContext ctx, index) {

                                            var item = homeusercontroller
                                                .userPropertiesModel!
                                                .data![index];
                                            String imagePath = Constants
                                                    .PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";

                                            // var imagePath =
                                            //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                            // print(imagePath);
                                            return InkWell(
                                              onTap: () async {
                                                productdeatilscontroller
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );

                                                // print("productid${item.id ?? 0}");
                                                await productdeatilscontroller
                                                    .init();
                                                userreviewController.reviewAdd(
                                                    item.id ?? 0, 0);
                                                await userreviewController
                                                    .init();
                                                Get.to(ProductDetails());
                                                // Get.to( ProductDetails());
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //           ));
                                              },
                                              child: Container(
                                                width: 140,
                                                // height: 700,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      _getRandomColor(),
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
                                                    InkWell(
                                                      onTap: () {
                                                        homeusercontroller
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
                                                          child: Icon(
                                                              homeusercontroller
                                                                      .wishListItemsId
                                                                      .contains(
                                                                          item
                                                                              .id!)
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
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
                                                                style: CustomTextStyle
                                                                    .popinsmedium),
                                                            Text(
                                                                item.description
                                                                            .toString()
                                                                            .length <
                                                                        30
                                                                    ? item
                                                                        .description!
                                                                    : item
                                                                        .description!
                                                                        .substring(
                                                                            0,
                                                                            19),
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
                                                                                item.price.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
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
                                                                            "Save${item.discount.toString()}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ),
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
                                                                            "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                                                            // "₹" +
                                                                            //     item.price!,
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.073),
                                                                        Padding(
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
                                          }),
                                    ),
                                  );
                      }),

                  //               Container(
                  //                 height: 600,
                  //                 child: GridView.builder(
                  //                     scrollDirection: Axis.vertical,
                  //                     physics: NeverScrollableScrollPhysics(),
                  //                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //                         maxCrossAxisExtent: 150,
                  //                         childAspectRatio: 3 / 2,
                  //                        mainAxisExtent: 270,
                  //                         crossAxisSpacing: 15,
                  //                         mainAxisSpacing: 15),
                  //                     itemCount: homeusercontroller.getProductList.length,
                  //                     itemBuilder: (BuildContext ctx, index) {
                  //                       var item = homeusercontroller.getProductList[index];
                  //                       return InkWell(
                  //                         onTap: () {
                  //                           Get.to(()=> ProductDetails());

                  //                         },
                  //                         child: Container(
                  //                           width: 160,
                  //                           // height: 700,
                  //                           decoration: BoxDecoration(
                  //                               borderRadius: BorderRadius.circular(25),
                  //                                boxShadow: [
                  //                                         BoxShadow(
                  //                                           color: Colors.white,
                  //                                           spreadRadius: 2,
                  //                                           blurRadius: 5,
                  //                                           offset: Offset(
                  //                                               0, 3), // Offset of the shadow
                  //                                         ),
                  //                                       ],
                  //                               // color: MyColors.white
                  //                               ),
                  //                           child: Column(
                  //                             children: [
                  //                               Container(
                  //                                 height: 125,

                  //                                 // decoration: BoxDecoration(
                  //                                 //     borderRadius: BorderRadius.circular(30),
                  //                                 //     color: MyColors.white),
                  //                                 child: Image.asset(item["image"],
                  //                                     fit: BoxFit.cover,),
                  //                               ),

                  //                               // SizedBox(height: 15,),

                  //                               Container(
                  //                                    height: 145,
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.only(left:10.0,right: 5,top:5),
                  //                                   child: Column(
                  //                                     mainAxisAlignment: MainAxisAlignment.start,
                  //                                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                                     children: [
                  //                                       Text(item["title"],
                  //                                           style: CustomTextStyle.popinsmedium),
                  //                                       Text(item["subtitle"],
                  //                                           style: CustomTextStyle.popinssmall0),
                  //                                       // SizedBox(height: 3),

                  //                                       Row(
                  //                                         mainAxisAlignment:
                  //                                             MainAxisAlignment.spaceBetween,
                  //                                         children: [
                  //                                           Text(
                  //                                             item["price"],
                  //                                             style: CustomTextStyle.popinsmedium,
                  //                                           ),

                  //                              Container(
                  //                    width: 35,
                  // height: 35,
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(10),
                  //                           color: Color(0xffffcc00)),
                  //                       child: Padding(
                  //                         padding:  EdgeInsets.all(10.0),
                  //                         child: Image.asset(
                  //                            "assets/image/bag2.png",height: 80,
                  //                         ),
                  //                       ))

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
                  //               ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Our Brand",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            Get.to(() => AllbrandPage(
                                data: homeusercontroller.userBrandModel!.data!
                                    .where((element) => element.canine == 1)
                                    .toList()));
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        // GetBuilder<HomeuserController>(
                        //     init: homeusercontroller,
                        //     builder: (_) {
                        //       return !homeusercontroller.categoryLoaded
                        //           ? SizedBox()
                        //           : ListView.builder(
                        //               primary: false,
                        //               scrollDirection: Axis.horizontal,
                        //               shrinkWrap: true,
                        //               itemCount:
                        //                   homeusercontroller.getOurBrandList.length,
                        //               itemBuilder: (context, index) {
                        //                 var item =
                        //                     homeusercontroller.getOurBrandList[index];
                        //                 // print(item.name!);
                        //                 // var imagePath =
                        //                 //     "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                        //                 // print(imagePath);

                        //                 return Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Column(
                        //                     children: [
                        //                       Container(
                        //                         height: MediaQuery.of(context)
                        //                                 .size
                        //                                 .width *
                        //                             0.55,
                        //                         width: MediaQuery.of(context)
                        //                                 .size
                        //                                 .width *
                        //                             0.46,
                        //                         decoration: BoxDecoration(
                        //                           borderRadius:
                        //                               BorderRadius.circular(30),
                        //                           // color: MyColors.white
                        //                         ),
                        //                         child: Stack(
                        //                           alignment: Alignment.topCenter,
                        //                           children: [
                        //                             // SizedBox(height: 140,),
                        //                             Container(
                        //                               height: MediaQuery.of(context)
                        //                                       .size
                        //                                       .width *
                        //                                   0.6,
                        //                               width: MediaQuery.of(context)
                        //                                       .size
                        //                                       .width *
                        //                                   0.46,
                        //                               decoration: BoxDecoration(
                        //                                   borderRadius:
                        //                                       BorderRadius.circular(
                        //                                           30),
                        //                                   color: Colors.transparent),
                        //                               child: Column(
                        //                                 children: [
                        //                                   Padding(
                        //                                     padding:
                        //                                         const EdgeInsets.only(
                        //                                             top: 25.0),
                        //                                     child: Container(
                        //                                       decoration:
                        //                                           BoxDecoration(
                        //                                         borderRadius:
                        //                                             BorderRadius
                        //                                                 .circular(30),
                        //                                         gradient:
                        //                                             LinearGradient(
                        //                                           begin: Alignment
                        //                                               .topCenter,
                        //                                           end: Alignment
                        //                                               .bottomCenter,
                        //                                           colors: [
                        //                                             Color(0xFFFFF0BA),
                        //                                             Color.fromRGBO(
                        //                                                 252,
                        //                                                 233,
                        //                                                 166,
                        //                                                 0.00),
                        //                                           ],
                        //                                         ),
                        //                                       ),
                        //                                       child: Image.asset(
                        //                                           item["image"],
                        //                                           fit: BoxFit.cover,
                        //                                           height: 135),
                        //                                     ),
                        //                                   ),
                        //                                   SizedBox(
                        //                                     height: 15,
                        //                                   ),
                        //                                   Text(item["title"],
                        //                                       style: CustomTextStyle
                        //                                           .popinssmall0)
                        //                                 ],
                        //                               ),
                        //                             ),

                        //                             Positioned(
                        //                               top: 3,
                        //                               child: Container(
                        //                                   height: 50,
                        //                                   width: 60,
                        //                                   decoration: BoxDecoration(
                        //                                       color: Colors.white
                        //                                           .withOpacity(0.3),
                        //                                       borderRadius:
                        //                                           BorderRadius
                        //                                               .circular(20)),
                        //                                   child: Image.asset(
                        //                                     item["logo"],
                        //                                     height: 50,
                        //                                   )),
                        //                             )
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),

                        //                   //  Stack(
                        //                   //   children: [
                        //                   //     Container(
                        //                   //       width: 69,
                        //                   //       height: 75,
                        //                   //       decoration: BoxDecoration(
                        //                   //         borderRadius: BorderRadius.circular(23),
                        //                   //         color: item,
                        //                   //         boxShadow: [
                        //                   //           BoxShadow(
                        //                   //             color: Colors.grey.withOpacity(0.3),
                        //                   //             spreadRadius: 2,
                        //                   //             blurRadius: 5,
                        //                   //             offset: Offset(
                        //                   //                 0, 3), // Offset of the shadow
                        //                   //           ),
                        //                   //         ],
                        //                   //       ),
                        //                   //     ),
                        //                   //   ],
                        //                   // )
                        //                 );
                        //               },
                        //             );
                        //     }),
                        GetBuilder<HomeuserController>(
                            init: homeusercontroller,
                            builder: (_) {
                              return homeusercontroller.userBrandModel == null
                                  ? SizedBox()
                                  : ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: homeusercontroller
                                          .userBrandModel!.data!
                                          .where(
                                              (element) => element.canine == 1)
                                          .toList()
                                          .length,
                                      itemBuilder: (context, index) {
                                        var item = homeusercontroller
                                            .userBrandModel!.data!
                                            .where((element) =>
                                                element.canine == 1)
                                            .toList()[index];
                                        // print(item.name!);
                                        var imagePath =
                                            "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                        var imageLogoPath =
                                            "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                        // print(imagePath);
                                        return InkWell(
                                          onTap: () {
                                            Ourbranddetailscontroller
                                                .addproduct(item.id ?? 0,
                                                    item.logo ?? '');
                                            //  subcategorycontroller.addproduct(item.id??0) ;

                                            Get.to(OurBrandDetails());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.46,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    // color: MyColors.white
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      // SizedBox(height: 140,),
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Colors
                                                                .transparent),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          25.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFFF0BA),
                                                                      Color.fromRGBO(
                                                                          252,
                                                                          233,
                                                                          166,
                                                                          0.00),
                                                                    ],
                                                                  ),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      imagePath,
                                                                  // width: 50,
                                                                  height: 135,
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
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(item.title!,
                                                                style: CustomTextStyle
                                                                    .popinssmall0)
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 3,
                                                        child: Container(
                                                          height: 50,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child:
                                                              // Image.asset(
                                                              //   item["logo"],
                                                              //   height: 50,
                                                              // ),
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                imageLogoPath,
                                                            // width: 50,
                                                            height: 50,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //  Stack(
                                            //   children: [
                                            //     Container(
                                            //       width: 69,
                                            //       height: 75,
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(23),
                                            //         color: item,
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //             color: Colors.grey.withOpacity(0.3),
                                            //             spreadRadius: 2,
                                            //             blurRadius: 5,
                                            //             offset: Offset(
                                            //                 0, 3), // Offset of the shadow
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // )
                                          ),
                                        );
                                      },
                                    );
                            }),
                      ],
                    ),
                  ),

                  //             SingleChildScrollView(
                  //               scrollDirection: Axis.horizontal,
                  //               child:
                  //                   Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // // Card(color: Colors.white70 ,
                  // //                           shape: RoundedRectangleBorder(
                  // //                               borderRadius: BorderRadius.circular(15)
                  // //                           ),
                  // //                           child: Stack(
                  // //                             children: [
                  // //                               Column(mainAxisAlignment: MainAxisAlignment.start,
                  // //                                 children: [
                  // //                                   Padding(
                  // //                                     padding:  EdgeInsets.all(15.0),
                  // //                                     child: Container(
                  // //                                       decoration: BoxDecoration(
                  // //                                         //borderRadius: BorderRadius.circular(),
                  // //                                           border: Border.all(color: Colors.black,width: 0.5)
                  // //                                       ),
                  // //                                       child: Image.asset("assets/image/dog5.png"),
                  // //                                     ),
                  // //                                   ),
                  // //                                   Padding(
                  // //                                     padding:  EdgeInsets.only(left: 15.0,right: 15),
                  // //                                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // //                                       children: [
                  // //                                         Text("Mobile", style: TextStyle(
                  // //                                           // fontWeight: FontWeight
                  // //                                           //     .bold,
                  // //                                            // color: voilet,
                  // //                                             fontSize: 14),),
                  // //                                         Row(
                  // //                                           children: [
                  // //                                             Text("4.5", style: TextStyle(
                  // //                                               // fontWeight: FontWeight
                  // //                                               //     .bold,
                  // //                                                // color: voilet,
                  // //                                                 fontSize: 14),),
                  // //                                             Image.asset("assets/image/food5.png",height: 15,)

                  // //                                           ],)

                  // //                                       ],
                  // //                                     ),
                  // //                                   ),
                  // //                                   Padding(
                  // //                                     padding:  EdgeInsets.only(left: 15.0,right: 15),
                  // //                                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // //                                       children: [
                  // //                                         Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // //                                           children: [
                  // //                                             Text(
                  // //                                               "LAVA 3500",
                  // //                                               textAlign: TextAlign.center,
                  // //                                               style: TextStyle(
                  // //                                                 // fontWeight: FontWeight
                  // //                                                 //     .bold,
                  // //                                                  // color: voilet,
                  // //                                                   fontSize: 14),
                  // //                                             ),
                  // //                                             Text(
                  // //                                               "₹ 459.00",
                  // //                                               textAlign: TextAlign.center,
                  // //                                               style: TextStyle(
                  // //                                                 // fontWeight: FontWeight
                  // //                                                 //     .bold,
                  // //                                                  // color: voilet,
                  // //                                                   fontSize: 14),
                  // //                                             ),

                  // //                                             Row(children: [
                  // //                                               Container(decoration: BoxDecoration(
                  // //                                                   borderRadius: BorderRadius.circular(10),
                  // //                                                   border: Border.all(color: Color(0xfff73563),width: 0.5))
                  // //                                                 ,child: Padding(
                  // //                                                   padding:  EdgeInsets.all(3),
                  // //                                                   child: CircleAvatar(radius: 5,backgroundColor: Colors.transparent,child: Text("S",style:TextStyle(color: Color(0xfff73563),fontSize: 10))),
                  // //                                                 ),),
                  // //                                               SizedBox(width: 3,),
                  // //                                               Container(decoration: BoxDecoration(
                  // //                                                   borderRadius: BorderRadius.circular(10),
                  // //                                                   border: Border.all(color: Color(0xfff73563),width: 0.5))
                  // //                                                 ,child: Padding(
                  // //                                                   padding:  EdgeInsets.all(3),
                  // //                                                   child: CircleAvatar(radius: 5,backgroundColor: Colors.transparent,child: Text("L",style:TextStyle(color: Color(0xfff73563),fontSize: 10))),
                  // //                                                 ),),
                  // //                                               SizedBox(width: 3,),

                  // //                                               Container(decoration: BoxDecoration(
                  // //                                                   borderRadius: BorderRadius.circular(10),
                  // //                                                   border: Border.all(color: Color(0xfff73563),width: 0.5))
                  // //                                                 ,child: Padding(
                  // //                                                   padding:  EdgeInsets.all(3),
                  // //                                                   child: CircleAvatar(radius: 5,backgroundColor: Colors.transparent,child: Text("M",style:TextStyle(color: Color(0xfff73563),fontSize: 10))),
                  // //                                                 ),),

                  // //                                             ],)
                  // //                                           ],
                  // //                                         ),
                  // //                                         //Icon(Icons.shopping_bag_outlined,color: pink,size: 20,)
                  // //                                       ],
                  // //                                     ),
                  // //                                   ),

                  // //                                 ],
                  // //                               ),
                  // //                               Padding(
                  // //                                 padding:  EdgeInsets.only(left: 10.0,right: 10,top:10),
                  // //                                 child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  // //                                   children: [

                  // //                                     Container(decoration: BoxDecoration(
                  // //                                         borderRadius: BorderRadius.circular(10),
                  // //                                         border: Border.all(color: Color(0xfff73563),width: 1))
                  // //                                       ,child: Padding(
                  // //                                         padding:  EdgeInsets.all(0),
                  // //                                         child: Image.asset("assets/image/heartremove.png",color: Color(0xfff73563),height: 25,),
                  // //                                       ),),

                  // //                                   ],),
                  // //                               )
                  // //                             ],
                  // //                           ),
                  // //                         ),

                  //                 InkWell(
                  //                   onTap: () {
                  //                     Navigator.push(context,
                  //                         MaterialPageRoute(builder: (context) => OurBrand()));
                  //                   },
                  //                   child: Stack(
                  //                     alignment: Alignment.topCenter,
                  //                     children: [
                  //                       // SizedBox(height: 140,),
                  //                       Container(
                  //                         height: MediaQuery.of(context).size.width * 0.6,
                  //                         width: MediaQuery.of(context).size.width * 0.46,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.circular(30),
                  //                             boxShadow: [
                  //                               BoxShadow(
                  //                                 color: Colors.grey.withOpacity(0.3),
                  //                                 spreadRadius: 2,
                  //                                 blurRadius: 5,
                  //                                 offset: Offset(0, 3), // Offset of the shadow
                  //                               ),
                  //                             ],
                  //                             // color: MyColors.white
                  //                             //                          gradient: LinearGradient(
                  //                             //   begin: Alignment.topCenter,
                  //                             //   end: Alignment.bottomCenter,
                  //                             //   colors: [
                  //                             //     Color(0xFFFFF0BA),
                  //                             //     Color.fromRGBO(252, 233, 166, 0.00),
                  //                             //   ],
                  //                             // ),
                  //                             ),
                  //                         child: Column(
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top: 25.0),
                  //                               child: Container(
                  //                                 height: 100,
                  //                                 decoration: BoxDecoration(
                  //                                   gradient: LinearGradient(
                  //                                     begin: Alignment.topCenter,
                  //                                     end: Alignment.bottomCenter,
                  //                                     colors: [
                  //                                       Color(0xFFFFF0BA),
                  //                                       Color.fromRGBO(252, 233, 166, 0.00),
                  //                                     ],
                  //                                   ),
                  //                                   borderRadius: BorderRadius.circular(30),
                  //                                   // color: MyColors.white
                  //                                 ),
                  //                                 child: Image.asset("assets/image/food5.png",
                  //                                     fit: BoxFit.cover, height: 135),
                  //                               ),
                  //                             ),

                  //                             // SizedBox(height: 15,),
                  //                             Container(
                  //                               height: 100,
                  //                               child: Text('Reservation',
                  //                                   style: CustomTextStyle.popinssmall0),
                  //                             )

                  //                             // Column(
                  //                             //   mainAxisAlignment:
                  //                             //       MainAxisAlignment.start,
                  //                             //   crossAxisAlignment:
                  //                             //       CrossAxisAlignment.start,
                  //                             //   children: [

                  //                             //   ],
                  //                             // )
                  //                           ],
                  //                         ),
                  //                       ),

                  //                       Positioned(
                  //                         top: 3,
                  //                         child: Container(
                  //                             height: 50,
                  //                             width: 60,
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.white.withOpacity(0.3),
                  //                                 borderRadius: BorderRadius.circular(20)),
                  //                             child: Image.asset(
                  //                               "assets/image/dog9.png",
                  //                               height: 50,
                  //                             )),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),

                  // Stack(  alignment: Alignment.topCenter,children: [
                  //   Container(
                  //                     height: MediaQuery.of(context).size.width * 0.63,
                  //                     width: MediaQuery.of(context).size.width * 0.46,
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(30),

                  //                       color: MyColors.white
                  //                     ),child: Column(
                  //                       children: [
                  //     Container(
                  //                         height: MediaQuery.of(context).size.width * 0.6,
                  //                         width: MediaQuery.of(context).size.width * 0.46,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.circular(30),
                  //                             color: Colors.transparent),
                  //                         child: Column(
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top: 0.0),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   borderRadius: BorderRadius.circular(30),
                  //                                   gradient: LinearGradient(
                  //                                     begin: Alignment.topCenter,
                  //                                     end: Alignment.bottomCenter,
                  //                                     colors: [
                  //                                       Color(0xFFFFF0BA),
                  //                                       Color.fromRGBO(252, 233, 166, 0.00),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 child: Image.asset("assets/image/food5.png",
                  //                                     fit: BoxFit.cover, height: 135),
                  //                               ),
                  //                             ),

                  //                             SizedBox(height: 15,),

                  //                             Text('Reservation',
                  //                                 style: CustomTextStyle.popinssmall0)
                  //                           ],
                  //                         ),
                  //                       ),

                  //                     ],)),
                  //           Positioned(
                  //                           top: 3,
                  //                           child: Container(
                  //                               height: 50,
                  //                               width: 60,
                  //                               decoration: BoxDecoration(
                  //                                   color: Colors.white.withOpacity(0.3),
                  //                                   borderRadius: BorderRadius.circular(20)),
                  //                               child: Image.asset(
                  //                                 "assets/image/dog9.png",
                  //                                 height: 50,
                  //                               )),
                  //                         )

                  // ],),
                  //                 Container(
                  //                   height: MediaQuery.of(context).size.width * 0.63,
                  //                   width: MediaQuery.of(context).size.width * 0.46,
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     // color: MyColors.white
                  //                   ),
                  //                   child: Stack(
                  //                     alignment: Alignment.topCenter,
                  //                     children: [
                  //                       // SizedBox(height: 140,),
                  //                       Container(
                  //                         height: MediaQuery.of(context).size.width * 0.6,
                  //                         width: MediaQuery.of(context).size.width * 0.46,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.circular(30),
                  //                             color: Colors.transparent),
                  //                         child: Column(
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top: 25.0),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   borderRadius: BorderRadius.circular(30),
                  //                                   gradient: LinearGradient(
                  //                                     begin: Alignment.topCenter,
                  //                                     end: Alignment.bottomCenter,
                  //                                     colors: [
                  //                                       Color(0xFFFFF0BA),
                  //                                       Color.fromRGBO(252, 233, 166, 0.00),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 child: Image.asset("assets/image/food5.png",
                  //                                     fit: BoxFit.cover, height: 135),
                  //                               ),
                  //                             ),

                  //                             // SizedBox(height: 15,),

                  //                             Text('Reservation',
                  //                                 style: CustomTextStyle.popinssmall0)
                  //                           ],
                  //                         ),
                  //                       ),

                  //                       Positioned(
                  //                         top: 3,
                  //                         child: Container(
                  //                             height: 50,
                  //                             width: 60,
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.white.withOpacity(0.3),
                  //                                 borderRadius: BorderRadius.circular(20)),
                  //                             child: Image.asset(
                  //                               "assets/image/dog9.png",
                  //                               height: 50,
                  //                             )),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               Container(
                  //                   height: MediaQuery.of(context).size.width * 0.63,
                  //                   width: MediaQuery.of(context).size.width * 0.46,
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     // color: MyColors.white
                  //                   ),
                  //                   child: Stack(
                  //                     alignment: Alignment.topCenter,
                  //                     children: [
                  //                       // SizedBox(height: 140,),
                  //                       Container(
                  //                         height: MediaQuery.of(context).size.width * 0.6,
                  //                         width: MediaQuery.of(context).size.width * 0.46,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.circular(30),
                  //                             color: Colors.transparent),
                  //                         child: Column(
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top: 25.0),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                     borderRadius: BorderRadius.circular(30),
                  //                                     color: MyColors.white),
                  //                                 child: Image.asset("assets/image/food5.png",
                  //                                     fit: BoxFit.cover, height: 135),
                  //                               ),
                  //                             ),

                  //                             // SizedBox(height: 15,),

                  //                             Text('Reservation',
                  //                                 style: CustomTextStyle.popinssmall0)
                  //                           ],
                  //                         ),
                  //                       ),

                  //                       Positioned(
                  //                         top: 3,
                  //                         child: Container(
                  //                             height: 50,
                  //                             width: 60,
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.white.withOpacity(0.3),
                  //                                 borderRadius: BorderRadius.circular(20)),
                  //                             child: Image.asset(
                  //                               "assets/image/dog9.png",
                  //                               height: 50,
                  //                             )),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ]),
                  //             ),

                  //  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  //  GetBuilder<HomeuserController>(
                  //                       init: homeusercontroller,
                  //                       builder: (_) {
                  //                         return   Center(
                  //                                     child: homeusercontroller.videoController.value.isInitialized
                  //                                         ? AspectRatio(
                  //                                             aspectRatio:  homeusercontroller.videoController
                  //                                                 .value.aspectRatio,
                  //                                             child: VideoPlayer( homeusercontroller.videoController),
                  //                                           )
                  //                                         : CircularProgressIndicator(),
                  //                                   );

                  //                       }),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shop By Brand",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            Get.to(AllbrandPage(
                                data: homeusercontroller.userBrandModel!.data!
                                    .where((element) => element.canine == 0)
                                    .toList()));
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0),

                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GetBuilder<HomeuserController>(
                            init: homeusercontroller,
                            builder: (_) {
                              return homeusercontroller.userBrandModel == null
                                  ? SizedBox()
                                  : ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: homeusercontroller
                                          .userBrandModel!.data!
                                          .where(
                                              (element) => element.canine == 0)
                                          .toList()
                                          .length,
                                      itemBuilder: (context, index) {
                                        var item = homeusercontroller
                                            .userBrandModel!.data!
                                            .where((element) =>
                                                element.canine == 0)
                                            .toList()[index];
                                        // print(item.name!);
                                        var imagePath =
                                            "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                        var imageLogoPath =
                                            "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                        // print(imagePath);
                                        return InkWell(
                                          onTap: () {
                                            Ourbranddetailscontroller
                                                .addproduct(item.id ?? 0,
                                                    item.logo ?? '');
                                            Get.to(OurBrandDetails());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.46,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    // color: MyColors.white
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      // SizedBox(height: 140,),
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Colors
                                                                .transparent),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          25.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFFF0BA),
                                                                      Color.fromRGBO(
                                                                          252,
                                                                          233,
                                                                          166,
                                                                          0.00),
                                                                    ],
                                                                  ),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      imagePath,
                                                                  // width: 50,
                                                                  height: 135,
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
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(item.title!,
                                                                style: CustomTextStyle
                                                                    .popinssmall0)
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 3,
                                                        child: Container(
                                                          height: 50,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child:
                                                              // Image.asset(
                                                              //   item["logo"],
                                                              //   height: 50,
                                                              // ),
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                imageLogoPath,
                                                            // width: 50,
                                                            height: 50,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //  Stack(
                                            //   children: [
                                            //     Container(
                                            //       width: 69,
                                            //       height: 75,
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(23),
                                            //         color: item,
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //             color: Colors.grey.withOpacity(0.3),
                                            //             spreadRadius: 2,
                                            //             blurRadius: 5,
                                            //             offset: Offset(
                                            //                 0, 3), // Offset of the shadow
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // )
                                          ),
                                        );
                                      },
                                    );
                            }),
                      ],
                    ),
                  ),

                  // Container(
                  //   height: 250,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ListView(
                  //     primary: false,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       GetBuilder<HomeuserController>(
                  //           init: homeusercontroller,
                  //           builder: (_) {
                  //             return homeusercontroller.userBrandModel == null
                  //                 ? SizedBox()
                  //                 : ListView.builder(
                  //                     primary: false,
                  //                     scrollDirection: Axis.horizontal,
                  //                     shrinkWrap: true,
                  //                     itemCount: homeusercontroller
                  //                         .userBrandModel!.data!.length,
                  //                     itemBuilder: (context, index) {
                  //                       var item = homeusercontroller
                  //                           .userBrandModel!.data![index];
                  //                       // print(item.name!);
                  //                       var imagePath =
                  //                           "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                  //                       var imageLogoPath =
                  //                           "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                  //                       // print(imagePath);
                  //                       return InkWell(
                  //                         onTap: () {
                  //                           Ourbranddetailscontroller.addproduct(
                  //                               item.id ?? 0, item.logo ?? '');
                  //                           Get.to(OurBrandDetails());
                  //                         },
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(8.0),
                  //                           child: Column(
                  //                             children: [
                  //                               Container(
                  //                                 height: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width *
                  //                                     0.55,
                  //                                 width: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width *
                  //                                     0.46,
                  //                                 decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(30),
                  //                                   // color: MyColors.white
                  //                                 ),
                  //                                 child: Stack(
                  //                                   alignment:
                  //                                       Alignment.topCenter,
                  //                                   children: [
                  //                                     // SizedBox(height: 140,),
                  //                                     Container(
                  //                                       height:
                  //                                           MediaQuery.of(context)
                  //                                                   .size
                  //                                                   .width *
                  //                                               0.6,
                  //                                       width:
                  //                                           MediaQuery.of(context)
                  //                                                   .size
                  //                                                   .width *
                  //                                               0.46,
                  //                                       decoration: BoxDecoration(
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .circular(30),
                  //                                           color: Colors
                  //                                               .transparent),
                  //                                       child: Column(
                  //                                         children: [
                  //                                           Padding(
                  //                                             padding:
                  //                                                 const EdgeInsets
                  //                                                         .only(
                  //                                                     top: 25.0),
                  //                                             child: Container(
                  //                                               decoration:
                  //                                                   BoxDecoration(
                  //                                                 borderRadius:
                  //                                                     BorderRadius
                  //                                                         .circular(
                  //                                                             30),
                  //                                                 gradient:
                  //                                                     LinearGradient(
                  //                                                   begin: Alignment
                  //                                                       .topCenter,
                  //                                                   end: Alignment
                  //                                                       .bottomCenter,
                  //                                                   colors: [
                  //                                                     Color(
                  //                                                         0xFFFFF0BA),
                  //                                                     Color.fromRGBO(
                  //                                                         252,
                  //                                                         233,
                  //                                                         166,
                  //                                                         0.00),
                  //                                                   ],
                  //                                                 ),
                  //                                               ),
                  //                                               child:
                  //                                                   CachedNetworkImage(
                  //                                                 imageUrl:
                  //                                                     imagePath,
                  //                                                 // width: 50,
                  //                                                 height: 135,
                  //                                                 placeholder:
                  //                                                     (context,
                  //                                                             url) =>
                  //                                                         Center(
                  //                                                   child:
                  //                                                       CircularProgressIndicator(),
                  //                                                 ), // Replace with your own placeholder widget
                  //                                                 errorWidget: (context,
                  //                                                         url,
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
                  //                                               style: CustomTextStyle
                  //                                                   .popinssmall0)
                  //                                         ],
                  //                                       ),
                  //                                     ),
                  //                                     Positioned(
                  //                                       top: 3,
                  //                                       child: Container(
                  //                                         height: 50,
                  //                                         width: 60,
                  //                                         decoration: BoxDecoration(
                  //                                             color: Colors.white
                  //                                                 .withOpacity(
                  //                                                     0.3),
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         20)),
                  //                                         child:
                  //                                             // Image.asset(
                  //                                             //   item["logo"],
                  //                                             //   height: 50,
                  //                                             // ),
                  //                                             CachedNetworkImage(
                  //                                           imageUrl:
                  //                                               imageLogoPath,
                  //                                           // width: 50,
                  //                                           height: 50,
                  //                                           placeholder:
                  //                                               (context, url) =>
                  //                                                   Center(
                  //                                             child:
                  //                                                 CircularProgressIndicator(),
                  //                                           ), // Replace with your own placeholder widget
                  //                                           errorWidget: (context,
                  //                                                   url, error) =>
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
                  //                           //  Stack(
                  //                           //   children: [
                  //                           //     Container(
                  //                           //       width: 69,
                  //                           //       height: 75,
                  //                           //       decoration: BoxDecoration(
                  //                           //         borderRadius: BorderRadius.circular(23),
                  //                           //         color: item,
                  //                           //         boxShadow: [
                  //                           //           BoxShadow(
                  //                           //             color: Colors.grey.withOpacity(0.3),
                  //                           //             spreadRadius: 2,
                  //                           //             blurRadius: 5,
                  //                           //             offset: Offset(
                  //                           //                 0, 3), // Offset of the shadow
                  //                           //           ),
                  //                           //         ],
                  //                           //       ),
                  //                           //     ),
                  //                           //   ],
                  //                           // )
                  //                         ),
                  //                       );
                  //                     },
                  //                   );
                  //           }),
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toys",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            subcategorycontroller.producttoys();
                            Get.to(AlltoyPage());
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // subcategorycontroller.userPropertiesModel == null ||
                  //         subcategorycontroller.userPropertiesModel!.data == null
                  //     ? SizedBox()
                  //     :

                  GetBuilder<SubCategoryController>(
                      init: subcategorycontroller,
                      builder: (_) {
                        return subcategorycontroller.usertoyModel == null ||
                                subcategorycontroller.usertoyModel!.data ==
                                    null ||
                                subcategorycontroller
                                    .usertoyModel!.data!.isEmpty
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
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
                                            mainAxisExtent: 250),
                                    itemCount: subcategorycontroller
                                        .usertoyModel!.data!.length
                                        .clamp(0, 4),
                                    itemBuilder: (BuildContext ctx, index) {
                                      var item = subcategorycontroller
                                          .usertoyModel!.data![index];

                                      var imagePath =
                                          "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                      return subcategorycontroller
                                                      .usertoyModel ==
                                                  null ||
                                              subcategorycontroller
                                                      .usertoyModel!.data ==
                                                  null
                                          ? SizedBox()
                                          : Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              // width: MediaQuery.of(context).size.width * 0.46,
                                              decoration: BoxDecoration(
                                                 gradient: LinearGradient(
                                                    colors: [
                                                      _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // MyColors.white
                                                      //     .withOpacity(0.1),
                                                      MyColors.white,
                                                      MyColors.white,
                                                      // MyColors.white,
                                                    ],
                                                    tileMode: TileMode.clamp,
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
                                              ),
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height: 125,

                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(30),
                                                        //     color: MyColors.white),
                                                        child: Center(
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: imagePath,
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
                                                      InkWell(
                                                        onTap: () {
                                                          homeusercontroller
                                                              .addItemToWishList(
                                                                  item.id ?? 0);
                                                          print("ToysID");
                                                          print(item.id);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              child: Icon(
                                                                  homeusercontroller
                                                                          .wishListItemsId
                                                                          .contains(item
                                                                              .id!)
                                                                      ? Icons
                                                                          .favorite
                                                                      : Icons
                                                                          .favorite_border,
                                                                  color: Colors
                                                                      .red)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // SizedBox(height: 15,),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(item.name ?? '',
                                                            style: CustomTextStyle
                                                                .popinsmedium),
                                                        Text(
                                                            item.description
                                                                        .toString()
                                                                        .length <
                                                                    30
                                                                ? item
                                                                    .description!
                                                                : item
                                                                    .description!
                                                                    .substring(
                                                                        0, 19),
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
                                                                        "₹${item.price ?? ''}",
                                                                        style: CustomTextStyle
                                                                            .discounttext),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    // Container(
                                                                    //   height: 18,
                                                                    //   width: 40,
                                                                    //   decoration: BoxDecoration(
                                                                    //       color:
                                                                    //           MyColors
                                                                    //               .red,
                                                                    //       borderRadius:
                                                                    //           BorderRadius.circular(
                                                                    //               10),
                                                                    //       border: Border.all(
                                                                    //           color: MyColors
                                                                    //               .red)),
                                                                    //   child: Center(
                                                                    //     child:
                                                                    Text(
                                                                        // item.discount.toString(),
                                                                        "Save${item.discount ?? "0"}%",
                                                                        style: CustomTextStyle
                                                                            .popinstextsmal2222red),
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.23,
                                                                      child:
                                                                          Text(
                                                                        "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                                                        // "₹" +
                                                                        //     item.price!,
                                                                        style: CustomTextStyle
                                                                            .popinsmedium,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: Get.width *
                                                                            0.073),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5.0),
                                                                      child: Container(
                                                                          width: 35,
                                                                          height: 35,
                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                          child: Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                Image.asset(
                                                                              "assets/image/bag2.png",
                                                                              height: 25,
                                                                            ),
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                    }),
                              );
                      })

                  // GridView(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   scrollDirection: Axis.vertical,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 15.0,
                  //       mainAxisSpacing: 15.0,
                  //       mainAxisExtent: 250),
                  //   children: [
                  //   Container(
                  //       height: MediaQuery.of(context).size.width * 0.7,
                  //       width: MediaQuery.of(context).size.width * 0.46,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: MyColors.white),
                  //       child: Column(
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               Container(
                  //                        width: MediaQuery.of(context).size.width,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     color: MyColors.white),
                  //                 child: Image.asset("assets/image/dog2.png",
                  //                     fit: BoxFit.cover, height: 135),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Align(
                  //                     alignment: Alignment.centerRight,
                  //                     child: Icon(Icons.favorite_border,color:Colors.red)),
                  //               ),
                  //             ],
                  //           ),

                  //           // SizedBox(height: 15,),

                  //           Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Mars Petcare Inc',
                  //                     style: CustomTextStyle.popinsmedium),
                  //                 Text('Lorem Ipsum is simply dummy',
                  //                     style: CustomTextStyle.popinssmall0),
                  //                 SizedBox(height: 5),
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             Text("₹269",
                  //                                 style:
                  //                                     CustomTextStyle.discounttext),
                  //                             SizedBox(width: 10),
                  //                             Container(
                  //                               height: 20,
                  //                               width: 40,
                  //                               decoration: BoxDecoration(
                  //                                   color: MyColors.red,
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(10),
                  //                                   border: Border.all(
                  //                                       color: MyColors.red)),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                     // item.discount.toString(),
                  //                                     "Save20%",
                  //                                     style: CustomTextStyle
                  //                                         .popinstextsmal2222),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         SizedBox(height: 5),
                  //                         Text(
                  //                           "₹ 260.00",
                  //                           style: CustomTextStyle.popinsmedium,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.only(right: 5.0),
                  //                       child: Container(
                  //                           width: 35,
                  //                           height: 35,
                  //                           decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               color: Color(0xffffcc00)),
                  //                           child: Padding(
                  //                             padding: EdgeInsets.all(5.0),
                  //                             child: Image.asset(
                  //                               "assets/image/bag2.png",
                  //                               height: 25,
                  //                             ),
                  //                           )),
                  //                     )
                  //                   ],
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       height: MediaQuery.of(context).size.width * 0.7,
                  //       width: MediaQuery.of(context).size.width * 0.46,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(25),
                  //           color: MyColors.white),
                  //       child: Column(
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               Container(
                  //                        width: MediaQuery.of(context).size.width,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     color: MyColors.white),
                  //                 child: Image.asset("assets/image/food3.png",
                  //                     fit: BoxFit.cover, height: 135),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Align(
                  //                     alignment: Alignment.centerRight,
                  //                     child: Icon(Icons.favorite_border,color:Colors.red)),
                  //               ),
                  //             ],
                  //           ),

                  //           // SizedBox(height: 15,),

                  //           Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Mars Petcare Inc',
                  //                     style: CustomTextStyle.popinsmedium),
                  //                 Text('Lorem Ipsum is simply dummy',
                  //                     style: CustomTextStyle.popinssmall0),
                  //                 // SizedBox(height: 3),
                  //                 SizedBox(height: 5),
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             Text("₹269",
                  //                                 style:
                  //                                     CustomTextStyle.discounttext),
                  //                             SizedBox(width: 10),
                  //                             Container(
                  //                               height: 20,
                  //                               width: 40,
                  //                               decoration: BoxDecoration(
                  //                                   color: MyColors.red,
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(10),
                  //                                   border: Border.all(
                  //                                       color: MyColors.red)),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                     // item.discount.toString(),
                  //                                     "Save20%",
                  //                                     style: CustomTextStyle
                  //                                         .popinstextsmal2222),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         SizedBox(height: 5),
                  //                         Text(
                  //                           "₹ 260.00",
                  //                           style: CustomTextStyle.popinsmedium,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.only(right: 5.0),
                  //                       child: Container(
                  //                           width: 35,
                  //                           height: 35,
                  //                           decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               color: Color(0xffffcc00)),
                  //                           child: Padding(
                  //                             padding: EdgeInsets.all(5.0),
                  //                             child: Image.asset(
                  //                               "assets/image/bag2.png",
                  //                               height: 25,
                  //                             ),
                  //                           )),
                  //                     )
                  //                   ],
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       height: MediaQuery.of(context).size.width * 0.7,
                  //       width: MediaQuery.of(context).size.width * 0.46,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: MyColors.white),
                  //       child: Column(
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               Container(
                  //                        width: MediaQuery.of(context).size.width,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     color: MyColors.white),
                  //                 child: Image.asset("assets/image/food5.png",
                  //                     fit: BoxFit.cover, height: 135),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Align(
                  //                     alignment: Alignment.centerRight,
                  //                     child: Icon(Icons.favorite_border,color:Colors.red)),
                  //               ),
                  //             ],
                  //           ),

                  //           // SizedBox(height: 15,),

                  //           Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Mars Petcare Inc',
                  //                     style: CustomTextStyle.popinsmedium),
                  //                 Text('Lorem Ipsum is simply dummy',
                  //                     style: CustomTextStyle.popinssmall0),
                  //                 SizedBox(height: 5),
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             Text("₹269",
                  //                                 style:
                  //                                     CustomTextStyle.discounttext),
                  //                             SizedBox(width: 10),
                  //                             Container(
                  //                               height: 20,
                  //                               width: 40,
                  //                               decoration: BoxDecoration(
                  //                                   color: MyColors.red,
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(10),
                  //                                   border: Border.all(
                  //                                       color: MyColors.red)),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                     // item.discount.toString(),
                  //                                     "Save20%",
                  //                                     style: CustomTextStyle
                  //                                         .popinstextsmal2222),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         SizedBox(height: 5),
                  //                         Text(
                  //                           "₹ 260.00",
                  //                           style: CustomTextStyle.popinsmedium,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.only(right: 5.0),
                  //                       child: Container(
                  //                           width: 35,
                  //                           height: 35,
                  //                           decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               color: Color(0xffffcc00)),
                  //                           child: Padding(
                  //                             padding: EdgeInsets.all(5.0),
                  //                             child: Image.asset(
                  //                               "assets/image/bag2.png",
                  //                               height: 25,
                  //                             ),
                  //                           )),
                  //                     )
                  //                   ],
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  //   padding: EdgeInsets.all(5),
                  //   shrinkWrap: true,
                  // ),
                  ,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Product By Partner",
                  //       style: CustomTextStyle.popinstext,
                  //     ),

                  //     // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(AllbrandPage());
                  //       },
                  //       child: Text('See All',
                  //           style: TextStyle(
                  //               color: MyColors.bgcolor,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500,
                  //               fontFamily: "Poppins")),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product By Partner",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            Get.to(AllProdctbybrandPage());
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GetBuilder<HomeuserController>(
                            init: homeusercontroller,
                            builder: (_) {
                              return !homeusercontroller.partnerLoaded
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ListView.builder(
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: homeusercontroller
                                            .userProductPartnerModel!
                                            .data!
                                            .length,
                                        itemBuilder: (context, index) {
                                          var item = homeusercontroller
                                              .userProductPartnerModel!
                                              .data![index];

                                          // print(item.name!);
                                          var imagePath =
                                              "${Constants.BASE_URL}/storage/app/public/store/cover/${item.coverPhoto ?? ""}";
                                          var imageLogoPath =
                                              "${Constants.BASE_URL}/storage/app/public/store/${item.logo ?? ""}";

                                          return InkWell(
                                            onTap: () async {
                                              homeusercontroller
                                                  .viewpartner(item.id ?? 0);
                                              await homeusercontroller
                                                  .partnerIteminit();
                                              Get.to(ProductByPartnerDetails());
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      // color: MyColors.white
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        // SizedBox(height: 140,),
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.46,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: Colors
                                                                  .transparent),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            25.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    gradient:
                                                                        LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      colors: [
                                                                        Color(
                                                                            0xFFFFF0BA),
                                                                        Color.fromRGBO(
                                                                            252,
                                                                            233,
                                                                            166,
                                                                            0.00),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        imagePath,
                                                                    // width: 50,
                                                                    height: 135,
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
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(item.name!,
                                                                  style: CustomTextStyle
                                                                      .popinssmall0)
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 3,
                                                          child: Container(
                                                            height: 50,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child:
                                                                // Image.asset(
                                                                //   item["logo"],
                                                                //   height: 50,
                                                                // ),
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  imageLogoPath,
                                                              // width: 50,
                                                              height: 50,
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
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //  Stack(
                                              //   children: [
                                              //     Container(
                                              //       width: 69,
                                              //       height: 75,
                                              //       decoration: BoxDecoration(
                                              //         borderRadius: BorderRadius.circular(23),
                                              //         color: item,
                                              //         boxShadow: [
                                              //           BoxShadow(
                                              //             color: Colors.grey.withOpacity(0.3),
                                              //             spreadRadius: 2,
                                              //             blurRadius: 5,
                                              //             offset: Offset(
                                              //                 0, 3), // Offset of the shadow
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ],
                                              // )
                                            ),
                                          );
                                        },
                                      ),
                                    );
                            }),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Services",
                          style: CustomTextStyle.popinstext,
                        ),

                        // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                        InkWell(
                          onTap: () {
                            Get.to(ServicePage());
                          },
                          child: Text('See All',
                              style: TextStyle(
                                  color: MyColors.bgcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins")),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  GetBuilder<HomeuserController>(
                      init: homeusercontroller,
                      builder: (_) {
                        return homeusercontroller.userServicesModel == null
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                    // height: 600,
                                    child: GridView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                //  childAspectRatio: 4 / 4,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,
                                                mainAxisExtent: 100),
                                        itemCount: homeusercontroller
                                            .userServicesModel!.data!.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          var item = homeusercontroller
                                              .userServicesModel!.data![index];
                                          var imagePath =
                                              "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.image ?? ""}";

                                          return GestureDetector(
                                            onTap: () async {
                                              String url = Constants
                                                      .GET_SERVICES_CATEGORIES +
                                                  "/" +
                                                  item.id.toString();
                                              homeusercontroller
                                                  .getServicesCategories(url);

                                              Get.to(
                                                  () => ServicesCategoryPage());
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black26,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: MyColors.white),
                                                  child: CachedNetworkImage(
                                                    imageUrl: imagePath,
                                                    fit: BoxFit.cover,
                                                    // width: 61,
                                                    // height: 75,
                                                    placeholder:
                                                        (context, url) =>
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
                                                Text(
                                                  item.name!,
                                                  style: CustomTextStyle
                                                      .popinssmall0,
                                                )
                                              ],
                                            ),
                                          );
                                          //
                                        })),
                              );

                        // // GridView(
                        //             physics: NeverScrollableScrollPhysics(),
                        //             scrollDirection: Axis.vertical,
                        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //                 crossAxisCount: 4,
                        //                 crossAxisSpacing: 15,
                        //                 mainAxisSpacing: 15,
                        //                 mainAxisExtent: 100),
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   Container(
                        //                     height: 60,
                        //                     width: 60,
                        //                     decoration: BoxDecoration(
                        //                         border: Border.all(color: Colors.black26, width: 1),
                        //                         borderRadius: BorderRadius.circular(25),
                        //                         color: MyColors.white),
                        //                   ),
                        //                   Text(
                        //                     "Brush",
                        //                     style: CustomTextStyle.popinssmall0,
                        //                   )
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Container(
                        //                     height: 60,
                        //                     width: 60,
                        //                     decoration: BoxDecoration(
                        //                         border: Border.all(color: Colors.black26, width: 1),
                        //                         borderRadius: BorderRadius.circular(25),
                        //                         color: MyColors.white),
                        //                   ),
                        //                   Text(
                        //                     "Nail Cutter",
                        //                     style: CustomTextStyle.popinssmall0,
                        //                   )
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Container(
                        //                     height: 60,
                        //                     width: 60,
                        //                     decoration: BoxDecoration(
                        //                         border: Border.all(color: Colors.black26, width: 1),
                        //                         borderRadius: BorderRadius.circular(25),
                        //                         color: MyColors.white),
                        //                   ),
                        //                   Text(
                        //                     "Comb",
                        //                     style: CustomTextStyle.popinssmall0,
                        //                   )
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Container(
                        //                     height: 60,
                        //                     width: 60,
                        //                     decoration: BoxDecoration(
                        //                         border: Border.all(color: Colors.black26, width: 1),
                        //                         borderRadius: BorderRadius.circular(25),
                        //                         color: MyColors.white),
                        //                   ),
                        //                   Text(
                        //                     "Slicker",
                        //                     style: CustomTextStyle.popinssmall0,
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //             padding: EdgeInsets.all(5),
                        //             shrinkWrap: true,
                        //           );
                      })
                ],
              ),
            ),

            GetBuilder<HomeuserController>(
                init: homeusercontroller,
                builder: (_) {
                  return homeusercontroller.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.1), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
            // Progress bar
            GetBuilder<HomeuserController>(
                init: homeusercontroller,
                builder: (_) {
                  return homeusercontroller.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.white, // Color of the progress bar
                            size: 50.0, // Size of the progress bar
                          ),
                        )
                      : SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
