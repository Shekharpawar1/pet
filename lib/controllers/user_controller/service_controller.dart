
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/models/cityModel.dart' as cityFile;

class ServiceController  extends GetxController {


  bool  isAdding = false;

  toogle(int index) {
    isAdding = !isAdding;
  }
  void addtime() {
    isAdding = true;
    update();
  }

  void timeslot() {
    isAdding = false;
    update();
  }


String getCityUrl = Constants.GET_CITY_LIST;
  CityListModel? cityListModel;
 
  bool cityLoaded = false;
 List _serviceList = [
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Brush",
    
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Nail Cuttter",
     
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "comb",
     
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Slicker",
     
    },
    
  ].obs;
  List _slottimeList = [
    {
      "time": "11:00",
    
    
    },
    {
      "time": "11:30",
     
    },
    {
      "time": "12:00",
     
    },
    {
     "time": "12:30",
     
    },
     {
      "time": "1:00",
    
    
    },
    {
      "time": "1:30",
     
    },
    {
      "time": "2:00",
     
    },
    {
     "time": "2:30",
     
    },
    
  ].obs;
  
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

  // @override
  // void onInit() {
  //   super.onInit();
  //   init();
  // }

  get getServiceList => _serviceList;
   get gettimeslotList => _slottimeList;
}