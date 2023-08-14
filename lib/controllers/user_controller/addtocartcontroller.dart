import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/addAddressModel.dart';
import 'package:pet/models/usersModel/addressdeleteModel.dart';
import 'package:pet/models/usersModel/mycartListModel.dart';
import 'package:pet/models/usersModel/mycartlistdeleteModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class MyCartController extends GetxController {
// int? itemID;
  int? additemid;
  int? disCount;
  int? addressid;
  int? price;
// var sizecount = 0;
  List sizes = [];
int total = 1;
var tex;
// void  incrementSize(){
// sizes[]++;
//     update();
//   }
  int? isselected;

  void additem(int id) {
    additemid = id;
    update();
    print("ID${additemid}");
  }

  void selectaddadress(int id) {
    addressid = id;
    update();
    print("ID${addressid}");
  }

//  void productsizes(List sizedproduct) {
//     sizes = sizedproduct;
//     update();
//     print("sizes${sizes}");
//   }

  void adddiscount(int disprice, int price) {
    disCount = disprice;
    price = price;
     tex = price*0.5;
    update();
    print("disCount${disCount}");
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }

  incrementSize(int index) {
    sizes[index]++;
    update();
    print("SIzes${sizes}");
    // total = 0;
    // mycartmodel!.data!.forEach((element) async {
    //   total += (int.parse(element.price!) *
    //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
    //   //  subtotal += total*sizes[0];
    //   print("total${total}");
    // });
    
    updateTotal();
  }

  decrementSize(int index) {
    if (sizes[index] > 1) {
      sizes[index]--;
      update();
      print("SIzes--${sizes}");
    }
    updateTotal();
  }
  void updateTotal() {
    
    total = 0;
    mycartmodel!.data!.forEach((element) async {
      total += (int.parse(element.price!) *
          sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
      //  subtotal += total*sizes[0];
      print("total${total}");
    });
  }
  

  void chooseaddress(int index) {
    isselected = index;
    update();
  }

  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  MyCartListModel? mycartmodel;
  bool cartlistLoaded = false;
  int itemID = 244;
  var subtotal;

  Future<void> init() async {
    try {
      // productdeatils
      mycartmodel = MyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "$itemID"));
      print(mycartmodel);
      sizes = mycartmodel!.data!.map((e) => 1).toList();

      // mycartmodel!.data!.forEach((element) async {
      //   total += (int.parse(element.price!) *
      //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
      //   //  subtotal += total*sizes[0];
      //   print("total${total}");
      // });

      print(getUserMyCartUrl + "$itemID");
      cartlistLoaded = true;
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
  }

  String getUserMyCartDeleteUrl = '${Constants.GET_USER_MYCARTLISTDELETE}';
  MyCartListDeleteModel? mycartdeletemodel;
  bool cartlistdeleteLoaded = false;

  Future<void> initdelete() async {
    try {
      // productdeatils
      mycartdeletemodel = MyCartListDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserMyCartDeleteUrl + "$additemid"));
      print(mycartdeletemodel);
      print("delete");
      print(getUserMyCartDeleteUrl + "$additemid");
      cartlistLoaded = true;
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
  }

  String getUserAllAddressUrl = '${Constants.GET_USER_ALLADDRESSLIST}';
  AllAddressListModel? allAddresslistModel;
  bool addresslistLoaded = false;

  int userId = 244;
  Future<void> alladdressinit() async {
    try {
      // productdeatils
      allAddresslistModel = AllAddressListModel.fromJson(
          await ApiHelper.getApi(getUserAllAddressUrl + "$userId"));
      print(allAddresslistModel);

      print(getUserAllAddressUrl + "$userId");
      addresslistLoaded = true;
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
  }

  String getUserAdressDeleteUrl = '${Constants.GET_USER_ADDRESS_DELETE}';

  AddressDeleteModel? addressdeletemodel;
  bool addressdeleteLoaded = false;

  Future<void> addressdeleteinit() async {
    try {
      addressdeletemodel = AddressDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserAdressDeleteUrl + "$addressid"));
      print(addressdeleteLoaded);
      print("delete");
      print(getUserAdressDeleteUrl + "$addressid");
      addressdeleteLoaded = true;
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
  }
}
