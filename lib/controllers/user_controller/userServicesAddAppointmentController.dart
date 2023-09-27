import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/TimeslotModel.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/usersModel/GetPetModel.dart';
import 'package:pet/models/usersModel/allCityModel.dart';
import 'package:pet/models/usersModel/allServicesModel.dart';
import 'package:pet/models/usersModel/servicesGetModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pet/models/usersModel/GetPetModel.dart' as petFile;
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;

class UserServicesAddAppointmentController extends GetxController {
  bool showLoading = false;
  final storage = GetStorage();
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int? serviceId;
  var userID;
  void updateServiceId(int id) {
    serviceId = id;
    update();
  }

  // var demoResponse = {
  //   "data": [
  //     {
  //       "slot-date": "2023-08-01 00:00:00.000",
  //       "slots": [
  //         "8:00",
  //         "9:00",
  //         "8:00",
  //         "9:00",
  //         "8:00",
  //         "9:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00"
  //       ],
  //     },
  //     {
  //       "slot-date": "2023-07-30 00:00:00.000",
  //       "slots": [
  //         "8:00",
  //         "9:00",
  //         "8:00",
  //         "9:00",
  //         "8:00",
  //         "9:00",
  //         "12:00",
  //         "1:00"
  //       ],
  //     },
  //     {
  //       "slot-date": "2023-08-02 00:00:00.000",
  //       "slots": [
  //         "10:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00",
  //         "12:00",
  //         "1:00"
  //       ],
  //     },
  //   ],
  // };

  List<String> demoPetsList = [];
  // petFile.State? selectedPet = null.obs();
  // updatePet(petFile.State? pet) {
  //   selectedPet = pet;
  //   update();
  // }
  String? selectedPet = null.obs();
  updatePet(String? pet) {
    selectedPet = pet;
    update();
  }

  List<String> city = [
    "Bhopal",
    "Indore",
    "Mumbai",
    "Delhi",
    "Goa",
    "Ujjain",
    "Banglore",
  ];

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;
  TimeSlot? selectedSlot;

  List<List<DateTime>> listOfWeeks = [];

  // String? selectedcity;

