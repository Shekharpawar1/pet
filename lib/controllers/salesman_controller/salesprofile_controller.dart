import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/salesmanModel/salesprofileModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class SalesProfileController extends GetxController {

final storage = GetStorage();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
var sellerId = GetStorage().read("sellerid");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? profileImage;
  bool showLoading = false;
  File? selectedImage;
  String? selectedImagePath;
  var userId;



  String profileFilePath = '';
  String profileFileName = '';
  File? profileFile;

  String logoFilePath = '';
  String logoFileName = '';
  File? logoFile;

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

  Future getImageGalleryLogo() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.gallery, imageQuality: 25);

    // setState(() {
    logoFileName = image!.name;
    logoFilePath = image.path;
    logoFile = File(image.path);

    update();
    // print('Profile Image $profileFile');
    // print('Profile Image Path $profileFilePath');
    // print('Profile Image Name $profileFileName');
    print('Logo Image $logoFile');
    print('Logo Image Path $logoFilePath');
    print('Logo Image Name $logoFileName');
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

  Future getImageCameraLogo() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.camera, imageQuality: 25);

    logoFileName = image!.name;
    logoFilePath = image.path;
    logoFile = File(image.path);
    // print('Image Path $file');
    update();
  }

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
    salesMyProfile();
    // userId = storage.read('id');
  }

  String getSalesProfile = '${Constants.GET_SALES_PROFILE}';
  SalesProfileModel? salesprofilemodel;
  bool myprofileLoaded = false;
  // int userid = 244;

  Future<void> salesMyProfile() async {
    try {
      // coupon
      salesprofilemodel = SalesProfileModel.fromJson(
          await ApiHelper.getApi(getSalesProfile + "${sellerId}"));
      // myprofilemodel!.data!.forEach((element) {

      //  });
      storage.write('login', true);
      print("sellerProfileURL" +getSalesProfile + "$sellerId");
      fullNameController.text = salesprofilemodel!.data![0].fName.toString();
      lastNameController.text = salesprofilemodel!.data![0].lName.toString();
      numberController.text = salesprofilemodel!.data![0].phone.toString();
      emailController.text = salesprofilemodel!.data![0].email.toString();
      addressController.text = "Mumbai";
      pincodeController.text = "420001";

      myprofileLoaded = true;

      //  var sellerid;
      
      // }
      // // // var id = userLoginModel.data![0].id;
      // print("=====>>>> Id ${sellerid} FName: ${sellerfname} lName: ${sellerlastname} Email: ${selleremail}");
      // storage.write('sellerlastname', sellerlastname);
      // storage.write('sellerfname', sellerfname);
      //  storage.write('selleremail', selleremail);
     
      // print(storage.read('sellerfname').toString());
      // print(storage.read('sellerlastname').toString());
      // print(storage.read('selleremail').toString());
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

  Future<void> salesUpdateProfile() async {
    showLoading = true;
    update();

    Map<String, String> body = {
      "f_name": fullNameController.text,
      "l_name": lastNameController.text,
      "email": emailController.text,
      "phone": numberController.text,
      // "image": selectedImagePath.toString(),
    };
    String UpdateProfile = Constants.SALES_UPDATE_PROFILE;
    print(body);
    
    try {
      List documentList = [
        {'value': selectedImagePath, 'key': "image"},
      ];
      var request = http.MultipartRequest('POST', Uri.parse(UpdateProfile));
      request.fields.addAll(body);
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
}
