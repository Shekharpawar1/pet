import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/screens/skip/skipusercontroller.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/utils/constants.dart';

import '../../utils/colors.dart';
import '../../utils/fontstyle.dart';

class SkipCartScreen extends StatelessWidget {
  final controller = Get.put(SkipUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SkipUserController>(builder: (c) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListView.builder(
                    primary: false,
                    //scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.cartlist.length,
                    itemBuilder: (context, index) {
                      var item = controller.cartlist[index];
                      // print(item.name!);
                      // ${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}
                      String imagePath =
                          "${Constants.PRODUCT_HOME_IMAGE_PATH}/${item['image']}";
                      // var imagePath = "${item.image ?? ""}";
                      print(imagePath);

                      //  addtocartController.sizes = addtocartController.mycartmodel!.data!.map((e) => 1).toList();
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyColors.boxbgcolor),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Icon(Icons.edit_outlined),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  InkWell(
                                      onTap: () async {
                                        controller.cartlist.removeAt(index);
                                        GetStorage().write(
                                            "cartlist", controller.cartlist);
                                        controller.update();
                                        //  items.removeAt(index);
                                        // addtocartController
                                        //     .additem(item.id ?? 0);
                                        // print("Item${item.id}");
                                        // await addtocartController.initdelete();
                                        // addtocartController.updateTotal();

                                        // addtocartController.init();
                                      },
                                      child: const Icon(Icons.delete_outline)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child:
                                      //   Image.asset(
                                      //   "assets/image/fooddog.png",
                                      // ),
                                      CachedNetworkImage(
                                    imageUrl: imagePath,
                                    width: 65,
                                    height: 95,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ), // Replace with your own placeholder widget
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons
                                            .error), // Replace with your own error widget
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (item["item_name"] ?? '').toString(),
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                    Text((item["variant"] ?? '').toString(),
                                        style: CustomTextStyle.popinssmall0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // (productdeatilscontroller.sizecount == productdeatilscontroller.sizecount )?
                                        Text(
                                          "₹" + ((item["price"])).toString(),
                                          // "₹${item.price}",
                                          // "₹"+(addtocartController.total).toString(),
                                          style: CustomTextStyle.popinsmedium,
                                        ),
                                        // :
                                        // Text(
                                        // // item.price.toString(),
                                        //   // "₹${item.price}",
                                        //   "₹"+(addtocartController.total).toString(),
                                        //   style: CustomTextStyle
                                        //       .popinsmedium,
                                        // ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.decrementSize(index);
                                              },
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    color: MyColors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Icon(Icons.remove,
                                                    size: 15,
                                                    color: Colors.black),
                                                //  Icon(
                                                //   Icons.minimize,
                                                //   size: 8,
                                                //   color: Colors.white,
                                                // ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                                width: 30,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  item['quantity'].toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.incrementSize(index);
                                              },
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    //shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: MyColors.yellow),
                                                child: const Icon(Icons.add,
                                                    size: 15,
                                                    color: Colors.black),
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
                  
                  
                  
                  
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // await couponsController.init();
                      // Get.to(UsercouponPage(
                      //   price: (addtocartController.total) +
                      //       (addtocartController.total * 0.05),
                      // ));
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
                                  Text(
                                    "",
                                    style: CustomTextStyle.popinslight,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: MyColors.white),
                    child: DottedBorder(
                      color: Colors.black26,
                      borderType: BorderType.Rect,
                      radius: const Radius.circular(25),
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
                                // SizedBox(
                                //   width:
                                //       MediaQuery.of(context).size.width * 0.2,
                                // ),
                                const Spacer(),
                                Text(
                                  "₹" + controller.subtotal,
                                  style: CustomTextStyle.popinstext,
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            const Divider(
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
                                  "Tax(5%)",
                                  style: CustomTextStyle.popinslight,
                                ),
                                const Spacer(),
                                Text(
                                  "+ ₹" + controller.tax,
                                  style: CustomTextStyle.popinstext,
                                ),
                              ],
                            ),
                            const Divider(
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
                                  "Max discount",
                                  style: CustomTextStyle.popinslight,
                                ),
                                const Spacer(),
                                Text(
                                  "- ₹ 0",
                                  style: CustomTextStyle.popinstext,
                                ),
                              ],
                            ),
                            const Divider(
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
                                const Spacer(),
                                Text(
                                  "₹ ${controller.total}",
                                  // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                  style: CustomTextStyle.popinstext,
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.48,
                                    child: Text("",
                                        style: CustomTextStyle.popinstext)),
                              ],
                            ),
                            InkWell(
                              onTap: () async {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
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
                    onTap: () async {},
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
                              Text("₹${controller.total}",
                                  style: CustomTextStyle.appbartext)
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: "Alert",
                                  content: Column(
                                    children: [
                                      Text("You need to login first"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        color: MyColors.yellow,
                                        minWidth: 100,
                                        onPressed: () {
                                          
                                          Get.offAll(() => LoginUser());
                                        },
                                        child: Text("Login"),
                                      )
                                    ],
                                  ));
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
          );
        }),
      ),
    );
  }
}
