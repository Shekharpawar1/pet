

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/userLocationController.dart';
import 'package:pet/models/usersModel/myOrderModel.dart';
import 'package:pet/models/usersModel/orderDetailsModel.dart';
import 'package:pet/models/usersModel/DeliveryAddressModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class MyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;  
bool isButtonEnabled = true;
 RxString address=''.obs;
var imagereorder;
String? cleanedImageUrl;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
final UserLocationController controller = Get.put(UserLocationController());
var userId;
int? orderID;
double total1  = 0.00;
int tax = 0;
RxString billingAddress=''.obs;
int discount = 0;
int qutyy= 0;
String?  variantsname;
  String? selectedImagePath;
double total =0.00;
var cancelmessage;
List<String> imageUrls = [] ;
 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    userId = storage.read('id');

  }


 void orderdetailsupdateTotal() {
   
    showLoading = false;
    update();

    print("TotalOrderdetails: $total1");
  }
  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

  void disablebutton(bool button) {
    isButtonEnabled = button;
    update();
    print("isButtonEnabled${isButtonEnabled}");
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
String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  MyOrderModel? myorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  OrderDetailsModel? orderdetailsModel;
  // bool orderdetailsLoaded = false;


  String getDeliveryAddress='${Constants.GET_DELIVERY_ADDRESS}';
   DeliveryAddressModel? deliveryAddressModel;



   Future<void>getDeliveryAddress1(String addressid) async {
     try{
       print("deliveryAddress${getDeliveryAddress+"${addressid}"}");
       deliveryAddressModel = DeliveryAddressModel.fromJson(
           await ApiHelper.getApi(getDeliveryAddress+"${addressid}"));
       address.value=
           "${deliveryAddressModel!.data![0].houseNo},${deliveryAddressModel!.data![0].area} ,${deliveryAddressModel!.data![0].landmark} , ${deliveryAddressModel!.data![0].city}, ${deliveryAddressModel!.data![0].state}-${deliveryAddressModel!.data![0].pincode}";
     print("deliverydetailsAddress${deliveryAddressModel!.data![0].houseNo}");

     billingAddress.value= storage.read("useraddress");
     // print(getMyOrderUrl+"${storage.read('id')}");
     }
     catch(err){
       print(err);
     }
   }
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
      orderdetailsModel = OrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));

           variantsname = orderdetailsModel!.data!.map((e) => e.variant).toString();

      print(orderdetailsModel);
       print("OrderDetilsgst ${variantsname}");
       print("OrderDetils "+getMyOrderDetailsUrl+"${orderID}");

   imageUrls = orderdetailsModel!.data!.expand((e) =>
    e.itemDetails!.map((ele) => ele.image!.replaceAll(RegExp(r'[()]'), ''))
).toList();


print("iseddnn${imageUrls}");


 orderdetailsModel?.data?.forEach((element) {
  String priceString = element.price.toString();
  String itemtax = element.taxAmount.toString();
  String itemdiscount = element.discountOnItem.toString();
String qty = element.quantity.toString();
imagereorder =element.itemDetails!.map((e) => e.image!.replaceAll(RegExp(r'[()]'), ''));
String imageUrl = "(2023-11-25-6561fa43adb35.png)";
 cleanedImageUrl = imageUrl.replaceAll(RegExp(r'[()]'), '');

print("Image without parentheses: $cleanedImageUrl");
print("Imagessd**d${imagereorder}");  
  try {
   total1 += double.parse(priceString.toString());
discount = double.parse(itemdiscount.toString()).toInt();
tax += double.parse(itemtax.toString()).toInt();
qutyy += double.parse(qty.toString()).toInt();

            
    print("totaltax");
    print("Pricerrrrrr${total}");
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
 

   
Future<void> reorderinit() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
      "user_id": userId.toString(),
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
    print(isButtonEnabled);
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


   
Future<void> cancelorderinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": userId.toString(),
      "order_id":orderID.toString(),
      "canceled":controller.selectedReason.toString(),
     
     
    };
    String cancelorderURl = Constants.CANCELORDER_URL;
   print(body);
    try {
    
      var request = http.MultipartRequest('POST', Uri.parse(cancelorderURl+"${orderID}"));
      request.fields.addAll(body);
    
  var  response =   await ApiHelper.postFormData(request: request);
    print("CancelOrder==>");
     
     
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



}