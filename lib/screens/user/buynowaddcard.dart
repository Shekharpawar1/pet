

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
import 'package:pet/controllers/user_controller/addresscontroller.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/coupons_controller.dart';
import 'package:pet/models/usersModel/mycartListModel.dart' as MyOrder;
import 'package:pet/screens/partner/partneraddress.dart';

import 'package:pet/screens/swepcard.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/screens/user/paymentbuynow.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:pet/screens/user/useraddnewAddress.dart';
import 'package:pet/screens/user/usercouponPage.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class BuyNowAddToCardUser extends StatefulWidget {
   BuyNowAddToCardUser({super.key,this.data,required this.storeid
  //  this.tax
   });
 MyOrder.Datum ? data;
 int storeid;
//  int? tax;



  @override
  State<BuyNowAddToCardUser> createState() => _BuyNowAddToCardUserState();
}

class _BuyNowAddToCardUserState extends State<BuyNowAddToCardUser> {
  AddressController addressController = Get.put(AddressController());
  MyCartController addtocartController = Get.put(MyCartController());
  
  CouponsController couponsController = Get.put(CouponsController());

    @override
  void onInit() {
    addtocartController.updateTotal();
    // super.onInit();
  }
  @override
  Widget build(BuildContext context) {
     ;     // addtocartController.updateTotal();
       final prevScreen=Get.previousRoute;
       print("prevscreen ${prevScreen}");
    print("DataBuyNow");
    print(widget.data);
    print("store_Id${widget.storeid}");
    // addtocartController.updateTotal();
    return Stack(
      children: [
        Scaffold(
         appBar:CustomAppBarTitleback(),
         body: Padding(
            padding: EdgeInsets.only(left:15,right:15),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [

widget.data == null?
                                          Center(
                                            child: ElevatedButton(
                                                        onPressed: () {
                                                       Get.to(HomeUser(

                                                       ));
                                                        },
                                                        child: Text('Continue Shopping')
                                                      ),
                                          ):

                              (widget.data ==
                                                null)
                                            ? SizedBox()
                                            :

                                             Container(
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
                                                        BorderRadius.circular(
                                                            25),
                                                    color: MyColors.boxbgcolor),
                                                child: Stack(
                                                  children: [

                                                    Row(
                                                      children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child:

                                                            CachedNetworkImage(
                                                          imageUrl: Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${widget.data!.image??''}",
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
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                            SizedBox(width: Get.width*0.5,
                                                              child: Text(
                                                              (widget.data!.itemName ??
                                                                    '')
                                                                    .toString(),
                                                                    maxLines: 1,
                                                                      overflow: TextOverflow.ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                          // Text(
                                                          //   (widget.data!.itemName ??
                                                          //           '')
                                                          //       .toString(),
                                                          //   style: CustomTextStyle
                                                          //       .popinsmedium,
                                                          // ),
                                                             Text(
                                                              "Qty: "+(widget.data!.quantity ??
                                                                      '')
                                                                  .toString(),
                                                              style: CustomTextStyle
                                                                  .popinssmall0),
                                                          Text(
                                                              "variants: "+ (widget.data!.variant ??
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
                                                                    widget.data!.price
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
                                              ),


                GestureDetector(
                  onTap: () async {
                             await couponsController.init();
                    Get.to(UsercouponPage(
                      price: (   widget.data!.price!) ,

                    ));

                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: MyColors.blue123,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/image/applycodeimg.png",
                                    height: 45),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Apply coupon",
                                  style: CustomTextStyle.popinslight,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                  GetBuilder<CouponsController>(
                init: couponsController,
                builder: (_) {
                                    return Text(
                                      couponsController.couponcode ?? "",
                                      style: CustomTextStyle.popinslight,
                                    );
                                  }
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            ),
                          ],
                        ),
                      )),
                ),

                SizedBox(
                  height: 20,
                ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.white),
                      child: DottedBorder(
                        color: Colors.black26,
                        borderType: BorderType.Rect,
                        radius: Radius.circular(25),
                        child: Container(

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(children: [
                              Row(
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                  // SizedBox(
                                  //   width:
                                  //       MediaQuery.of(context).size.width * 0.2,
                                  // ),
                                  Spacer(),
                                // (addtocartController.total == 0 )  ?
                                //   Text(
                                //     addtocartController.price.toString(),
                                //     style: CustomTextStyle.popinstext,
                                //   ):
                                  Text(
                                  "₹" +  widget.data!.price.toString(),
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
                             (couponsController.maxAmount == null || couponsController.maxAmount == "0.0" || couponsController.maxAmount == "0")?
                                  Row(
                                children: [
                                  Text(
                                    "Delivery charges",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                  const Spacer(),
                                  (((widget.data!.price!)) <   addtocartController.deliverycharges)?
                                  Text(
                                    "+ ₹" +
                                        (addtocartController.deliveryprice)
                                            .toInt().toString(),
                                    style: CustomTextStyle.popinstext,
                                  ):
                                  Text(
                                    "+ ₹" +
                                        (0)
                                            .toInt().toString(),
                                    style: CustomTextStyle.popinstext,
                                  ),
                                ],
                              )


                              :Row(
                                children: [
                                  Text(
                                    "Delivery charges",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                  const Spacer(),
                                  (((widget.data!.price!)-num.parse(couponsController.maxAmount??"")) <   addtocartController.deliverycharges)?
                                  Text(
                                    "+ ₹" +
                                        (addtocartController.deliveryprice)
                                            .toInt().toString(),
                                    style: CustomTextStyle.popinstext,
                                  ):
                                  Text(
                                    "+ ₹" +
                                        (0)
                                            .toInt().toString(),
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
                                    "Max discount",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                Spacer(),
                                  GetBuilder<CouponsController>(
                                      init: couponsController,
                                      // initState: (_) {},
                                      builder: (_) {

                                        return Text(
                                        "- ₹${(couponsController.maxAmount ?? 0.0).toString()}",
                                          style: CustomTextStyle.popinstext,
                                        );
                                      }),
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

                     (couponsController.maxAmount == null || couponsController.maxAmount == "0.0" || couponsController.maxAmount == "0")?

                              Row(
                                children: [
                                  Text(
                                    "Rounding Adjust",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                 Spacer(),

                                GetBuilder<CouponsController>(
                                      init: couponsController,
                                      // initState: (_) {},
                                      builder: (_) {

                                      return


                                        ((((widget.data!.price!))) <   addtocartController.deliverycharges)?
                                  Text(
                                    "₹${(double.parse((widget.data!.price!).toString())+(addtocartController.deliveryprice)  .toDouble()).toInt().toString()}",
                                     style: CustomTextStyle.popinstext,
                                  ):Text(
                                    "₹${(double.parse((widget.data!.price!).toString())  .toDouble()).toInt().toString()}",
                                     style: CustomTextStyle.popinstext,
                                  );
                                    }
                                  ),





                                ],
                              )

                       :    Row(
                                children: [
                                  Text(
                                    "Rounding Adjust",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                 Spacer(),

                                GetBuilder<CouponsController>(
                                      init: couponsController,
                                      // initState: (_) {},
                                      builder: (_) {

                                      return


                                      (((widget.data!.price!)-num.parse(couponsController.maxAmount??"0.0")) <   addtocartController.deliverycharges)?
                                  Text(
                                    "₹${(double.parse(widget.data!.price!.toString())+(addtocartController.deliveryprice)  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                   style: CustomTextStyle.popinstext,
                                  ):Text(
                                    "₹${(double.parse(widget.data!.price!.toString())  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                   style: CustomTextStyle.popinstext,
                                  );

                                    }
                                  ),





                                ],
                              ),


                            ]),
                          ),
                        ),
                      ),
                    ),
                //   },
                // ),

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
                  // height:  MediaQuery.of(context).size.height*0.15,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  child: GetBuilder<MyCartController>(
                                      init: addtocartController,
                                      builder: (_) {
                                        return addtocartController
                                                        .allAddresslistModel ==
                                                    null ||
                                                addtocartController
                                                        .allAddresslistModel!
                                                        .data ==
                                                    null ||
                                                addtocartController
                                                    .allAddresslistModel!
                                                    .data!
                                                    .isEmpty
                                            ? SizedBox()
                                            : Text(
                                                (addtocartController
                                                            .allAddresslistModel!
                                                            .data![addtocartController
                                                                    .isselected ??
                                                                0]
                                                            .area ??
                                                        "")
                                                    .toString(),
                                                style:
                                                    CustomTextStyle.popinstext);
                                      })),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await addtocartController.alladdressinit();

                              showModalBottomSheet(
                                context: context,
                                 isScrollControlled: true,
  isDismissible: true,
  shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(16))),
  builder: (context) =>
  // DraggableScrollableSheet(
  //   initialChildSize: 0.4,
  //   minChildSize: 0.2,
  //   maxChildSize: 0.75,
  //   expand: true,
  //                            builder: (_, controller) =>
                              ListView(
                                shrinkWrap: true,
                                primary: false,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        // padding: EdgeInsets.only(
                                        //   bottom: MediaQuery.of(context)
                                        //       .viewInsets
                                        //       .bottom,
                                        // ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.cancel),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              GetBuilder<MyCartController>(
                                                  init: addtocartController,
                                                  builder: (_) {
                                                    return ListView.builder(
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      itemCount: addtocartController
                                                          .allAddresslistModel!
                                                          .data!
                                                          .length??0,
                                                      itemBuilder: (context, index) {
                                                        var item = addtocartController
                                                            .allAddresslistModel!
                                                            .data![index];

                                                        return ( addtocartController
                                                                    .allAddresslistModel!
                                                                    .data ==
                                                                null)
                                                            ? SizedBox()
                                                            : InkWell(
                                                                onTap: () {
                                                                  addtocartController
                                                                      .selectaddadress(
                                                                          item.id ??
                                                                              0);

                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                          10),
                                                                  child: Container(
                                                                      margin: EdgeInsets
                                                                          .symmetric(
                                                                              vertical:
                                                                                  10),
                                                                      // height: MediaQuery.of(context).size.height*0.2,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
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
                                                                                    onTap: () async {
                                                                                      addressController.addadressID(item.id ?? 0);
                                                                                      addressController.updateaddress(item.id, item.firstName, item.lastName, item.mobile, item.pincode, item.area, item.houseNo, item.landmark);
                                                                                      print("${item.lastName}");
                                                                                      Get.to(UserAddress(
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
                                                                                  SizedBox(width: 5),
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      await addtocartController.addressdeleteinit();
                                                                                      //  addressController.removeaddress(index);
                                                                                      addtocartController.alladdressinit();
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
                                                                                  SizedBox(width: 5),
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      addtocartController.chooseaddressID(item.id??0);
                                                                                      addtocartController.chooseaddress(index);
                                                                                      Get.back();

                                                                                       final storage = GetStorage();

                                    // }
                                               storage.write('useraddress',item.area);
                                                  storage.write('useraddresscity',item.city);
                                      print("Useraddress");
                                     print(storage.read('useraddress').toString());
                                      print(storage.read('useraddresscity').toString());
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

                                            ],
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                                // ),
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
                    Get.to(UserAddress(
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


                             (couponsController.maxAmount == null || couponsController.maxAmount == "0.0" || couponsController.maxAmount == "0")?

                                     GetBuilder<CouponsController>(
                                      init: couponsController,

                                      builder: (_) {

                                      return

                                       (((widget.data!.price!)) <   addtocartController.deliverycharges)?
                                  Text(
                                    "₹${(double.parse(widget.data!.price!.toString())+(addtocartController.deliveryprice) ).toInt().toString()}",
                                   style: CustomTextStyle.popinstext,
                                  ):Text(
                                    "₹${(double.parse(widget.data!.price!.toString()) ).toInt().toString()}",
                                    style: CustomTextStyle.popinstext,
                                  );

                                    }
                                  ):


                                  GetBuilder<CouponsController>(
                                      init: couponsController,
                                      builder: (_) {

                                      return
                                        (((widget.data!.price!)-num.parse(couponsController.maxAmount??"0.0")) <   addtocartController.deliverycharges)?
                                      Text(
                                        "₹${(double.parse(widget.data!.price!.toString())+(addtocartController.deliveryprice)  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                        style: CustomTextStyle.popinstext,
                                      ):Text(
                                        "₹${(double.parse(widget.data!.price!.toString())  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                        style: CustomTextStyle.popinstext,
                                      );

                                    }
                                  )





                          ],
                        ),
                        InkWell(
                          onTap: () {

addtocartController.totalbuyNowPrice(
   (widget.data!.price??0).toDouble()
);
                            addtocartController.adddata(widget.data!.id??0,widget.data!.quantity??0, widget.data!.itemName??'',
                              0,
                         widget.data!.price!,2,widget.storeid
                                ,"yes"

                            );





    final storage = GetStorage();

                            storage.write(
                                'usercoupondis', couponsController.maxAmount);
                            print("couponstore");
                            print(storage.read('usercoupondis'));


storage.write('store_id', widget.storeid??0);



if (addtocartController.isselected != null &&
                                addtocartController.allAddresslistModel !=
                                    null &&
                                addtocartController.allAddresslistModel!.data !=
                                    null &&
                                addtocartController
                                    .allAddresslistModel!.data!.isNotEmpty) {
                              if (widget.data!.itemName!.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please add any items",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              }
                              else {
                                // Proceed to the payment screen

                                Get.to(
                                  PaymentUser(
                                    price: ((widget.data!.price! + addtocartController.deliveryprice) -
                                        (double.parse(couponsController.maxAmount ?? "0.0")).toDouble()),
                                    screenName: 'BuyNowAddToCardUser',
                                  ),
                                );
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
