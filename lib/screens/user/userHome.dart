import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
import 'package:pet/controllers/user_controller/userServicesAddAppointmentController.dart';
import 'package:pet/controllers/user_controller/videocontoller.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart' as Banner;
import 'package:pet/models/usersModel/getUserPropertiesModel.dart' as itemDetails ;
import 'package:pet/models/usersModel/productModel.dart';
import 'package:pet/others/Filter.dart';
// import 'package:pet/others/VideoPlayerExample.dart';
import 'package:pet/screens/oubranddetails.dart';
import 'package:pet/screens/user/AllPageProductbybrand.dart';
import 'package:pet/screens/user/AllbrandPageshop.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart';
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
import 'package:pet/screens/user/shopbybranddetails.dart';
import 'package:pet/screens/user/userServicesAddAppointment.dart';
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
import 'package:share_plus/share_plus.dart';


class HomeUser extends StatefulWidget {
  HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  TextEditingController _searchcontroller = TextEditingController();
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
 
  
  VideoBannerController videobannercontroller  = Get.put(VideoBannerController());
  SubCategoryController subcategorycontroller =
      Get.put(SubCategoryController());
      ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  UserReviewController userreviewController = Get.put(UserReviewController());
  OurBrandDetailsController Ourbranddetailscontroller =
      Get.put(OurBrandDetailsController());
  MyCartController mycartController = Get.put(MyCartController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());

  final UserServicesAddAppointmentController
      userServicesAddUserServicesAddAppointmentController =
      Get.put(UserServicesAddAppointmentController());
  ProfileController profilecontroller = Get.put(ProfileController());
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  final List<Color> _randomColors = [
    MyColors.yellowlight,
    Colors.blue,
    Colors.green,
  ];

  Color _getRandomColor() {
    final random = Random();
    return _randomColors[random.nextInt(_randomColors.length)];
  }

