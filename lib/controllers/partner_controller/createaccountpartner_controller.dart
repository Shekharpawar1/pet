import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/salesmanModel/moduleModel.dart';
import 'package:pet/models/salesmanModel/zoneModel.dart';
import 'package:pet/models/stateModel.dart';

import '../../utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:pet/models/salesmanModel/moduleModel.dart' as moduleFile;
import 'package:pet/models/salesmanModel/zoneModel.dart' as zoneFile;
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:http/http.dart' as http;

class CreateAccountPartnerController extends GetxController {
  TextEditingController latController = TextEditingController();

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool isLoading = false;
  bool passwordconVisible = false;
  String? dropdowntype;
  List<String> typeDropDownList = ["0", "0.1", "0.2", "0.3", "0.4"];

  String? dropdownzone;
  List<String> zoneDropDownList = [];

  String? dropdownIdentityType;
  List<String> identityTypeDropDownList = [
    "Pets Module"
        "Dogs Module"
  ];

  List<String> countries = [
    'India',
    'America',
    'Australia',
    'Russia',
  ];

  String? selectedCountry;

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

  void updatetime(String time) {
    dropdownzone = time;
    update();
  }

  void updateidentitytype(String zone) {
    dropdownzone = zone;
    update();
  }


void updatepass() {
    passwordVisible = !passwordVisible;
    update();
  }
void updateconpass() {
    passwordconVisible = !passwordconVisible;
    update();
  }
  List<String> currency = [
    '\$ USD',
    '\₤ EURO',
    '\₹ RUPEES',
    '\€ POUND',
  ];

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

  // Future<void> selectTime(BuildContext context) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (pickedTime != null) {
  //     print(pickedTime.format(context));
  //     String formattedTime =
  //         pickedTime.format(context).replaceAll(RegExp(r'[^0-9:]'), '');
  //     print(formattedTime);
  //     timeinput.text = formattedTime;
  //     update();
  //   } else {
  //     print("Time is not selected");
  //   }
  // }

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

  // zone list
  String getZoneUrl = Constants.GET_ZONE_LIST;
  ZoneModel? zoneListModel;
  bool zoneLoaded = false;
  zoneFile.Zone? selectedZone;
  Future<void> updateZone(zoneFile.Zone zone) async {
    selectedZone = zone;
    update();
    print('Zone${selectedZone}');
  }


  // // module list
  // String getModuleUrl = Constants.GET_MODULE_LIST;
  // ModuleModel? moduleListModel;
  // bool moduleLoaded = false;
  // moduleFile.Module? selectedModule;
  // Future<void> updateModule(moduleFile.Module module) async {
  //   selectedModule = module;
  //   update();
  // }

  Future<void> init() async {
    // try {
    //   // module list
    //   moduleListModel =
    //       ModuleModel.fromJson(await ApiHelper.getApi(getModuleUrl));
    //   print(moduleListModel);
    //   moduleLoaded = true;
    //   update();
    // } catch (e) {
    //   print('Error: $e');
    //   Get.snackbar(
    //     'Error',
    //     'Unable to Module: $e',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }
     try {
      // zone list
      zoneListModel = ZoneModel.fromJson(await ApiHelper.getApi(getZoneUrl));
      print(zoneListModel);
      zoneLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      // Get.snackbar(
      //   'Error',
      //   'Unable to Zone: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    try {
      // sate list
      stateListModel =
          StateListModel.fromJson(await ApiHelper.getApi(getUserStateUrl));
      print(stateListModel);
      stateLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Zones: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
    try {
      // city list
      cityListModel =
          CityListModel.fromJson(await ApiHelper.getApi(getCityUrl + stateId));
      print(cityListModel);
      cityLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      // Get.snackbar(
      //   'Error',
      //   'Unable to City: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  Future<void> postUserData(
      List<Map<String, String>> documentList, var body, String url) async {
    try {
      // documentList.forEach((element) async {
      //   print(element["key"]! + "  >   " + element["value"]!);
      // });
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(body);
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
