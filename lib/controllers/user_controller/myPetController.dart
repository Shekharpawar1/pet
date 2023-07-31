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

class UserMyPetController extends GetxController {
  final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Jarman safed'.obs();

  // List of items in our dropdown menu
  TextEditingController dobController = TextEditingController();

  TextEditingController petNameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  String gender = 'Male'; // Store the selected gender
  bool isMale = true;

  void changeGender(String gender) {
    this.gender = gender;
    update();
  }

  void isMaleMaker(bool val) {
    this.isMale = val;
    update();
  }

  String petType = 'Dog'; // Store the selected pet type
  bool isDog = true; // True if the selected pet is a dog, false if it's a cat

  void changePetType(String petType) {
    this.petType = petType;
    update();
  }

  void isDogMaker(bool val) {
    this.isDog = val;
    update();
  }

  var items = ['Jarman safed', "Lebra", "PUG", "Pomelian"];

  @override
  void onClose() {
    print("Disposing fields...");
    clearFields();

    super.onClose();
  }

  void clearFields() {
    dobController.clear();

    petNameController.clear();
    update();
  }

  // Create a setter for dropdownvalue
  void setDropdownValue(String value) {
    dropdownvalue = value;
    update();
  }

  // Validator for the dropdown field
  String? dropdownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null; // Return null for no validation errors
  }

  // Function to show the date picker
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      dobController.text = picked
          .toString()
          .split(' ')[0]; // Set the selected date to the TextFormField
    }
  }

  Future<bool> validateForm(BuildContext context) {
    final completer = Completer<bool>();

    if (formKey.currentState!.validate()) {
      completer.complete(true);
    } else {
      completer.complete(false);
    }

    return completer.future;
  }

  // Future<void> sendOtp() async {
  //   try {
  //     // sate list
  //     var body = {
  //       "phone": phoneNumberController.text.trim().toString(),
  //       "otp": otpText
  //     };
  //     var response =
  //         await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
  //     storage.write('login', true);
  //     print("============= Success ${storage.read("login")}=============");
  //     var jsonResponse = jsonDecode(response);
  //     var id = jsonResponse['state'][0]['id'];
  //     storage.write('id', id);
  //     // print(stateListModel);
  //     // stateLoaded = true;
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
  // }

  @override
  void onInit() {
    super.onInit();
    // init();
  }
}
