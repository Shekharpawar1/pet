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
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/order_tracker_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholereview_controller.dart';
import 'package:pet/screens/wholesaler/locationScreenWhole.dart';
import 'package:pet/screens/wholesaler/locationScreenWholesaler.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/pdfView.dart';
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
      this.delivered,this.username,this.usernumber,
      this.lastname
      
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
  String? username;
  String? usernumber;
  String? lastname;

  @override
  State<OrderDetailswhole> createState() => _OrderDetailswholeState();
}

class _OrderDetailswholeState extends State<OrderDetailswhole> {
  WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
  final WholeReviewController wholereviewcontroller =
      Get.put(WholeReviewController());
      DateTime initialDate = DateTime.now();
  final storage = GetStorage();


  
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
                                           wholemyordercontroller.wholeorderdetailsModel!.data![0].price??'',
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
                                          wholemyordercontroller.wholeorderdetailsModel!.data![0].taxAmount??'',
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
                                            wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].discountOnItem ??
                                                '',
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
                                      // style: CustomTextStyle.popinssmall014,
                                    ),
                                     pw.Text(
                                      (widget.orderAmount ?? '0.0').toString(),
                                      // style: CustomTextStyle.popinssmall014,
                                    ),
                                  ],
                                                              ),
                                   pw. Divider(
                                          thickness: 1, ),
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
    final fileName = 'invoice.pdf';

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
        builder: (context) => WholePDFScreen(
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
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].variant ??
                                                0)
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
    // Save the PDF to a file
    // final outputFile = File('path/to/output.pdf');
    //  outputFile.writeAsBytes(await pdf.save());

    //   final pdfBytes = await pdf.save();
    //   final fileName = 'invoice.pdf';

    final pdfBytessummary = await summarypdf.save();
    final fileNamesummary = 'ordersummary.pdf';

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
        builder: (context) => WholePDFScreen(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          //  appBar: CustomAppBarWholeback(),
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
                      Get.to(NotificationWhole());
                    },
                    child: Center(
                      child: Icon(Icons.notifications, color: MyColors.black),
                    )),
                Positioned(
                    top: 10.0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
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
//             Stack(
//               children: [
//                 InkWell(
//                     onTap: () {
//                       Get.to(AddToCardwhole());
//                     },
//                     child: Center(
//                         child: SvgPicture.asset("assets/image/bag.svg"))),

// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//                 Positioned(
//                     top: 10.0,
//                     right: 0,
//                     child: Stack(
//                       children: <Widget>[
//                         Icon(Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                         Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child: Center(
//                               child: Text(
//                                 ('5').toString(),
//                                 // list.length.toString(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                       ],
//                     )),
//               ],
//             ),
//             SizedBox(
//               width: 20,
//             )
            // InkWell(
            //     onTap: () {
            //       Get.to(NotificationWhole());
            //     },
            //     child: SvgPicture.asset("assets/image/notification.svg")),
          ],
        ),
      
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
                                 wholereviewcontroller.reviewAdd(
                                        item.id ?? 0,
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                .data![0].orderId ??
                                            0));
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
                                            Text(
                                              item.variant ?? '',
                                              style:
                                                  CustomTextStyle.popinsmedium,
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
                                                  item.totalAddOnPrice ?? '',
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),
                                              ],
                                            )
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
                                           "₹"+(wholemyordercontroller.wholeorderdetailsModel!.data![0].totalAddOnPrice??''),
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
                                                "Tax Amount",
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
                                          "+ ₹"+ (wholemyordercontroller.wholeorderdetailsModel!.data![0].taxAmount??''),
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
                                            "- ₹"+(wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].discountOnItem ??
                                                ''),
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
                                     ( (double.parse(wholemyordercontroller.wholeorderdetailsModel!.data![0].totalAddOnPrice!)+ double.parse(wholemyordercontroller.wholeorderdetailsModel!.data![0].taxAmount!)) - double.parse(wholemyordercontroller.wholeorderdetailsModel!.data![0].discountOnItem!)).toString(),
                                      // "₹"+(widget.orderAmount ?? '0.0').toString(),
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
                                        (wholemyordercontroller.wholeorderdetailsModel!
                                                    .data![0].variant ??
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

                                
//                                 Row(children: [
//                                   Container(
//                                       width: 134,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               Color(0xFFCEE8FC),
//                                               Color.fromRGBO(206, 232, 252, 0.00),
//                                             ],
//                                           ),
//                                           borderRadius: BorderRadius.circular(37)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           children: [
//                                             Image.asset("assets/image/file.png"),
//                                             SizedBox(
//                                               width: 3,
//                                             ),
//                                             Text(
//                                               "download invoice",
//                                               style: CustomTextStyle.popinssmall01,
//                                             )
//                                           ],
//                                         ),
//                                       )),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Container(
//                                       width: 147,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               Color(0xFFFBF1C8),
//                                               Color.fromRGBO(251, 241, 200, 0.00),
//                                             ],
//                                           ),
//                                           borderRadius: BorderRadius.circular(37)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           children: [
//                                             Image.asset("assets/image/file.png"),
//                                             SizedBox(
//                                               width: 3,
//                                             ),
//                                             Text(
//                                               "download summary",
//                                               style: CustomTextStyle.popinssmall01,
//                                             )
//                                           ],
//                                         ),
//                                       ))
//                                 ]),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.03),
//                                 Container(
//                                   width: 335,
//                                   // height: 300,
//                                   decoration: BoxDecoration(
//                                       color: MyColors.white,
//                                       borderRadius: BorderRadius.circular(21)),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Align(
//                                             alignment: Alignment.topRight,
//                                             child: Container(
//                                               //alignment: Alignment.topRight,
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.05,
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.3,
//                                               decoration: BoxDecoration(
//                                                   color: MyColors.yellow,
//                                                   borderRadius: BorderRadius.only(
//                                                       topRight: Radius.circular(25),
//                                                       bottomLeft:
//                                                           Radius.circular(20))),
//                                               child: Center(
//                                                   child: Text(
//                                                 widget.orderstatus.toString(),
//                                                 style: CustomTextStyle
//                                                     .popinstextsmall12,
//                                               )),
//                                             ),
//                                           ),
//                                         ],
//                                       ),

//                                       ListView.builder(
//                                           primary: false,
//                                           shrinkWrap: true,
//                                           itemCount: wholemyordercontroller
//                                               .wholeorderdetailsModel!.data!.length,
//                                           itemBuilder: (context, index) {
//                                             var item = wholemyordercontroller
//                                                 .wholeorderdetailsModel!
//                                                 .data![index];
//                                             String imagePath = Constants
//                                                     .PRODUCT_HOME_IMAGE_PATH +
//                                                 "/${item.itemDetails![0].image ?? ''}";
// //  wholereviewcontroller.reviewAdd(item.id??0, (wholemyordercontroller.wholeorderdetailsModel!
// //                                                         .data![0].orderId ??
// //                                                     0));
//                                             print("====>>>>imagepath ${imagePath}");
//                                             return Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   vertical: 10),
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.15,
//                                               width:
//                                                   MediaQuery.of(context).size.width,
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       color: MyColors.grey,
//                                                       width: 0.5),
//                                                   borderRadius:
//                                                       BorderRadius.circular(25),
//                                                   color: MyColors.white),
//                                               child: Row(children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(15.0),
//                                                   child: CachedNetworkImage(
//                                                     imageUrl: imagePath,
//                                                     fit: BoxFit.cover,
//                                                     // width: 61,
//                                                     // height: 75,
//                                                     placeholder: (context, url) =>
//                                                         Center(
//                                                       child:
//                                                           CircularProgressIndicator(),
//                                                     ), // Replace with your own placeholder widget
//                                                     errorWidget: (context, url,
//                                                             error) =>
//                                                         Icon(Icons
//                                                             .error), // Replace with your own error widget
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       item.variant ?? '',
//                                                       style: CustomTextStyle
//                                                           .popinsmedium,
//                                                     ),
//                                                     Text(item.discountType ?? '',
//                                                         style: CustomTextStyle
//                                                             .popinssmall0),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           item.totalAddOnPrice ??
//                                                               '',
//                                                           style: CustomTextStyle
//                                                               .popinsmedium,
//                                                         ),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ]),
//                                             );
//                                           }),

//                                       SizedBox(
//                                           height:
//                                               MediaQuery.of(context).size.height *
//                                                   0.05),

// //                       Padding(
// //                         padding: const EdgeInsets.all(10.0),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Order ID:12568",
// //                               style: CustomTextStyle.popinssmall014,
// //                             ),
// //                             SizedBox(
// //                               height: 5,
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "1 X Food bowl",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "2 X Food Food 5 kg",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),

