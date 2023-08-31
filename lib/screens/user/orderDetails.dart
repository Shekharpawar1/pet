import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/orderdetails_controller.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/order_tracker_controller.dart';
import 'package:pet/screens/user/locationScreenUser.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

import 'package:open_file/open_file.dart';

import 'dart:io' as io;
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:url_launcher/url_launcher.dart';

class OrderDetailsUser extends StatefulWidget {
   OrderDetailsUser({super.key, this.orderId, this.couponcode, this.paymentmethod,this.orderstatus});
  int? orderId;
  String? couponcode;
  String? paymentmethod;
  String? orderstatus;

  @override
  State<OrderDetailsUser> createState() => _OrderDetailsUserState();
}

class _OrderDetailsUserState extends State<OrderDetailsUser> {
  MyOrderController myordercontroller = Get.put(MyOrderController());
  OrderDetailsController orderdetailscontroller =
      Get.put(OrderDetailsController());

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
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ('5').toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ('5').toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: GetBuilder<MyOrderController>(
              init: myordercontroller,
              builder: (_) {
                return myordercontroller.orderdetailsModel!.data == null
                    ? SizedBox()
                    : ListView(
                        shrinkWrap: false,
                        primary: true,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: myordercontroller
                                  .orderdetailsModel!.data!.length,
                              itemBuilder: (context, index) {
                                var item = myordercontroller
                                    .orderdetailsModel!.data![index];
                                String imagePath =
                                    Constants.PRODUCT_HOME_IMAGE_PATH +
                                        "/${item.itemDetails![0].image ?? ''}";

                                print("====>>>>imagepath ${imagePath}");
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.grey, width: 0.5),
                                      borderRadius: BorderRadius.circular(25),
                                      color: MyColors.white),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath, fit: BoxFit.cover,
                                        // width: 61,
                                        // height: 75,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.variant ?? '',
                                          style: CustomTextStyle.popinsmedium,
                                        ),
                                        Text(item.discountType ?? '',
                                            style:
                                                CustomTextStyle.popinssmall0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.totalAddOnPrice ?? '',
                                              style:
                                                  CustomTextStyle.popinsmedium,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ]),
                                );
                              }),

                          //  Container(
                          //    height: MediaQuery.of(context).size.height * 0.18,
                          //    width: MediaQuery.of(context).size.width,
                          //    decoration: BoxDecoration(
                          //        border: Border.all(color: MyColors.grey, width: 0.5),
                          //        borderRadius: BorderRadius.circular(25),
                          //        color: MyColors.white),
                          //    child: Row(children: [
                          //      Padding(
                          //        padding: const EdgeInsets.all(15.0),
                          //        child: Image.asset(
                          //          "assets/image/fooddog.png",
                          //        ),
                          //      ),
                          //      Column(
                          //        crossAxisAlignment: CrossAxisAlignment.start,
                          //        mainAxisAlignment: MainAxisAlignment.center,
                          //        children: [
                          //          Text(
                          //            "Mars Petcare Inc",
                          //            style: CustomTextStyle.popinsmedium,
                          //          ),
                          //          Text("with paneer or cottage cheese",
                          //              style: CustomTextStyle.popinssmall0),
                          //          Row(
                          //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //            children: [
                          //              Text(
                          //                "₹ 620.00",
                          //                style: CustomTextStyle.popinsmedium,
                          //              ),
                          //            ],
                          //          )
                          //        ],
                          //      )
                          //    ]),
                          //  ),
                          //  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: CustomTextStyle.popinssmall014,
                              ),
                              Text(
                                orderdetailscontroller
                                    .getorderdetailsList["subtotal"],
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
                                    orderdetailscontroller
                                        .getorderdetailsList["services"],
                                    style: CustomTextStyle.popinssmallnormal,
                                  ),
                                ],
                              ),
                              Text(
                                orderdetailscontroller
                                    .getorderdetailsList["movingcart"],
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
                                    "Promo Code: " +
                                        widget.couponcode.toString(),
                                    style: CustomTextStyle.popinssmallnormal,
                                  ),
                                ],
                              ),
                              Text(
                                myordercontroller.orderdetailsModel!.data![0]
                                        .discountOnItem ??
                                    '',
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
                                orderdetailscontroller
                                    .getorderdetailsList["total"],
                                style: CustomTextStyle.popinssmall014,
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Text(
                            "Order Details",
                            style: CustomTextStyle.popinssmall014,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: MyColors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order Number",
                                    style: CustomTextStyle.popinsboldlight,
                                  ),
                                  Text(
                                    (myordercontroller.orderdetailsModel!
                                                .data![0].orderId ??
                                            0)
                                        .toString(),
                                    style: CustomTextStyle.popinsboldlightsmall,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(
                                    "Payment",
                                    style: CustomTextStyle.popinsboldlight,
                                  ),
                                  Text(
                                    "Paid:" + widget.paymentmethod.toString(),
                                    style: CustomTextStyle.popinsboldlightsmall,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(
                                    "Date",
                                    style: CustomTextStyle.popinsboldlight,
                                  ),
                                  Text(
                                    orderdetailscontroller
                                        .getorderdetailsList["date"],
                                    style: CustomTextStyle.popinsboldlightsmall,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(
                                    "Phone Number",
                                    style: CustomTextStyle.popinsboldlight,
                                  ),
                                  Text(
                                    orderdetailscontroller
                                        .getorderdetailsList["phonenumber"],
                                    style: CustomTextStyle.popinsboldlightsmall,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(
                                    "Deliver To",
                                    style: CustomTextStyle.popinsboldlight,
                                  ),
                                  Text(
                                    orderdetailscontroller
                                        .getorderdetailsList["deliverydate"],
                                    style: CustomTextStyle.popinsboldlightsmall,
                                  ),
                                  Divider(thickness: 1, color: MyColors.grey),
                                  GestureDetector(
                                    onTap: () => generateAndOpenPDF(context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "download invoice",
                                          style: CustomTextStyle.popinsboldlight,
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 15)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Text(
                            "Address",
                            style: CustomTextStyle.popinssmall014,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: MyColors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  orderdetailscontroller
                                      .getorderdetailsList["address"],
                                  style: CustomTextStyle.popinsboldlightsmall,
                                ),
                              )),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Text(
                            "shipping Address",
                            style: CustomTextStyle.popinssmall014,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: MyColors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  orderdetailscontroller
                                      .getorderdetailsList["shippingaddress"],
                                  style: CustomTextStyle.popinsboldlightsmall,
                       ),
                     )
                     ),
                   
                        
                           SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                           InkWell(
                             onTap: () {
                               // Get.to(MyPetDetails());
                          

                               Get.to(LocationPickerMapUser());
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
                       );
 
                            
 
  })
            
            
          ),
        );
  }
  
  // void generateAndSharePDF(BuildContext context) async {
  //   final pdf = pw.Document();
  //   // final image = await imageFromAssetBundle('assets/image.png');
  //   final dividerImageData = (await rootBundle.load("assets/image/divider.png"))
  //       .buffer
  //       .asUint8List();
  //   final dividerImage = pw.MemoryImage(
  //     dividerImageData,
  //   );
  //   final logoImageData =
  //       (await rootBundle.load("assets/image/logo.png")).buffer.asUint8List();
  //   final logoImage = pw.MemoryImage(
  //     logoImageData,
  //   );

  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Container(
  //         decoration: pw.BoxDecoration(
  //           borderRadius: pw.BorderRadius.circular(25),
  //           // color: Colors.white.withOpacity(0.38),
  //         ),
  //         child: pw.Padding(
  //           padding: const pw.EdgeInsets.all(15.0),
  //           child: pw.Column(
  //             children: [
  //               pw.Image(
  //                 logoImage,
  //                 height: 50,
  //               ),
  //               pw.SizedBox(
  //                 height: 30,
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.center,
  //                 children: [
  //                   pw.Text(
  //                     "Order Id: ",
  //                     style: pw.TextStyle(
  //                       // fontWeight: pw.FontWeight.w400,
  //                       fontSize: 20.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     widget.orderId,
  //                     style: pw.TextStyle(
  //                       // fontWeight: pw.FontWeight.w400,
  //                       fontSize: 20.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.center,
  //                 children: [
  //                   pw.Text(
  //                     "Invoice Id: ",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 20.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     widget.invoice,
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 20.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.Padding(
  //                 padding: pw.EdgeInsets.symmetric(vertical: 15.0),
  //                 child: pw.Image(dividerImage),
  //               ),
  //               pw.ListView(
  //                 // physics: NeverScrollableScrollPhysics(),
  //                 // shrinkWrap: true,
  //                 children: orderModel!.data!
  //                     .map((e) => pw.Container(
  //                           child: pw.Column(
  //                             children: [
  //                               pw.Row(
  //                                 mainAxisAlignment:
  //                                     pw.MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   pw.Text(
  //                                     "Product Name",
  //                                     style: pw.TextStyle(
  //                                       fontSize: 14,
  //                                       // fontWeight: pw.FontWeight.w400,
  //                                     ),
  //                                   ),
  //                                   pw.Text(
  //                                       e.productName!.length < 36
  //                                           ? e.productName!
  //                                           : "${e.productName!.substring(0, 35)}...",
  //                                       style: pw.TextStyle(
  //                                         fontSize: 14,
  //                                         // fontWeight: pw.FontWeight.w500,
  //                                       ))
  //                                 ],
  //                               ),
  //                               pw.Divider(),
  //                               pw.Row(
  //                                 mainAxisAlignment:
  //                                     pw.MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   pw.Text(
  //                                     "Variant",
  //                                     style: pw.TextStyle(
  //                                       fontSize: 14,
  //                                       // fontWeight: pw.FontWeight.w400,
  //                                     ),
  //                                   ),
  //                                   pw.Text(
  //                                       "${e.variation.toString().replaceAll('"', "")}",
  //                                       style: pw.TextStyle(
  //                                         fontSize: 14,
  //                                         // fontWeight: pw.FontWeight.w500,
  //                                       ))
  //                                 ],
  //                               ),
  //                               pw.Divider(),
  //                               pw.Row(
  //                                 mainAxisAlignment:
  //                                     pw.MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   pw.Text(
  //                                     "Quantity",
  //                                     style: pw.TextStyle(
  //                                       fontSize: 14,
  //                                       // fontWeight: pw.FontWeight.w400,
  //                                     ),
  //                                   ),
  //                                   pw.Text("${e.quantity.toString()} Pcs ",
  //                                       style: pw.TextStyle(
  //                                         fontSize: 14,
  //                                         // fontWeight: pw.FontWeight.w500,
  //                                       ))
  //                                 ],
  //                               ),
  //                               pw.Padding(
  //                                 padding:
  //                                     pw.EdgeInsets.symmetric(vertical: 15.0),
  //                                 child: pw.Image(dividerImage),
  //                               ),
  //                             ],
  //                           ),
  //                         ))
  //                     .toList(),
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     "Name: ",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     "$fname $lname",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     "Email: ",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     "$email",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     "Phone: ",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     "$number",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     "Address: ",
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     widget.address,
  //                     style: pw.TextStyle(
  //                       // color: white,
  //                       // fontWeight: FontWeight.w400,
  //                       fontSize: 14.0,
  //                       // fontFamily: "Alhadara-DEMO",
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );

  //   final pdfBytes = await pdf.save();
  //   final fileName = 'invoice.pdf';

  //   // Save the PDF file locally
  //   final file = await savePDFToDeviceLocal(fileName, pdfBytes);

  //   // Open the PDF file using the default PDF viewer
  //   // openPDF(file.path);
  //   // print("sharing....");
  //   Share.shareXFiles([XFile(file.path)], text: 'Share Invoice');

  //   final snack = SnackBar(content: Text("Please select an app."));
  //   ScaffoldMessenger.of(context).showSnackBar(snack);
  // }

  void generateAndOpenPDF(BuildContext context) async {
    final pdf = pw.Document();
    // final image = await imageFromAssetBundle('assets/image.png');
    final dividerImageData = (await rootBundle.load("assets/image/divider.png"))
        .buffer
        .asUint8List();
    final dividerImage = pw.MemoryImage(
      dividerImageData,
    );
    final logoImageData =
        (await rootBundle.load("assets/image/logo.png")).buffer.asUint8List();
    final logoImage = pw.MemoryImage(
      logoImageData,
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(25),
            // color: Colors.white.withOpacity(0.38),
          ),
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(15.0),
            child: pw.Column(
              children: [
                pw.Image(
                  logoImage,
                  height: 50,
                ),
                pw.SizedBox(
                  height: 30,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Order Id: ",
                      style: pw.TextStyle(
                        // fontWeight: pw.FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "widget.orderId",
                      style: pw.TextStyle(
                        // fontWeight: pw.FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Invoice Id: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "widget.invoice",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Date: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                 "DateFormat(dd MMM yyyy).format( DateTime.parse((widget.date.toString())))",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
              
             
                 
              
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 15.0),
                  child: pw.Image(dividerImage),
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Name: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "fname lname",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Email: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "email",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Phone: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "number",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Address: ",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                    pw.Text(
                      "widget.address",
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final pdfBytes = await pdf.save();
    final fileName = 'invoice.pdf';

    // Save the PDF file locally
    // final file = await savePDFToDevice(fileName, pdfBytes);   // inside app package
    final file = await savePDFToDeviceLocal(fileName, pdfBytes);   // inside internal storage downloads folder

    // Open the PDF file using the default PDF viewer
    // openPDF(file.path);

    final snack = SnackBar(content: Text("Ready To View."));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<io.File> savePDFToDevice(String fileName, List<int> pdfBytes) async {
    final dir = await getApplicationDocumentsDirectory();
    // final file = io.File('/storage/emulated/0/Download/$fileName');
    final file = io.File('${dir.path}/$fileName');
    await file.writeAsBytes(pdfBytes);
    return file;
  }

  Future<io.File> savePDFToDeviceLocal(
      String fileName, List<int> pdfBytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = io.File('${dir.path}/$fileName');
    await file.writeAsBytes(pdfBytes);
    return file;
  }
  
  // void openPDF(String filePath) async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PDFScreen(title: "Invoice", path: filePath),
  //     ),
  //   );
  //   // final result = await OpenFile.open(filePath);
  //   // if (result.type != ResultType.done) {
  //   //   // Handle error opening file
  //   //   print('Failed to open PDF: ${result.message}');
  //   // }
  // }

}
