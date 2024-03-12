

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';

import 'package:pet/screens/salesman/productAllPartnersales.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import '../../utils/constants.dart';

class SalesProductByPartnerDetails extends StatelessWidget {
   SalesProductByPartnerDetails({super.key, this.address,this.email,this.name, this.mobileno});
   String? name;
   String? email;
   String? address;
   String? mobileno;
  final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
         SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());
      
  SalesMyCartController mycartController = Get.put(SalesMyCartController());

  // final HomeuserController homeusercontroller = Get.put(HomeuserController());
  //   ProductDetailsController productdeatilscontroller =
  //     Get.put(ProductDetailsController());
  //     UserReviewController userreviewController = Get.put(UserReviewController());
  @override
  Widget build(BuildContext context) {
    var imagePath =  "${Constants.BASE_URL}/storage/app/public/store/cover/${homesalecontroller
                                            .salesProductPartnerModel!.data![0].coverPhoto ?? ""}";
    
    //  "${Constants.USERPROFILE_IMAGEPATH_URL}" +
    //                                         .toString();
    return  Scaffold(
       appBar: CustomAppBarSalesWholeback(title : "Product Details"),
       body: ListView(shrinkWrap: true,
       primary: true,
       children: [


              Container(
                
                child: CachedNetworkImage(
                                                                  imageUrl:
                                                                      imagePath,
                                                                  // width: 50,
                                                                  height: 150,
                                                                  fit: BoxFit.fill,
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
                                                            


       SizedBox(height: 10,),




        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
         Row(
                                    children: [
                                      Text(
                                        "Partner Name",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                      Spacer(),
                                      Text(
                                       name
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
         Row(
                                    children: [
                                      Text(
                                        "Address",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                    Spacer(),
                                      Text(
                                                                           address
                                            .toString(),
        
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                 
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
        
                                           Row(
                                    children: [
                                      Text(
                                        "Mobile",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                     Spacer(),
                                      Text(
                                     mobileno
                                            .toString(),
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  
                                 
                                           SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),  
         Row(
                                    children: [
                                      Text(
                                        "Email",
                                        style: CustomTextStyle.popinslight,
                                      ),
                                     Spacer(),
                                      Text(
                                                                            email
                                            .toString(),
        
                                        style: CustomTextStyle.popinstext,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
                                  Divider(
                                    color: MyColors.lightdivider,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                 SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),

                                                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text("Partner Products",style: CustomTextStyle.popinstext,),

                    // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                    InkWell(
                      onTap: () {
                         SalesProductDetailsController productdeatilscontroller = Get.put(SalesProductDetailsController());

                        Get.to(() => SalesProductAllPartner());
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

                                         
                                           SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.02),
        
 homesalecontroller
                                            .salesproductbypartneritemModel == null ||  homesalecontroller
                                            .salesproductbypartneritemModel!.data == null
                             ? SizedBox(
                                      child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)))
                                
                              :
             GetBuilder<HomeSalesController>(
                    init: homesalecontroller,
                    builder: (_) {
                      return homesalecontroller.partneritemLoaded == null
                          ? SizedBox()
                          :  homesalecontroller
                                            .salesproductbypartneritemModel == null || homesalecontroller.salesproductbypartneritemModel!.data == null
                             ? SizedBox(
                                      child:Center(child: Image.asset("assets/image/favorite_border,color:Colors.redimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)))
                                
                              : Container(
                                  // height: 600,
                                  child: GridView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 15.0,
                                              mainAxisExtent: 280),
                                      itemCount:  homesalecontroller
                                            .salesproductbypartneritemModel!.data!.length
                                          .clamp(0,
                                              4), // Set the number of cards you want to display.
                                      itemBuilder: (context, index) {
                                     

                                        var item =  homesalecontroller
                                            .salesproductbypartneritemModel!.data![index];
                                        String imagePath =
                                            Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";

                                        // var imagePath =
                                        //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                        // print(imagePath);
                                        return
                                        
                                         InkWell(
                                          onTap: () async {
                                                salesProductDetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print(
                                                    "productid${item.id ?? 0}");
                                                await salesProductDetailsController
                                                    .init();
                                                Get.to(ProductDetailssale());
                                            // Get.to( ProductDetails());
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //           ));
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
                                                                item.description
                                                                            .toString()
                                                                            .length <
                                                                        10
                                                                    ? item
                                                                        .description!
                                                                    : item
                                                                        .description!
                                                                        .substring(
                                                                            0,
                                                                            19),
                                                                             maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                                                    // Row(
                                                                    //   children: [
                                                                    //     Text(
                                                                    //         "₹" +
                                                                    //             item.price.toString(),
                                                                    //         style: CustomTextStyle.discounttext),
                                                                    //     SizedBox(
                                                                    //         width:
                                                                    //             2),
                                                                    //     // Container(
                                                                    //     // height:
                                                                    //     //     20,
                                                                    //     // width: 48,
                                                                    //     // decoration: BoxDecoration(
                                                                    //     //     color: MyColors
                                                                    //     //         .red,
                                                                    //     //     borderRadius: BorderRadius.circular(
                                                                    //     //         10),
                                                                    //     //     border:
                                                                    //     //         Border.all(color: MyColors.red)),
                                                                    //     // child:
                                                                    //     //     Center(
                                                                    //     //   child:
                                                                    //     Text(
                                                                    //         // item.discount.toString(),
                                                                    //           "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                    //         style:
                                                                    //             CustomTextStyle.popinstextsmal2222red),
                                                                    //     //   ),
                                                                    //     // ),
                                                                    //   ],
                                                                    // ),
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
                                           
                                          
                                          
                                          // (
                                          //   // width: 145,
                                          //   // height: 700,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(25),
                                          //     color: MyColors.white,
                                          //     boxShadow: [
                                          //       BoxShadow(
                                          //         color: Colors.grey
                                          //             .withOpacity(0.3),
                                          //         spreadRadius: 3,
                                          //         blurRadius: 7,
                                          //         offset: Offset(0,
                                          //             3), // Offset of the shadow
                                          //       ),
                                          //     ],
                                          //     // color: MyColors.white
                                          //   ),
                                          //   child: Column(
                                          //     children: [
                                          //       InkWell(
                                          //         onTap: () {
                                          //           homeusercontroller
                                          //               .addItemToWishList(
                                          //                   item.id!);
                                          //         },
                                          //         child: Padding(
                                          //           padding:
                                          //               const EdgeInsets.all(
                                          //                   8.0),
                                          //           child: Align(
                                          //               alignment: Alignment
                                          //                   .centerRight,
                                          //               child: Icon(homeusercontroller
                                          //                       .wishListItemsId
                                          //                       .contains(
                                          //                           item.id!)
                                          //                   ? Icons.favorite
                                          //                   : Icons
                                          //                       .favorite_border,color:Colors.red)),
                                          //         ),
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
                                          //           placeholder:
                                          //               (context, url) =>
                                          //                   Center(
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
                                          //           padding:
                                          //               const EdgeInsets.only(
                                          //                   left: 10.0,
                                          //                   right: 5,
                                          //                   top: 5),
                                          //           child: Column(
                                          //             mainAxisAlignment:
                                          //                 MainAxisAlignment
                                          //                     .start,
                                          //             crossAxisAlignment:
                                          //                 CrossAxisAlignment
                                          //                     .start,
                                          //             children: [
                                          //               Text(item.name!,
                                          //                   style: CustomTextStyle
                                          //                       .popinsmedium),
                                          //               Text(
                                          //                   item.description
                                          //                               .toString()
                                          //                               .length <
                                          //                           30
                                          //                       ? item
                                          //                           .description!
                                          //                       : item
                                          //                           .description!
                                          //                           .substring(
                                          //                               0, 19),
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
                                          //                                   item.price
                                          //                                       .toString(),
                                          //                               style: CustomTextStyle
                                          //                                   .discounttext),
                                          //                           SizedBox(
                                          //                               width:
                                          //                                   1),
                                          //                           // Container(
                                          //                           //   height:
                                          //                           //       20,
                                          //                           //   width: 47,
                                          //                           //   decoration: BoxDecoration(
                                          //                           //       color: MyColors
                                          //                           //           .red,
                                          //                           //       borderRadius: BorderRadius.circular(
                                          //                           //           10),
                                          //                           //       border:
                                          //                           //           Border.all(color: MyColors.red)),
                                          //                           //   child:
                                          //                           //       Center(
                                          //                           //     child: 
                                          //                               Text(
                                          //                                   // item.discount.toString(),
                                          //                                     "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                          //                                   style: CustomTextStyle.popinstextsmal2222),
                                          //                           //   ),
                                          //                           // ),
                                          //                         ],
                                          //                       ),
                                          //                       SizedBox(
                                          //                           height: 5),
                                          //                       Text(
                                          //                         "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                          //                         // "₹" +
                                          //                         //     item.price!,
                                          //                         style: CustomTextStyle
                                          //                             .popinsmedium,
                                          //                       ),
                                          //                     ],
                                          //                   ),

                                          //                   Padding(
                                          //                     padding:
                                          //                         const EdgeInsets
                                          //                                 .only(
                                          //                             right:
                                          //                                 5.0),
                                          //                     child: Container(
                                          //                         width: 35,
                                          //                         height: 35,
                                          //                         decoration: BoxDecoration(
                                          //                             borderRadius:
                                          //                                 BorderRadius.circular(
                                          //                                     10),
                                          //                             color: Color(
                                          //                                 0xffffcc00)),
                                          //                         child:
                                          //                             Padding(
                                          //                           padding:
                                          //                               EdgeInsets.all(
                                          //                                   5.0),
                                          //                           child: Image
                                          //                               .asset(
                                          //                             "assets/image/bag2.png",
                                          //                             height:
                                          //                                 25,
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
                                );
                    }),

            ],
          ),
        )


       ],)
    );
  }
}