  @override
  void onInit() {
  
    // notificationcontroller.init();
      mycartController.init();
      homeusercontroller.init();
       homeusercontroller.bannerListinit();
       homeusercontroller. getWishinit(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
       drawer: drawer(),
      appBar: CustomAppBar(drawerKey: _drawerkey,context: context,),

      body:
       Padding(
        
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            RefreshIndicator(
             
key: _refreshIndicatorKey,

              onRefresh: () async {
                _refreshIndicatorKey.currentState?.show(atTop: false);
           
                await homeusercontroller.init();
                 homeusercontroller.getWishList();
                  homeusercontroller.bannerListinit();
                
                await Future.delayed(Duration(seconds: 2));
              },
              child: 
              ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                primary: false,

                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text(
                              "Find the pet you love on around you easily",
                              style: CustomTextStyle.popinstext,
                            )),

                        
 Spacer(),
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
                                  :  Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: CircleAvatar(
                      radius: 35,
                        backgroundColor: Colors.transparent,
                      child:ClipOval (
                        
                        child: CachedNetworkImage(
                          imageUrl: "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                            profilecontroller.myprofilemodel!
                                  .data![0].image
                                  .toString(),
                            
                          fit: BoxFit.cover,
                          width: 75,
                          height: 75,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ), // Replace with your own placeholder widget
                          errorWidget: (context, url, error) => Icon(
                              Icons.error), // Replace with your own error widget
                        ),
                      ),
                    ),
                  );
                            }),
                   
                   
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
    homeusercontroller == null? Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                
                GetBuilder<HomeuserController>(
                    init: homeusercontroller,
                    builder: (_) {
                    // List<dynamic> data = homeusercontroller.userBannerModel!.data!;
if(homeusercontroller.userBannerModel == null){
  return CircularProgressIndicator();
}
List<Banner.Datum> data = homeusercontroller.userBannerModel!.data!;
List<Banner.Datum> filteredData = data.where((item) =>
    item.type == 'home_banner_1' ||
    item.type == 'home_banner_2' ||
    item.type == 'home_banner_3').toList();

List<Banner.Datum> filteredDataVideo = data.where((item) =>
    item.type == 'video' 
   ).toList();

    print("vvvvv***${filteredData.length}");

    GetStorage().write('videobanner',filteredDataVideo[0].image) ;
    print(GetStorage().read('videobanner') );
    print("kk");
    print("vvvvv***${filteredDataVideo[0].image}");
                      return  homeusercontroller. showLoading ?
                      Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                      homeusercontroller.userBannerModel == null
                          ? SizedBox()
                          : CarouselSlider.builder(
                              itemCount:filteredData.length,
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


                                    // List <String> filterdata = 
          // var item = filteredData[index];
                                // var item = homeusercontroller
                                //     .userBannerModel!.data![index];
   var item = filteredData[index];
   var imagePath = "${Constants.BANNER_IMAGE_PATH}${(item.image ?? '')}";
                                // var imagePath = 
                                //     "${Constants.BANNER_IMAGE_PATH}${( item.image ?? "")}";
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
                                    
                                  ],
                                );

                              
                              });
                    },
                  ),


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

                        GestureDetector(
                          onTap: () {
                            FilterController filtercontroller =
                                Get.put(FilterController());
                            filtercontroller.loadDefaultData();
                            filtercontroller.clearFields();
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
                                                 subcategorycontroller
                                                    .productInitByCategory();

                                                Get.to(() => Allcategory());
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right:10.0),
                                                    child: Container(
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
                                                 mainAxisExtent: 285 ),
                                          itemCount: homeusercontroller
                                              .userPropertiesModel!.data!.length
                                              .clamp(0,
                                                  4), // Set the number of cards you want to display.
                                          itemBuilder: (context, index) {
                                           
                                            

                                            var item = homeusercontroller
                                                .userPropertiesModel!
                                                .data![homeusercontroller.userPropertiesModel!.data!.length -
                                    1 -
                                    index];
                                            String imagePath = Constants
                                                    .PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";

                                           
                                            return InkWell(
                                              onTap: () async {
                                                 productdeatilscontroller.dispose();
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
                                                Get.to(ProductDetails(id:item.id??0, image:item.image??''));
                                                
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

Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item.image.toString(), item.name.toString(),  item.price.toString());

    // Share.share(itemAll.toString());
  
  },
),


Spacer(),
   InkWell(
                                                      onTap: () {
                                                        homeusercontroller
                                                            .addItemToWishList(
                                                                item.id!);

                                                            homeusercontroller.init();
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
                                       
]),


                                                    Container(
                                                      height: 125,
                                                      
                                                     
                                                      child: CachedNetworkImage(
                                                        imageUrl: imagePath,
                                                       
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
                                                            Text( item.name??'',
                                                                          
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
                                                                                item.price.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        
                                                                         SizedBox(width:3),
                                                                        Text(
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                      
                                                                        // ),
                                                                      ],
                                                                    ):const  SizedBox(),
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
                                                                            "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toInt()}",

                                                                            
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                               onTap: () async{

 productdeatilscontroller.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.price ?? ''),(item.image).toString(),"yes");
                                                                              await productdeatilscontroller.addProductHome();
                                                            mycartController.init();

 print("imageeeee");                                                                  // else{
print(item.image);
                                                                                // }
                                                                            
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
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
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
                                            onTap: () async{
                                              Ourbranddetailscontroller
                                                  .addproduct(item.id ?? 0,item.title??'',
                                                      item.logo ?? '');
                                              //  subcategorycontroller.addproduct(item.id??0) ;
                                      await Ourbranddetailscontroller.ourproductinit();
                                              Get.to( OurBrandDetails());
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                                  Container(
                                                   
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
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:25.0),
                                                          child: Container(
                                                            // height: MediaQuery.of(
                                                            //             context)
                                                            //         .size
                                                            //         .height *
                                                            //     0.,
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
                                                                              15.0),
                                                                  child: Container(
                                                                     height: 150,
                                                                      width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                
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
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(15.0),
                                                                          child: CachedNetworkImage(
                                                                                                                                            imageUrl:
                                                                            imagePath,
                                                                                                                                            // width: 50,
                                                                                                                                            height: 125,
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
                                                        ),
                                                    SizedBox(height: 10,),
                                                        Positioned(
                                                          top: 2,
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
                                               
                                            
                                            ),
                                          );
                                        },
                                      );
                              }),
                        ],
                      ),
                    ),
                  ),

               

                   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  // VideoPlayerExample(),
                   GetBuilder<HomeuserController>(
                                        init: homeusercontroller,
                                        builder: (_) {

                                          return   Center(
                                                      child: homeusercontroller.videoController.value.isInitialized
                                                          ? AspectRatio(
                                                              aspectRatio:  homeusercontroller.videoController
                                                                  .value.aspectRatio,
                                                              child: VideoPlayer( homeusercontroller.videoController),
                                                            )
                                                          : CircularProgressIndicator(),
                                                    );

                                        }),

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


                        InkWell(
                          onTap: () {
                            Get.to(AllShopbrandPage(
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
                                                item.title??'',
                                                    item.logo ?? '');
  Ourbranddetailscontroller.productinit();
                                            Get.to(ShopBrandDetails());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  
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
                                                                         15.0),
                                                              child: Container(
                                                                height: 150,
                                                                 width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
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
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(15.0),
                                                                      child: CachedNetworkImage(
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
                                                      SizedBox(height: 10,),
                                                      Positioned(
                                                        top:2,
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
                                                              
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                imageLogoPath,
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
                                          
                                          ),
                                        );
                                      },
                                    );
                            }),
                      ],
                    ),
                  ),

          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toys",
                          style: CustomTextStyle.popinstext,
                        ),


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
                                child: Container(
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
                                      itemCount:subcategorycontroller. combinedList!.length
                                          .clamp(0, 4),
                                      itemBuilder: (BuildContext ctx, index) {
                                           var item1 = subcategorycontroller
                                      .combinedList[index];

                                  var imagePath =
                                      "${Constants.BASE_URL}/storage/app/public/product/${item1.image ?? ""}";
                       
                                         return subcategorycontroller
                                                        .usertoyModel ==
                                                    null ||
                                                subcategorycontroller
                                                        .usertoyModel!.data ==
                                                    null
                                            ? SizedBox()
                                            :
                                            InkWell(
                                              onTap: () async{
                                                 productdeatilscontroller.dispose();
                                                   productdeatilscontroller
                                                  .viewproduct(
                                                item1.id ?? 0,
                                              );
                                               print("productippToysppd${item1.id ?? 0}");
                                          await productdeatilscontroller.init();
                                          Get.to(ProductDetails(
                                           id: item1.id??0, 
                                          ));
                                              },
                                              child: Container(
                                                    width: 140,
                                                    // height: 700,
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
                                            
                                            
                                            
                                                    
                                                    Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item1.image.toString(), item1.name.toString(),  item1.price.toString());

  
  },
),


Spacer(),

                                                       GetBuilder<HomeuserController>(
                                                                  init: homeusercontroller,
                                                                  builder: (_) {
                                                            return InkWell(
                                                              onTap: () {
                                                                homeusercontroller
                                                                    .addItemToWishList(
                                                                        item1.id!);
                                            
                                                                    homeusercontroller.init();
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
                                                                                 item1.id!)
                                                                          ? Icons
                                                                              .favorite
                                                                          : Icons
                                                                              .favorite_border,
                                                                      color:
                                                                          Colors.red),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        ),
                                                                      
]),

                                            
                                            
                                                        Container(
                                                          height: 125,
                                                         
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
                                               Text(
                                          item1.name
                                              .toString(),
                                               maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyle.popinstext,
                                        ),
                                      
                                                                    Text(
  item1.description!.length < 20
      ? item1.description!
      : item1.description!.substring(0, item1.description!.length),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: CustomTextStyle.popinssmall0,
),
  SizedBox(height: 5),
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
                                                                           (item1.discount !="0.00"&& item1.discount !="0"&& item1.discount !="0.0")?
                                                                  
                                                                          
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                                "₹" +
                                                                                    item1.price.toString(),
                                                                                style: CustomTextStyle.discounttext),
                                                                            SizedBox(
                                                                                width:
                                                                                    2),
                                                                          
                                                                            SizedBox(width:3),
                                                                          
                                                                            Text(
                                                                               
                                                                                "Save${item1.discount.toString()}%",
                                                                                style:
                                                                                    CustomTextStyle.popinstextsmal2222red)
                                                                        
                                                                            //   ),
                                                                            // ),
                                                                          ],
                                                                        )
                                                                       : SizedBox(),
                                                                          
                                                                     
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
                                                                                "₹ ${((double.parse(item1.price ?? '')) - ((double.parse(item1.price ?? "")) * (double.parse(item1.discount ?? "0")) / 100)).toInt()}",
                                            
                                                                               
                                                                                style:
                                                                                    CustomTextStyle.popinsmedium,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                                width:
                                                                                    Get.width * 0.054),
                                                                            InkWell(
                                                                              onTap: () async{
                                                                               productdeatilscontroller.viewproductHome(
                                                                              item1.id??0,item1.name??'',"1kg",1 ,double.parse(item1.price ?? ''),(item1.image??'').toString(),"yes");
                                                                              await productdeatilscontroller.addProductHome();
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
                      })

                  
               ,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),



                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product By Partner",
                          style: CustomTextStyle.popinstext,
                        ),


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
                                                  .viewpartner(item.id ?? 0,);
                                                  
                       videobannercontroller. viewpartner1(item.vendorId??0);
                                              await homeusercontroller
                                                  .partnerIteminit();
                                                  //  partnerBannerinit();
                                              Get.to(ProductByPartnerDetails(
name: item.name??"" ,
address: item.address??'',
mobileno: item.phone??'',
email: item.email??''

                                              ));
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
                                                                      maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                                                
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  imageLogoPath,
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          await homeusercontroller.getServicesCategories();


                                          homeusercontroller.ServiceDescription.value=homeusercontroller
                                              .servicesCategoryModel!.data![index].description.toString();
                                          print("descriptionsds ${homeusercontroller.ServiceDescription.value}");
                                          userServicesAddUserServicesAddAppointmentController
                                              .clearFields();
                                          userServicesAddUserServicesAddAppointmentController
                                              .updateServiceId(item.id!);
                                          userServicesAddUserServicesAddAppointmentController
                                              .init();
                                             
                                          await userServicesAddUserServicesAddAppointmentController
                                              .fetchAppointmentSlots(item.id!);
                                          print(item);
                                          Get.to(() =>

                                              UserServicesAddAppointmentState(name:item.name??''));
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
                                                      BorderRadius.circular(25),
                                                  color: MyColors.white),
                                              child: CachedNetworkImage(
                                                imageUrl: imagePath,
                                                fit: BoxFit.cover,
                                                // width: 61,
                                                // height: 75,
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ), // Replace with your own placeholder widget
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const Icon(Icons
                                                        .error), // Replace with your own error widget
                                              ),
                                            ),
                                            Text(
                                              item.name!,textAlign: TextAlign.center,
                                              style:
                                                  CustomTextStyle.popinssmall0,
                                            )
                                          ],
                                        ),
                                      );
                                      
                                    },
                                  ),
                                ),
                              );

                        
                      })
                ],
              ),
            ),

            
         
        
          ],
        ),
      ),
    );
  }
  // createTimeSlots('10:00','21:00',10);

}


void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}