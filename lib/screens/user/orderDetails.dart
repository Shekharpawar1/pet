import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:downloads_path_provider/downloads_path_provider.dart';
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
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/orderdetails_controller.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/controllers/user_controller/userorder_tracker_controller.dart';
import 'package:pet/controllers/wholesaler_controller/order_tracker_controller.dart';
import 'package:pet/models/usersModel/orderDetailsModel.dart' as orderDetails;
import 'package:pet/screens/user/locationScreenUser.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/widgets/pdfView.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/file_handle_api.dart';
import 'package:pet/utils/fontstyle.dart';

import 'package:open_file/open_file.dart';
import 'package:pet/utils/pdf_invoice_api.dart';

import 'dart:io' as io;
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../controllers/user_controller/coupons_controller.dart';

class OrderDetailsUser extends StatefulWidget {
  OrderDetailsUser(
      {super.key,
        this.storeId,
      this.orderId,
      this.couponcode,
      this.coupondisAmount,
      this.paymentmethod,
      this.orderstatus,
      this.orderAmount,
      this.fname,
      this.lname,
      this.email,
      this.address,
      this.phone,

      this.delivered,this.deliverycharge});


  String? address;
  String? couponcode;
  int? storeId;
  String? coupondisAmount;
  String? delivered;
  String? email;
  String? fname;
  String? lname;
  String? orderAmount;
  int? orderId;
  String? orderstatus;
  String? paymentmethod;
  String? phone;
  String? deliverycharge;

  @override
  State<OrderDetailsUser> createState() => _OrderDetailsUserState();
}

