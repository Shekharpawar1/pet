import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/partnerModel/partnerprofileModel.dart';
import 'package:pet/models/usersModel/myprofileModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class PartnerProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
 TextEditingController shopNameController = TextEditingController();
   TextEditingController companyNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
   TextEditingController gstController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identitytypeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? profileImage;
  bool showLoading = false;
  File? selectedImage;
  String? selectedImagePath;
  var partnerID;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImagePath = pickedImage.path;
      selectedImage = File(pickedImage.path);
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

  void partnerupdateaddress(String? firstname, String? lastname, 
      String? number, String? email, String? address) {
    fullNameController.text = firstname ?? "";
    lastNameController.text = lastname ?? "";
    mobileNumberController.text = number ?? '';
    emailController.text = email ?? '';
    // addressController.text = address ?? '';

    // pincodeController.text = pincode ?? '';

    update();

    clearFields();

    //  print(addaddressall.length);
  }

 

  void clearFields() {
    fullNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    emailController.clear();
   
  }


  void onInit() {
    super.onInit();
     partnerprofile();
    partnerID = storage.read('partnerid');
  }

  String getPartnerProfile = '${Constants.GET_PARTNER_PROFILE}';
  PartnerProfileModel? partnerprofilemodel;
  bool partnerprofileLoaded = false;
  // int userid = 244;

  Future<void> partnerprofile() async {
    try {
     
      partnerprofilemodel = PartnerProfileModel.fromJson(
            //  await ApiHelper.getApi(getPartnerProfile + "${2}"));
          await ApiHelper.getApi(getPartnerProfile + "${storage.read('partnerid')}"));
      // myprofilemodel!.data!.forEach((element) {

      //  });
      print("PartnerProfileUrL" +getPartnerProfile + "${storage.read('partnerid')}");
      fullNameController.text = partnerprofilemodel!.data![0].vendorId![0].fName.toString();
      lastNameController.text = partnerprofilemodel!.data![0].vendorId![0].lName.toString();
      mobileNumberController.text = partnerprofilemodel!.data![0].vendorId![0].phone.toString();
      emailController.text = partnerprofilemodel!.data![0].vendorId![0].email.toString();
   
      partnerprofileLoaded = true;
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

  Future<void> partnerupdateProfile() async {
    showLoading = true;
    update();

    Map<String, String> body = {
      "f_name": fullNameController.text,
      "l_name": lastNameController.text,
      "email": emailController.text,
      "phone": mobileNumberController.text,
      "id": storage.read('partnerid').toString(),
    };
    String UpdateProfile = Constants.PARTNER_UPDATE_PROFILE;
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
