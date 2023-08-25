import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/models/usersModel/petCategoryBreedModel.dart';
import 'package:pet/models/usersModel/petCategoryModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class UserMyPetController extends GetxController {
  final storage = GetStorage();
  bool showLoading = false;
  var userId;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // List of items in our dropdown menu
  TextEditingController dobController = TextEditingController();

  TextEditingController petNameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  String gender = 'Male'; // Store the selected gender
  bool isMale = true;
  String profileFilePath = '';
  String profileFileName = '';
  File? profileFile;
  DateTime? pickedDate;

  @override
  void onInit() {
    super.onInit();
    init();
    userId = storage.read('id');
    update();
  }

  // category list
  String getCategoryUrl = Constants.GET_PET_CATEGORY_LIST;
  PetCategoryModel? categoryListModel;
  bool moduleLoaded = false;

  // category breed list
  String getCategoryBreedUrl = Constants.GET_CATEGORY_BREED;
  PetCategoryBreedModel? petCategoryBreedModel;
  // bool cateLoaded = false;

  String? petType; // Store the selected pet type
  bool isDog = true; // True if the selected pet is a dog, false if it's a cat

  String? petImage;

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // module list
      categoryListModel =
          PetCategoryModel.fromJson(await ApiHelper.getApi(getCategoryUrl));
      print(categoryListModel);
      moduleLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Load Category: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    showLoading = false;
    update();
  }

  void changeGender(String gender) {
    this.gender = gender;
    update();
  }

  void isMaleMaker(bool val) {
    this.isMale = val;
    update();
  }

  List<String> items = [];
  String? dropdownvalue = null.obs(); // Initialize to null

  Future<void> changePetType(String petType, int petId) async {
    this.petType = petType;
    await fetchPetBreed(petId);
    print("breed fetched");

    if (petCategoryBreedModel != null && petCategoryBreedModel!.data != null) {
      items =
          petCategoryBreedModel!.data!.map((e) => e.name.toString()).toList();
      print(items);

      // Check if the petType is present in the items list
      if (!items.contains(petType)) {
        print('petType is not a valid value in the items list');
        return;
      }
    } else {
      items = [];
      print('petCategoryBreedModel or its state is null');
      return;
    }

    // Set the dropdownvalue to a valid item in the items list
    dropdownvalue = petType; // Ensure the type is String
    update();
  }

  // Method to set the dropdownvalue
  void setDropdownValue(String? newValue) {
    dropdownvalue = newValue;
    update();
  }

  Future<void> postUserData(List documentList, var body, String url) async {
    showLoading = true;
    update();
    try {
      // List documentList = [
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45 (1).png', 'key': "logo"},
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45.png', 'key': "profile"},
      // ];
      // var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest('POST', Uri.parse(url));
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

    showLoading = false;
    update();
  }

  Future<void> fetchPetBreed(int petId) async {
    showLoading = true;
    update();
    try {
      // breed list
      print("getting");
      petCategoryBreedModel = PetCategoryBreedModel.fromJson(
          await ApiHelper.getApi(getCategoryBreedUrl + "/$petId"));
      print(petCategoryBreedModel);
      // moduleLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Load Category: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    showLoading = false;
    update();
  }

  void changePetImage(String petImage) {
    this.petImage = petImage;
    update();
  }

  void isDogMaker(bool val) {
    this.isDog = val;
    update();
  }

  @override
  void onClose() {
    print("Disposing fields...");
    clearFields();

    super.onClose();
  }

  void clearFields() {
    dobController.clear();

    profileFilePath = '';
    profileFileName = '';
    profileFile = null;

    petNameController.clear();
    yearController.clear();
    monthController.clear();
    petImage = null;
    petType = null;
    items = [];
    update();
  }

  // // Create a setter for dropdownvalue
  // void setDropdownValue(String value) {
  //   dropdownvalue = value;
  //   update();
  // }

  // Validator for the dropdown field
  String? dropdownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null; // Return null for no validation errors
  }

  // Function to show the date picker
  void selectDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      dobController.text = pickedDate
          .toString()
          .split(' ')[0]; // Set the selected date to the TextFormField
      calculateAge(pickedDate!);
    }
    update();
  }

  void calculateAge(DateTime selectedDate) {
    DateTime now = DateTime.now();

    int years = now.year - selectedDate.year;
    int months = now.month - selectedDate.month;

    if (now.day < selectedDate.day) {
      months--; // Subtract a month if the current day is before the selected day
    }

    if (months < 0) {
      years--; // Subtract a year if the current month is before the selected month
      months += 12;
    }

    yearController.text = years.toString();
    monthController.text = months.toString();
    update();
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

  Future getImageGalleryProfile() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.gallery, imageQuality: 25);

    // setState(() {
    profileFileName = image!.name;
    profileFilePath = image.path;
    profileFile = File(image.path);

    update();
    print('Profile Image $profileFile');
    print('Profile Image Path $profileFilePath');
    print('Profile Image Name $profileFileName');
    // print('Logo Image $logoFile');
    // print('Logo Image Path $logoFilePath');
    // print('Logo Image Name $logoFileName');
    // });
  }

  Future getImageCameraProfile() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.camera, imageQuality: 25);

    profileFileName = image!.name;
    profileFilePath = image.path;
    profileFile = File(image.path);
    // print('Image Path $file');
    update();
  }
}
