import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addresscontroller.dart';
import 'package:pet/controllers/user_controller/coupons_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/models/usersModel/addAddressModel.dart';
import 'package:pet/models/usersModel/addressdeleteModel.dart';
import 'package:pet/models/usersModel/mycartListModel.dart';
import 'package:pet/models/usersModel/mycartlistdeleteModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class MyCartController extends GetxController {
  final storage = GetStorage();
  CouponsController couponsController = Get.put(CouponsController());
  AddressController addressController = Get.put(AddressController());

// int? itemID;
  int? additemid;
  int? disCount;
  int? addressid;
  int? price;
// var sizecount = 0;
  List sizes = [];
  bool showLoading = false;
  var userID;
  int total = 1;
  String? paymenttype;
  int? isselected1;
  String? paymentStatus;
  String? orderStatus;
  String? paymentMethodUser1;
  var tex;
  var  addressuser;
  List<Map<String, dynamic>> cartList = [];
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

  void chooseaddressID(int id) {
    isselected1 = id;
    update();
    print("Address Id ====>>>>> $isselected1");
  }
//  void productsizes(List sizedproduct) {
//     sizes = sizedproduct;
//     update();
//     print("sizes${sizes}");
//   }
  void addpaymenttype(String type, String paymentstatus, String paymentMethodUser  ) {
    paymenttype = type;
paymentStatus = paymentstatus;
    paymentMethodUser1    = paymentMethodUser;
// orderStatus = orderstatus;
    update();
    print("paymentMethod1: ${paymentMethodUser1},paymenttype: ${paymenttype},paymentstatus: ${paymentstatus}");
  }

  



  void adddiscount(int disprice, int price) {
    disCount = disprice;
    price = price;
    tex = price * 0.5;
    update();
    print("disCount${disCount}");
  }

  @override
  void onInit() {
    super.onInit();

    init();
    userID = storage.read('id');
  addressuser =   storage.read('useraddresscity');

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
  // void updateTotal() {

  //    total ;
  //   mycartmodel!.data!.forEach((element) async {
  //     total += (int.parse(element.price!) *
  //         sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
  //     //  subtotal += total*sizes[0];
  //     print("total${total}");
  //   });
  // }


  void updateTotal() {
    total = 0;

    mycartmodel!.data!.forEach((element) {
      String priceString = element.price.toString();

      try {
        double price = double.parse(priceString);
        int sizeIndex = mycartmodel!.data!.indexOf(element) ?? 0;
        int size = sizes.elementAt(sizeIndex);

        total +=
            (price * size).toInt(); // Convert the final value to an integer
      } catch (e) {
        print("Error parsing price: $e");
      }
    });

    print("Total: $total");
  }

  void chooseaddress(int index) {
    isselected = index;
    update();
    print("Index updated ====>>>>> $isselected");
  }

 
  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  MyCartListModel? mycartmodel;
  bool cartlistLoaded = false;

  var subtotal;

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      mycartmodel = MyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('id')}"));
      print("====?//${mycartmodel}");
      sizes = mycartmodel!.data!.map((e) => e.quantity).toList();
      List<Map<String, dynamic>> cartJsonList =
          mycartmodel!.data!.map((item) => {
            "product_id": item.itemId,
            "quantity":item.quantity,
            "variation":item.variant,
            "tax_amount":13,
            "discount_on_item":20,
            "price":item.price
          }).toList();
      cartList = cartJsonList;
      

