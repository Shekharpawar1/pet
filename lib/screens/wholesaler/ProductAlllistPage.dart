import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/productdetails.dart';

class ProductAlllistPagewhole extends StatefulWidget {
  const ProductAlllistPagewhole({super.key});

  @override
  State<ProductAlllistPagewhole> createState() => _ProductAlllistPagewholeState();
}

class _ProductAlllistPagewholeState extends State<ProductAlllistPagewhole> {
   WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(left: 5.0, top: 10, bottom: 10, right: 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.black,
                size: 20,
              ),
            ),
          ),
          title: Center(
              child: Text(
            "All Products",
            style: CustomTextStyle.appbartext,
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height*0.02),

              !wholehomecontroller.propertyLoaded
                  ? SizedBox()
                  : Container(
                      // height: 5000,
                      child: GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 2,
                                  mainAxisExtent: 285,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemCount: wholehomecontroller
                              .userPropertiesModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            var item = wholehomecontroller
                                .userPropertiesModel!.data![index];

                           String imagePath =
                                                Constants.PRODUCT_HOME_IMAGE_PATH +
                                                    "/${item.image!}";
                            print(imagePath);
                            return InkWell(
                              onTap: () async{

                                 wholeproductdetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print("productid${item.id ?? 0}");
                                                await wholeproductdetailsController
                                                    .init();
                                                Get.to(ProductDetailswhole(
                                                  id: item.id??0,
                                                ));
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


        GetBuilder<WholeHomeController>(
                  init: wholehomecontroller,
                  builder: (_) {
           return InkWell(
                                                          onTap: () {
                                                            wholehomecontroller
                                                                .addItemToWishList(
                                                                    item.id!);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Icon(wholehomecontroller
                                                                        .wishListItemsId
                                                                        .contains(
                                                                            item.id!)
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
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                               onTap: () async{
                                                                             wholeproductdetailsController.viewproductHome(
                                                                              item.id??0,item.name??'',"1kg",1 ,item.price as int,item.image!);
                                                                              await wholeproductdetailsController
                                                            .addProductHome();
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
                              //         blurRadius: 2,
                              //         offset:
                              //             Offset(0, 3), // Offset of the shadow
                              //       ),
                              //     ],
                              //     // color: MyColors.white
                              //   ),
                              //   child: Column(
                              //     children: [
                              //       Container(
                              //         height: 125,

                              //         // decoration: BoxDecoration(
                              //         //     borderRadius: BorderRadius.circular(30),
                              //         //     color: MyColors.white),
                              //         child: CachedNetworkImage(
                              //           imageUrl: imagePath,
                              //           width: 61,
                              //           height: 75,
                              //           placeholder: (context, url) => Center(
                              //             child: CircularProgressIndicator(),
                              //           ), // Replace with your own placeholder widget
                              //           errorWidget: (context, url, error) =>
                              //               Icon(Icons
                              //                   .error), // Replace with your own error widget
                              //         ),
                              //       ),

                              //       // SizedBox(height: 15,),

                              //       Container(
                              //         height: 145,
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
                              //               Text(item.description.toString(),
                              //                   style: CustomTextStyle
                              //                       .popinssmall0),
                              //               // SizedBox(height: 3),

                              //               Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment
                              //                         .spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     item.price!,
                              //                     style: CustomTextStyle
                              //                         .popinsmedium,
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
                              //                                     .circular(10),
                              //                             color: Color(
                              //                                 0xffffcc00)),
                              //                         child: Padding(
                              //                           padding: EdgeInsets.all(
                              //                               10.0),
                              //                           child: Image.asset(
                              //                             "assets/image/bag2.png",
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
                    ),
            ],
          ),
        ));
  }
}
