

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/notification_controller.dart';
import 'package:pet/models/wholesalerModel/totalordermodel.dart';
import 'package:pet/screens/wholesaler/balance.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class WholeTotalOrderController extends GetxController{
var wholesalerId = GetStorage().read("wholesalerid");
WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());
        MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
  bool showLoading = false;
int? orderID ;
String? paymentstatus;
int? orderAmount;
//Totalorder
  String getTotalOrderUrl = '${Constants.GET_WHOLE_TOTALORDER}';
 WholeTotalOrderModel? wholetotalorderModel;
  bool totalorderLoaded = false;
var  totalAmount;
@override
  void onInit() {
    super.onInit();
    init();
        wholenotificationcontroller.notifyinit();
      mycartwholeController.init();
  }


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


  Future<void> init() async {
      showLoading = true;
    update();

try {
      
      wholetotalorderModel = WholeTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderUrl + "${wholesalerId}"));
      print("TotalOrderURL ==> ${getTotalOrderUrl + "${wholesalerId}"}");
      totalorderLoaded = true;
                 totalAmount = 0;

    wholetotalorderModel!.data!.forEach((e) {
      if (e.paymentStatus == "unpaid") {
        // totalAmount += int.parse(e.orderAmount ?? "0").toInt();
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






  
Future<void> walletinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": wholesalerId.toString(),
      "order_id":orderID.toString(),
      "amount":orderAmount.toString(),
      "pay_mode":paymentstatus.toString()
     
     
    };
    String walletURl = Constants.WALLET_URL;
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