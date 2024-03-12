import 'dart:ui';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/models/wholesalerModel/orderDetailsModel.dart'as orderDetails;
import 'package:pet/controllers/wholesaler_controller/couponswhole_controller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/order_tracker_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';
import 'package:pet/screens/wholesaler/locationScreenWhole.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/pdfView.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

import '../user/locationScreenUser.dart';
import 'dart:io' as io;
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:url_launcher/url_launcher.dart';
class OrderDetailswhole extends StatefulWidget {
  OrderDetailswhole(
      {super.key,
      this.orderId,
      this.couponcode,
      this.paymentmethod,
      this.orderstatus,
      this.orderAmount,
      this.fname,
      this.lname,
      this.email,
      this.address,
      this.phone,
      this.delivered,
      // this.username,
      // this.usernumber,
      // this.lastname,
       this.deliverycharge
      
      });
  int? orderId;
  String? couponcode;
  String? paymentmethod;
  String? orderstatus;
    String? address;
  String? delivered;
  String? email;
  String? fname;
  String? lname;
  String? orderAmount;
  String? phone;
  // String? username;
  // String? usernumber;
  // String? lastname;
  String? deliverycharge;

  @override
  State<OrderDetailswhole> createState() => _OrderDetailswholeState();
}

class _OrderDetailswholeState extends State<OrderDetailswhole> {
  WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
       WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
  final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
      DateTime initialDate = DateTime.now();
  final storage = GetStorage();

  MyCartWholeController addtocartController =
      Get.put(MyCartWholeController());
  CouponsWholeController couponsController = Get.put(CouponsWholeController());
  
  void generateAndOpenPDF(BuildContext context) async {
    final pdf = pw.Document();
    // final image = await imageFromAssetBundle('assets/image.png');
    // final dividerImageData = (await rootBundle.load("assets/image/divider.png"))
    //     .buffer
    //     .asUint8List();
    // final dividerImage = pw.MemoryImage(
    //   dividerImageData,
    // );
    final logoImageData =
        (await rootBundle.load("assets/logo/logo.png")).buffer.asUint8List();
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
                // pw.Image(
                //   logoImage,
                //   height: 50,
                // ),
                // pw.SizedBox(
                //   height: 30,
                // ),
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
                      widget.orderId.toString(),
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
                      "INV${widget.orderId.toString()}",
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
                      DateFormat("dd MMM yyyy").format(DateTime.now()),
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
                  // child: pw.Image(dividerImage),
                  child: pw.Divider(
                    indent: 1,
                    thickness: 1,
                  ),
                ),
            //     pw.Row(
            //       mainAxisAlignment: pw.MainAxisAlignment.start,
            //       children: [
            //         pw.Text(
            //           "Name: ",
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //         pw.Text(
            //           widget.fname.toString(),
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //       ],
            //     ),
            //     pw.Row(
            //       mainAxisAlignment: pw.MainAxisAlignment.start,
            //       children: [
            //         pw.Text(
            //           "Email: ",
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //         pw.Text(
            //           widget.email.toString(),
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //       ],
            //     ),
            //     pw.Row(
            //       mainAxisAlignment: pw.MainAxisAlignment.start,
            //       children: [
            //         pw.Text(
            //           "Phone: ",
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //         pw.Text(
            //           widget.phone.toString(),
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //       ],
            //     ),
            //     pw.Row(
            //       mainAxisAlignment: pw.MainAxisAlignment.start,
            //       children: [
            //         pw.Text(
            //           "Address: ",
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //         pw.Text(
            //           storage.read('useraddress').toString() +
            //               ", " +
            //               storage.read('useraddresscity').toString(),
            //           style: pw.TextStyle(
            //             // color: white,
            //             // fontWeight: FontWeight.w400,
            //             fontSize: 14.0,
            //             // fontFamily: "Alhadara-DEMO",
            //           ),
            //         ),
            //       ],
            //     ),
            // pw.Divider(),
           
