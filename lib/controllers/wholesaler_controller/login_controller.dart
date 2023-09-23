import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/utils/constants.dart';

import '../../utils/api_helper.dart';

class LoginWholeController extends GetxController{
final storage = GetStorage();
   bool passwordVisible = false;
   
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void updatepass() {
    passwordVisible = !passwordVisible;
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

  Future<void> loginEmail() async {
    try {
      // sate list
      var body = {
        "email": emailController.text.trim().toString(),
        "password": passwordController.text.trim().toString(),
      };
      var response =
          await ApiHelper.postApi(url: Constants.WHOLESALER_LOGIN, body: body);
      storage.write('login', true);
      print("============= Success ${storage.read("login")}=============");
      // var jsonResponse = json.decode(response);
      // UserLoginModel userLoginModel = UserLoginModel.fromJson(response);
      // print(userLoginModel);
      var wholesalerid;
        var wholesalerroleid;
      var wholesalerData;

      print(response["data"]);
      try {
        wholesalerid = response["data"][0]["id"];
        wholesalerroleid = response["data"][0]["role"];
        wholesalerData = response["data"];
      } catch (e) {
        wholesalerid = response["data"]![0]["id"];
                wholesalerroleid = response["data"]![0]["role"];
        wholesalerData = response["data"][0];
      }
      print("=====>>>> Id ${wholesalerid} Data: ${wholesalerData} Role: ${wholesalerroleid}");
      storage.write('wholesalerData', wholesalerData);
      storage.write('wholesalerid', wholesalerid);
       storage.write('wholesalerroleid', wholesalerroleid);
     
      print(storage.read('wholesalerid').toString());
      print(storage.read('wholesalerData').toString());
      print(storage.read('wholesalerroleid').toString());
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
 
}