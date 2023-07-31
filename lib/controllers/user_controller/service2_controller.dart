

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/TimeslotModel.dart';

class Service2Controller extends GetxController{
  TextEditingController cityController = TextEditingController();
      TextEditingController numberController = TextEditingController();

  List<String> city = [
    "Bhopal", "Indore",
  ];

  String? selectedcity;

  
  void updateCity(String city) {
    selectedcity = city;
    update();
  }
  final List<TimeSlot> timeSlots = [
    TimeSlot(time: '11:00'),
    TimeSlot(time: '11:30 '),
    TimeSlot(time: '12:00'),
    TimeSlot(time: '12:30'),
    TimeSlot(time: '1:00'),
    TimeSlot(time: '1:30'),
    // Add more time slots as needed
  ];

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Restore previous selections from GetStorage
    final List<String>? selectedSlots = box.read('selectedSlots');
    if (selectedSlots != null) {
      timeSlots.forEach((slot) {
        if (selectedSlots.contains(slot.time)) {
          slot.isSelected = true;
           update();
        }
      });
    }
  }

  void selectTimeSlot(int index) {
    final TimeSlot selectedSlot = timeSlots[index];
    selectedSlot.isSelected = !selectedSlot.isSelected;

    if (selectedSlot.isSelected) {
      box.writeIfNull('selectedSlots', []);
      final List<String>? selectedSlots = box.read('selectedSlots');
      selectedSlots?.add(selectedSlot.time);
      box.write('selectedSlots', selectedSlots);
      //  update();
    } else {
      final List<String>? selectedSlots = box.read('selectedSlots');
      selectedSlots?.remove(selectedSlot.time);
      box.write('selectedSlots', selectedSlots);
      //  update();
    }

    
  }
}
