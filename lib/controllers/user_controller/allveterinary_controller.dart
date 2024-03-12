import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/allventeryModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class AllVeterinaryController extends GetxController{



// my veterniary

  String getUserVeterniaryUrl =
      '${Constants.GET_USER_VETERNIARY}';
  AllVeterinaryModel? allveterniarymodel;
  bool allveterniaryLoaded = false;

  
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // veterniary
      allveterniarymodel = AllVeterinaryModel.fromJson(
          await ApiHelper.getApi(getUserVeterniaryUrl));
      print(getUserVeterniaryUrl);
      allveterniaryLoaded = true;
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

  }
}