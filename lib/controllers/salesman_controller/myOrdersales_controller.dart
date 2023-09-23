

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/salesmanModel/mysalesOrderModel.dart';
import 'package:pet/models/salesmanModel/orderDetailsModel.dart';


 import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SalesMyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;
var wholesalerId;
int? orderID;


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

  void addorder(int id) {
    orderID = id;
    update();
    print("orderIDSales${orderID}");
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
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
      print(salesorderdetailsModel);
       print(getMyOrderDetailsUrl+"${orderID}");
      // orderLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
}