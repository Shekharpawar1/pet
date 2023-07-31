import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class SalesLoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? otpText;
  updateOtp(String otp) {
    otpText = otp;
    update();
  }

  Future<void> getOtp() async {
    try {
      // sate list
      var body = {"number": phoneNumberController.text.trim().toString()};
      await ApiHelper.postApi(url: Constants.USER_LOGIN, body: body);
      // print(stateListModel);
      // stateLoaded = true;
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
  }

   validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is Invalid')),
      );
    }
  }

  Future<void> postUserData() async {
    try {
      List documentList = [
        '/C:/Users/PC/Downloads/Rectangle 45 (1).png',
        '/C:/Users/PC/Downloads/Rectangle 45.png'
      ];
      var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://canine.hirectjob.in/api/v1/auth/state'));
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath(
          'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      documentList.forEach((element) async {
        request.files
            .add(await http.MultipartFile.fromPath('documents', element));
      });
      await ApiHelper.postFormData(request: request);
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
  }

  Future<void> sendOtp() async {
    try {
      // sate list
      var body = {
        "number": phoneNumberController.text.trim().toString(),
        "otp": otpText
      };
      await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
      // print(stateListModel);
      // stateLoaded = true;
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
  }

  @override
  void onInit() {
    super.onInit();
    // init();
  }
}
