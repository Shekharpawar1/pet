import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/subcateogries_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/user/filterScreen.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/searchScreen.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class Allcategory extends StatefulWidget {
  Allcategory({super.key, this.id});
  int? id;

  @override
  State<Allcategory> createState() => _AllcategoryState();
}

class _AllcategoryState extends State<Allcategory> {
  TextEditingController _searchcontroller = TextEditingController();
  final SubCategoryController subcategorycontroller =
      Get.put(SubCategoryController());
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
       MyCartController mycartController = Get.put(MyCartController());
  final HomeuserController homeusercontroller = Get.put(HomeuserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarback(title:"All Category"),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
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
                        controller: homeusercontroller.searchcontroller,
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
                height: MediaQuery.of(context).size.height * 0.04,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: GetBuilder<SubCategoryController>(
                      init: subcategorycontroller,
                      builder: (_) {
                        return subcategorycontroller.usersubmodel == null
                            ? const SizedBox()
                            : ListView.builder(
                                primary: false,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: subcategorycontroller
                                    .usersubmodel!.data!.length,
                                itemBuilder: (context, index) {
                                  
                                  var item = subcategorycontroller
                                      .usersubmodel!.data![index];
              
                                  var imagePath =
                                      "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
              
                              
              
                                  return !subcategorycontroller.propertysubloaded
                                      ?const  SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
              
                                          child: InkWell(
                                            onTap: () {
                                              subcategorycontroller
                                                  .updateSelectedIndex(
                                                      item.id ?? 0);
                                              print("===>${item.id}");
                                              subcategorycontroller.productinit();
                                            },
                                            child: Container(
                                              // height: 40,
                                              // width: 180,
                                              decoration: BoxDecoration(
                                                  color: (subcategorycontroller
                                                              .selectedIndex ==
                                                          item.id)
                                                      ? MyColors.yellow
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    
                                                    CachedNetworkImage(
                                                      imageUrl: imagePath,
              
                                                    
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
              
                                                    SizedBox(
                                                      width: 5,
                                                    ),
              
                                                    Text(item.name.toString(),
                                                        style: CustomTextStyle
                                                            .popinssmall)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
              
                                         
              
                                         
                                        );
                                },
                              );
              
                       
                      }),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GetBuilder<SubCategoryController>(
                    init: subcategorycontroller,
                    builder: (_) {
                      return subcategorycontroller.userProductModel == null
                          ? const SizedBox()
                          : GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 285),
                              itemCount: subcategorycontroller
                                  .userProductModel!
                                  .data!
                                  .length, // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                
                                var item = subcategorycontroller
                                    .userProductModel!.data![index];
                                print(item);
                                var imagePath =
                                    "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                
                                return
                                 
                                    subcategorycontroller
                                                .userProductModel!.data ==
                                            null
                                        ? SizedBox(
                                            child: Center(
                                                child: Image.asset(
                                                    "assets/image/nodataimg.png",
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.4,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width)))
                                        : InkWell(
                                            onTap: () async {
                                              productdeatilscontroller.dispose();
                                              productdeatilscontroller
                                                  .viewproduct(
                                                item.id ?? 0,
                                              );
                                              print(
                                                  "productippppd${item.id ?? 0}");
                                              await productdeatilscontroller
                                                  .init();
                                              Get.to(ProductDetails(
                                                id: item.id ?? 0,
                                              ));
                                            },
                                            child: Container(
                                              width: 140,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
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
                                                    offset: const Offset(0,
                                                        3), // Offset of the shadow
                                                  ),
                                                ],
                                                // color: MyColors.white
                                              ),
                                              child: Column(
                                                children: [
                                                  GetBuilder<HomeuserController>(
                                                      init: homeusercontroller,
                                                      builder: (_) {
                                                        return InkWell(
                                                          onTap: () {
                                                            homeusercontroller
                                                                .addItemToWishList(
                                                                    item.id!);
              
                                                            homeusercontroller
                                                                .init();
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
                                                                          .contains(item
                                                                              .id!)
                                                                      ? Icons
                                                                          .favorite
                                                                      : Icons
                                                                          .favorite_border,
                                                                  color:
                                                                      Colors.red),
                                                            ),
                                                          ),
                                                        );
                                                      }),
              
                                                  Container(
                                                    height: 125,
                                                   
                                                   
                                                    child: CachedNetworkImage(
                                                      imageUrl: imagePath,
                                                      
                                                      placeholder:
                                                          (context, url) =>
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
              
                                                  // SizedBox(height: 15,),
              
                                                  Container(
                                                    // height: 140,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                            const SizedBox(
                                                              height: 5),
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
                                                                        
                                                                      ],
                                                                    ):const  SizedBox(),
                                                                 
                                                                 
                                                                 
                                                                  const SizedBox(
                                                                      height: 5),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
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
                                                                              0.054),
                                                                      InkWell(
                                                                        onTap: ()async{

 productdeatilscontroller.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.price ?? ''),(item.image).toString(),"yes");
                                                                              
                                                                              await productdeatilscontroller.addProductHome();
                                                            mycartController.init();
},
                                                                        child: Padding(
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
                                            ));
              
                              });
                    }),
              ),
          
            ],
          ),
        ));
  }
}
