

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/couponModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class CouponsController extends GetxController {

 TextEditingController couponsController =TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


 void onInit() {
    super.onInit();
    init();
  }
    String getUserCouponUrl =
      '${Constants.GET_USER_COUPON}';
 CouponModel? couponmodel;
  bool  couponLoaded = false;
  
  @override
 Future<void> init() async {
    try {
      // coupon
      couponmodel = CouponModel.fromJson(
          await ApiHelper.getApi(getUserCouponUrl));
          
      print(getUserCouponUrl);
      couponLoaded = true;
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
    }}
  
  



}