class _OrderDetailsUserState extends State<OrderDetailsUser> {
  MyCartController addtocartController = Get.put(MyCartController());

  
  CouponsController couponsController = Get.put(CouponsController());
      ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  MyOrderController myordercontroller = Get.put(MyOrderController());
  OrderDetailsController orderdetailscontroller =
      Get.put(OrderDetailsController());
 DateTime initialDate = DateTime.now();
  final storage = GetStorage();
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());
String formattedTotal = "";

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
                // pw.ListView(
                //   // physics: NeverScrollableScrollPhysics(),
                //   // shrinkWrap: true,
                //   children: myordercontroller!.orderdetailsModel.data!
                //       .map((e) => pw.Container(
                //             child: pw.Column(
                //               children: [
                //                 pw.Row(
                //                   mainAxisAlignment:
                //                       pw.MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     pw.Text(
                //                       "Product Name",
                //                       style: pw.TextStyle(
                //                         fontSize: 14,
                //                         // fontWeight: pw.FontWeight.w400,
                //                       ),
                //                     ),
                //                     pw.Text(
                //                         e.productName!.length < 36
                //                             ? e.productName!
                //                             : "${e.productName!.substring(0, 35)}...",
                //                         style: pw.TextStyle(
                //                           fontSize: 14,
                //                           // fontWeight: pw.FontWeight.w500,
                //                         ))
                //                   ],
                //                 ),
                //                 pw.Divider(),
                //                 pw.Row(
                //                   mainAxisAlignment:
                //                       pw.MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     pw.Text(
                //                       "Variant",
                //                       style: pw.TextStyle(
                //                         fontSize: 14,
                //                         // fontWeight: pw.FontWeight.w400,
                //                       ),
                //                     ),
                //                     pw.Text(
                //                         "${e.variation.toString().replaceAll('"', "")}",
                //                         style: pw.TextStyle(
                //                           fontSize: 14,
                //                           // fontWeight: pw.FontWeight.w500,
                //                         ))
                //                   ],
                //                 ),
                //                 pw.Divider(),
                
 

  void generateAndOpenPDF(BuildContext context) async {
    final pdf = pw.Document();
   
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
                  child: 
                 pw.Text("************************************************************************************"),
                           
                ),
          //       pw.Row(
          //         mainAxisAlignment: pw.MainAxisAlignment.start,
          //         children: [
          //           pw.Text(
          //             "Name: ",
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //           pw.Text(
          //             widget.fname.toString(),
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //         ],
          //       ),
          //       pw.Row(
          //         mainAxisAlignment: pw.MainAxisAlignment.start,
          //         children: [
          //           pw.Text(
          //             "Email: ",
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //           pw.Text(
          //             widget.email.toString(),
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //         ],
          //       ),
          //       pw.Row(
          //         mainAxisAlignment: pw.MainAxisAlignment.start,
          //         children: [
          //           pw.Text(
          //             "Phone: ",
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //           pw.Text(
          //             widget.phone.toString(),
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //         ],
          //       ),
          //       pw.Row(
          //         mainAxisAlignment: pw.MainAxisAlignment.start,
          //         children: [
          //           pw.Text(
          //             "Address: ",
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
          //             ),
          //           ),
          //           pw.Text(
          //             storage.read('useraddress').toString() +
          //                 ", " +
          //                 storage.read('useraddresscity').toString(),
          //             style: pw.TextStyle(
          //               // color: white,
          //               // fontWeight: FontWeight.w400,
          //               fontSize: 14.0,
          //               // fontFamily: "Alhadara-DEMO",
           pw.Table(
  // border: pw.TableBorder.all(),
  columnWidths: {
    0: pw.FixedColumnWidth(100), // Product Name
    1: pw.FixedColumnWidth(100), // Variant
    2: pw.FixedColumnWidth(50),  // Quantity
    3: pw.FixedColumnWidth(50),  // Gst
    4: pw.FixedColumnWidth(100), // Price
  },
  children: [
    pw.TableRow(
      children: [
        pw.Text("Product Name",textAlign: pw.TextAlign.center),
        pw.Text("Variant",textAlign: pw.TextAlign.center),
        pw.Text("Quantity",textAlign: pw.TextAlign.center),
        pw.Text("Gst",textAlign: pw.TextAlign.center),
        pw.Text("Price",textAlign: pw.TextAlign.center),
      ],
    ),
    for (var e in myordercontroller!.orderdetailsModel!.data!)
      pw.TableRow(
        
        children: [
          pw.Text(
            e.variant!.length < 10
                ? e.variant!
                : "${e.variant!.substring(0, 10)}...",
            textAlign: pw.TextAlign.center,
          ),
          pw.Text("${e.variation.toString().replaceAll('"', "")}",textAlign: pw.TextAlign.center),
          pw.Text("${e.quantity.toString()}",textAlign: pw.TextAlign.center),
          pw.Text("${e.gst.toString()}",textAlign: pw.TextAlign.center),
          pw.Text("${e.price.toString()}",textAlign: pw.TextAlign.center),
        ],
      ),
  ],
),
                              pw. Container(   decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(15),
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
                                         myordercontroller.total1.toString(),
                                            // style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                       pw.Divider(
                                        // indent: 1,
                                        // thickness: 1,
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
                                                  "Delivery Charge",
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
"+ "+ (widget.deliverycharge??'40').toString(),   
                                          ),
                                        ],
                                      ),
                                   pw.    Divider(
                                        indent: 1,
                                        thickness: 1,
                                      ),
                                    pw.   Row(
                                        mainAxisAlignment:
                                          pw.   MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw. Column(
                                            crossAxisAlignment:
                                            pw.     CrossAxisAlignment.start,
                                            children: [
                                            pw.   Text(
                                                "Discount",
                                                // style: CustomTextStyle.popinssmall014,
                                              ),
                                             pw.  Text(
                                                "Promo Code: " +
                                                    widget.couponcode.toString(),
                                                // style:
                                                //     CustomTextStyle.popinssmallnormal,
                                              ),
                                            ],
                                          ),
                                         pw.  Text(
                                        "- ${widget.coupondisAmount.toString()}",
                                            // myordercontroller.orderdetailsModel!
                                            //         .data![0].discountOnItem ??
                                            //     '',
                                            // style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                   pw.    Divider(
                                        
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
                                                "Delivery Charge",
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
                                             widget.deliverycharge.toString()
                                          //  myordercontroller.orderdetailsModel!.data![0].taxAmount??'',
                                            // style: CustomTextStyle.popinssmall014,
                                          ),
                                        ],
                                      ),
                                   pw.    Divider(
                                        // indent: 1,
                                        // thickness: 1,
                                      ),
                                 
                                     pw.   Row(
                                  mainAxisAlignment:
                                       pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                pw. Text(
                                      "Total",
                                      // style: CustomTextStyle.popinssmall014,
                                    ),
                                     pw.Text(
                                      (widget.orderAmount ?? '0.0').toString(),
                                      // style: CustomTextStyle.popinssmall
                                    ),
                                  ],
                                                              ),
                                  //  pw. Divider(
                                  //          ),
                                      // pw. GestureDetector(
                                      //   onTap: () {
                                      //     // generate pdf file
                                      //     // final pdfFile = await PdfInvoiceApi.generate();
                                      //     generateAndOpenPDF(context);
                                      //     // opening the pdf file
                                      //     // FileHandleApi.openFile(pdfFile);
                                      //   },
                                      //   // onTap: () =>
                                      //   //
                                      //   child:
                                      //     pw.Row(
                                      //     mainAxisAlignment:
                                      //          pw.MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       pw. Container(
                                      // width: 182,
                                      // height: 40,
                                      // decoration:  pw.BoxDecoration(
                                      //     gradient:  pw.LinearGradient(
                                      //       begin:  pw.Alignment.topCenter,
                                      //       end:  pw.Alignment.bottomCenter,
                                      //       colors: [
                                      //         // pw. Color(0xFFCEE8FC),
                                      //         // Color.fromRGBO(206, 232, 252, 0.00),
                                      //       ],
                                      //     ),
                                      //     borderRadius:  pw.BorderRadius.circular(37)),
                                      // child: Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Row(
                                      //     children: [
                                      //       Image.asset("assets/image/file.png"),
                                      //       SizedBox(
                                      //         width: 3,
                                      //       ),
                                      //       Text(
                                      //         "download Invoice",
                                      //         style: CustomTextStyle.popinssmall01,
                                      //       )
                                      //     ],
                                      //   ),
                                      // )),
                                  

                                      //       Icon(
                                      //           Icons
                                      //               .arrow_forward_ios_outlined,
                                      //           size: 15)
                                      //     ],
                                      //   ),
                                      // // ),
                                                                
                                    ],
                                  ),
                                ),
                              ),
                               pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 15.0),
                  // child: pw.Image(dividerImage),
                  child: 
                 pw.Text("************************************************************************************"),
                           
                ),
           
           
              ],
            ),
          ),
        ),
      ),
    );
    // Save the PDF to a file
    // final outputFile = File('path/to/output.pdf');
    //  outputFile.writeAsBytes(await pdf.save());

    //   final pdfBytes = await pdf.save();
    //   final fileName = 'invoice.pdf';

    final pdfBytes = await pdf.save();
    final fileName = 'invoice${widget.orderId}.pdf';

    // Save the PDF file locally
    // final file = await savePDFToDevice(fileName, pdfBytes);

    // Save the PDF file locally
    // final file = await savePDFToDevice(fileName, pdfBytes);   // inside app package
    final file = await savePDFToDevice(
        fileName, pdfBytes); // inside internal storage downloads folder

    // Open the PDF file using the default PDF viewer
    // savePDFToDevice(fileName,pdfBytes );
    // openPDF(file.path);
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
  // final filePath = '${dir!.path}/Download/$fileName';

  // final file = io.File(filePath);
     final file = io.File('/storage/emulated/0/Download/$fileName');
    // final file = io.File('${dir.path}/$fileName');

  print("Saving file.... ${file}");
    await file.writeAsBytes(pdfBytes);
    return file;
  }

  //  Future<File> writeFile(String fileName, List<int> pdfBytes) async {
  //   // storage permission ask
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //   // the downloads folder path
  //   Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
  //   String tempPath = tempDir.path;
  //   var filePath = tempPath + '/$fileName';
  //   //

  //   //await file.writeAsBytes(pdfBytes);
  //    var file = File(filePath).writeAsBytes(pdfBytes);

  //   return file;
  //   // the data
  //   // var bytes = ByteData.view(data.buffer);
  //   // final buffer = bytes.buffer;
  //   // // save the data in the path
  //   // return File(filePath).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  Future<io.File> savePDFToDeviceLocal(
      String fileName, List<int> pdfBytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = io.File('${dir.path}/$fileName');
    await file.writeAsBytes(pdfBytes);
    return file;
  }

