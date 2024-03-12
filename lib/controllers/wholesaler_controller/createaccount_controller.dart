import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:http/http.dart' as http;
class CreateAccountwholeControllers extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
   TextEditingController numberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
    // TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identitytypeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();

  TextEditingController gstController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? dropdowntype;
  List<String> typeDropDownList = ["0", "0.1", "0.2", "0.3", "0.4"];

  String? dropdownzone;
  List<String> zoneDropDownList = ["North Zone", "South Zone"];

  String? dropdownIdentityType;
  List<String> identityTypeDropDownList = ["Passport", "Aadhar card"];

  List<String> countries = [
    'India',
    'America',
    'Australia',
    'Russia',
  ];

  String? selectedCountry;
  bool isLoading = false;
  void updateCountry(String country) {
    selectedCountry = country;
    update();
  }

  void updatetype(String type) {
    dropdowntype = type;
    update();
  }

  void updatezone(String zone) {
    dropdownzone = zone;
    update();
  }

  void updateidentitytype(String zone) {
    dropdownzone = zone;
    update();
  }

  List<String> currency = [
    '\$ USD',
    '\₤ EURO',
    '\₹ RUPEES',
    '\€ POUND',
  ];

void clearstate() {
    
    selectedState= null;
   
    stateListModel= null;
  

  }

  void clearcity() {
    
    selectedCity= null;
   
    cityListModel= null;
  

  }
  String? selectedCurrency;

  void updateCurrency(String currency) {
    selectedCurrency = currency;
    update();
  }

  bool isAdding = false;
  void addWholeSaler() {
    isAdding = true;
    update();
  }

  void wholeSalerView() {
    isAdding = false;
    update();
  }

   Future<bool> validateForm(BuildContext context) {
    final completer = Completer<bool>();

    if (formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is valid')),
      // );
      completer.complete(true);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is invalid')),
      // );
      completer.complete(false);
    }

    return completer.future;
  }

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    // print("INsider");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate = picked;
      dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      update();
    }
  }

  // state list
  String getUserStateUrl = Constants.GET_STATE_LIST;
  StateListModel? stateListModel;
  bool stateLoaded = false;
  bool showLoading = false;
  statesFile.State? selectedState;
  Future<void> updateState(statesFile.State state) async {
    selectedState = state;
    showLoading = true;
    update();
    await fetchCity(state.id.toString());
    showLoading = false;
    update();
  }

  Future<void> init() async {
    try {
      // sate list
      stateListModel =
          StateListModel.fromJson(await ApiHelper.getApi(getUserStateUrl));
      print(stateListModel);
      stateLoaded = true;
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
  // // state list
  // String getUserStateUrl = Constants.GET_STATE_LIST;
  // StateListModel? stateListModel;
  // bool stateLoaded = false;

  // statesFile.State? selectedState;
  // Future<void> updateState(statesFile.State state) async {
  //   selectedState = state;
  //   await fetchCity(state.id.toString());
  //   update();
  // }

  // city list
  String getCityUrl = Constants.GET_CITY_LIST;
  CityListModel? cityListModel;
  // cityListModel!.state = [];
  bool cityLoaded = false;

  cityFile.State? selectedCity;
  void updateCity(cityFile.State? city) {
    selectedCity = city;
    update();
  }

  fetchCity(String stateId) async {
    // try {
    //   // city list
    //   cityListModel =
    //       CityListModel.fromJson(await ApiHelper.getApi(getCityUrl + stateId));
    //   print(cityListModel);
    //   cityLoaded = true;
    //   update();
    // } 

    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(getCityUrl));
      request.fields.addAll({
        "state":stateId.toString()
      });
      
   cityListModel  = CityListModel.fromJson(await ApiHelper.postFormData(request: request));
   
      // update();
      print(cityListModel);
      cityLoaded = true;
      update();
    }
    catch (e) {
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



  Future<void> postWholeData(
    
      List<Map<String, String>> documentList, var body, String url) async {
    try {
  
    
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(body);
      print(body);
      print(documentList);
      documentList.forEach((element) async {
        request.files.add(await http.MultipartFile.fromPath(
          element["key"]!,
          element["value"]!,
        ));
      });
      // print(request.fields);
      // print(request.files);
      await ApiHelper.postFormData(request: request);
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

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
