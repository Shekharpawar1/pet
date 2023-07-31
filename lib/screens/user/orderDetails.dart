import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class OrderDetailsUser extends StatefulWidget {
  const OrderDetailsUser({super.key});

  @override
  State<OrderDetailsUser> createState() => _OrderDetailsUserState();
}

class _OrderDetailsUserState extends State<OrderDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left, color: MyColors.black)),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
              child: Text(
            "Order Details",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
          actions: [
            //  SvgPicture.asset("assets/image/girl.svg"),

            // SizedBox(width: 20),
            InkWell(
                onTap: () {
                  Get.to(NotificationWhole());
                },
                child: SvgPicture.asset("assets/image/notification.svg")),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/image/fooddog.png",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mars Petcare Inc",
                          style: CustomTextStyle.popinsmedium,
                        ),
                        Text("with paneer or cottage cheese",
                            style: CustomTextStyle.popinssmall0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ 620.00",
                              style: CustomTextStyle.popinsmedium,
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/image/fooddog.png",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mars Petcare Inc",
                          style: CustomTextStyle.popinsmedium,
                        ),
                        Text("with paneer or cottage cheese",
                            style: CustomTextStyle.popinssmall0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ 620.00",
                              style: CustomTextStyle.popinsmedium,
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: CustomTextStyle.popinssmall014,
                    ),
                    Text(
                      "\$50",
                      style: CustomTextStyle.popinssmall014,
                    ),
                  ],
                ),
                Divider(
                  indent: 1,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Moving Cart",
                          style: CustomTextStyle.popinssmall014,
                        ),
                        Text(
                          "Additional Services",
                          style: CustomTextStyle.popinssmallnormal,
                        ),
                      ],
                    ),
                    Text(
                      "\$20",
                      style: CustomTextStyle.popinssmall014,
                    ),
                  ],
                ),
                Divider(
                  indent: 1,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount",
                          style: CustomTextStyle.popinssmall014,
                        ),
                        Text(
                          "Promo Code: 554dffd",
                          style: CustomTextStyle.popinssmallnormal,
                        ),
                      ],
                    ),
                    Text(
                      "-\$20",
                      style: CustomTextStyle.popinssmall014,
                    ),
                  ],
                ),
                Divider(
                  indent: 1,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: CustomTextStyle.popinssmall014,
                    ),
                    Text(
                      "\$138.00",
                      style: CustomTextStyle.popinssmall014,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  "Order Details",
                  style: CustomTextStyle.popinssmall014,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  "Order Number",
                  style: CustomTextStyle.popinsboldlight,
                ),
                Text(
                  "4797290627",
                  style: CustomTextStyle.popinsboldlightsmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Payment",
                  style: CustomTextStyle.popinsboldlight,
                ),
                Text(
                  "Paid: Using Upi",
                  style: CustomTextStyle.popinsboldlightsmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Date",
                  style: CustomTextStyle.popinsboldlight,
                ),
                Text(
                  "10 Feb 2023  10:20 AM",
                  style: CustomTextStyle.popinsboldlightsmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Phone Number",
                  style: CustomTextStyle.popinsboldlight,
                ),
                Text(
                  "10 Feb 2023  10:20 AM",
                  style: CustomTextStyle.popinsboldlightsmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Deliver To",
                  style: CustomTextStyle.popinsboldlight,
                ),
                Text(
                  "10 Feb 2023  10:20 AM",
                  style: CustomTextStyle.popinsboldlightsmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InkWell(
                  onTap: () {
                    // Get.to(MyPetDetails());
                    Get.to(LocationPickerMapWholeSaler());
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width*0.8,

                      height: MediaQuery.of(context).size.height * 0.08,

                      decoration: BoxDecoration(
                          color: MyColors.yellow,
                          borderRadius: BorderRadius.circular(25)),

                      child: Center(
                          child: Text(
                        "Track order",
                        style: CustomTextStyle.mediumtextreem,
                      )),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        ));
  }
}
