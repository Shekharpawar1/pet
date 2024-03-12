import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addresscontroller.dart';
import 'package:pet/controllers/user_controller/coupons_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart';
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
  
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
// int? itemID;
  int? additemid;
  int? disCount;
  int? addressid;
  int? price;
  // int? sizecountt =0 ;
// var sizecount = 0;
  List sizes = [];
  bool showLoading = false;
  var userID;
  double total  = 0.00;
   int deliverycharges  = 999;
    int deliveryprice  = 40;
  int totalprice = 0;
  String? paymenttype;
  int? isselected1;
  String? paymentStatus;
  String? orderStatus;
  String? paymentMethodUser1;
  var tex;
  var addressuser;

  int? selectID;
  int? selectqty;
  String? selectname;
  double? selecttex;
  double? selectprice;
  int? selectdis;
  String? selectreturn;
  int? selectStoreId;
 var qty ;
  // String user_id=storage.read("id").toString();
  List<Map<String, dynamic>> cartList = [];

  int? isselected;

  void additem(int id) {
    additemid = id;
    update();
    print("ItemID${additemid}");
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


  void totalbuyNowPrice( double totalprice) {
    total = totalprice;
    update();
    print("TotalPriceBuy ====>>>>> $total");
  }

  void addpaymenttype(
      String type, String paymentstatus, String paymentMethodUser) {
    paymenttype = type;
    paymentStatus = paymentstatus;
    paymentMethodUser1 = paymentMethodUser;
    update();
    print(
        "paymentMethod1: ${paymentMethodUser1},paymenttype: ${paymenttype},paymentstatus: ${paymentstatus}");
  }

  void adddata(int id, int qty, String name, double tex, double price, int dis,int store_id,
  String returnorder
   ) {
    showLoading = false;
    selectID = id;
    selectqty = qty;
    selectname = name;
    selecttex = tex;
    selectprice = price;
    selectdis = dis;
    selectreturn = returnorder;
    selectStoreId=store_id;

    cartList = [
      {
        "product_id": selectID.toString(),
        "quantity": selectqty.toString(),
        "store_id":selectStoreId.toString(),
        "variation": selectname.toString(),
        "tax_amount":"0",
        "discount_on_item": selectdis.toString(),
        "price": selectprice.toString(),
        "return_order": selectreturn.toString()
      }
    ];

    update();
    print(
        "DataBuyNowupdated ====>>>>> $selectID   $selectname $selecttex $selectprice $selectdis");
    print(cartList);
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
    addressuser = storage.read('useraddresscity');
  }
//Sizesssss
  incrementSize(int index) {
  
if(mycartmodel!.data![index].totalQuantity != "0"){
   if (sizes[index] < int.parse(mycartmodel!.data![index].totalQuantity!).toInt()) {
    // print("SIzes++++${mycartmodel!.data![index].totalQuantity}");
sizes[index]++;
   mycartmodel!.data![index].quantity = sizes[index];

   
print("Sizes after increment: ${mycartmodel!.data![index].quantity}");

print("Counttttprice ${mycartmodel!.data![index].price}");
    update();

    print("SIzes${sizes}");
    storage.write('size_$index', sizes[index]);
    print("ReadSizes${storage.read('size_$index')}");

    updateTotal();
    
    // Check if sizes[index] is equal to totalQuantity
    if (sizes[index] == int.parse(mycartmodel!.data![index].totalQuantity!).toInt()) {

      Get.snackbar(
        'Maximum Quantity Reached',
        'You have reached the maximum stock for this item.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } else {
    // If sizes[index] is already equal to totalQuantity
    print("Maximum Quantity");
    Get.snackbar(
      'Maximum Quantity Reached',
      'You have reached the maximum quantity for this item.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

else{
  print("bbcbccb");
  sizes[index]++;
   mycartmodel!.data![index].quantity = sizes[index];

  
   
print("Sizes after increment: ${mycartmodel!.data![index].quantity}");

print("Counttttprice ${mycartmodel!.data![index].price}");
    update();

    print("SIzes${sizes}");
    updateTotal();
}


  }


  
  decrementSize(int index) {
    if (  sizes[index] > 1) {
      sizes[index]--;
      mycartmodel!.data![index].quantity = sizes[index];
      
print("Sizes after decrement** : ${mycartmodel!.data![index].quantity}");

print("Counttttprice--- ${mycartmodel!.data![index].price}");
      update();
      print("SIzes--${sizes}");
    }

      GetStorage().write('sizes_$index', sizes[index]);
      print("ReadSizes---${storage.read('sizes_$index')}");

    updateTotal();
  }
  

  void updateTotal() {
    total = 0;

      mycartmodel!.data!.forEach((element) {
      String priceString = element.price.toString();
      String quty = element.quantity.toString();

      double price = double.parse(priceString);
int quantity = int.parse(quty);

double priceqty = price * quantity;
print("priceqtyvv${priceqty}");
      try {
        double price = double.parse(priceString);
        int qtyyy = int.parse(quty);
        int sizeIndex = mycartmodel!.data!.indexOf(element) ?? 0;
        int size = sizes.elementAt(sizeIndex);
  int qty = (price / qtyyy).toInt();

totalprice =  price.toInt();
        total +=
            (priceqty ).toInt();
           
      } catch (e) {
        print("Error parsing price: $e");
      }


      List<Map<String, dynamic>> cartJsonList1 = mycartmodel!.data!
          .map((item) => {
                "product_id": item.itemId,
                "quantity":item.quantity,
                "variation": item.variant,
                "tax_amount": "0",
                "discount_on_item":storage.read('productItem'),
                "price":( item.price! * item.quantity!.toInt()),
                "return_order":item.returnOrder??"no",
              })
          .toList();
print("carttt");
          print(cartJsonList1);
cartList = cartJsonList1;
          
    });
    showLoading = false;
    update();

    print("total: $total");
  }

  void chooseaddress(int index) {
    isselected = index;
    update();
    print("Index updated ====>>>>> $isselected");
  }

  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  MyCartListModel? mycartmodel;
  bool cartlistLoaded = false;

  // var subtotal;

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      mycartmodel = MyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('id')}"));
      print("====?//${mycartmodel}");
      sizes = mycartmodel!.data!.map((e) => e.quantity).toList();
      cartList = [];
      List<Map<String, dynamic>> cartJsonList = mycartmodel!.data!
          .map((item) => {
                "product_id": item.itemId,
                "quantity": item.quantity,
                "variation": item.variant,
                "tax_amount": "0",
                "discount_on_item":storage.read('productItem'),
                "price":( item.price! *   item.quantity!.toInt()),
                "return_order":item.returnOrder??"no" ,
              })
          .toList();
      cartList = cartJsonList;
      
      

      print("===??????${cartJsonList}");


      print("URL====${getUserMyCartUrl + "${storage.read('id')}"}");
      print(mycartmodel);
      cartlistLoaded = true;
       updateTotal();
      update();
    } catch (e) {
      print('Error: $e');
  
    }
    showLoading = false;
    update();
  }
 @override
  void onClose() {
    print("closing...");
  clearFields();
    super.onClose();
  }
void clearFields() {
    
    couponsController.couponcode = '';
     couponsController.maxAmount = "0";
update();
  }
  // productdetails
  String getUserProductDetailsUrl = '${Constants.GET_USER_PRODUCTDETAILS}';
  ProductDetailsModel? productdetailmodel;
  bool productdetailLoaded = false;


  String getUserMyCartDeleteUrl = '${Constants.GET_USER_MYCARTLISTDELETE}';
  MyCartListDeleteModel? mycartdeletemodel;
  bool cartlistdeleteLoaded = false;

  Future<void> initdelete() async {
    showLoading = true;
    update();
    try {
      mycartdeletemodel = MyCartListDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserMyCartDeleteUrl + "$additemid"));
      print(mycartdeletemodel);
      print("delete");
      print(getUserMyCartDeleteUrl + "$additemid");
      cartlistLoaded = true;

      // final ProductDetailsController productdetailscontroller =
      //     Get.put(ProductDetailsController());
      // await productdetailscontroller.isProductInCart();
      print("====>>>>> model: ${mycartmodel!.toJson()}");
      mycartmodel!.data!.removeWhere((element) => element.id == additemid);
      if (mycartmodel!.data!.isEmpty){
        print("mycartmodelis Empty");
        print(mycartmodel!.data!.length);
          price = 0;
        total =0;

       couponsController.couponcode = "null";
        couponsController..maxAmount = "0";
clearFields();

      // await productdetailscontroller.isProductInCart();
        print("ToTal====?");
      }


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
    showLoading = false;
    update();
  }
  RxString address=''.obs;
  String getUserAllAddressUrl = '${Constants.GET_USER_ALLADDRESSLIST}';
  AllAddressListModel? allAddresslistModel;
  bool addresslistLoaded = false;

  Future<void> alladdressinit() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      allAddresslistModel = AllAddressListModel.fromJson(
          await ApiHelper.getApi(getUserAllAddressUrl + "${storage.read('id')}"));
      address.value=
      "${allAddresslistModel!.data![0].houseNo},${allAddresslistModel!.data![0].area} ,${allAddresslistModel!.data![0].landmark} , ${allAddresslistModel!.data![0].city}, ${allAddresslistModel!.data![0].state}-${allAddresslistModel!.data![0].pincode}";
       await storage.write("UserbillingAddress",address.value);
      print("user billing address${address.value}");
      print(allAddresslistModel);

      print(getUserAllAddressUrl + "$userID");
      addresslistLoaded = true;
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
      sendingAddr =
          "${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].city ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].area ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].houseNo ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].landmark ?? ""}";
      print(sendingAddr);
    }

    if (addtocartController.allAddresslistModel == null ||
        addtocartController.allAddresslistModel!.data == null ||
        addtocartController.allAddresslistModel!.data!.isEmpty) {
      sendingAddrID = 0;
    } else {
      sendingAddrID = isselected1 ?? 0;
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
      //"phonepe_transactionId":phonepetransaction.toString(),
      //"custom_transactionId":merchantTransaction.toString(),
      "payment_mode": paymentMethodUser1.toString(),
      "total_tax_amount": "0",
      "payment_method": paymenttype.toString(),
      "transaction_reference": "sadgash23asds",
      "delivery_address_id": sendingAddrID.toString(),
      "delivery_"
      "coupon_code": couponsController.couponcode ?? '',
      "order_type": "delivery",
      "checked": 1.toString(),
      "store_id": 1.toString(),
      "zone_id": 2.toString(),
      "delivered_status": "undelivered",
      "delivery_address": storage.read('useraddresscity').toString(),
    "delivery_charge": (deliveryprice??40).toString() ,
    "original_delivery_charge":(deliveryprice??40).toString() ,
      "item_campaign_id": "",
      "order_amount": ((total)-num.parse(couponsController.maxAmount??'0') > deliverycharges)?
       ((total  ) -
              (double.parse(couponsController.maxAmount ?? "0.0"))).toInt()
          .toString():
      (((total + deliveryprice) ) -
              (double.parse(couponsController.maxAmount ?? "0.0"))).toInt()
          .toString(),
      "cart": cartList,
    };
    // String PlaceOrderUrl = Constants.PLACE_ORDER;
    String PlaceOrderUrl = Constants.PLACE_ORDER;
    print("====>>>> Body Place Order: ${body}");
    try {
      // var request = http.MultipartRequest('POST', Uri.parse(PlaceOrderUrl));
      // request.fields.addAll(body);

      await ApiHelper.postApi(body: body, url: PlaceOrderUrl);
      update();
      // Get.back();
      Get.snackbar(
        'Success',
        'Order place successfully',
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
      throw "error";
    }

    showLoading = false;
    update();
  }

  Future<void> buynowplaceorder() async {
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
      sendingAddr =
          "${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].city ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].area ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].houseNo ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].landmark ?? ""}";
      print(sendingAddr);
    }

    if (addtocartController.allAddresslistModel == null ||
        addtocartController.allAddresslistModel!.data == null ||
        addtocartController.allAddresslistModel!.data!.isEmpty) {
      sendingAddrID = 0;
    } else {
      sendingAddrID = isselected1 ?? 0;
      print(sendingAddr);
    }

// print(body);

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
      "total_tax_amount":"0",
      "payment_method": paymenttype.toString(),
      "transaction_reference": "sadgash23asds",
      "delivery_address_id": sendingAddrID.toString(),
       "delivery_charge": (deliveryprice??40).toString() ,
    "original_delivery_charge":(deliveryprice??40).toString() ,
      "coupon_code": couponsController.couponcode ?? '',
      "order_type": "delivery",
      "checked": 1.toString(),
      "store_id": 1.toString(),
      "zone_id": 2.toString(),
      "delivered_status": "undelivered",
      "delivery_address": storage.read('useraddresscity').toString(),
      // (allAddresslistModel!
      //                               .data![isselected ?? 0]
      //                               .area ??
      //                           '').toString(),
      "item_campaign_id": "",
      "order_amount": 
      
      selectprice.toString(),
      "cart": [
        {
          "product_id": selectID.toString(),
          "quantity": selectqty.toString(),
          "variation": selectname.toString(),
          "tax_amount": selecttex.toString(),
          "discount_on_item": selectdis.toString(),
          "price": selectprice.toString()
        }
      ].toList()
    };
    // String PlaceOrderUrl = Constants.PLACE_ORDER;
    print(body);
    try {
      // var request = http.MultipartRequest('POST', Uri.parse(PlaceOrderUrl));
      // request.fields.addAll(body);

      // await ApiHelper.postApi(body: body, url: PlaceOrderUrl);
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
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
      throw "error";
    }

    showLoading = false;
    update();
  }

  // String INITIATE_PAYMENT = '${Constants.INITIATE_PAYMENT}';

  // Future<void> placeorder2(double amount) async {
  //   showLoading = true;
  //   update();
  //   final storage = GetStorage();
  //   int store_id=storage.read('store_id');
  //   MyCartController addtocartController = Get.put(MyCartController());
  //   String sendingAddr = "";
  //   int sendingAddrID = 0;
  //   if (addtocartController.allAddresslistModel == null ||
  //       addtocartController.allAddresslistModel!.data == null ||
  //       addtocartController.allAddresslistModel!.data!.isEmpty) {
  //     sendingAddr = "Demo address";
  //   } else {
  //     sendingAddr =
  //     "${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].city ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].area ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].houseNo ?? ""} ${addtocartController.allAddresslistModel!.data![addtocartController.isselected ?? 0].landmark ?? ""}";
  //     print(sendingAddr);
  //   }
  //
  //   if (addtocartController.allAddresslistModel == null ||
  //       addtocartController.allAddresslistModel!.data == null ||
  //       addtocartController.allAddresslistModel!.data!.isEmpty) {
  //     sendingAddrID = 0;
  //   } else {
  //     sendingAddrID = isselected1 ?? 0;
  //     print(sendingAddr);
  //   }
  //
  //   Map<String, dynamic> body = {
  //     "user_id": storage.read('id').toString(),
  //     "role":0,
  //     "store_id": store_id,
  //     "coupon_discount_amount": (couponsController.maxAmount ?? "0").toString(),
  //     "coupon_discount_title": couponsController.coupontitle ?? '',
  //     "payment_status": paymentStatus.toString(),
  //     "order_status": "pending",
  //     // "gst_bill": "0",
  //     "payment_day": "0",
  //     "payment_mode": paymentMethodUser1.toString(),
  //     "total_tax_amount": "0",
  //     "payment_method": "online",
  //     "transaction_reference": "sadgash23asds",
  //     "delivery_address_id": sendingAddrID.toString(),
  //
  //         "coupon_code": couponsController.couponcode ?? '',
  //     "order_type": "delivery",
  //     "checked": 1.toString(),
  //
  //     "zone_id": 2.toString(),
  //     "delivered_status": "undelivered",
  //     "delivery_address": storage.read('useraddresscity').toString(),
  //     "delivery_charge": (deliveryprice??40).toString() ,
  //     "original_delivery_charge":(deliveryprice??40).toString() ,
  //     "item_campaign_id": "",
  //     "order_amount": ((total)-num.parse(couponsController.maxAmount??'0') > deliverycharges)?
  //     ((total  ) -
  //         (double.parse(couponsController.maxAmount ?? "0.0"))).toInt()
  //         .toString():
  //     (((total + deliveryprice) ) -
  //         (double.parse(couponsController.maxAmount ?? "0.0"))).toInt()
  //         .toString(),
  //     "cart": cartList,
  //   };
  //   // String PlaceOrderUrl = Constants.PLACE_ORDER;
  //   String jsonBody = json.encode(body);
  //
  //   // Define your API endpoint
  //   String INITIATE_PAYMENT = Constants.INITIATE_PAYMENT;
  //
  //   try {
  //     // Send the POST request with JSON body
  //     final response = await http.post(
  //       Uri.parse(INITIATE_PAYMENT),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonBody,
  //     );
  //
  //     print(response);
  //
  //     update();
  //     // Get.back();
  //     Get.snackbar(
  //       'Success',
  //       'Order place successfully',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   } catch (e) {
  //     print('Error: $e');
  //
  //     // Get.snackbar(
  //     //   'Error',
  //     //   'An error occurred: $e',
  //     //   snackPosition: SnackPosition.BOTTOM,
  //     //   backgroundColor: Colors.red,
  //     //   colorText: Colors.white,
  //     // );
  //     throw "error";
  //   }
  //
  //
  //   showLoading = false;
  //   update();
  // }

}