            pw.
                           ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  children: wholemyordercontroller!.wholeorderdetailsModel!.data!
                      .map((e) => pw.Container(
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      "Product Name",
                                      style: pw.TextStyle(
                                        fontSize: 14,
                                        // fontWeight: pw.FontWeight.w400,
                                      ),
                                    ),
                                    pw.Text(
                                        e.variant!.length < 36
                                            ? e.variant!
                                            : "${e.variant!.substring(0, 35)}...",
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          // fontWeight: pw.FontWeight.w500,
                                        ))
                                  ],
                                ),
                                // pw.Divider(),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      "Variant",
                                      style: pw.TextStyle(
                                        fontSize: 14,
                                        // fontWeight: pw.FontWeight.w400,
                                      ),
                                    ),
                                    pw.Text(
                                        "${e.variation.toString().replaceAll('"', "")}",
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          // fontWeight: pw.FontWeight.w500,
                                        ))
                                  ],
                                ),
                                // pw.Divider(),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      "Quantity",
                                      style: pw.TextStyle(
                                        fontSize: 14,
                                        // fontWeight: pw.FontWeight.w400,
                                      ),
                                    ),
                                    pw.Text("${e.quantity.toString()}",
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          // fontWeight: pw.FontWeight.w500,
                                        ))
                                  ],
                                ),
                                 pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      "Gst",
                                      style: pw.TextStyle(
                                        fontSize: 14,
                                        // fontWeight: pw.FontWeight.w400,
                                      ),
                                    ),
                                    pw.Text("${e.gst.toString()}",
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          // fontWeight: pw.FontWeight.w500,
                                        ))
                                  ],
                                ),
                               pw.Divider(),
                              ],
                            ),
                          ))
                      .toList(),  
                            
                           )
                            ,
           pw.
                              Container(   decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(15),
                                    // border: pw.Border.all(color: MyColors.grey)
                                    ),
                                child:  pw.Padding(
                                  padding:  pw. EdgeInsets.all(8.0),
                                  child:  pw.Column(
                                    children: [
                                      pw.Row(
                                        mainAxisAlignment:
                                           pw.  MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw. Text(
                                            "Sub Total",
                                            // style: pw. CustomTextStyle.popinssmall014,
                                          ),
                                         pw.  Text(
                                          "₹"+(wholemyordercontroller.total1??0).toString(),
                                            // style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                       pw.Divider(
                                        indent: 1,
                                        thickness: 1,
                                      ),
                                     pw.  Row(
                                        mainAxisAlignment:
                                            pw. MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw. Column(
                                            crossAxisAlignment:
                                              pw.   CrossAxisAlignment.start,
                                            children: [
                                             pw.  Text(
                                                "Tax Amount",
                                                // style: CustomTextStyle.popinssmall014,
                                              ),
                                              // Text(
                                              //  myordercontroller.orderdetailsModel!.data![0].taxAmount??'',
                                              //   style:
                                              //       CustomTextStyle.popinssmallnormal,
                                              // ),
                                            ],
                                          ),
                                           pw.Text(
                                         (wholemyordercontroller.wholeorderdetailsModel!.data![0].gst).toString(),
                                            // style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                   pw.    Divider(
                                        indent: 1,
                                        thickness: 1,
                                      ),
                                
                               
                                     pw.   Row(
                                  mainAxisAlignment:
                                       pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                pw. Text(
                                      "Total",
                                    ),
                                     pw.Text(
                                      (widget.orderAmount ?? '0.0').toString(),
                                    ),
                                  ],
                                                              ),
                                   pw. Divider(
                                          thickness: 1, ),
                                                     
                                    ],
                                  ),
                                ),
                              ),
                              
           
           
              ],
            ),
          ),
        ),
      ),
    );

    final pdfBytes = await pdf.save();
    final fileName = 'invoice.pdf';
 // inside app package
    final file = await savePDFToDevice(
        fileName, pdfBytes); 
    print("File Name" + fileName);
    final snack = SnackBar(content: Text("Ready To View. $fileName"));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<io.File> savePDFToDevice(String fileName, List<int> pdfBytes) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  final dir = await getExternalStorageDirectory();
     final file = io.File('/storage/emulated/0/Download/$fileName');
  print("Saving file.... ${file}");
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
  Future<void> openPDF(String filePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WholePDFScreen(
          title: "Invoice",
          path: filePath,
        ),
      ),
    );
  }

  void generateAndOpenPDFsummary(BuildContext context) async {
    final summarypdf = pw.Document();
   
    final logoImageData =
        (await rootBundle.load("assets/logo/logo.png")).buffer.asUint8List();
    final logoImage = pw.MemoryImage(
      logoImageData,
    );

    summarypdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(25),
          ),
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(15.0),
            child: pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Order Id: ",
                      style: pw.TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    pw.Text(
                      widget.orderId.toString(),
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
                      "Date: ",
                      style: pw.TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    pw.Text(
                      DateFormat("dd MMM yyyy").format(DateTime.now()),
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
                  // child: pw.Image(dividerImage),
                  child: pw.Divider(
                    indent: 1,
                    thickness: 1,
                  ),
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
                      widget.fname.toString(),
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
                      widget.email.toString(),
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
                      widget.phone.toString(),
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
                      storage.read('useraddress').toString() +
                          ", " +
                          storage.read('useraddresscity').toString(),
                      style: pw.TextStyle(
                        // color: white,
                        // fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        // fontFamily: "Alhadara-DEMO",
                      ),
                    ),
                  ],
                ),
           
           pw.
                                Container(
                                decoration:  pw.BoxDecoration(
                                    borderRadius:  pw.BorderRadius.circular(15),
                                    // border:  pw.Border.all(color: MyColors.grey)
                                    ),
                                child:  pw.Padding(
                                  padding:  pw. EdgeInsets.all(15.0),
                                  child:  pw.Column(
                                    crossAxisAlignment:
                                         pw.CrossAxisAlignment.start,
                                    children: [
                                     pw.  Text(
                                        "Order Id",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                   pw.    Text(
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].orderId ??
                                                0)
                                            .toString(),
                                      ),
                                      pw. SizedBox(
                                          height:10),


                                           pw.    Text(
                                        "Item Name",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                     pw.  Text(
                                        (wholemyordercontroller.variantsname)
                                            .toString(),
                                      ),
                                      pw. SizedBox(
                                          height: 10),
                                     pw.  Text(
                                        "Payment",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                     pw.  Text(
                                        "Paid:" +
                                            widget.paymentmethod.toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
                                      ),
                                      pw. SizedBox(
                                          height:10),
                                      pw. Text(
                                        "Date",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                      pw. Text(
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].createdAt ??
                                                '')
                                            .toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
                                      ),
                                     pw.  SizedBox(
                                          height:10),
                                      pw. Text(
                                        "Phone Number",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                      pw. Text(
                                        widget.phone.toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
                                      ),
                                      pw. SizedBox(
                                          height: 10),

                                              
                                     pw.  Text(
                                         "deliver to",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                      pw. Text(
                                        initialDate
                                              .add(Duration(days: 7)).toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
                                      ),
                                      pw. Divider(
                                          thickness: 1,),
                                   
                                    ],
                                  ),
                                ),
                              ),
 
           
           
              ],
            ),
          ),
        ),
      ),
    );
  
    final pdfBytessummary = await summarypdf.save();
    final fileNamesummary = 'ordersummary.pdf';

   
    final file = await savePDFToDevicesummaryString
    (
        fileNamesummary, pdfBytessummary); 
    print("File Name" + fileNamesummary);
    final snack = SnackBar(content: Text("Ready To View. $fileNamesummary"));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<io.File> savePDFToDevicesummaryString( fileNamesummary, List<int> pdfBytessummary) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  final dir = await getExternalStorageDirectory();
     final file = io.File('/storage/emulated/0/Download/$fileNamesummary');
    
  print("Saving file.... ${file}");
    await file.writeAsBytes(pdfBytessummary);
    return file;
  }



  Future<io.File> savePDFToDeviceLocalsummary(
      String fileNamesummary, List<int> pdfBytessummary) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = io.File('${dir.path}/$fileNamesummary');
    await file.writeAsBytes(pdfBytessummary);
    return file;
  }

  Future<void> openOrderSummaryPDF(String filePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WholePDFScreen(
          title: "Order Summary",
          path: filePath,
        ),
      ),
    );
   
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

           appBar: CustomAppBarWholeOnlyback(title: "Order Details",),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: GetBuilder<WholeMyOrderController>(
                    init: wholemyordercontroller,
                    builder: (_) {
                      return wholemyordercontroller.wholeorderdetailsModel!.data ==
                              null||
                                            wholemyordercontroller.wholeorderdetailsModel!.data ==
                                                null ||
                                            wholemyordercontroller.wholeorderdetailsModel!.data!.isEmpty
                                        ? const SizedBox()
                          : ListView(
                              shrinkWrap: false,
                              primary: true,
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.02),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/logocanine.png",
                                      height: 80,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Canine Products",
                                          style: CustomTextStyle.popinsmedium,
                                        ),
                                        Text(
                                          "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                                          style: CustomTextStyle.popinssmall0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),


  ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: wholemyordercontroller.wholeorderdetailsModel!.data!.length,
                                  itemBuilder: (context, index) {
                                    var item =wholemyordercontroller.wholeorderdetailsModel!.data![index];
                                    String imagePath = Constants
                                            .PRODUCT_HOME_IMAGE_PATH +
                                        "/${item.itemDetails![0].image ?? ''}";
                                //  wholereviewcontroller.reviewAdd(
                                //         item.id ?? 0,
                                //         (wholemyordercontroller.wholeorderdetailsModel!
                                //                 .data![0].orderId ??
                                //             0));
                                    print("====>>>>imagepath ${imagePath}");
                                    return wholemyordercontroller.wholeorderdetailsModel == null || wholemyordercontroller.wholeorderdetailsModel!.data == null || wholemyordercontroller.wholeorderdetailsModel!.data![index] == null? SizedBox():
                                    Container(

                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.grey, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: MyColors.white),
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath,
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            // height: 75,
                                            placeholder: (context, url) =>
                                                Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url,
                                                    error) =>
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
                                        SizedBox(width: Get.width*0.5,
                                              child: Text(
                                                item.variant ?? '',
                                                maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                style:
                                                    CustomTextStyle.popinsmedium,
                                              ),
                                            ),
                                            Text("Quantity : "+(item.quantity ?? 0).toString(),
                                                style: CustomTextStyle
                                                    .popinssmall0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "₹"+ (  item.price ?? ''),
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                              ],
                                            )
                                        
                             ,           SizedBox(height: 5,),
                                        
                                           InkWell(
                                      onTap: () async {
  

orderDetails.Data itemReOrder = orderDetails.Data(
  id: item.id,
  itemId: item.itemId,
  orderId: item.orderId,
variant: item.variant,
variation: item.variation,
quantity: item.quantity,
price: item.price,
itemDetails: item.itemDetails,
);

print("Price   ${item.price}");
print("OrderReItem${itemReOrder}");
wholeproductdetailsController.updateReOrder(itemReOrder);
wholeproductdetailsController.ReOrderProduct();
print("OrderItemID*** ${item.id}");
 await addtocartController.init();
   Get.to( AddToCardwhole());
                   
                                      },
                                      child: Container(
                                        width: 85,
  height: 30, 
  decoration: BoxDecoration(
    color: MyColors.yellow, 
    borderRadius: BorderRadius.circular(8.0), 
  ),
                                        child: Center(child: Text("Buy it again"))))
                                     
                                      
                                          ],
                                        )
                                      ]),
                                    );
                                  }),
SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Text(
                                "Order Invoice",
                                style: CustomTextStyle.popinssmall014,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: MyColors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sub Total",
                                            style: CustomTextStyle.popinssmall014,
                                          ),
                                          Text(
                                           "₹"+(wholemyordercontroller.total1??0.0).toString(),
                                            style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        indent: 1,
                                        thickness: 1,
                                      ),
                                      
                                       Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: CustomTextStyle.popinssmall014,
                                    ),
                                    Text(
                                 " ₹"+  ( (double.parse((wholemyordercontroller.total1??0.0).toString()) + double.parse(widget.deliverycharge.toString())) ).toDouble().toStringAsFixed(2),
                                     style: CustomTextStyle.popinssmall014,
                                    ),
                                  ],
                                                              ),
                                   Divider(
                                          thickness: 1, color: MyColors.grey),
                                      GestureDetector(
                                        onTap: () {
                                         generateAndOpenPDF(context);
                                            },
                                        
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                      width: 182,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFCEE8FC),
                                              Color.fromRGBO(206, 232, 252, 0.00),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(37)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset("assets/image/file.png"),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "download Invoice",
                                              style: CustomTextStyle.popinssmall01,
                                            )
                                          ],
                                        ),
                                      )),
                                  

                                            Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                size: 15)
                                          ],
                                        ),
                                      ),
                                                                
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Text(
                                "Order Summary",
                                style: CustomTextStyle.popinssmall014,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: MyColors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order Id",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].orderId ??
                                                0)
                                            .toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),


                                              Text(
                                        "Item Name",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        (wholemyordercontroller.variantsname)
                                            .toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "Payment",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        "Paid:" +
                                            widget.paymentmethod.toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "Date",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].createdAt ??
                                                '')
                                            .toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "Phone Number",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        widget.phone.toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),

                                              
                                      Text(
                                         "deliver to",
                                        style: CustomTextStyle.popinsboldlight,
                                      ),
                                      Text(
                                        initialDate
                                              .add(Duration(days: 7)).toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      ),
                                      Divider(
                                          thickness: 1, color: MyColors.grey),
                                      GestureDetector(
                                        onTap: () {
                                          // generate pdf file
                                          // final pdfFile = await PdfInvoiceApi.generate();
                                          generateAndOpenPDFsummary(context);
                                          // opening the pdf file
                                          // FileHandleApi.openFile(pdfFile);
                                        },
                                        // onTap: () =>
                                        //
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                      width: 182,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFCEE8FC),
                                              Color.fromRGBO(206, 232, 252, 0.00),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(37)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset("assets/image/file.png"),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "download Order Summary",
                                              style: CustomTextStyle.popinssmall01,
                                            )
                                          ],
                                        ),
                                      )),
                                  

                                            Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                size: 15)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Text(
                                "Address",
                                style: CustomTextStyle.popinssmall014,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: MyColors.grey)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child:

                                          // GetBuilder<MyCartController>(
                                          //   init: addtocartController,
                                          //   builder: (_) {
                                          //     return
                                          Text(
                                        storage.read('useraddress').toString() +
                                            ", " +
                                            storage
                                                .read('useraddresscity')
                                                .toString(),
                                        style: CustomTextStyle
                                            .popinsboldlightsmall,
                                      )
                                      //   }
                                      // ),
                                      )),

                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Text(
                                "shipping Address",
                                style: CustomTextStyle.popinssmall014,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),

                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: MyColors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      widget.address.toString(),
                                      style:
                                          CustomTextStyle.popinsboldlightsmall,
                                    ),
                                  )),

                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.05),
                                        SizedBox(height: 15,),

                              if(widget.orderstatus == "delivered")
                               Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                              "Product Review",
                                              style: CustomTextStyle.popinstext,
                                            ),
                                    
                                                GetBuilder<WholeReviewController>(
                                          init: wholereviewcontroller,
                                          builder: (_) {
                        return
                        
                                            
                                               
                                             Column(
                                               children: [
                                              
                                                 Container(
                                                  margin:
                                                      EdgeInsets.symmetric(vertical: 10),
                                                  
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: MyColors.grey, width: 0.5),
                        
                                                      borderRadius:
                                                          BorderRadius.circular(25),
                                                      color: MyColors.white),
                                                  child: 
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                        children: [
                                                         

                                                      
                                                    
                                                                                       InkWell(
                                                                                          onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                // title:
                                                                content: Form(
                                                                     key: wholereviewcontroller.formKey,
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      Text(
                                                                                          'Rating and Review',
                                                                                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        SizedBox(height: 18.0),
                                                                      TextField(
                                                                        controller:
                                                                            wholereviewcontroller
                                                                                .commentController,
                                                                        decoration: InputDecoration(
                                                                          hintText: 'description',
                                                                        ),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            wholereviewcontroller
                                                                                .ratingController,
                                                                        decoration: InputDecoration(
                                                                          hintText: 'Rating',
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: <Widget>[
                                                                
                                                                  TextButton(
                                                                    child: Text('Submit'),
                                                                    onPressed: () async {
                                                                  
                                                                        wholereviewcontroller.validateForm(context).then(
                                (isValid)  {
                                  if (isValid) {
           
                                    try {
                                               wholereviewcontroller.reviewinit();
                                                                             
                              Get.back();
                                    } catch (e) {
                                      Get.snackbar(
                                        'Error',
                                        'Something Went Wrong: $e',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  } 
                                });
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                        },
                                                      );
                                                                                          },
                                                                                          child:
                                                    
                                                                                           RatingStars(
                                                        value:0,
                                                      
                                                      starBuilder: (index, color) => Icon(
                                                        Icons.star,
                                                        color: color,
                                                        size: 15,
                                                      ),
                                                      starCount: 5,
                                                      starSize: 20,
                                                     
                                                       maxValue:5,
                                                      starSpacing: 0.5,
                                                      maxValueVisibility: true,
                                                      valueLabelVisibility: false,
                                                      animationDuration:
                                                              Duration(milliseconds: 5000),
                                                      
                                                      starOffColor: const Color(0xffe7e8ea),
                                                      starColor: MyColors.yellow,
                                                             ),
                                                                                      
                                                                                      
                                                                                        )
                                                           
                                                                                      
                                                          ],
                                                      ),
                                                    )
                                                 
                                            )
                                                //  })
                                             ],
                                             );
                                         
                                           
                                          
                                          }),
                                 ],
                               ),

                                Text(
                                  "Call",
                                  style: CustomTextStyle.popinssmall014,
                                ),
                                Card(
                                  elevation: 1.5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(21.0),
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height * 0.13,
                                      decoration: BoxDecoration(
                                          color: MyColors.white,
                                          borderRadius: BorderRadius.circular(21)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.0,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${widget.fname} ${widget.lname}"
                                                ,
                                                  style:
                                                      CustomTextStyle.popinsmedium,
                                                ),
                                                Container(
                                                  height: 30, width: 30,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: MyColors.yellowcir,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                            widget.phone??'',
                                              style: CustomTextStyle.popinssmall01,
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.05),
                                InkWell(
                                  onTap: () async {
                                    OrderTrackerWholeController
                                        ordertrackcontroller =
                                        Get.put(OrderTrackerWholeController());
                                    ordertrackcontroller
                                        .updateOrder(widget.orderId ?? 0);
                                    await ordertrackcontroller.init();
                                    Get.to(LocationPickerMapWhole1());
                                  },
                                  child: Center(
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width*0.8,

                                      height:
                                          MediaQuery.of(context).size.height * 0.08,

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
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.02),
                              ],
                            );
                    })),
          
          
          
            GetBuilder<WholeMyOrderController>(
                init: wholemyordercontroller,
                builder: (_) {
                  return wholemyordercontroller.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.5), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
           
            GetBuilder<WholeMyOrderController>(
                init: wholemyordercontroller,
                builder: (_) {
                  return wholemyordercontroller.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.white, // Color of the progress bar
                            size: 50.0, // Size of the progress bar
                          ),
                        )
                      : SizedBox();
                }),
        
          
          ],
        ));
 
 
  }
}
