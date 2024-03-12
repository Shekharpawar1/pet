import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/usersModel/myprofileModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? profileImage;
  bool showLoading = false;
  File? selectedImage;
  String? selectedImagePath;
  var userId;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImagePath = pickedImage.path;
      selectedImage = File(pickedImage.path);
      print("SELECEd image : 3${selectedImage}");
    }
    update();
  }

  void validateForm(BuildContext context) {
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

  void updateaddress(String? firstname, String? lastname, String? pincode,
      String? number, String? email, String? address) {
    fullNameController.text = firstname ?? "";
    lastNameController.text = lastname ?? "";
    numberController.text = number ?? '';
    emailController.text = email ?? '';
    addressController.text = address ?? '';

    pincodeController.text = pincode ?? '';

    update();

    clearFields();

    
  }

 

  // void fetchdetails(int id) {

  // }

  void clearFields() {
    fullNameController.clear();
    lastNameController.clear();
    numberController.clear();
    emailController.clear();
    addressController.clear();
    pincodeController.clear();
    
  }



  void onInit() {
    super.onInit();
    
    userId = storage.read('id');
    print(userId);
  }

  String getUserProfile = '${Constants.GET_USER_PROFILE}';
  MyProfileModel? myprofilemodel;
  bool myprofileLoaded = false;
  // int userid = 244;

  Future<void> myprofile() async {
    try {
      // coupon
      myprofilemodel = MyProfileModel.fromJson(
          await ApiHelper.getApi(getUserProfile + "${storage.read('id')}"));
      // myprofilemodel!.data!.forEach((element) {

      //  });
      print("USERPROFILE URL  *** " + getUserProfile + "${storage.read('id')}");
      // selectedImage = myprofilemodel!.data![0].image.toString();/
      fullNameController.text = myprofilemodel!.data![0].fName.toString();
      lastNameController.text = myprofilemodel!.data![0].lName.toString();
      numberController.text = myprofilemodel!.data![0].phone.toString();
      emailController.text = myprofilemodel!.data![0].email.toString();
      String city = myprofilemodel!.data![0].city == null
          ? ""
          : myprofilemodel!.data![0].city.toString();

      addressController.text = city;
      // pincodeController.text = "";

      myprofileLoaded = true;
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

  Future<void> updateProfile() async {
    showLoading = true;
    update();

    Map<String, String> body = {
      "f_name": fullNameController.text,
      "l_name": lastNameController.text,
      "email": emailController.text,
      "phone": numberController.text,
      "city": addressController.text,
      // "image": selectedImagePath.toString(),
    };
    String UpdateProfile = Constants.USER_UPDATE_PROFILE;
    print(body);
    try {
      List documentList = [
        {'value': selectedImagePath, 'key': "image"},
      ];
      var request = http.MultipartRequest('POST', Uri.parse(UpdateProfile));
      request.fields.addAll(body);

      documentList.forEach((element) async {
        request.files.add(await http.MultipartFile.fromPath(
            element["key"], element["value"]));
      });
      await ApiHelper.postFormData(request: request);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Update Profile',
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