// //                             Divider(
// //                               indent: 1,
// //                               thickness: 1,
// //                             ),

// //                             Text(
// //                               "Order ID:12568",
// //                               style: CustomTextStyle.popinssmall014,
// //                             ),
// //                             SizedBox(
// //                               height: 5,
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "1 X Food bowl",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "2 X Food Food 5 kg",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),

// //                             Divider(
// //                               indent: 1,
// //                               thickness: 1,
// //                             ),
// //                             Text(
// //                               "Order ID:12568",
// //                               style: CustomTextStyle.popinssmall014,
// //                             ),
// //                             SizedBox(
// //                               height: 5,
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "1 X Food bowl",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   "2 X Food Food 5 kg",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                                 Text(
// //                                   "\$138.00",
// //                                   style: CustomTextStyle.popinssmallnormal,
// //                                 ),
// //                               ],
// //                             ),

// // // Divider(indent: 1,thickness: 1,)
// //                           ],
// //                         ),
// //                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.03),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Sub Total",
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                     Text(
//                                       "\$50",
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(
//                                   indent: 1,
//                                   thickness: 1,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Moving Cart",
//                                           style: CustomTextStyle.popinssmall014,
//                                         ),
//                                         Text(
//                                           "Additional Services",
//                                           style: CustomTextStyle.popinssmallnormal,
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "\$20",
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(
//                                   indent: 1,
//                                   thickness: 1,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Discount",
//                                           style: CustomTextStyle.popinssmall014,
//                                         ),
//                                         Text(
//                                           "Promo Code: " +
//                                               widget.couponcode.toString(),
//                                           style: CustomTextStyle.popinssmallnormal,
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       wholemyordercontroller.wholeorderdetailsModel!
//                                               .data![0].discountOnItem ??
//                                           '',
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(
//                                   indent: 1,
//                                   thickness: 1,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Total",
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                     Text(
//                                       "\$138.00",
//                                       style: CustomTextStyle.popinssmall014,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.03),
//                                 Text(
//                                   "Order Details",
//                                   style: CustomTextStyle.popinssmall014,
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.01),
//                                 Text(
//                                   "Order Number",
//                                   style: CustomTextStyle.popinsboldlight,
//                                 ),
//                                 Text(
//                                   (wholemyordercontroller.wholeorderdetailsModel!
//                                               .data![0].orderId ??
//                                           0)
//                                       .toString(),
//                                   style: CustomTextStyle.popinsboldlightsmall,
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.02),
//                                 Text(
//                                   "Payment",
//                                   style: CustomTextStyle.popinsboldlight,
//                                 ),
//                                 Text(
//                                   "Paid:" + widget.paymentmethod.toString(),
//                                   style: CustomTextStyle.popinsboldlightsmall,
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.02),
//                                 Text(
//                                   "Date",
//                                   style: CustomTextStyle.popinsboldlight,
//                                 ),
//                                 Text(
//                                   "10 Feb 2023  10:20 AM",
//                                   style: CustomTextStyle.popinsboldlightsmall,
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.02),
//                                 Text(
//                                   "Phone Number",
//                                   style: CustomTextStyle.popinsboldlight,
//                                 ),
//                                 Text(
//                                   "10 Feb 2023  10:20 AM",
//                                   style: CustomTextStyle.popinsboldlightsmall,
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height * 0.02),
//                                 Text(
//                                   "Deliver To",
//                                   style: CustomTextStyle.popinsboldlight,
//                                 ),
//                                 Text(
//                                   "10 Feb 2023  10:20 AM",
//                                   style: CustomTextStyle.popinsboldlightsmall,
//                                 ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.05),
                                        SizedBox(height: 15,),
                               Text(
                                          "Product Review",
                                          style: CustomTextStyle.popinstext,
                                        ),
                                
                                            GetBuilder<WholeReviewController>(
                                      init: wholereviewcontroller,
                                      builder: (_) {
                        return
                        wholereviewcontroller.wholeReviewModel == null &&
                                wholereviewcontroller.wholeReviewModel!.data == null 
                                // userreviewcontroller.userReviewModel!.data!.isEmpty
                            ?  SizedBox():
                                        
                                         ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount:   wholereviewcontroller.wholeReviewModel!.data!.length??0,
                                      itemBuilder: (context, index) {
                                        var item =    wholereviewcontroller.wholeReviewModel!.data![index];
                                
                                       
                                        return
                                        
                                           
                                         Column(
                                           children: [
                                              ...item.userId!.map((e) {
                                             print("NameReviewer ${e.fName}");
                                    return 
                                             Container(
                                              margin:
                                                  EdgeInsets.symmetric(vertical: 10),
                                              // height:
                                              //     MediaQuery.of(context).size.height *
                                              //         0.18,
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
                                                         Text(
                                                        "${e.fName} ${e.lName}",
                                                        style:
                                                            CustomTextStyle.popinsmedium,
                                                      ),
                                                      Text(
                                                        item.comment ?? '',
                                                        style:
                                                            CustomTextStyle.popinsmedium,
                                                      ),

                                                  
                                                
                                                                                   InkWell(
                                                                                      onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            // title:
                                                            content: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
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
                                                            actions: <Widget>[
                                                            
                                                              TextButton(
                                                                child: Text('Submit'),
                                                                onPressed: () async {
                                                              //   userreviewcontroller.reviewAdd(orderdetailscontroller, (myordercontroller.orderdetailsModel!
                                                              //     .data![0].orderId ??
                                                              // 0));
                                                                  await wholereviewcontroller
                                                                      .reviewinit();
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ],
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
                                                    value:( item.rating??0).toDouble(),
                                                  // onValueChanged: (v) {
                                                  //   //
                                                  //   setState(() {
                                                  //     value = v;
                                                  //   });
                                                  // },
                                                  starBuilder: (index, color) => Icon(
                                                    Icons.star,
                                                    color: color,
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
                                                   maxValue:5,
                                                  starSpacing: 0.5,
                                                  maxValueVisibility: true,
                                                  valueLabelVisibility: false,
                                                  animationDuration:
                                                          Duration(milliseconds: 5000),
                                                  // valueLabelPadding:
                                                  //     const EdgeInsets.symmetric(
                                                  //         vertical: 1, horizontal: 8),
                                                  // valueLabelMargin:
                                                  //     const EdgeInsets.only(right: 8),
                                                  starOffColor: const Color(0xffe7e8ea),
                                                  starColor: MyColors.yellow,
                                                         ),
                                                        //  }),
                                                                                  
                                                                                  
                                                                                    )
                                                       
                                                                                  
                                                      ],
                                                  ),
                                                )
                                             
                                        );
                                         })    ],
                                         );
                                     
                                       
                                       
                                        });

                                        
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
                                                Text("${widget.username} ${widget.lastname}"
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
                                                  // child:Center(child: Text("05"))
                                                )
                                              ],
                                            ),

                                            // Row(children: [
                                            // SvgPicture.asset("assets/image/yellowstar.svg"),
                                            // SizedBox(width: 5,),
                                            // SvgPicture.asset("assets/image/yellowstar.svg"),
                                            // SizedBox(width: 5,),
                                            // SvgPicture.asset("assets/image/yellowstar.svg"),
                                            // SizedBox(width: 5,),
                                            // SvgPicture.asset("assets/image/yellowstar.svg"),
                                            // SizedBox(width: 5,),
                                            // SvgPicture.asset("assets/image/yellowstar.svg"),
                                            // SizedBox(width: 5,),
                                            // Text("4.5")
                                            // ],)

                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                            widget.usernumber??'',
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
