

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/controllers/user_controller/videocontoller.dart';
import 'package:pet/screens/user/productAllPartner.dart';
// import 'package:pet/screens/user/productAllPartner.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/constants.dart';

class ProductByPartnerDetails extends StatelessWidget {
   ProductByPartnerDetails({super.key, this.address,this.email,this.name, this.mobileno});
   String? name;
   String? email;
   String? address;
   String? mobileno;

  final HomeuserController homeusercontroller = Get.put(HomeuserController());
    ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
      
  VideoBannerController videobannercontroller  = Get.put(VideoBannerController());
  MyCartController mycartController = Get.put(MyCartController());
      UserReviewController userreviewController = Get.put(UserReviewController());
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
       appBar: CustomAppBarback(title:"Partner Details"),
       body: ListView(
        shrinkWrap: true,
       primary: true,
       children: [


              Container(
                
                child: CachedNetworkImage(
                                                                  imageUrl:
                                                                      "${Constants.BASE_URL}/storage/app/public/store/cover/${homeusercontroller
                                            .userProductPartnerModel!.data![0].coverPhoto ?? ""}",
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
                   Text("Products",style: CustomTextStyle.popinstext,),

                    // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                    InkWell(
                      onTap: ()async {

                         await videobannercontroller.partnerBannerinit();
                        Get.to(UserProductAllPartner());
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
        
homeusercontroller.userproductbypartneritemModel == null || homeusercontroller.userproductbypartneritemModel!.data == null
                             ? SizedBox(
                                      child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)))
                                
                              :
             GetBuilder<HomeuserController>(
                    init: homeusercontroller,
                    builder: (_) {
                      return homeusercontroller.partneritemLoaded == null
                          ? SizedBox()
                          : homeusercontroller.userproductbypartneritemModel == null || homeusercontroller.userproductbypartneritemModel!.data == null
                             ? SizedBox(
                                      child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)))
                                
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
                                              mainAxisExtent: 285),
                                      itemCount: homeusercontroller
                                          .userproductbypartneritemModel!.data!.length
                                          .clamp(0,
                                              4), // Set the number of cards you want to display.
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

                                        var item = homeusercontroller
                                            .userproductbypartneritemModel!.data![index];
                                        String imagePath =
                                            Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";

                                        // var imagePath =
                                        //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                        // print(imagePath);
                                        return
                                        
                                         InkWell(
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
                                            item.id??0,0
                                          );
                                                await userreviewController. init();
                                            Get.to(ProductDetails());
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

           
 GetBuilder<HomeuserController>(
                            init: homeusercontroller,
                            builder: (_) {
                                                        return InkWell(
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
                                                        );
                                                      }
                                                    ),

                                                       
]),
                          


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
                                                                        20
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
                                                                         SizedBox(width:3),
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ):const  SizedBox(),
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
                                                                    //         "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                    //         style:
                                                                    //             CustomTextStyle.popinstextsmal2222red),
                                                                    //     //   ),
                                                                    //     // ),
                                                                    //   ],
                                                                    // ),
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
                                                                            "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toInt().toDouble()}",

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
onTap: ()async{

   productdeatilscontroller.viewproductHome(
                                                                              item.id??0,item.name??'',"1kg",1 ,double.parse(item.price ?? ''),item.image??'','yes');
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
void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}