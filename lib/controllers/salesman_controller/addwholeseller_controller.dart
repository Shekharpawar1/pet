import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/salesman_controller/dashboard_controller.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/salesmanModel/zoneModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:http/http.dart' as http;
import 'package:pet/models/salesmanModel/zoneModel.dart' as zoneFile;
class SalesAddwholeControllers extends GetxController {

  
var sellerId = GetStorage().read("sellerid");
bool showLoading = false;
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

  DashBoardController dashBoardController = Get.put(DashBoardController());
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
  @override
  void onInit() {
    super.onInit();
    init();
    zoneinit();
  }
Future<void> updateZone(zoneFile.Zone zone) async {
    selectedZone = zone;
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

    void onClose() {
    print("closing...");
 dispose();
    super.onClose();
  }
void clearFields() {
    fullNameController.clear();
    lastNameController.clear();
    numberController.clear();
    aadharController.clear();
    emailController.clear();
    passcodeController.clear();
    dobController.clear();
    businessNameController.clear()
;    gstController.clear();
    pincodeController.clear();
    selectedState= null;
    selectedCity= null;
    zoneListModel = null;
       selectedZone = null;
    stateListModel= null;
    cityListModel =null;
    profileFilePath = '';
    logoFilePath = '';


  }

  void dispose() {
    clearFields();
 clearcity();
 clearstate();
  //  clearzonefield();
  update();
  }

void clearcity() {

 selectedCity= null;
cityListModel =null;
}

void clearstate() {

 selectedState= null;
stateListModel =null;
}

 void clearzonefield() {
zoneListModel = null;
       selectedZone = null;
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


// zone list
  String getZoneUrl = Constants.GET_ZONE_LIST;
  ZoneModel? zoneListModel;
  bool zoneLoaded = false;
  zoneFile.Zone? selectedZone;

  // state list
  String getUserStateUrl = Constants.GET_STATE_LIST;
  StateListModel? stateListModel;
  bool stateLoaded = false;
  statesFile.State? selectedState ;
  //  StateListModel? selectedModel; // Variable to store the selected model
  // List<MyModel> modelList = [
  //   MyModel(1, 'Option 1'),
  //   MyModel(2, 'Option 2'),
  //   MyModel(3, 'Option 3'),
  // ];
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
  String getCityUrl = Constants.GET_CITY_LIST;
  CityListModel? cityListModel;
  // cityListModel!.state = [];
  bool cityLoaded = false;



 var selectedCity;
  void updateCity(city) {
    selectedCity = city;
    update();
  }

  List citieslist = [];
  fetchCity(String stateId) async {
    try {
      // city list
      var b = await http.post(Uri.parse(
          "http://caninedemo.caninetest.xyz/api/v1/auth/city?state=$stateId"));
      print(b.body);

      var data = jsonDecode(b.body);
      citieslist = data["data"];
      print(citieslist);

    
      print(cityListModel);
      cityLoaded = true;
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






Future<void> zoneinit() async {
 showLoading = true;
    update();
      try {
      // zone list
      zoneListModel = ZoneModel.fromJson(await ApiHelper.getApi(getZoneUrl));
      print(getZoneUrl);
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
  showLoading = false;
    update();
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
    
     var response = await ApiHelper.postFormData(request: request);
     print("Wholedata");
     print(response);
          print("GetWholedata===>");
    dashBoardController.init();
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
  
  
  }

  Future getImageGalleryLogo() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.gallery, imageQuality: 25);

    // setState(() {
    logoFileName = image!.name;
    logoFilePath = image.path;
    logoFile = File(image.path);

    update();
    
  }

  Future getImageCameraProfile() async {
    var image = await ImagePicker.platform
        .getImage(source: ImageSource.camera, imageQuality: 25);

    profileFileName = image!.name;
    profileFilePath = image.path;
    profileFile = File(image.path);
  
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


}
