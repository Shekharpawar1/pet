import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class OurBrandDetails extends StatelessWidget {
  OurBrandDetails({super.key});

  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  
 MyCartController mycartController = Get.put(MyCartController());
  OurBrandDetailsController ourbranddeatilscontrroller =
      Get.put(OurBrandDetailsController());
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    ourbranddeatilscontrroller.ourproductinit();
    // var imagePath = "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${ourbranddeatilscontrroller.brandlogo??''}";
    return Scaffold(
        appBar: CustomAppBarback(title:"Our Brand Details"),
        body: ListView(
          shrinkWrap: true,
          primary: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                      controller: ourbranddeatilscontrroller.searchcontroller,
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
            ),

            
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: 
                GetBuilder<OurBrandDetailsController>(
                    init: ourbranddeatilscontrroller,
                    builder: (_) {
                      return
            
                         
                          GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: AlwaysScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 285),
                              itemCount: ourbranddeatilscontrroller
                                  .userPropertiesModel!
                                  .data!
                                  .length, // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                
                                var item = ourbranddeatilscontrroller
                                    .userPropertiesModel!.data![index];
                                print("Name,Brand");
                                print(item.name);
                                print(item.brandId);
                                var imagePath =
                                    "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                print(imagePath);
                                return
                                  
                                    InkWell(
                                  onTap: ()async {
                                    productdeatilscontroller.dispose();
                                                productdeatilscontroller
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
            
                                                // print("productid${item.id ?? 0}");
                                                await productdeatilscontroller
                                                    .init();
                                               
                                                Get.to(ProductDetails(
                                                  id: item.id??0,
                                                ));
                                  },
                                  child: Container(
                                    width: 140,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                        
                                          MyColors.white,
                                          MyColors.white,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
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
                                           GetBuilder<HomeuserController>(
                  init: homeusercontroller,
                  builder: (_) {
                                            return InkWell(
                                              onTap: () {
                                                homeusercontroller
                                                    .addItemToWishList(item.id!);
            
                                                homeusercontroller.init();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(
                                                      homeusercontroller
                                                              .wishListItemsId
                                                              .contains(item.id!)
                                                          ? Icons.favorite
                                                          : Icons.favorite_border,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            );
                                          }
                                        ),
            
                                        Container(
                                          height: 125,
                                         
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath,
                                            
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
            
                                       
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 5, top: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(item.name!,                    maxLines: 1,
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
                                                                "₹ ${((double.parse(item.price??'0')) - ((double.parse(item.price??'0')) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
            
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
                                                                 productdeatilscontroller.viewproductHome(
                                                                              item.id??0,item.name??'',"1kg",1 ,double.parse(item.price ?? '0'),item.image??'','yes');
                                                                              await productdeatilscontroller.addProductHome();
                                                            mycartController.init();
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
            ),

            

                                                           
          ],
        ));
  }
}
