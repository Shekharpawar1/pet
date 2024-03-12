import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/addresscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/couponswhole_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';

import 'package:pet/screens/swepcard.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/payment.dart';
import 'package:pet/screens/wholesaler/wholeaddnewAddress.dart';
import 'package:pet/screens/wholesaler/wholecouponPage.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class AddToCardwhole extends StatefulWidget {
  const AddToCardwhole({super.key});

  @override
  State<AddToCardwhole> createState() => _AddToCardwholeState();
}

class _AddToCardwholeState extends State<AddToCardwhole> {
   
  MyCartWholeController mycartwholeController = Get.put(MyCartWholeController());
  CouponsWholeController couponsController = Get.put(CouponsWholeController());
    WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
  WholeAddressController addressController = Get.put(WholeAddressController());
  @override
  void onInit() {
    mycartwholeController.updateTotal();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(

          body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                GetBuilder<MyCartWholeController>(
                    init: mycartwholeController,
                    builder: (_) {
                      return mycartwholeController.wholemycartmodel == null
                          ? SizedBox()
                          : mycartwholeController.cartlistLoaded == false
                              ? SizedBox()
                              
                           
                            : mycartwholeController.wholemycartmodel!.data!.isEmpty
                                ? Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text('Continue Shopping')),
                                  )
                                : 
                              
                              Container(
                                  child: ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: mycartwholeController
                                          .wholemycartmodel!.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = mycartwholeController
                                            .wholemycartmodel!.data![index];
                                         String imagePath =
                                            Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";
                                       return (mycartwholeController
                                                    .wholemycartmodel!.data ==
                                                null)
                                            ? SizedBox()
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(25),
                                                    color: MyColors.boxbgcolor),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          // Icon(Icons.edit_outlined),
                                                          // SizedBox(
                                                          //   width: 10,
                                                          // ),
                                                          InkWell(
                                                              onTap: () async {
                                                                //  items.removeAt(index);
                                                                mycartwholeController
                                                                    .additem(
                                                                             
                                                                        item.id ??
                                                                            0);
                                                                print(
                                                                    "Item${item.id}");
                                                                await mycartwholeController
                                                                    .initdelete();
                                                                   mycartwholeController.updateTotal();  
                                                                   
                                                                mycartwholeController.init();
                                                               
                                                              },
                                                              child: Icon(Icons
                                                                  .delete_outline)),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                15.0),
                                                        child:
                                                            //   Image.asset(
                                                            //   "assets/image/fooddog.png",
                                                            // ),
                                                            CachedNetworkImage(
                                                          imageUrl: imagePath,
                                                          width: 65,
                                                          height: 95,
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
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                        SizedBox(
                                                              width: Get.width *
                                                                  0.5,
                                                              child: Text(
                                                                (item.itemName ??
                                                                        '')
                                                                    .toString(),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                          Text(
                                                              "variant : "+(item.variant ?? '')
                                                                  .toString(),
                                                              style: CustomTextStyle
                                                                  .popinssmall0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                          (wholeproductdetailsController.sizecount == wholeproductdetailsController.sizecount )
                                                          ?
                                                                 Text(
                                                            "₹" +
                                                                      ((item.price! *
                                                                              (item.quantity!.toInt())))
                                                                          .toStringAsFixed(2),
                                                                  // "₹${item.price}",
                                                                  // "₹"+(addtocartController.total).toString(),
                                                                  style: CustomTextStyle
                                                                      .popinsmedium,
                                                                )
                                                                :
                                                                Text(
                                                                // item.price.toString(),
                                                                  // "₹${item.price}",
                                                                  "₹"+(mycartwholeController.total).toString(),
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
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      mycartwholeController
                                                                          .decrementSize(
                                                                              index);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height: 25,
                                                                      decoration: BoxDecoration(
                                                                          shape: BoxShape
                                                                              .rectangle,
                                                                          color: MyColors
                                                                              .yellow,
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  10)),
                                                                      child: Icon(
                                                                          Icons
                                                                              .remove,
                                                                          size: 15,
                                                                          color: Colors
                                                                              .black),
                                                                     
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 3,
                                                                  ),
                                                                  GetBuilder<
                                                                          MyCartWholeController>(
                                                                      init:
                                                                          mycartwholeController,
                                                                      builder: (_) {
                                                                        return Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius:
                                                                                  BorderRadius.circular(50),
                                                                            ),
                                                                            child: Center(
                                                                                child: Text(
                                                                              mycartwholeController
                                                                                  .sizes[index]
                                                                                  .toString(),
                                                                              style:
                                                                                  TextStyle(fontWeight: FontWeight.w500),
                                                                            )));
                                                                      }),
                                                                  SizedBox(
                                                                    width: 3,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      mycartwholeController
                                                                          .incrementSize(
                                                                              index);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height: 25,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              //shape: BoxShape.rectangle,
                                                                              borderRadius: BorderRadius.circular(
                                                                                  10),
                                                                              color:
                                                                                  MyColors.yellow),
                                                                      child: Icon(
                                                                          Icons.add,
                                                                          size: 15,
                                                                          color: Colors
                                                                              .black),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ]),
                                                  ],
                                                ),
                                              );
                                      }));
                    }),


                SizedBox(
                  height: 20,
                ),
                GetBuilder<MyCartWholeController>(
                  init: mycartwholeController,
                  // initState: (_) {},
                  builder: (_) {
                    return Container(
                      // height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.white),
                      child: DottedBorder(
                        color: Colors.black26,
                        borderType: BorderType.Rect,
                        radius: Radius.circular(25),
                        //  strokeWidth: 1,
                        child: Container(
                          // height:MediaQuery.of(context).size.height*0.28,

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(children: [
                              Row(
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                     Spacer(),
                                  Text(
                                  "₹"+  mycartwholeController.total.toString(),
                                    style: CustomTextStyle.popinstext,
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02),
                             Divider(
                                color: MyColors.lightdivider,
                                thickness: 1,
                                height: 1,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02),

                                 
                              Row(
                                children: [
                                  Text(
                                    "Rounding Adjust",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                    Spacer(),
                                       Text(
                                        "₹${((mycartwholeController.total) .toDouble()).toStringAsFixed(2)}",
                                        style: CustomTextStyle.popinstext,
                                      )
                                 
                                ],
                              ),

]),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(
                  "Address",
                  style: CustomTextStyle.popinslight,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: MyColors.blue123),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10, bottom: 10, right: 15),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.48,
                                  child: GetBuilder<MyCartWholeController>(
                                      init: mycartwholeController,
                                      builder: (_) {
                                        return mycartwholeController
                                                        .wholeallAddresslistModel ==
                                                    null ||
                                                mycartwholeController
                                                        .wholeallAddresslistModel!
                                                        .data ==
                                                    null ||
                                                mycartwholeController
                                                    .wholeallAddresslistModel!
                                                    .data!
                                                    .isEmpty
                                            ? SizedBox()
                                            : Text(
                                                (mycartwholeController
                                                            .wholeallAddresslistModel!
                                                            .data![mycartwholeController
                                                                    .isselected ??
                                                                0]
                                                            .area ??
                                                        "")
                                                    .toString(),
                                                style: CustomTextStyle.popinstext);
                                      })),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await mycartwholeController.alladdressinit();

                              showModalBottomSheet(
                               isScrollControlled: true,
                                isDismissible: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>      ListView(
                                  shrinkWrap: true,
                                  primary: false,
                                  children: [
                                    Container(
                                       margin: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.cancel),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            GetBuilder<MyCartWholeController>(
                                                init: mycartwholeController,
                                                builder: (_) {
                                                  return ListView.builder(
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount: mycartwholeController
                                                        .wholeallAddresslistModel!
                                                        .data!
                                                        .length,
                                                    itemBuilder: (context, index) {
                                                      var item = mycartwholeController
                                                          .wholeallAddresslistModel!
                                                          .data![index];

                                                      return (mycartwholeController
                                                                  .wholeallAddresslistModel!
                                                                  .data ==
                                                              null)
                                                          ? SizedBox()
                                                          : InkWell(
                                                              onTap: () {
                                                                mycartwholeController
                                                                    .selectaddadress(
                                                                        item.id ?? 0);
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.all(10),
                                                                child: Container(
                                                                    margin: EdgeInsets
                                                                        .symmetric(
                                                                            vertical:
                                                                                10),
                                                                    // height: MediaQuery.of(context).size.height*0.2,
                                                                    width:
                                                                        MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .width,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    15),
                                                                        border: Border.all(
                                                                            color: MyColors
                                                                                .grey)),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                                  .all(
                                                                              10.0),
                                                                      child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            item!
                                                                                .firstName
                                                                                .toString(),
                                                                            style: CustomTextStyle
                                                                                .popinstext,
                                                                          ),
                                                                          Text(
                                                                            item!
                                                                                .lastName
                                                                                .toString(),
                                                                            style: CustomTextStyle
                                                                                .popinssmallnormal,
                                                                          ),
                                                                          Text(
                                                                            "${item.houseNo.toString()} ${item.area.toString()}",
                                                                            style: CustomTextStyle
                                                                                .popinssmallnormal,
                                                                          ),
                                                                          Text(
                                                                            "${item.landmark.toString()} ${item.state.toString()} ${item.city.toString()}",
                                                                            style: CustomTextStyle
                                                                                .popinssmallnormal,
                                                                          ),
                                                                          Text(
                                                                            "Mobile No: ${item.mobile.toString()}",
                                                                            style: CustomTextStyle
                                                                                .popinssmallnormal,
                                                                          ),
                                                                          SizedBox(
                                                                              height:
                                                                                  10),
                                                                          Row(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap:
                                                                                      () async {
                                                                                    addressController.addadressID(item.id ??
                                                                                        0);
                                                                                    addressController.updateaddress(
                                                                                        item.id,
                                                                                        item.firstName,
                                                                                        item.lastName,
                                                                                        item.mobile,
                                                                                        item.pincode,
                                                                                        item.area,
                                                                                        item.houseNo,
                                                                                        item.landmark);
                                                                                    print("${item.lastName}");
                                                                                    Get.to(WholeUserAddress(
                                                                                      isSelected: false,
                                                                                    ));
                                                                                    await addressController.updateaddaddress();
                                                                                    addressController.clearFields();
                                                                                  },
                                                                                  child: Container(
                                                                                      height: 25,
                                                                                      width: 60,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          "Edit",
                                                                                          style: CustomTextStyle.popinssmallnormal,
                                                                                        )),
                                                                                      )),
                                                                                ),
                                                                                SizedBox(
                                                                                    width:
                                                                                        5),
                                                                                InkWell(
                                                                                  onTap:
                                                                                      () async {
                                                                                    await mycartwholeController.addressdeleteinit();
                                                                                    //  addressController.removeaddress(index);
                                                                                    mycartwholeController.alladdressinit();
                                                                                  },
                                                                                  child: Container(
                                                                                      height: 25,
                                                                                      width: 60,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          "Delete",
                                                                                          style: CustomTextStyle.popinssmallnormal,
                                                                                        )),
                                                                                      )),
                                                                                ),
                                                                                SizedBox(
                                                                                    width:
                                                                                        5),
                                                                                GestureDetector(
                                                                                  onTap:
                                                                                      () {
                                                                                    mycartwholeController.chooseaddressID(item.id??0);
                                                                                    mycartwholeController.chooseaddress(index);
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Container(
                                                                                      height: 25,
                                                                                      width: 60,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          "Choose",
                                                                                          style: CustomTextStyle.popinssmallnormal,
                                                                                        )),
                                                                                      )),
                                                                                ),
                                                                              ])
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ),
                                                            );
                                                    },
                                                  );
                                                }),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Center(
                                            //   child: ElevatedButton(
                                            //     style: ElevatedButton.styleFrom(
                                            //       primary: MyColors.yellow,
                                            //     ),
                                            //     onPressed: () {
                                            //       Get.to(PaymentUser());
                                            //     },
                                            //     child: Text(
                                            //       'Save Address',
                                            //       style: CustomTextStyle.popinssmall,
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: MyColors.yellow,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Text(
                                "Change",
                                style: CustomTextStyle.mediumtextreem,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                InkWell(
                  onTap: () async {
                    addressController.clearFields();
                    await addressController.init();
                    Get.to(WholeUserAddress(
                      isSelected: true,
                    ));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15, color: MyColors.yellow),
                      Text("Add new address",
                          style: CustomTextStyle.yellowtextnormal),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 5, bottom: 5, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            Text("Total", style: CustomTextStyle.popinstext),

                              GetBuilder<MyCartWholeController>(
                  init: mycartwholeController,
                  builder: (_) {
                        
                             return Text( 
                              "₹${(((mycartwholeController.total)).toDouble()).toStringAsFixed(2)}",
                                   style: CustomTextStyle.appbartext);
                          
                  })
                           
                          ],
                        ),
                        InkWell(
                          onTap: () {
                           
                           

                            if (mycartwholeController.isselected != null &&
                                mycartwholeController.wholeallAddresslistModel !=
                                    null &&
                                mycartwholeController.wholeallAddresslistModel!.data !=
                                    null &&
                                mycartwholeController
                                    .wholeallAddresslistModel!.data!.isNotEmpty) {
                              if (mycartwholeController
                                  .wholemycartmodel!.data!.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please add any items",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                // Proceed to the payment screen
                            Get.to(Paymentwhole(
                               price:
                               ((mycartwholeController.total) 
                             .toDouble())
                             
                            ));
                         
                              }
                            } else {
                              // Show a validation message indicating that no address is selected
                              Get.snackbar(
                                "Error",
                                "Please select an address before proceeding.",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                              );
                            }











                           
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                                color: MyColors.yellow,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              "Proceed To Buy",
                              style: CustomTextStyle.mediumtextreem,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

             
              ],
            ),
          ),
        ),
   
   
      ],
    );
  }
}