// Future<void> generatePDF() async {
//   final pdf = pw.Document();

//   // Create a page
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         // Add your UI widgets to the PDF page
//         return pw.Center(
//           child: pw.Text('Hello, PDF!'),
//         );
//       },
//     ),
//   );

//   // Save the PDF to a file
//   final outputFile =io. File('path/to/output.pdf');
//   await outputFile.writeAsBytes(await pdf.save());
// }
  Future<void> openPDF(String filePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(
          title: "Invoice",
          path: filePath,
        ),
      ),
    );
    // final result = await OpenFile.open(filePath);
    // if (result.type != ResultType.done) {
    //   // Handle error opening file
    //   print('Failed to open PDF: ${result.message}');
    // }
  }

  void generateAndOpenPDFsummary(BuildContext context) async {
    final summarypdf = pw.Document();
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

    summarypdf.addPage(
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
                // pw.Row(
                //   mainAxisAlignment: pw.MainAxisAlignment.center,
                //   children: [
                //     pw.Text(
                //       "Invoice Id: ",
                //       style: pw.TextStyle(
                //         // color: white,
                //         // fontWeight: FontWeight.w400,
                //         fontSize: 20.0,
                //         // fontFamily: "Alhadara-DEMO",
                //       ),
                //     ),
                //     pw.Text(
                //       "INV${widget.orderId.toString()}",
                //       style: pw.TextStyle(
                //         // color: white,
                //         // fontWeight: FontWeight.w400,
                //         fontSize: 20.0,
                //         // fontFamily: "Alhadara-DEMO",
                //       ),
                //     ),
                //   ],
                // ),
               
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
                     ( widget.fname??'').toString(),
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
                      (widget.email??'').toString(),
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
                      (widget.phone??'').toString(),
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
                    storage.read("UserbillingAddress"),
                      // storage.read('useraddress').toString() +
                      //     ", " +
                      //     storage.read('useraddresscity').toString(),
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
                                        (myordercontroller.orderdetailsModel!
                                                    .data![0].orderId ??
                                                0)
                                            .toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
                                      ),
                                      pw. SizedBox(
                                          height:10),


                                           pw.    Text(
                                        "Item Name",
                                        // style: CustomTextStyle.popinsboldlight,
                                      ),
                                     pw.  Text(
                                        (myordercontroller.variantsname)
                                            .toString(),
                                        // style: CustomTextStyle
                                        //     .popinsboldlightsmall,
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
                                        (myordercontroller.orderdetailsModel!
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
    // Save the PDF to a file
    // final outputFile = File('path/to/output.pdf');
    //  outputFile.writeAsBytes(await pdf.save());

    //   final pdfBytes = await pdf.save();
    //   final fileName = 'invoice.pdf';

    final pdfBytessummary = await summarypdf.save();
    final fileNamesummary = 'ordersummary${widget.orderId}.pdf';

    // Save the PDF file locally
    // final file = await savePDFToDevice(fileName, pdfBytes);

    // Save the PDF file locally
    // final file = await savePDFToDevice(fileName, pdfBytes);   // inside app package
    final file = await savePDFToDevicesummaryString
    (
        fileNamesummary, pdfBytessummary); // inside internal storage downloads folder

    // Open the PDF file using the default PDF viewer
    // savePDFToDevice(fileName,pdfBytes );
    // openPDF(file.path);
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
  // final filePath = '${dir!.path}/Download/$fileName';

  // final file = io.File(filePath);
     final file = io.File('/storage/emulated/0/Download/$fileNamesummary');
    // final file = io.File('${dir.path}/$fileName');
    
  print("Saving file.... ${file}");
    await file.writeAsBytes(pdfBytessummary);
    return file;
  }

  //  Future<File> writeFile(String fileName, List<int> pdfBytes) async {
  //   // storage permission ask
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //   // the downloads folder path
  //   Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
  //   String tempPath = tempDir.path;
  //   var filePath = tempPath + '/$fileName';
  //   //

  //   //await file.writeAsBytes(pdfBytes);
  //    var file = File(filePath).writeAsBytes(pdfBytes);

  //   return file;
  //   // the data
  //   // var bytes = ByteData.view(data.buffer);
  //   // final buffer = bytes.buffer;
  //   // // save the data in the path
  //   // return File(filePath).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  Future<io.File> savePDFToDeviceLocalsummary(
      String fileNamesummary, List<int> pdfBytessummary) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = io.File('${dir.path}/$fileNamesummary');
    await file.writeAsBytes(pdfBytessummary);
    return file;
  }

