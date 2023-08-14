import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/GetPetModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class UserMyPetListController extends GetxController {
  GetPetModel? petListModel;
  String getPetUrl = Constants.GET_PET_USER;
  bool showLoading = false;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // pet list
      petListModel =
          GetPetModel.fromJson(await ApiHelper.getApi(getPetUrl + "/1"));
      print(petListModel);
      // notificationLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Load Pets: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    showLoading = false;
    update();
  }
}
