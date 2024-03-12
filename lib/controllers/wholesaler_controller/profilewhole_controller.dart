import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/usersModel/myprofileModel.dart';
import 'package:pet/models/wholesalerModel/wholemyprofileModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class WholeProfileController extends GetxController {
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
  var wholeSellerId;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImagePath = pickedImage.path;
      selectedImage = File(pickedImage.path);

      print("SelectImagepath ${selectedImagePath}");
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

    //  print(addaddressall.length);
  }

  // void updatepofile1(
  //   String? fName,
  //   String? lName,
  //   String? email,
  //   String? phone,
  //   String? image,
  // ) {
  //   fullNameController.text = fName ?? "";
  //   lastNameController.text = lName ?? "";
  //   numberController.text = phone ?? '';
  //   emailController.text = email ?? '';
  //   selectedImagePath = image ?? '';

  //   update();

  //   clearFields();

  //   //  print(addaddressall.length);
  // }

  void fetchdetails(int id) {
// myprofilemodel(){

//      fullNameController.text;
//     lastNameController.text;
//     numberController.text;
//     emailController.text;
//     addressController.text;
//     pincodeController.text;
// }
  }
  void clearFields() {
    fullNameController.clear();
    lastNameController.clear();
    numberController.clear();
    emailController.clear();
    addressController.clear();
    pincodeController.clear();
    // pincodeController.clear();
    // selectedState= null;
    // selectedCity= null;
    // stateListModel= null;
    // cityListModel =null;
  }

//  @override
//   void onInit() {
//     super.onInit();
//     init();

//   }

  void onInit() {
    super.onInit();
    // init();
  wholeSellerId = storage.read('wholesalerid');
  print("WHoleSeller  ${wholeSellerId}");
  }

  String getUserProfile = '${Constants.GET_WHOLESELLER_PROFILE}';
  WholeMyProfileModel? wholemyprofilemodel;
  bool myprofileLoaded = false;
  // int userid = 244;

  Future<void> myprofile() async {
    try {
      // coupon
      wholemyprofilemodel = WholeMyProfileModel.fromJson(
          await ApiHelper.getApi(getUserProfile + "${storage.read('wholesalerid')}"));
      // myprofilemodel!.data!.forEach((element) {

      //  });
      print("WholeSellerProfileURL"+getUserProfile + "$wholeSellerId");
      fullNameController.text = wholemyprofilemodel!.data![0].fName.toString();
      lastNameController.text = wholemyprofilemodel!.data![0].lName.toString();
      numberController.text = wholemyprofilemodel!.data![0].phone.toString();
      emailController.text = wholemyprofilemodel!.data![0].email.toString();
      addressController.text = "Mumbai";
      pincodeController.text = "420001";

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
      // "image": selectedImagePath.toString(),
    };
    String UpdateProfile = Constants.GET_WHOLESELLER_UPDATE_PROFILE;
    print(body);
    try {
      List documentList = [
        {'value': selectedImagePath, 'key': "image"},
      ];
      var request = http.MultipartRequest('POST', Uri.parse(UpdateProfile));
      request.fields.addAll(body);

      print("IMagePost ${documentList}");
//       request.files.add(await http.MultipartFile.fromPath(
// "image",selectedImagePath.toString()
      // ));
      // 'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      // var request = http.MultipartRequest('POST', Uri.parse(UpdateProfile));
      // request.fields.addAll(body);
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
