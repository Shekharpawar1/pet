import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/dashBoard_controller.dart';
import 'package:pet/screens/partner/orderDetails.dart';
import 'package:pet/screens/partner/widget/wholeAppBar.dart';
import 'package:pet/screens/wholesaler/orderDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class ProductWholesellerpartner extends StatefulWidget {
  const ProductWholesellerpartner({super.key});

  @override
  State<ProductWholesellerpartner> createState() => _ProductWholesellerpartnerState();
}

class _ProductWholesellerpartnerState extends State<ProductWholesellerpartner> {
   TextEditingController _searchcontroller = TextEditingController();

    PartnerDashBoardController partnerDashBoardController = Get.put(PartnerDashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: CustomAppBarPartnerback(title:"Product"
        
      ),   
      body:
        GetBuilder<PartnerDashBoardController>(
          init: partnerDashBoardController,
          builder: (_) {
            return ListView(
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
SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                     
                    GetBuilder<PartnerDashBoardController>(
          init: partnerDashBoardController,
          builder: (_) {
                    return  ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount:partnerDashBoardController.partnertotalProductModel
              !.data!.length,
                    itemBuilder: (context, index) {
                      var item = partnerDashBoardController.partnertotalProductModel!.data![index];
                      String imagePath =
                                            Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";
                     return  partnerDashBoardController.partnertotalProductModel!.data == null
                      ? SizedBox()
                      : 
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                              
            
                                InkWell(
                                  onTap: () {
                                    
                                     print("iTem  ${item.id}");


                                  },
                                  child:  Container(
                                                // margin: EdgeInsets.symmetric(
                                                //     vertical: 10),
                                                // height: MediaQuery.of(context)
                                                //         .size
                                                //         .height *
                                                //     0.18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: MyColors.boxbgcolor),
                                                child: Stack(
                                                  children: [
                                                    Row(children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child:
                                                            //   Image.asset(
                                                            //   "assets/image/fooddog.png",
                                                            // ),
                                                            CachedNetworkImage(
                                                          imageUrl: imagePath,
                                                          width: 75,
                                                          height: 100,
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
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            (item.name ??
                                                                    '')
                                                                .toString(),
                                                            style: CustomTextStyle
                                                                .popinsmedium,
                                                          ),
                                                          Text(
                                                              (item.description ??
                                                                      '')
                                                                  .toString(),
                                                              style: CustomTextStyle
                                                                  .popinssmall0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "₹" +
                                                                    item.price
                                                                        .toString(),
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.1,
                                                              ),
                                                              ],
                                                          )
                                                        ],
                                                      )
                                                    ]),
                                                  ],
                                                ),
                                              )
                                      ),
                               ],
                            ),
                          )
                  ;  },
                      );
                      }
                    ),
              ],
            );
          }),
   

    );
  }
}