// Future<void> generatePDF() async {
//   final pdf = pw.Document();

//   // Create a page
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         // Add your UI widgets to the PDF page
//         return pw.Center(
//           child: pw.Text('Hello, PDF!'),
//         );
//       },
//     ),
//   );

//   // Save the PDF to a file
//   final outputFile =io. File('path/to/output.pdf');
//   await outputFile.writeAsBytes(await pdf.save());
// }
  Future<void> openOrderSummaryPDF(String filePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(
          title: "Order Summary",
          path: filePath,
        ),
      ),
    );
    // final result = await OpenFile.open(filePath);
    // if (result.type != ResultType.done) {
    //   // Handle error opening file
    //   print('Failed to open PDF: ${result.message}');
    // }
  }

 

  @override
  Widget build(BuildContext context) {
    // addtocartController.alladdressinit();
  // userreviewcontroller.reviewAdd(
  //                                       item.id ?? 0,
  //                                       widget.orderId??0);
    return Stack(
      children: [
        Scaffold(
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
//             actions: [
//               Stack(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Get.to(NotificationUser());
//                       },
//                       child: Center(
//                         child: Icon(Icons.notifications, color: MyColors.black),
//                       )),
//                   Positioned(
//                       top: 10.0,
//                       right: 0,
//                       child: Stack(
//                         children: <Widget>[
//                           Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                           Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   ('5').toString(),
//                                   // list.length.toString(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 8.0,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               )),
//                         ],
//                       )),
//                 ],
//               ),
//               SizedBox(width: 20),
//               Stack(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Get.to(AddToCardUser());
//                       },
//                       child:
//                           Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//                   Positioned(
//                       top: 10.0,
//                       right: 0,
//                       child: Stack(
//                         children: <Widget>[
//                           Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
//                           Positioned(
//                               top: 3.0,
//                               right: 4.0,
//                               child: Center(
//                                 child: Text(
//                                   ('5').toString(),
//                                   // list.length.toString(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 8.0,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               )),
//                         ],
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 width: 20,
//               )
//             ],
          ),
         
          body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: GetBuilder<MyOrderController>(
                  init: myordercontroller,
                  builder: (_) {
                    return myordercontroller.orderdetailsModel == null ||
                            myordercontroller.orderdetailsModel!.data == null ||
                            myordercontroller.orderdetailsModel!.data!.isEmpty
                        ? Center(
                            child: Image.asset("assets/image/nodataimg.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width))
                        : ListView(
                            shrinkWrap: false,
                            primary: true,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: myordercontroller
                                      .orderdetailsModel!.data!.length,
                                  itemBuilder: (context, index) {
                                    var item = myordercontroller
                                        .orderdetailsModel!.data![index];
                                    String imagePath = Constants
                                            .PRODUCT_HOME_IMAGE_PATH +
                                        "/${item.itemDetails![0].image ?? ''}";
                                  
                                    print("====>>>>imagepath ${imagePath}");



  

                                    return myordercontroller
                                        .orderdetailsModel == null || myordercontroller
                                        .orderdetailsModel!.data == null || myordercontroller
                                        .orderdetailsModel!.data![index] == null ||myordercontroller
                                        .orderdetailsModel!.data![index].itemDetails!.isEmpty? SizedBox():
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
                                      child: Row(
                                        children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 5,bottom: 15,top:15),
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
                                                //     Text("Gst : "+(item.gst ?? 0).toString(),
                                                // style: CustomTextStyle
                                                //     .popinssmall0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                "₹"+ (  item.price ?? '').toString(),
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                              ],
                                            ),
SizedBox(height: 3,),
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
productdeatilscontroller.updateReOrder(itemReOrder);
productdeatilscontroller.ReOrderProduct();
print("OrderItemID*** ${item.id}");
 await addtocartController.init();
   Get.to( AddToCardUser());
                   
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
                                    , 
                                    
                                    // Spacer(),
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
                                         "₹"+ (myordercontroller.total1).toInt().toString(),
                                          style: CustomTextStyle.popinstext,
                                        ),
                                        
                                        ],
                                      ),
                                      Divider(
                                        // indent: 1,
                                        // thickness: 1,
                                      ),
  //                                     Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Column(
  //                                           crossAxisAlignment:
  //                                               CrossAxisAlignment.start,
  //                                           children: [
  //                                             Text(
  //                                               "Tax Amount",
  //                                               style: CustomTextStyle.popinssmall014,
  //                                             ),
  //                                             // Text(
  //                                             //  myordercontroller.orderdetailsModel!.data![0].taxAmount??'',
  //                                             //   style:
  //                                             //       CustomTextStyle.popinssmallnormal,
  //                                             // ),
  //                                           ],
  //                                         ),
  //                                         Text(
  //  "+"+(myordercontroller.orderdetailsModel!.data![0].gst).toString(),
  //                                         //  "+ ₹"+myordercontroller.tax .toString(),
  //                                         // "+ ₹"+ (myordercontroller.orderdetailsModel!.data![0].taxAmount??''),
  //                                           style: CustomTextStyle.popinssmall014,
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     Divider(
  //                                       indent: 1,
  //                                       thickness: 1,
  //                                     ),
                                     
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Discount",
                                                style: CustomTextStyle.popinssmall014,
                                              ),
                                              Text(
                                                "Promo Code: " +
                                                    widget.couponcode.toString(),
                                                style:
                                                    CustomTextStyle.popinssmallnormal,
                                              ),
                                            ],
                                          ),
                                         Text(
 "- ₹${widget.coupondisAmount!.toString()}",
                                                   // "- ₹"+myordercontroller.discount .toString(),
                                           // "- ₹"+(myordercontroller.orderdetailsModel!
                                           //         .data![0].discountOnItem ??
                                           //     ''),
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
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Delivery Charge",
                                                style: CustomTextStyle.popinssmall014,
                                              ),
                                              // Text(
                                              //  myordercontroller.orderdetailsModel!.data![0].taxAmount??'',
                                              //   style:
                                              //       CustomTextStyle.popinssmallnormal,
                                              // ),
                                            ],
                                          ),
                                          Text(
                                          "+ ₹"+ (widget.deliverycharge??'0').toString(),
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
                                " ₹"+ (
                                calculateTotal()),
                                      style: CustomTextStyle.popinssmall014,
                                    ),
                                  ],
                                                              ),
                                   Divider(
                                          thickness: 1, color: MyColors.grey),
                                      GestureDetector(
                                        onTap: () {
                                          // generate pdf file
                                          // final pdfFile = await PdfInvoiceApi.generate();
                                          generateAndOpenPDF(context);
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
                                        (myordercontroller.orderdetailsModel!
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
                                        (myordercontroller.variantsname)
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
                                      // Text(
                                      //   (myordercontroller.orderdetailsModel!
                                      //               .data![0].createdAt ??
                                      //           '')
                                      //       .toString(),
                                      //   style: CustomTextStyle
                                      //       .popinsboldlightsmall,
                                      // ),
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

                                            storage.read("UserbillingAddress"),
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
                                height: 15,
                              ),

                                if(widget.orderstatus == "delivered")
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Review",
                                    style: CustomTextStyle.popinstext,
                                  ),

                                  
                              GetBuilder<UserReviewController>(
                                  init: userreviewcontroller,
                                  builder: (_) {
                                    return 
                                    // userreviewcontroller
                                    //                 .userReviewModel ==
                                    //             null &&
                                    //         userreviewcontroller
                                    //                 .userReviewModel!.data ==
                                    //             null
                                    //     // userreviewcontroller.userReviewModel!.data!.isEmpty
                                    //     ? SizedBox():
                                        // : ListView.builder(
                                        //     primary: false,
                                        //     shrinkWrap: true,
                                        //     itemCount: userreviewcontroller
                                        //             .userReviewModel!
                                        //             .data!
                                        //             .length ??
                                        //         0,
                                        //     itemBuilder: (context, index) {
                                        //       var item = userreviewcontroller
                                        //           .userReviewModel!
                                        //           .data![index];

                                              // return 
                                              Column(
                                                children: [
                                                  // ...item.userId!.map((e) {
                                                  //   print(
                                                  //       "NameReviewer ${e.fName}");
                                                    // return
                                                     Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        // height:
                                                        //     MediaQuery.of(context).size.height *
                                                        //         0.18,
                                                        width:
                                                            MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: MyColors
                                                                    .grey,
                                                                width: 0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color:
                                                                MyColors.white),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // Text(
                                                              //   "${e.fName} ${e.lName}",
                                                              //   style: CustomTextStyle
                                                              //       .popinsmedium,
                                                              // ),
                                                              // Text(
                                                              //   item.comment ??
                                                              //       '',
                                                              //   style: CustomTextStyle
                                                              //       .popinsboldlightsmall,
                                                              // ),
                                                              InkWell(
                                                                onTap: () {
                                                                      userreviewcontroller. clearFields();
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return   BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    
                                                                        child: AlertDialog(
                                                                          // title:
                                                                          content:
                                                                        
                                                                              Form(
                                                                                key: userreviewcontroller.formKey,
                                                                                child: Column(
                                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Rating and Review',
                                                                                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        SizedBox(height: 18.0),
                                                                                        // Text('Are you sure you want to delete this notification?'),
                                                                                // Align(
                                                                                //   alignment:
                                                                                //       Alignment.topRight,
                                                                                //   child: IconButton(
                                                                                //     icon: Icon(Icons
                                                                                //         .close), // You can use any close icon you prefer
                                                                                //     onPressed: () {
                                                                                //       Get.back(); // Close the dialog
                                                                                //     },
                                                                                //   ),
                                                                                // ),
                                                                                                                                                           Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: TextField(
                                                                                              controller: userreviewcontroller.commentController,
                                                                                              decoration: InputDecoration(
                                                                                                hintText: 'Description',
                                                                                                      
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                              ),
                                                                                              maxLines: 3,
                                                                                            ),
                                                                                          ),
                                                                              
                                                                                           // Rating TextField
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: TextField(
                                                                                              controller: userreviewcontroller.ratingController,
                                                                                              decoration: InputDecoration(
                                                                                                hintText: 'Rating',
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        
                                                                                      
                                                                                // TextField(
                                                                                //   controller: userreviewcontroller.ratingController,
                                                                                //   decoration: InputDecoration(
                                                                                //     hintText: 'Rating',
                                                                                //   ),
                                                                                // ),
                                                                                                                                                          ],
                                                                                                                                                        ),
                                                                              ),
                                                                          actions: <
                                                                              Widget>[


                                                                            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {

                   userreviewcontroller.validateForm(context).then(
                                (isValid)  {
                                  if (isValid) {
                                    // print("Valid form");
           
                                    try {
                                           userreviewcontroller.commentreviewinit();
                                                                             
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
                child: Text('Submit'),
              ),      
                                                                            // TextButton(
                                                                            //   child:
                                                                            //       Text('Submit'),
                                                                            //   onPressed:
                                                                            //       () async {
                                                                            //     //   userreviewcontroller.reviewAdd( i(myordercontroller.orderdetailsModel!
                                                                            //     //     .data![0].orderId ??
                                                                            //     // 0));
                                                                           
                                                                            //     await userreviewcontroller.commentreviewinit();
                                                                            //     Navigator.of(context).pop();
                                                                            //   },
                                                                            // ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:

                                                                    // ListView.builder(
                                                                    //                                 primary: false,
                                                                    //                                 shrinkWrap: true,
                                                                    //                                 // scrollDirection: Axis.horizontal,
                                                                    //                                 itemCount:userreviewcontroller.userReviewModel?.data?.length ?? 0,
                                                                    //                                 itemBuilder: (context, index) {
                                                                    //                                   var item = userreviewcontroller
                                                                    //                                     .userReviewModel!.data![index];
                                                                    //                              return      userreviewcontroller
                                                                    //                                     .userReviewModel!.data == null? SizedBox():
                                                                    RatingStars(
                                                                  value: 0,
                                                                  // onValueChanged: (v) {
                                                                  //   //
                                                                  //   setState(() {
                                                                  //     value = v;
                                                                  //   });
                                                                  // },
                                                                  starBuilder:
                                                                      (index, color) =>
                                                                          Icon(
                                                                    Icons.star,
                                                                    color:
                                                                        color,
                                                                    size: 15,
                                                                  ),
                                                                  starCount: 5,
                                                                  starSize: 20,
                                                                  // valueLabelColor: const Color(0xff9b9b9b),
                                                                  // valueLabelTextStyle: const TextStyle(
                                                                  //     color: Colors.white,
                                                                  //     fontWeight: FontWeight.w400,
                                                                  //     fontStyle: FontStyle.normal,
                                                                  //     fontSize: 12.0),
                                                                  // valueLabelRadius: 10,
                                                                  maxValue: 5,
                                                                  starSpacing:
                                                                      0.5,
                                                                  maxValueVisibility:
                                                                      true,
                                                                  valueLabelVisibility:
                                                                      false,
                                                                  animationDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              5000),
                                                                  // valueLabelPadding:
                                                                  //     const EdgeInsets.symmetric(
                                                                  //         vertical: 1, horizontal: 8),
                                                                  // valueLabelMargin:
                                                                  //     const EdgeInsets.only(right: 8),
                                                                  starOffColor:
                                                                      const Color(
                                                                          0xffe7e8ea),
                                                                  starColor:
                                                                      MyColors
                                                                          .yellow,
                                                                ),
                                                                //  }),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                  // })
                                                ],
                                              );
                                            // });

                                    //  InkWell(
                                    //   onTap: () {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (BuildContext context) {
                                    //         return AlertDialog(
                                    //           // title:
                                    //           content: Column(
                                    //             mainAxisSize: MainAxisSize.min,
                                    //             children: [
                                    //               // Align(
                                    //               //   alignment:
                                    //               //       Alignment.topRight,
                                    //               //   child: IconButton(
                                    //               //     icon: Icon(Icons
                                    //               //         .close), // You can use any close icon you prefer
                                    //               //     onPressed: () {
                                    //               //       Get.back(); // Close the dialog
                                    //               //     },
                                    //               //   ),
                                    //               // ),
                                    //               TextField(
                                    //                 controller:
                                    //                     userreviewcontroller
                                    //                         .commentController,
                                    //                 decoration: InputDecoration(
                                    //                   hintText: 'description',
                                    //                 ),
                                    //               ),
                                    //               TextField(
                                    //                 controller:
                                    //                     userreviewcontroller
                                    //                         .ratingController,
                                    //                 decoration: InputDecoration(
                                    //                   hintText: 'Rating',
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //           actions: <Widget>[
                                    //             TextButton(
                                    //               child: Text('Cancel'),
                                    //               onPressed: () {
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //             ),
                                    //             TextButton(
                                    //               child: Text('OK'),
                                    //               onPressed: () async {
                                    //             //   userreviewcontroller.reviewAdd(orderdetailscontroller, (myordercontroller.orderdetailsModel!
                                    //             //     .data![0].orderId ??
                                    //             // 0));
                                    //                 await userreviewcontroller
                                    //                     .reviewinit();
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //             ),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    //   child: RatingStars(
                                    //     value: userreviewcontroller.value!,
                                    //     // onValueChanged: (v) {
                                    //     //   //
                                    //     //   setState(() {
                                    //     //     value = v;
                                    //     //   });
                                    //     // },
                                    //     starBuilder: (index, color) => Icon(
                                    //       Icons.star,
                                    //       color: color,
                                    //       size: 15,
                                    //     ),
                                    //     starCount: 5,
                                    //     starSize: 20,
                                    //     // valueLabelColor: const Color(0xff9b9b9b),
                                    //     // valueLabelTextStyle: const TextStyle(
                                    //     //     color: Colors.white,
                                    //     //     fontWeight: FontWeight.w400,
                                    //     //     fontStyle: FontStyle.normal,
                                    //     //     fontSize: 12.0),
                                    //     // valueLabelRadius: 10,
                                    //     maxValue:5,
                                    //     starSpacing: 0.5,
                                    //     maxValueVisibility: true,
                                    //     valueLabelVisibility: false,
                                    //     animationDuration:
                                    //         Duration(milliseconds: 5000),
                                    //     // valueLabelPadding:
                                    //     //     const EdgeInsets.symmetric(
                                    //     //         vertical: 1, horizontal: 8),
                                    //     // valueLabelMargin:
                                    //     //     const EdgeInsets.only(right: 8),
                                    //     starOffColor: const Color(0xffe7e8ea),
                                    //     starColor: MyColors.yellow,
                                    //   ),
                                    // );
                                  }),

                                ],
                              ),


                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              InkWell(
                                onTap: () async{
                                  // Get.to(MyPetDetails());
    OrderTrackerUserController ordertrackusercontroller = Get.put(OrderTrackerUserController());

                                    ordertrackusercontroller
                                        .updateOrder(widget.orderId ?? 0);
                                    await ordertrackusercontroller.init();
                                  Get.to(LocationPickerMapUser());
                                },
                                child: Center(
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width*0.8,

                                    height: MediaQuery.of(context).size.height *
                                        0.08,

                                    decoration: BoxDecoration(
                                        color: MyColors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(25)),

                                    child: Center(
                                        child: Text(
                                      "Track order",
                                      style: CustomTextStyle.mediumtextreem,
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                            ],
                          );
                  })),
        ),

        GetBuilder<MyOrderController>(
            init: myordercontroller,
            builder: (_) {
              return myordercontroller.showLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.1), // Adjust the opacity as needed
                      ),
                    )
                  : SizedBox();
            }),
        // Progress bar
        GetBuilder<MyOrderController>(
            init: myordercontroller,
            builder: (_) {
              return myordercontroller.showLoading
                  ? Center(
                      child: SpinKitCircle(
                        color: Colors.white, // Color of the progress bar
                        size: 50.0, // Size of the progress bar
                      ),
                    )
                  : SizedBox();
            }),
      ],
    );
  }
  String calculateTotal() {
    double total = double.parse(myordercontroller.total1.toString());
    double deliveryCharge = double.parse(widget.deliverycharge?.toString() ?? '0');
    double couponDiscount = double.parse(widget.coupondisAmount?.toString() ?? '0.0');

    double finalTotal = (total + deliveryCharge) - couponDiscount;

    // Convert the final total to integer and then back to string
    return finalTotal.toInt().toString();
  }
}
