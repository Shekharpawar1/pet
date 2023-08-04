 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/addAddressModel.dart';

class AddressController extends GetxController{

  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController flataddressController = TextEditingController();
  TextEditingController areaaddressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  AddAddressModel?  addaddressmodel ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 int? itemcount;
 int? isselected;
 List<AddAddressModel?> addaddressall=[];
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
void clearFields() {
    fullNameController.clear();
    lastNameController.clear();
    numberController.clear();
    flataddressController.clear();
    areaaddressController.clear();
    landmarkController.clear();
    pincodeController.clear();
    // dropdownstate.clear();
    // dropdowncity="";
  }
  void chooseaddress(int index){
isselected = index;
 update();
  }

void addaddress(){
   addaddressmodel = AddAddressModel(
    firstname:fullNameController.text,
    lastname: lastNameController.text,
    number: numberController.text,
    address1: flataddressController.text,
    address2: areaaddressController.text,
    landmark: landmarkController.text,
    pincode:pincodeController.text ,
    state: dropdownstate,
    city:dropdowncity
     );
 addaddressall!.add(addaddressmodel!);
itemcount =  addaddressall.length;
 update();

clearFields();

    //  print(addaddressall.length);

}

void removeaddress(int index){
addaddressall.removeAt(index);
itemcount = addaddressall.length;

}
  // String? dropdownIdentityType;
  // List<String> identityTypeDropDownList = ["Passport", "Aadhar card"];
 }