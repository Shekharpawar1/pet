

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/myOrderModel.dart';
import 'package:pet/models/usersModel/orderDetailsModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class MyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;
var userId;
int? orderID;
  String? selectedImagePath;
var total;

 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    userId = storage.read('id');
  }


  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }


   
String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  MyOrderModel? myorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  OrderDetailsModel? orderdetailsModel;
  // bool orderdetailsLoaded = false;

  Future<void> init() async {
   showLoading = true;
    // update();
    try {
      // myorder
      myorderModel = MyOrderModel.fromJson(
          await ApiHelper.getApi(getMyOrderUrl+"${storage.read('id')}"));
      print(myorderModel);
       print(getMyOrderUrl+"${storage.read('id')}");
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
      orderdetailsModel = OrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(orderdetailsModel);
       print("OrderDetils "+getMyOrderDetailsUrl+"${orderID}");
      // orderLoaded = true;

      
  //       void updateTotal() {
  //   total = 0;

  //   orderdetailsModel!.data!.forEach((element) {
  //     String priceString = element.totalAddOnPrice.toString();

  //     try {
  //       double price = double.parse(priceString);
  //       // int sizeIndex = orderdetailsModel!.data!.indexOf(element) ?? 0;
  //        int size = element.quantity??0;

  //       total +=
  //           (price * size).toInt(); // Convert the final value to an integer
  //     } catch (e) {
  //       print("Error parsing price: $e");
  //     }
  //   });

  //   print("TotalOrderdeailsPrice: $total");
  // }
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
 

   
Future<void> Reorderinit() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
      "user_id": userId.toString(),
      "order_id":orderID.toString(),
      "refund_method":"cash",
      "customer_reason": "lk mnnnnn",
      "customer_note" : "ggggsg"
      
     
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


  // Future<void> downloadInvoice() async {
  //   // Get the documents directory
  //   final directory = await getExternalStorageDirectory();
  //   // Define the file path and name for your invoice
  //   final filePath = '${directory.path}/invoice.pdf';

  //   // Generate or fetch the invoice content here and save it to the file
  //   // For example, you can use a PDF generation library like pdf or generate an image

  //   // Simulate generating an invoice PDF (replace this with your actual logic)
  //   final invoiceContent = 'Invoice content goes here';

  //   final file = File(filePath);
  //   await file.writeAsString(invoiceContent);

  //   // Show a snackbar or notification to inform the user that the download is complete
  //   // You can also provide a button to open the downloaded invoice
  // }


}