// mycartmodel!.data!.forEach((element) async {
      //   total += (int.parse(element.price!) *
      //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
      //   //  subtotal += total*sizes[0];
      //   print("total${total}");
      // });

      print("URL====${getUserMyCartUrl + "${storage.read('id')}"}");
      print(mycartmodel);
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
    showLoading = false;
    update();
  }

  String getUserMyCartDeleteUrl = '${Constants.GET_USER_MYCARTLISTDELETE}';
  MyCartListDeleteModel? mycartdeletemodel;
  bool cartlistdeleteLoaded = false;

  Future<void> initdelete() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      mycartdeletemodel = MyCartListDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserMyCartDeleteUrl + "$additemid"));
      print(mycartdeletemodel);
      print("delete");
      print(getUserMyCartDeleteUrl + "$additemid");
      cartlistLoaded = true;
      
  final ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());
      await productdetailscontroller.isProductInCart();
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
  }

  String getUserAllAddressUrl = '${Constants.GET_USER_ALLADDRESSLIST}';
  AllAddressListModel? allAddresslistModel;
  bool addresslistLoaded = false;

  Future<void> alladdressinit() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      allAddresslistModel = AllAddressListModel.fromJson(
          await ApiHelper.getApi(getUserAllAddressUrl + "$userID"));
      print(allAddresslistModel);

      print(getUserAllAddressUrl + "$userID");
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
    showLoading = false;
    update();
  }

  String getUserAdressDeleteUrl = '${Constants.GET_USER_ADDRESS_DELETE}';

  AddressDeleteModel? addressdeletemodel;
  bool addressdeleteLoaded = false;

  Future<void> addressdeleteinit() async {
    showLoading = true;
    update();
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
    showLoading = false;
    update();
  }

  Future<void> placeorder() async {
    showLoading = true;
    update();
    
  MyCartController addtocartController = Get.put(MyCartController());
    String sendingAddr = "";
      int sendingAddrID = 0;
    if (addtocartController.allAddresslistModel == null ||
        addtocartController.allAddresslistModel!.data == null ||
        addtocartController.allAddresslistModel!.data!.isEmpty) {
      sendingAddr = "Demo address";
    } else {
      sendingAddr = "${addtocartController.allAddresslistModel!
                  .data![addtocartController.isselected ?? 0].city ??
              ""} ${addtocartController.allAddresslistModel!
                  .data![addtocartController.isselected ?? 0].area ??
              ""} ${addtocartController.allAddresslistModel!
                  .data![addtocartController.isselected ?? 0].houseNo ??
              ""} ${addtocartController.allAddresslistModel!
                  .data![addtocartController.isselected ?? 0].landmark ??
              ""}";
        print(sendingAddr);
    }

    if (addtocartController.allAddresslistModel == null ||
        addtocartController.allAddresslistModel!.data == null ||
        addtocartController.allAddresslistModel!.data!.isEmpty) {
      sendingAddrID = 0;
    } else {
      sendingAddrID = isselected1??0;
        print(sendingAddr);
    }



    Map<String, dynamic> body = {
      "user_id": storage.read('id').toString(),
      "seller_id": null,
      "coupon_discount_amount": (couponsController.maxAmount ?? "0").toString(),
      "coupon_discount_title": couponsController.coupontitle ?? '',
      "payment_status": paymentStatus.toString(),
      "order_status": "pending",
      "gst_bill": "0",
      "payment_day": "0",
       "payment_mode": paymentMethodUser1.toString(),
      "total_tax_amount": (total * 0.05).toString(),
      "payment_method": paymenttype.toString(),
      "transaction_reference": "sadgash23asds",
      "delivery_address_id": sendingAddrID.toString(),
      //  (allAddresslistModel!
      //                               .data![isselected ?? 0]
      //                               .id ??
      //                           0).toString(),
      "coupon_code": couponsController.couponcode ?? '',
      "order_type": "delivery",
      "checked": 1.toString(),
      "store_id": 1.toString(),
      "zone_id": 2.toString(),
      "delivered_status": "undelivered",
      "delivery_address":  storage.read('useraddresscity').toString(),
      // (allAddresslistModel!
      //                               .data![isselected ?? 0]
      //                               .area ??
      //                           '').toString(),
      "item_campaign_id": "",
      "order_amount": (((total) + (total * 0.05)) -
              (double.parse(couponsController.maxAmount ?? "0.0")))
          .toString(),
      "cart": cartList,
    };
    String PlaceOrderUrl = Constants.PLACE_ORDER;
    print(body);
    try {
      // var request = http.MultipartRequest('POST', Uri.parse(PlaceOrderUrl));
      // request.fields.addAll(body);

      await ApiHelper.postApi(body: body, url: PlaceOrderUrl);
      update();
      // Get.back();
      Get.snackbar(
        'Success',
        'Address Added',
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
      throw "error";
    }

    showLoading = false;
    update();
  }
}
