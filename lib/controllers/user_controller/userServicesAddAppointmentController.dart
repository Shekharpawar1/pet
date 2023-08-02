import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/TimeslotModel.dart';

class UserServicesAddAppointmentController extends GetxController {
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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

  void updateCity(String city) {
    selectedcity = city;
    update();
  }

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

    selectedcity;
    print("Data cleared...");
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
}
