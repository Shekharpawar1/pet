 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{

  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController flataddressController = TextEditingController();
  TextEditingController areaaddressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? dropdownstate;
  List<String> stateDropDownList = ["Andhra Pradesh", "Assam", "Bihar","Madhya Pradesh", "Maharashtra", ];

  String? dropdowncity;
  List<String> cityDropDownList = ["Bhopal", "Indore"];

    void updateSate(String state) {
    dropdownstate = state;
    update();
  }

  void updatecity(String city) {
    dropdowncity = city;
    update();
  }

  // String? dropdownIdentityType;
  // List<String> identityTypeDropDownList = ["Passport", "Aadhar card"];
 }