  void setSelectedDate(var date) {
    selectedDate = date;
    bool foundedMatch = false;
    print(servicesModelDart!.data);
    servicesModelDart!.data!.forEach((element) {
      // print(element["slot-date"]);
      print("${element.slotDate} == ${selectedDate}");
      var el = DateTime.parse(element.slotDate.toString());
      print(el);
      if (selectedDate == el) {
        // print(element["slots"]);
        updateTimeSlotList(element.slotTiming as List<String>);
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
    demoPetsList = [];
    selectedPet = null;
    petListModel = null;
    numberController.clear();

    selectedCity = null;
    cityListModel = null;
    stateListModel = null;
    selectedState = null;
    print("Data cleared...");
    update();
  }

  @override
  void onInit() {
    super.onInit();
    init();
    userID = storage.read('id');
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

  GetPetModel? petListModel;
  String getPetUrl = Constants.GET_PET_USER;

  // AllCityModel? allCityModel;
  // String getAllCityUrl = Constants.ALL_CITY;
  // state list
  String getUserStateUrl = Constants.GET_STATE_LIST;
  StateListModel? stateListModel;
  bool stateLoaded = false;
  // bool showLoading = false;
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

  Future<void> init() async {
    showLoading = true;
    update();

    try {
      // sate list
      stateListModel =
          StateListModel.fromJson(await ApiHelper.getApi(getUserStateUrl));
      // print(stateListModel);
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
    try {
      print("====>>>> pet url: ${getPetUrl + storage.read('id').toString()}");
      // pet list
      petListModel = GetPetModel.fromJson(
          await ApiHelper.getApi(getPetUrl + storage.read('id').toString()));
      print(petListModel);
      // notificationLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Load Pets: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    if (petListModel != null && petListModel!.data != null) {
      demoPetsList =
          petListModel!.data!.map((e) => e.petName.toString()).toList();
      demoPetsList = demoPetsList.toSet().toList();
      print(demoPetsList);
      if (demoPetsList.isNotEmpty) {
        updatePet(demoPetsList[0]);
      }
    } else {
      demoPetsList = [];
      print('petCategoryBreedModel or its state is null');
      return;
    }
    // ALL CITY LIST FETCH
    // try {
    //   allCityModel =
    //       AllCityModel.fromJson(await ApiHelper.getApi(getAllCityUrl));
    //   print(allCityModel);
    //   // notificationLoaded = true;
    //   update();
    // } catch (e) {
    //   print('Error: $e');
    //   Get.snackbar(
    //     'Error',
    //     'Unable to Load City: $e',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }

    // if (allCityModel != null && allCityModel!.state != null) {
    //   city = allCityModel!.state!.map((e) => e.cityName.toString()).toList();
    //   city = city.toSet().toList();
    //   print(city);
    //   if (city.isNotEmpty) {
    //     updateCity(city[0]);
    //   }
    // } else {
    //   city = [];
    //   print('petCategoryBreedModel or its state is null');
    //   return;
    // }

    showLoading = false;
    update();
  }

  ServicesModelDart? servicesModelDart;
  AllServicesModel? allServicesModel;
  String getServicesUrl = Constants.GET_SERVICES_CATEGORIES;
  String getAllBookedServicesUrl = Constants.GET_All_BOOKED_SERVICES;
  List<int> bookedServicesIndex = [];

  Future<void> fetchAppointmentSlots(int serviceId) async {
    print("Fetching data...");
    showLoading = true;
    update();
    try {
      // apppointment data
      servicesModelDart = ServicesModelDart.fromJson(
          await ApiHelper.getApi(getServicesUrl + "/$serviceId"));
      allServicesModel = AllServicesModel.fromJson(
          await ApiHelper.getApi(getAllBookedServicesUrl));
      servicesModelDart!.data!.forEach((element) {
        print(
            "==>> slots: ${allServicesModel!.data!.where((f) => element.slotTiming!.contains(f.slot))}");
        print(
            "==>> dates: ${allServicesModel!.data!.where((f) => element.slotDate!.toString().toLowerCase().contains(f.date!))}");

        print(
            "==>> both: ${allServicesModel!.data!.where((f) => element.slotTiming!.contains(f.slot) && element.slotDate!.toString().toLowerCase().contains(f.date!)).toList().map((e) => e.city)}");

        print(
            "==>> both: ${allServicesModel!.data!.where((f) => element.slotTiming!.contains(f.slot) && element.slotDate!.toString().toLowerCase().contains(f.date!)).toList().length}");
        // print("element.slotTiming: ${element.slotTiming}");
        // print("element.slotDate: ${element.slotDate}");
        // print("");
        // print("");
        // if (allServicesModel!.data!.where((f) => element.slotTiming!.contains(f.slot) &&  element.slotDate!.toString().toLowerCase().contains(f.date!))) {
        //   bookedServicesIndex.add(servicesModelDart!.data!.indexOf(element));
        // }
        allServicesModel!.data!
            .where((f) =>
                element.slotTiming!.contains(f.slot) &&
                element.slotDate!.toString().toLowerCase().contains(f.date!))
            .forEach((foundElement) {
          bookedServicesIndex.add(element.slotTiming!.indexOf(foundElement.slot ?? "0"));
        });
      });
      bookedServicesIndex = bookedServicesIndex.toSet().toList();
      
      print("Booked Slots Indexes =======>>>>>>: ${bookedServicesIndex}");
      // notificationLoaded = true;
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
    // print(" service data ===>>>: ${servicesModelDart!.data!}");
  }

  void selectTimeSlot(int index) {
    timeSlots.forEach((e) => e.isSelected = false);
    selectedSlot = timeSlots[index];
    // selectedSlot!.isSelected = !selectedSlot!.isSelected;

    selectedSlot!.isSelected = true;
    print(selectedSlot!.time);
    update();

    // if (selectedSlot!.isSelected) {
    //   box.writeIfNull('selectedSlots', []);
    //   final List<dynamic>? selectedSlots = box.read('selectedSlots');
    //   selectedSlots?.add(selectedSlot!.time);
    //   box.write('selectedSlots', selectedSlots);
    //   update();
    // } else {
    //   final List<dynamic>? selectedSlots = box.read('selectedSlots');
    //   selectedSlots?.remove(selectedSlot!.time);
    //   box.write('selectedSlots', selectedSlots);
    //   update();
    // }
  }

  Future<void> addService() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "dates": DateFormat('dd-MM-yyyy').format(selectedDate).toString(),
      // "slot": timeSlots.map((e) => e.time).toList(),
      "slot": selectedSlot!.time.toString(),
      "pet": selectedPet.toString(),
      "city": selectedCity!.cityName.toString(),
      "mobile": numberController.text.trim(),
      "service_id": serviceId.toString(),
      "user_id": storage.read('id').toString()
    };
    String serviceBooking = Constants.SERVICE_BOOKING;
    print(body);
    try {
      // List documentList = [
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45 (1).png', 'key': "logo"},
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45.png', 'key': "profile"},
      // ];
      // var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest('POST', Uri.parse(serviceBooking));
      request.fields.addAll(body);
      // request.files.add(await http.MultipartFile.fromPath(
      //     'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      // documentList.forEach((element) async {
      //   request.files.add(await http.MultipartFile.fromPath(
      //       element["key"], element["value"]));
      // });
      await ApiHelper.postFormData(request: request);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Service Added',
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
