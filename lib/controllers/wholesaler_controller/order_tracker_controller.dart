import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:pet/models/wholesalerModel/orderTrackerModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class OrderTrackerWholeController extends GetxController {
  bool showLoading = false;
  int? orderId;
// tracker
  String getOrderTrackerUrl = '${Constants.GET_ORDER_TRACKER}';
  OrderTrackerModel? ordertrackermodel;
  bool ordertrackerloaded = false;

  bool isDelivered = true;
  var orderList;
  var shippedList;
  final List<String> cancellationReasons = [
    // 'Damaged Product',
    'Late Delivery',
    'Changed My Mind',
    'Other',
  ];
  final List<String> returnReasons = [
    'low Quality',
    'Wrong Product',
    // 'Damaged',
    'Other',
  ];
  String? selectedValue;
  updaeSelectedValue(String val) {
    selectedValue = val;
    update();
  }

  final List<String> steps = [
    'Pending',
    'Confirmed',
    'Processing',
    'Handover',
    'Picked Up',
    'Delivered'
  ];
  String? otherReason;
  updateOtherReason(String? val) {
    otherReason = val;
    update();
  }

  String? selectedReason;
  updateSelectedReason(String? val) {
    selectedReason = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  var orderStatus;

  // int getCurrentStepIndex() {
  //   if (ordertrackermodel!.data![0].deliveredStatus == 'delivered') {
  //     orderStatus = Status.delivered;
  //     update();
  //     return steps.length;
  //   } else if (ordertrackermodel!.data![0].pickedUp != null &&
  //       DateTime.parse(ordertrackermodel!.data![0].pickedUp.toString())
  //           .isBefore(DateTime.now())) {
  //     orderStatus = Status.delivered;
  //     update();
  //     return 5;
  //   } else if (ordertrackermodel!.data![0].handover != null &&
  //       DateTime.parse(ordertrackermodel!.data![0].handover.toString())
  //           .isBefore(DateTime.now())) {
  //     orderStatus = Status.delivered;
  //     update();
  //     return 4;
  //   } else if (ordertrackermodel!.data![0].processing != null &&
  //       DateTime.parse(ordertrackermodel!.data![0].processing.toString())
  //           .isBefore(DateTime.now())) {
  //     orderStatus = Status.delivered;
  //     update();
  //     return 3;
  //   } else if (ordertrackermodel!.data![0].confirmed != null &&
  //       DateTime.parse(ordertrackermodel!.data![0].confirmed.toString())
  //           .isBefore(DateTime.now())) {
  //     orderStatus = Status.delivered;
  //     update();
  //     return 2;
  //   } else if (ordertrackermodel!.data![0].pending != null &&
  //       DateTime.parse(ordertrackermodel!.data![0].pending.toString())
  //           .isBefore(DateTime.now())) {
  //     orderStatus = Status.delivered;
  //     update();
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  updateOrder(int? orderid) {
    orderId = orderid;
    update();
    print("OrderTackerID :${orderId}");
  }

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // categories
      ordertrackermodel = OrderTrackerModel.fromJson(
          await ApiHelper.getApi(getOrderTrackerUrl + "${orderId}"));
      // orderList = ordertrackermodel!.data![0].pending;
      // if(ordertrackermodel!.data![0].pending != null){
        
      // orderStatus = Status.order;
      // update();
      // }   else if(ordertrackermodel!.data![0].confirmed != null){
        
      // orderStatus = Status.shipped;
      // update();
      // } else if(ordertrackermodel!.data![0].handover != null){
        
      // orderStatus = Status.outOfDelivery;
      // update();
      // } else if(ordertrackermodel!.data![0].delivered != null){
        
      // orderStatus = Status.delivered;
      // update();
      // }

          if (ordertrackermodel!.data![0].pending != null) {
  print("Pending=====${ordertrackermodel!.data![0].pending}");
  orderStatus = Status.order;
  update();
}

if (ordertrackermodel!.data![0].confirmed != null) {
  print("Shipped=====${ordertrackermodel!.data![0].confirmed}");
  orderStatus = Status.shipped;
  update();
}

if (ordertrackermodel!.data![0].handover != null) {
  orderStatus = Status.outOfDelivery;
  update();
}

if (ordertrackermodel!.data![0].delivered != null) {
  orderStatus = Status.delivered;
  update();
}

      // shippedList = ordertrackermodel!.data![0].handover;
      print(ordertrackermodel);
      print(getOrderTrackerUrl + "${orderId}");
      ordertrackerloaded = true;
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
}
