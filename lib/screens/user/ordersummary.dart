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
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/partner/partneraddress.dart';
import 'package:pet/models/usersModel/mycartListModel.dart' as MyOrder;
import 'package:pet/screens/swepcard.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:pet/screens/user/useraddnewAddress.dart';
import 'package:pet/screens/user/usercouponPage.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class AddToCardUser extends StatefulWidget {
  AddToCardUser({
    super.key,
    
  });

  @override
  State<AddToCardUser> createState() => _AddToCardUserState();
}

class _AddToCardUserState extends State<AddToCardUser> {
  AddressController addressController = Get.put(AddressController());
  MyCartController addtocartController = Get.put(MyCartController());
  CouponsController couponsController = Get.put(CouponsController());

  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  @override
  void onInit() {
    addtocartController.updateTotal();
    addtocartController.init();
   
    
  }

  @override
  Widget build(BuildContext context) {
  
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                GetBuilder<MyCartController>(
                  init: addtocartController,
                  builder: (_) {
                    return addtocartController.mycartmodel == null
                        ? const SizedBox()
                        : addtocartController.cartlistLoaded == false
                            ? const SizedBox()
                           
                            : addtocartController.mycartmodel!.data!.isEmpty
                                ? Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // Get.to(HomeUser());
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text('Continue Shopping')),
                                  )
                                : Container(

                                    child: ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: addtocartController
                                          .mycartmodel!.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = addtocartController
                                            .mycartmodel!.data![index];
                                        // print(item.name!);
                                        // ${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}
                                        String imagePath =
                                            "${Constants.PRODUCT_HOME_IMAGE_PATH}/${item.image ?? ""}";
                                        // var imagePath = "${item.image ?? ""}";
                                        print(imagePath);

                                        //  addtocartController.sizes = addtocartController.mycartmodel!.data!.map((e) => 1).toList();
                                        return (addtocartController
                                                    .mycartmodel!.data ==
                                                null)
                                            ? const SizedBox()
                                            : Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          // Icon(Icons.edit_outlined),
                                                          // SizedBox(
                                                          //   width: 10,
                                                          // ),
                                                          InkWell(
                                                              onTap: () async {
                                                                //  items.removeAt(index);
                                                                addtocartController
                                                                    .additem(
                                                                        item.id ??
                                                                            0);
                                                                print(
                                                                    "Item${item.id}");
                                                                await addtocartController
                                                                    .initdelete();
                                                                addtocartController
                                                                    .updateTotal();

                                                                addtocartController
                                                                    .init();
                                                              },
                                                              child: const Icon(
                                                                  Icons
                                                                      .delete_outline)),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child:
                                                            
                                                              CachedNetworkImage(
                                                            imageUrl: imagePath,
                                                            width: 65,
                                                            height: 95,
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ), // Replace with your own placeholder widget
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
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
                                                                (item.variant ??
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
                                                                      ((item.price! *
                                                                              (item.quantity!.toInt())))
                                                                          .toInt().toString(),
                                                                 
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
                                                                      onTap:
                                                                          () {
                                                                        addtocartController
                                                                            .decrementSize(index);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            color: MyColors.yellow,
                                                                            borderRadius: BorderRadius.circular(10)),
                                                                        child: const Icon(
                                                                            Icons
                                                                                .remove,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.black),
                                                                        
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 3,
                                                                    ),
                                                                    GetBuilder<
                                                                            MyCartController>(
                                                                        init:
                                                                            addtocartController,
                                                                        builder:
                                                                            (_) {
                                                                          return Container(
                                                                              width: 30,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(50),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                addtocartController.sizes[index].toString(),
                                                                                style: const TextStyle(fontWeight: FontWeight.w500),
                                                                              )));
                                                                        }),
                                                                    const SizedBox(
                                                                      width: 3,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        addtocartController
                                                                            .incrementSize(index);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        decoration: BoxDecoration(
                                                                            //shape: BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            color: MyColors.yellow),
                                                                        child: const Icon(
                                                                            Icons
                                                                                .add,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                      },
                                    ),
                                  );
                  },
                ),

             

                GestureDetector(
                  onTap: () async {
                    await couponsController.init();
                    Get.to(UsercouponPage(
                      price: (addtocartController.total)
                      
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
                                    }),
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

                const SizedBox(
                  height: 20,
                ),
                GetBuilder<MyCartController>(
                  init: addtocartController,
                  builder: (_) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.white),
                      child: DottedBorder(
                        color: Colors.black26,
                        borderType: BorderType.Rect,
                        radius: const Radius.circular(25),
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
                                 
                                  const Spacer(),
                                  (addtocartController.total == 1)
                                      ? Text(
                                          "₹" +
                                              addtocartController.price!
                                                  .toString(),
                                          style: CustomTextStyle.popinstext,
                                        )
                                      : Text(
                                          "₹" +
                                              (addtocartController.total)
                                                 .toInt()  .toString(),
                                          style: CustomTextStyle.popinstext,
                                        ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              const Divider(
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
                                  (((addtocartController.total)) <   addtocartController.deliverycharges)?
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
                                  (((addtocartController.total)-num.parse(couponsController.maxAmount??"")) <   addtocartController.deliverycharges)?
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
                              const Divider(
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
                                  const Spacer(),
                                  GetBuilder<CouponsController>(
                                      init: couponsController,
                                      // initState: (_) {},
                                      builder: (_) {
                                        return Text(
                                          "- ₹${((couponsController.maxAmount ?? 0.0)).toString()}",
                                          style: CustomTextStyle.popinstext,
                                        );
                                      }),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              const Divider(
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
                                  const Spacer(),


                                  (((addtocartController.total)) <   addtocartController.deliverycharges)?
                                  Text(
                                    "₹${(double.parse(addtocartController.total.toString())+(addtocartController.deliveryprice)  .toDouble()).toInt().toString()}",
                                    style: CustomTextStyle.popinstext,
                                  ):Text(
                                    "₹${(double.parse(addtocartController.total.toString())  .toDouble()).toInt().toString()}",
                                    style: CustomTextStyle.popinstext,
                                  ),
                                ],
                              )
                          : Row(
                                children: [
                                  Text(
                                    "Rounding Adjust",
                                    style: CustomTextStyle.popinslight,
                                  ),
                                  const Spacer(),


                                  (((addtocartController.total)-num.parse(couponsController.maxAmount??"0.0")) <   addtocartController.deliverycharges)?
                                  Text(
                                    "₹${(double.parse(addtocartController.total.toString())+(addtocartController.deliveryprice)  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                    // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                    style: CustomTextStyle.popinstext,
                                  ):Text(
                                    "₹${(double.parse(addtocartController.total.toString())  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                    // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                    style: CustomTextStyle.popinstext,
                                  ),
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
                                            ? const SizedBox()
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
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16))),
                                builder: (context) =>
                                  
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
                                      
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
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
                                                  icon:
                                                      const Icon(Icons.cancel),
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
                                                    itemCount:
                                                        addtocartController
                                                            .allAddresslistModel!
                                                            .data!
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var item =
                                                          addtocartController
                                                              .allAddresslistModel!
                                                              .data![index];

                                                      return (addtocartController
                                                                  .allAddresslistModel!
                                                                  .data ==
                                                              null)
                                                          ? const SizedBox()
                                                          : InkWell(
                                                              onTap: () {
                                                                addtocartController
                                                                    .selectaddadress(
                                                                        item.id ??
                                                                            0);
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child:
                                                                    Container(
                                                                        margin: const EdgeInsets.symmetric(
                                                                            vertical:
                                                                                10),
                                                                        // height: MediaQuery.of(context).size.height*0.2,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                            border: Border.all(color: MyColors.grey)),
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(10.0),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                item!.firstName.toString(),
                                                                                style: CustomTextStyle.popinstext,
                                                                              ),
                                                                              Text(
                                                                                item!.lastName.toString(),
                                                                                style: CustomTextStyle.popinssmallnormal,
                                                                              ),
                                                                              Text(
                                                                                "${item.houseNo.toString()} ${item.area.toString()}",
                                                                                style: CustomTextStyle.popinssmallnormal,
                                                                              ),
                                                                              Text(
                                                                                "${item.landmark.toString()} ${item.state.toString()} ${item.city.toString()}",
                                                                                style: CustomTextStyle.popinssmallnormal,
                                                                              ),
                                                                              Text(
                                                                                "Mobile No: ${item.mobile.toString()}",
                                                                                style: CustomTextStyle.popinssmallnormal,
                                                                              ),
                                                                              const SizedBox(height: 10),
                                                                              Row(children: [
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
                                                                                const SizedBox(width: 5),
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    print("deleteee");
                                                                                     addtocartController
                                                                    .selectaddadress(
                                                                        item.id ??
                                                                            0);
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
                                                                                const SizedBox(width: 5),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    addtocartController.chooseaddressID(item.id ?? 0);
                                                                                    addtocartController.chooseaddress(index);
                                                                                    Get.back();

                                                                                    final storage = GetStorage();

                                                                                    // }
                                                                                    storage.write('useraddress', item.area);
                                                                                    storage.write('useraddresscity', item.city);
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
                                            const SizedBox(
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
                      const Icon(Icons.add, size: 15, color: MyColors.yellow),
                      Text("Add new address",
                          style: CustomTextStyle.yellowtextnormal),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
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


                               
                       GetBuilder<MyCartController>(
                  init: addtocartController,
                  builder: (_) {
                            return Column(
                              children: [
                                (couponsController.maxAmount == null || couponsController.maxAmount == "0.0" || couponsController.maxAmount == "0")?
                                       GetBuilder<CouponsController>(
                                              init: couponsController,
                                              builder: (_) {
                                          return Row(
                                            children: [
                                              

                                              (((addtocartController.total)) <   addtocartController.deliverycharges)?
                                              Text(
                                                "₹${(double.parse(addtocartController.total.toString())+(addtocartController.deliveryprice)  .toDouble()).toInt().toString()}",
                                                style: CustomTextStyle.popinstext,
                                              ):Text(
                                                "₹${(double.parse(addtocartController.total.toString())  .toDouble()).toInt().toString()}",
                                                 style: CustomTextStyle.popinstext,
                                              ),
                                            ],
                                          );
                                        }
                                      )
                                  :   GetBuilder<CouponsController>(
                                              init: couponsController,
                                              builder: (_) {
                                      return Row(
                                            children: [
                                              


                                              (((addtocartController.total)-num.parse(couponsController.maxAmount??"0.0")) <   addtocartController.deliverycharges)?
                                              Text(
                                                "₹${(double.parse(addtocartController.total.toString())+(addtocartController.deliveryprice)  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                                // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                                style: CustomTextStyle.popinstext,
                                              ):Text(
                                                "₹${(double.parse(addtocartController.total.toString())  - (double.parse(couponsController.maxAmount ?? "0.0").toInt()).toDouble()).toInt().toString()}",
                                                // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                                style: CustomTextStyle.popinstext,
                                              ),
                                            ],
                                          );
                                    }
                                  ),
                              ],
                            );
                          }
                        ),
                          
                          ],
                        ),
                        InkWell(
                          onTap: () {
                          
                            final storage = GetStorage();

                            storage.write(
                                'usercoupondis', couponsController.maxAmount);
                            print("couponstore");
                            print(storage.read('usercoupondis'));

                            

                            if (addtocartController.isselected != null &&
                                addtocartController.allAddresslistModel !=
                                    null &&
                                addtocartController.allAddresslistModel!.data !=
                                    null &&
                                addtocartController
                                    .allAddresslistModel!.data!.isNotEmpty) {
                              if (addtocartController
                                  .mycartmodel!.data!.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please add any items",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                // Proceed to the payment screen
                                Get.to(PaymentUser(
                                  price: (addtocartController.total + addtocartController.deliveryprice
                                           -
                                          double.parse(
                                              couponsController.maxAmount ??
                                                  "0"))
                                      .toDouble(), screenName: 'AddToCardUser',
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
