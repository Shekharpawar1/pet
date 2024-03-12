import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class PartnerController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  // List<String> cities = [
  //   'Indore',
  //   'Bhopal',
  //   'Mumbai',
  //   'Hariyana',
  // ];

  // String? selectedCity;
  // void updateCity(String city) {
  //   selectedCity = city;
  //   update();
  // }

  // List<String> states = [
  //   'Madhya Pradesh',
  //   'Rajasthan',
  //   'Maharastra',
  //   'Delhi',
  // ];

  bool isAdding = false;
  void addWholeSaler() {
    isAdding = true;
    update();
  }

  void wholeSalerView() {
    isAdding = false;
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

  init() async {
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
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
