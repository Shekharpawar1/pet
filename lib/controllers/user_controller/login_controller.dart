import 'dart:async';
import 'dart:convert';

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
import 'package:get_storage/get_storage.dart';

class UserLoginController extends GetxController {
  final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  String? otpText;

  updateOtp(String otp) {
    otpText = otp;
    update();
  }
 Future<bool> validateForm(BuildContext context) {
    final completer = Completer<bool>();

    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid')),
      );
      completer.complete(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is invalid')),
      );
      completer.complete(false);
    }

    return completer.future;
  }

  Future<void> getOtp() async {
    try {
      // sate list
      var body = {"cust_phone": phoneNumberController.text.trim().toString()};
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

  Future<void> postUserData(List documentList, var body) async {
    try {
      // List documentList = [
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45 (1).png', 'key': "logo"},
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45.png', 'key': "profile"},
      // ];
      // var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://canine.hirectjob.in/api/v1/auth/state'));
      request.fields.addAll(body);
      // request.files.add(await http.MultipartFile.fromPath(
      //     'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      documentList.forEach((element) async {
        request.files.add(await http.MultipartFile.fromPath(
            element["key"], element["value"]));
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
        "phone": phoneNumberController.text.trim().toString(),
        "otp": otpText
      };
      var response =
          await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
      storage.write('login', true);
      print("============= Success ${storage.read("login")}=============");
      var jsonResponse = jsonDecode(response);
      var id = jsonResponse['state'][0]['id'];
      storage.write('id', id);
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
