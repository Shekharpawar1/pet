import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/models/salesmanModel/orderDetailsModel.dart';
import 'package:pet/models/salesmanModel/totalOrderSellerModel.dart';
import 'package:pet/models/salesmanModel/totalWholeSellerModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
class DashBoardController extends GetxController{
  final storage = GetStorage();
var sellerId = GetStorage().read("sellerid");

        SalesMyCartController mycartController = Get.put(SalesMyCartController());
  NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
var sellerZoneID = GetStorage().read("sellerZoneId");
  bool showLoading = false;
int? orderID;
var wholesalerid;
var totalAmount;
//Totalwholeseller
String? paymentstatus;
int? orderAmount;

 void updateOrder(int id, int amount) {
    orderID = id;
     orderAmount = amount;
    update();
    print("orderID${orderID}");
  }
void updateAmountStatus(String status) {
    paymentstatus = status;
     
    update();
    print("status${paymentstatus}");
  }
  String getWholeSellerUrl = '${Constants.GET_WHOLESELLER_TOTAL}';
 TotalWholeSellerModel? total1wholesellerModel;
  bool wholetotalorderLoaded = false;

//TotalOrderseller
  String getTotalOrderSellerUrl = '${Constants.GET_TOTALSELLER_ORDER}';
 TotalOrderSellerModel? totalordersellerModel;
  bool sellertotalorderLoaded = false;
  
  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  SalesOrderDetailsModel? salesorderdetailsModel;
@override
  void onInit() {
    super.onInit();
    init();
    sellerinit();
   orderdetailsinit();
   notificationsalescontroller.notifyinit();
      mycartController.init();
    // var  sellerId = storage.read('wholesalerid');
    var  sellerzoneId = storage.read('sellerZoneId');

     print("SellerID${sellerId}");
  }


  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

  Future<void> init() async {
      showLoading = true;
    update();

try {
      // Totalorder
      total1wholesellerModel = TotalWholeSellerModel.fromJson(
          await ApiHelper.getApi(getWholeSellerUrl + "${storage.read('sellerZoneId')}"));
      print("WholeSellerUrl ==> ${getWholeSellerUrl + "${storage.read('sellerZoneId')}"}");
     
      wholetotalorderLoaded = true;
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


  Future<void> sellerinit() async {
      showLoading = true;
    update();
     
 // TotalorderSeller
    try {
     
      totalordersellerModel = TotalOrderSellerModel.fromJson(
          await ApiHelper.getApi(getTotalOrderSellerUrl + "${storage.read("sellerid")}"));
      print("SAlesWholeSellerUrl ==> ${getTotalOrderSellerUrl + "${storage.read("sellerid")}"}");
      sellertotalorderLoaded = true;


  totalAmount = 0;

    totalordersellerModel!.data!.forEach((e) {
      if (e.paymentStatus == "unpaid") {
        try {
      double orderAmount = double.parse(e.orderAmount ?? "0.00");
      totalAmount += orderAmount;
    } catch (e) {
      
      print("Error parsing orderAmount: $e");
    }
      }
    });
 print("Total unpaid amount: $totalAmount");
      update();
      print("paymentstatus");
      // update();

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
      print(salesorderdetailsModel);
       print(getMyOrderDetailsUrl+"${orderID}");
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
 
  
  
  
Future<void> saleswalletinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": storage.read('wholesalerId').toString(),
      "order_id": orderID.toString(),
      "amount": orderAmount.toString(),
      "pay_mode": paymentstatus.toString()
     
     
    };
    String walletURl = Constants.SALES_WALLET_URL;
   print(body);
    try {
   
      var request = http.MultipartRequest('POST', Uri.parse(walletURl));
      request.fields.addAll(body);
    print(walletURl);
  var  response =   await ApiHelper.postFormData(request: request);
    print("Wallet==>${response}");
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Wallet Successfully',
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