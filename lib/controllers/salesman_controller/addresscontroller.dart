 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/salesmanModel/addAddressModel.dart';
import 'package:pet/models/stateModel.dart';
// import 'package:pet/models/usersModel/addAddressModel.dart';
import 'package:http/http.dart' as http;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;


class SalesAddressController extends GetxController{
final storage = GetStorage();

var sellerId = GetStorage().read("sellerid");

// var wholesellerID = GetStorage().read("wholesalerid");
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController flataddressController = TextEditingController();
  TextEditingController areaaddressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  SalesAllAddressListModel?  addaddressmodel ;
  var wholesellerID;
  int? addressid;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 int? itemcount;
 int? isselected;
 List<SalesAllAddressListModel?> addaddressall=[];
    // String? dropdownstate;
  // List<String> stateDropDownList = ["Andhra Pradesh", "Assam", "Bihar","Madhya Pradesh", "Maharashtra", ];
  bool showLoading = false;
  // String? dropdowncity;
  // List<String> cityDropDownList = ["Bhopal", "Indore"];

  //   void updateSate(String state) {
  //   dropdownstate = state;
  //   update();
  // }

  // void updatecity(String city) {
  //   dropdowncity = city;
  //   update();
  // }

final box = GetStorage();

  @override
  void onClose() {
    print("closing...");
  clearFields();
   dispose();
    super.onClose();
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
    selectedState= null;
    selectedCity= null;
    stateListModel= null;
    cityListModel =null;
    

  }

  void dispose() {
    clearFields();
   
  update();
  }

void clearcity() {

 selectedCity= null;
cityListModel =null;
}
//   void chooseaddress(int index){
// isselected = index;
//  update();
//   }

  @override
  void onInit() {
    super.onInit();
    init();
      //     print("WholeSellerIDAddress ==>${wholesellerID}");
      //  print("SellerIDAddress ==>${sellerId}");
  }
   

fethUserId() {
  
     wholesellerID = storage.read('wholesalerId');
     print("WholeSellerID ==>${wholesellerID}");
       print("SellerID ==>${sellerId}");
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
      // Get.snackbar(
      //   'Error',
      //   'Unable to get State: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    showLoading = false;
    update();
  }
  String getUserStateUrl = Constants.GET_STATE_LIST;
  StateListModel? stateListModel;
  bool stateLoaded = false;
  // bool showLoading = false;
  statesFile.State? selectedState;
  Future<void> updateState(statesFile.State state) async {
    selectedState = state;
    showLoading = true;
    update();
    print("stateiD==${selectedState}");
    await fetchCity(state.id.toString());
    showLoading = false;
    update();
    //  clearFields();
  }
void addadressID(int id) {
    addressid = id;
    update();
     print("statecity==${addressid}");

  }
  // city list
  String getCityUrl = Constants.GET_CITY_LIST;
  CityListModel? cityListModel;
  // cityListModel!.state = [];
  bool cityLoaded = false;

  
  cityFile.State? selectedCity;
  Future<void> updateCity(cityFile.State? city) async {
    selectedCity = city;
    
    // showLoading = true;
    update();
     print("statecity==${selectedCity}");
    //  clearFields();
  }
 
  fetchCity(String stateId) async {
    showLoading = true;
    update();
    
    // try {
      // city list
      // cityListModel =
      //     CityListModel.fromJson(await ApiHelper.getApi(getCityUrl + stateId));

      //  print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(getCityUrl));
      request.fields.addAll({
        "state":stateId.toString()
      });
      
   cityListModel  = CityListModel.fromJson(await ApiHelper.postFormData(request: request));
   
      // update();
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

    showLoading = false;
    update();
  }

 


void updateaddress(int? id,String? firstname,String? lastname,String? number,String? pincode,String? landmark,String? houseno, String? area , ){

    fullNameController.text = firstname ?? "";
     lastNameController.text = lastname??"";
  numberController.text = number??'';
  pincodeController.text = pincode??'';
    flataddressController.text = houseno??'';
     areaaddressController.text = area??'';
     landmarkController.text = landmark??'';
    
    // selectedState = statename;
    // selectedCity = city;
     
//  addaddressall!.add(addaddressmodel!);
// itemcount =  addaddressall.length;
 update();
 print( fullNameController.text );
// clearFields();

    //  print(addaddressall.length);

}

// void removeaddress(int index){
// addaddressall.removeAt(index);
// itemcount = addaddressall.length;

// }





  Future<void> addaddress() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
        "first_name":fullNameController.text,
      "last_name": lastNameController.text,
      "mobile":numberController.text,
      "house_no":flataddressController.text,
      "area":areaaddressController.text,
      "landmark": landmarkController.text,
      "pincode":pincodeController.text ,
     "state":selectedState!.stateName.toString(),
     "city":selectedCity!.cityName.toString(),
     "user_id":storage.read('wholesalerId').toString(),
     
    };
    String AddAddress = Constants.ADD_ADDRESS;
    print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(AddAddress));
      request.fields.addAll(body);
      
      await ApiHelper.postFormData(request: request);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Address Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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

    showLoading = false;
    update();
  }


  Future<void> updateaddaddress() async {
    showLoading = true;
    update();
   
    var body = {
      "user_id": storage.read('wholesalerId').toString(),
      "first_name":fullNameController.text,
      "last_name": lastNameController.text,
      "mobile":numberController.text,
      "house_no":flataddressController.text,
      "area":areaaddressController.text,
      "landmark": landmarkController.text,
      "pincode":pincodeController.text ,
     "state":selectedState!.stateName.toString(),
     "city":selectedCity!.cityName.toString(),
      "id":addressid.toString()
     
    };
    String UpdateAdress = Constants.ADD_UPDATE_ADDRESS;
    print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(UpdateAdress));
      request.fields.addAll(body);
      
      await ApiHelper.postFormData(request: request);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Address Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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

    showLoading = false;
    update();
  }




  // String? dropdownIdentityType;
  // List<String> identityTypeDropDownList = ["Passport", "Aadhar card"];
 }