import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/TimeslotModel.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;

class UserServicesAddVeterinaryController extends GetxController {
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController petProblemController = TextEditingController();

  var demoResponse = {
    "data": [
      {
        "slot-date": "2023-08-01 00:00:00.000",
        "slots": [
          "8:00",
          "9:00",
          "8:00",
          "9:00",
          "8:00",
          "9:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00"
        ],
      },
      {
        "slot-date": "2023-07-30 00:00:00.000",
        "slots": [
          "8:00",
          "9:00",
          "8:00",
          "9:00",
          "8:00",
          "9:00",
          "12:00",
          "1:00"
        ],
      },
      {
        "slot-date": "2023-08-02 00:00:00.000",
        "slots": [
          "10:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00",
          "12:00",
          "1:00"
        ],
      },
    ],
  };

  List<String> demoPetsList = ["dog", "cat", "rabbit"];
  String selectedPet = "dog";
  updatePet(String pet) {
    selectedPet = pet;
    update();
  }

  List<String> city = [
    "Bhopal",
    "Indore",
  ];

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  String? selectedcity;

  void setSelectedDate(var date) {
    selectedDate = date;
    bool foundedMatch = false;
    demoResponse["data"]!.forEach((element) {
      // print(element["slot-date"]);
      print("${element["slot-date"]} == ${selectedDate}");
      var el = DateTime.parse(element["slot-date"].toString());
      print(el);
      if (selectedDate == el) {
        // print(element["slots"]);
        updateTimeSlotList(element["slots"] as List<String>);
        foundedMatch = true;
        return;
      }
    });
    if (!foundedMatch) {
      updateTimeSlotList([]);
    }
    update();
  }

  void setCurrentWeekIndex(var index) {
    currentWeekIndex = index;
    update();
  }

  void changeCurrentWeek(var item) {
    currentWeek = item;
  }

  void addToCurrentWeek(var item) {
    currentWeek.add(item);
    update();
  }

  void addToListOfWeek(var item) {
    listOfWeeks.add(item);
    update();
  }

  // void updateCity(String city) {
  //   selectedcity = city;
  //   update();
  // }

  List<TimeSlot> timeSlots = [
    // TimeSlot(time: '11:00'),
    // TimeSlot(time: '11:30 '),
    // TimeSlot(time: '12:00'),
    // TimeSlot(time: '12:30'),
    // TimeSlot(time: '1:00'),
    // TimeSlot(time: '1:30'),
    // Add more time slots as needed
  ];

  void updateTimeSlotList(List<String> slots) {
    // if (slots.isEmpty) {
    //   timeSlots = [];
    // }
    print(slots);
    timeSlots = slots.map((e) => TimeSlot(time: e)).toList();

    update();
  }

  final box = GetStorage();

  @override
  void onClose() {
    print("closing...");
    clearFields();
    super.onClose();
  }

  void clearFields() {
    timeSlots = [];

    today = DateTime.now();
    selectedDate = DateTime.now();
    currentWeek = [];
    currentWeekIndex = 0;

    listOfWeeks = [];

    cityListModel = null;
    stateListModel = null;
    selectedCity = null;
    selectedState = null;
    print("Data cleared...");
    update();
  }

  @override
  void onInit() {
    super.onInit();
    init();
    // final List<String>? selectedSlots = box.read('selectedSlots');
    // if (selectedSlots != null) {
    //   timeSlots.forEach((slot) {
    //     if (selectedSlots.contains(slot.time)) {
    //       slot.isSelected = true;
    //        update();
    //     }
    //   });
    // }
  }

  Future<void> init() async {
    showLoading = true;
    update();
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
        'Unable to get State: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    showLoading = false;
    update();
  }

  void selectTimeSlot(int index) {
    final TimeSlot selectedSlot = timeSlots[index];
    selectedSlot.isSelected = !selectedSlot.isSelected;
    print(selectedSlot);

    if (selectedSlot.isSelected) {
      box.writeIfNull('selectedSlots', []);
      final List<dynamic>? selectedSlots = box.read('selectedSlots');
      selectedSlots?.add(selectedSlot.time);
      box.write('selectedSlots', selectedSlots);
      update();
    } else {
      final List<dynamic>? selectedSlots = box.read('selectedSlots');
      selectedSlots?.remove(selectedSlot.time);
      box.write('selectedSlots', selectedSlots);
      update();
    }
  }

  // bool isLoading = false;
  // updateIsLoading(bool val) {
  //   isLoading = val;
  //   update();
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
    showLoading = true;
    update();
    try {
      // city list
      cityListModel =
          CityListModel.fromJson(await ApiHelper.getApi(getCityUrl + stateId));
      print(cityListModel);
      cityLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to City: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    showLoading = false;
    update();
  }
}
