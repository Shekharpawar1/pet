import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/user_controller/coupons_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class SalescouponPage extends StatefulWidget {
  const SalescouponPage({super.key,required this.price});
  final double price;

  @override
  State<SalescouponPage> createState() => _SalescouponPageState();
}

class _SalescouponPageState extends State<SalescouponPage> {
  CouponsController couponsController = Get.put(CouponsController());
  ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
 print(widget.price);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: MyColors.black)),
          ),
          title: Center(
              child: Text(
            "Coupons",
            style: CustomTextStyle.appbartext,
          )),
          actions: [
            InkWell(
                onTap: () {
                  Get.to(const NotificationUser());
                },
                child: SvgPicture.asset("assets/image/notification.svg")),
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/image/bag.svg"),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          primary: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.blue123,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 0.0),
                      color: Color.fromRGBO(255, 255, 255, 0.10),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your coupon';
                          }
                          return null;
                        },
                        controller: couponsController.couponTextController,
                        decoration: InputDecoration(
                          hintText: "Type coupon code here",
                          hintStyle: TextStyle(
                            color: MyColors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle coupon application here
                      },
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<CouponsController>(
                init: couponsController,
                builder: (_) {
                  return ListView.builder(
                      primary: false,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: couponsController.couponmodel!.data!.length,
                      itemBuilder: (context, index) {
                        //  final isSelected = subcategorycontroller.selectedIndex == index;

                        var item = couponsController.couponmodel!.data![index];
                        final DateFormat format = DateFormat(
                            "yyyy-MM-dd"); // Adjust the format as needed
                        final DateTime itemExpireDate =
                            format.parse(item.expireDate!);

                        final isExpired =
                            DateTime.now().isAfter(itemExpireDate);
                        // final isExpired = item.expireDate != null && DateTime.now().isAfter(item.expireDate!);

                        //  final isExpired = DateTime.now().isAfter(item.expireDate!);
                        //  final isExpired = couponsController.couponmodel!.data![index].expireDate.isBefore(DateTime.now());
                        return (couponsController.couponmodel == null ||
                                couponsController.couponmodel!.data == null)
                            ? SizedBox()
                            : Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: isExpired
                                          ? MyColors.grey
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.title.toString(),
                                              style:
                                                  CustomTextStyle.popinsmedium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Coupon Code: ' +
                                                        item.code.toString(),
                                                    style: CustomTextStyle
                                                        .popinsmedium),
                                                Text(
                                                  "Max discount: ₹" +
                                                      item.maxDiscount
                                                          .toString(),
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                                Text(
                                                  "Minimum purchase: ₹" +
                                                      item.minPurchase
                                                          .toString(),
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                                Text(
                                                  "Coupon type: " +
                                                      item.couponType
                                                          .toString(),
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                              ],
                                            ),
                                            isExpired
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      couponsController
                                                          .updatecode(
                                                              item.code ?? '',
                                                              item.title ?? '',
                                                              item.minPurchase ??
                                                                  '',
                                                              item.maxDiscount ??
                                                                  '');
                                                    },
                                                    child: Text(
                                                      'Expired',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.white,
                                                      onPrimary: MyColors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ) :
                                              (widget.price> double.parse(item.minPurchase!)) ?
                                                ElevatedButton(
                                                    onPressed: () {
                                                      couponsController
                                                          .updatecode(
                                                              item.code ?? '',
                                                              item.title ?? '',
                                                              item.minPurchase ??
                                                                  '',
                                                              item.maxDiscount??''
                                                                  );
                                                                  
                                                                  Get.back();
                                                    },
                                                    child: Text(
                                                      'TAP TO APPLY',
                                                      style: TextStyle(
                                                        fontSize: 10
                                                        ,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.white,
                                                      onPrimary: MyColors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ):ElevatedButton(
                                                    onPressed: () {
                                                     
                                                      // couponsController.updatecode(item.code??'',item.title??'',item.minPurchase??'',item.maxDiscount??'');
                                                    },
                                                    child: Text(
                                                      "You can't apply",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.white,
                                                      onPrimary: MyColors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  )
                                                  //  : ElevatedButton(
                                                  //   onPressed: () {
                                                  //     couponsController
                                                  //         .updatecode(
                                                  //             item.code ?? '',
                                                  //             item.title ?? '',
                                                  //             item.minPurchase ??
                                                  //                 '',
                                                  //             item.maxDiscount??''
                                                  //                 );
                                                                  
                                                  //                 Get.back(
                                                                    
                                                  //                 );
                                                  //   },
                                                  //   child: Text(
                                                  //     'TAP TO APPLY',
                                                  //     style: TextStyle(
                                                  //       fontSize: 14,
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //     ),
                                                  //   ),
                                                  //   style: ElevatedButton
                                                  //       .styleFrom(
                                                  //     primary: Colors.white,
                                                  //     onPrimary: MyColors.black,
                                                  //     shape:
                                                  //         RoundedRectangleBorder(
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(8),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                          
                                          
                                          ],
                                        ),
                                        Text(
                                          "StartDate :${item.startDate.toString()}",
                                          style: CustomTextStyle.popinsmedium,
                                        ),
                                        Text(
                                          "Expire Date :${item.expireDate.toString()}",
                                          style: CustomTextStyle.popinsmedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                      });
                })
          ],
        ));
  }
}
