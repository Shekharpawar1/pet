

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/wholeLocationController.dart';
import 'package:pet/models/wholesalerModel/myOrderModel.dart';
import 'package:pet/models/wholesalerModel/orderDetailsModel.dart';

import 'package:http/http.dart' as http;

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeMyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;
var wholesalerId;
 String? walletBalance = "0";
 
int? orderID;
String? selectedImagePath;
final WholeLocationController controller  = WholeLocationController();
 String? variantsname;
double total1  = 0.0;
bool isButtonEnabled = true;
 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    wholesalerId = storage.read('wholesalerid');
  }

  void disablebutton(bool button) {
    isButtonEnabled = button;
    update();
    print("isButtonEnabled${isButtonEnabled}");
  }

  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

 void updateWalletBalance() {
    double totalWalletAmount = 0.0;

    for(var element in wholemyorderModel!.data!){
      if (element.callback![0].userProfile![0].walletBalance != null) {
        totalWalletAmount += double.parse(element.callback![0].userProfile![0].walletBalance??'0.0');
      }
    }

    walletBalance = totalWalletAmount.toStringAsFixed(2);
    print("WalletBalance===>${walletBalance}");
  }
 void clearFields() {
      total1 = 0;
         
    print("Data cleared...");
    update();
  }
   
String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  WholeMyOrderModel? wholemyorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  WholeOrderDetailsModel? wholeorderdetailsModel;
  // bool orderdetailsLoaded = false;

  Future<void> init() async {
   showLoading = true;
    // update();
    try {
      // myorder
      wholemyorderModel = WholeMyOrderModel.fromJson(
          await ApiHelper.getApi(getMyOrderUrl+"${storage.read('wholesalerid')}"));
      print(wholemyorderModel);
       print(getMyOrderUrl+"${storage.read('wholesalerid')}");
       orderLoaded = true;

      //  updateWalletBalance();
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
      wholeorderdetailsModel = WholeOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
          
           variantsname = wholeorderdetailsModel!.data!.map((e) => e.variant).toString();
      print(wholeorderdetailsModel);
       print("OrderDetils "+getMyOrderDetailsUrl+"${orderID}");

 wholeorderdetailsModel?.data?.forEach((element) {
  String priceString = element.price.toString();
  String itemtax = element.taxAmount.toString();
  String itemdiscount = element.discountOnItem.toString();

  try {
 total1 += double.parse(priceString.toString());
    double taxxx = double.parse(itemtax);
    double itemdis = double.parse(itemdiscount);
    // total1 += price.toInt();
    // discount = itemdis.toInt();
    // tax += taxxx.toInt();
    // print("totaltax");
    // print(tax);
   // Accumulate the prices
  } catch (e) {
    print("Error parsing price: $e");
  }
});

      
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
 
    Future<void> cancelorderinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": storage.read('wholesalerid').toString(),
      "order_id":orderID.toString(),
      "canceled":controller.selectedValue.toString(),
     
     
    };
    String cancelorderURl = Constants.CANCELORDER_URL;
   print(body);
    try {
    //   List documentList = [
    //     {'value': selectedImagePath, 'key': "image"},
    //   ];
      var request = http.MultipartRequest('POST', Uri.parse(cancelorderURl+"${orderID}"));
      request.fields.addAll(body);
      // documentList.forEach((element) async {
      //   request.files.add(await http.MultipartFile.fromPath(
      //       element["key"], element["value"]));
      // });
  var  response =   await ApiHelper.postFormData(request: request);
    print("CancelOrder==>");
      // print(documentList);
      // if(response.)
     
isButtonEnabled = false;
print("EnableButton ${isButtonEnabled}");
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Cancel order Successfully',
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
      "customer_reason": controller.selectedReason.toString(),
      "customer_note" : controller.selectedReason.toString(),
      
     
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

  // Future<void> orderdetailsinit() async {
  //  showLoading = true;
  //   update();
  //   try {
  //     // myorder
  //     wholeorderdetailsModel = WholeOrderDetailsModel.fromJson(
  //         await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
  //     print(wholeorderdetailsModel);
  //      print(getMyOrderDetailsUrl+"${orderID}");

       
  //     // orderLoaded = true;
  //     update();
  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'An error occurred: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  //   showLoading = false;
  //   update();
  //   }
 
}