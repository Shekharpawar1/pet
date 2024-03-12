

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/salesLocationController.dart';
import 'package:pet/models/salesmanModel/mysalesOrderModel.dart';
import 'package:pet/models/salesmanModel/orderDetailsModel.dart';


 import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:pdf/widgets.dart' as pw;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SalesMyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;

 String? variantsname;
var wholesalerId;
int? orderID;
  String? selectedImagePath;
bool isButtonEnabled = true;

final SalesLocationController salesLocationController  = SalesLocationController();
int total1  = 0;
int tax = 0;
int discount = 0;
 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    // wholesalerId = storage.read('wholesalerid');
    // print("wholesalerIdMYORDER  ${wholesalerId}");
  }
fethUserId() {
  
     wholesalerId = storage.read('wholesalerId');
     print("WholeSellerID ==>${wholesalerId}");
       print("SellerID ==>${wholesalerId}");
}

  void clearFields() {
      total1 = 0;
         
    print("Data cleared...");
    update();
  }
  @override
  void onClose() {
    print("closing...");
  clearFields();
    super.onClose();
  }

  void addorder(int id) {
    orderID = id;
    update();
    print("orderIDSales${orderID}");
  }


   
  void disablebutton(bool button) {
    isButtonEnabled = button;
    update();
    print("isButtonEnabled${isButtonEnabled}");
  }

String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  SalesMyOrderModel? salesmyorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  SalesOrderDetailsModel? salesorderdetailsModel;
  // bool orderdetailsLoaded = false;

  Future<void> init() async {
   showLoading = true;
    // update();
    try {
      // myorder
      salesmyorderModel = SalesMyOrderModel.fromJson(
          await ApiHelper.getApi(getMyOrderUrl+"${storage.read('wholesalerId')}"));
      print(salesmyorderModel);
       print("MYORDERUrl"+getMyOrderUrl+"${storage.read('wholesalerId')}");
       orderLoaded = true;

     
     
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    showLoading = false;
    update();
    }


    
  Future<void> orderdetailsinit() async {
   showLoading = true;
    update();
    try {
      // myorder
      salesorderdetailsModel = SalesOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
                     variantsname = salesorderdetailsModel!.data!.map((e) => e.variant).toString();

      print(salesorderdetailsModel);
       print("OrderDetailsSalesUrl "+getMyOrderDetailsUrl+"${orderID}");

         salesorderdetailsModel?.data?.forEach((element) {
  String priceString = element.price.toString();
  String itemtax = element.taxAmount.toString();
  String itemdiscount = element.discountOnItem.toString();

  try {
    double price = double.parse(priceString);
    double taxxx = double.parse(itemtax);
    double itemdis = double.parse(itemdiscount);
    total1 += price.toInt();
    discount = itemdis.toInt();
    tax += taxxx.toInt();
    print("totaltax");
    print(tax);
  } catch (e) {
    print("Error parsing price: $e");
  }
});

      // orderLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    showLoading = false;
    update();
    }
 




Future<void> downloadInvoice() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final file = File('example.pdf');
  await file.writeAsBytes(await pdf.save());
}

Future<void> cancelorderinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": storage.read('wholesalerId').toString(),
      "order_id":orderID.toString(),
      "canceled":salesLocationController.selectedReason.toString(),
     
     
    };
    String cancelorderURl = Constants.CANCELORDER_URL;
   print(body);
    try {
 
      var request = http.MultipartRequest('POST', Uri.parse(cancelorderURl+"${orderID}"));
      request.fields.addAll(body);
     
  var  response =   await ApiHelper.postFormData(request: request);
    print("CancelOrder==>");
      // print(documentList);
      // if(response.)
     
isButtonEnabled = true;

      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Cancel Order Successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    showLoading = false;
    update();
  }


Future<void> reorderinit() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
      "user_id": wholesalerId.toString(),
      "order_id":orderID.toString(),
      "refund_method":"cash",
      "customer_reason": salesLocationController.selectedReason.toString(),
      "customer_note" : salesLocationController.selectedReason.toString(),
      
     
    };
    String RefundURl = Constants.REFUND_URL;
   print(body);
    try {
      List documentList = [
        {'value': selectedImagePath, 'key': "image"},
      ];
      var request = http.MultipartRequest('POST', Uri.parse(RefundURl));
      request.fields.addAll(body);
      documentList.forEach((element) async {
        request.files.add(await http.MultipartFile.fromPath(
            element["key"], element["value"]));
      });
      await ApiHelper.postFormData(request: request);
   print("ReOrder==>");
    isButtonEnabled = false;
      print(documentList);
      print(body);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'ReOrder Successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    showLoading = false;
    update();
  }

}