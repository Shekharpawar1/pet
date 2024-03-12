import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/addresscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/couponswhole_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/models/wholesalerModel/addAddressModel.dart';
import 'package:pet/models/wholesalerModel/addressdeleteModel.dart';
import 'package:pet/models/wholesalerModel/mycartListModel.dart';
import 'package:pet/models/wholesalerModel/mycartlistdeleteModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class MyCartWholeController extends GetxController {
  final storage = GetStorage();
  CouponsWholeController couponsController = Get.put(CouponsWholeController());
  WholeAddressController addressController = Get.put(WholeAddressController());
WholeProductDetailsController wholeProductDeailsCOntroller = Get.put(WholeProductDetailsController());
// int? itemID;
  int? additemid;
  int? disCount;
  int? addressid;
  int? price;
  String? paymentStatus;
  String? paymentdays1;
  String? paymentmethod1;
  bool? gst1;
  int? selectID;
  int? selectqty;
  String? selectname;
  int? selecttex;
  double? selectprice;
  int? selectdis;
// var sizecount = 0;
  List sizes = [];
  bool showLoading = false;
  var wholesalerID;
  double total = 0.0;
  String? paymenttype;
  var tex;
  List<Map<String, dynamic>> cartList = [];
// void  incrementSize(){
// sizes[]++;
//     update();
//   }
  int? isselected;
    int? isselected1;

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



void adddata(int id, int qty, String name, int tex, double price, int dis) {
    showLoading = false;
    selectID = id;
    selectqty = qty;
    selectname = name;
    selecttex = tex;
    selectprice = price;
    selectdis = dis;

    cartList = [
      {
        "product_id": selectID.toString(),
        "quantity": selectqty.toString(),
        "variation": selectname.toString(),
        "tax_amount": selecttex.toString(),
        "discount_on_item": selectdis.toString(),
        "price": selectprice.toString(),
      }
    ];

    update();
    print(
        "DataBuyNowupdated ====>>>>> $selectID   $selectname $selecttex $selectprice $selectdis");
    print(cartList);
  }

  void addpaymentPopup(String paymentday, bool gst, String paymnetmethod) {
    paymentdays1 = paymentday;
    gst1 = gst;
    paymentmethod1 = paymnetmethod;
// orderStatus = gst;
    update();
    print(
      "paymentdays1: ${paymentdays1},gst1: ${gst} paymentmethod: ${paymnetmethod}",
    );
  }

//  void productsizes(List sizedproduct) {
//     sizes = sizedproduct;
//     update();
//     print("sizes${sizes}");
//   }
  void addpaymenttype(String type, String paymentstatus) {
    paymenttype = type;
    paymentStatus = paymentstatus;

    update();
    print("paymenttype: ${paymenttype}");
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
    wholesalerID = storage.read('wholesalerid');
    print("WholesalerID ===> ${wholesalerID}");
  }

  incrementSize(int index) {
     if (sizes[index] <int.parse (wholemycartmodel!.data![index].totalQuantity!).toInt()) {
     
    print("SIzes++++${wholemycartmodel!.data![index].totalQuantity}");
     sizes[index]++;
       wholemycartmodel!.data![index].quantity = sizes[index];

   
print("Sizes after increment whole: ${wholemycartmodel!.data![index].quantity}");
    //  item.price ++;
    update();
   

    print("SIzes${sizes}");
    // total = 0;
    // mycartmodel!.data!.forEach((element) async {
    //   total += (int.parse(element.price!) *
    //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
    //   //  subtotal += total*sizes[0];
    //   print("total${total}");
    // });

    updateTotal();}
  }
 
  decrementSize(int index) {
    // print("SIzes--${wholemycartmodel!.data![index].minOrder??1}");
     if (  sizes[index] >wholemycartmodel!.data![index].minOrder??0) {
      sizes[index]--;
      wholemycartmodel!.data![index].quantity = sizes[index];
      
print("Sizes after decrement whole** : ${wholemycartmodel!.data![index].quantity}");
      update();
      print("SIzes--${sizes}");
    }
//     if (sizes[index] > wholemycartmodel!.data![index].minOrder??0) {
//       sizes[index]--;
//       update();
//       print("SIzes--${sizes}");
//  print("SIzes--${wholemycartmodel!.data![index].minOrder??0}");
//     }
    // if(wholemycartmodel!.data![index].minOrder == null){
    //   sizes[index]--;
    //   // update();
    //   print("----SIzes--${sizes}");
    //   print("SIzesbbbb--${wholemycartmodel!.data![index].minOrder??0}");
    // }
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
void clearFields() {
    
    couponsController.couponcode = null;
    //  couponsController.maxAmount = null;
update();
  }
  void totalbuyNowPrice( double totalprice) {
    total = totalprice;
    update();
    print("TotalPriceBuy ====>>>>> $total");
  }
  void updateTotal() {
    total = 0.0;

    wholemycartmodel!.data!.forEach((element) {
      String priceString = element.price.toString();
 String quty = element.quantity.toString();

      double price = double.parse(priceString);
int quantity = int.parse(quty);

double priceqty = price * quantity;

      try {
        double price = double.parse(priceString);
         int qtyyy = int.parse(quty);
        int sizeIndex = wholemycartmodel!.data!.indexOf(element) ?? 0;
        int size = sizes.elementAt(sizeIndex);


 int qty = (price / qtyyy).toInt();
print("Quantiy");
print(qty);

 total +=
           (priceqty);
        // total +=
        //     (price * size).toInt(); // Convert the final value to an integer
      } catch (e) {
        print("Error parsing price: $e");
      }

       List<Map<String, dynamic>> cartJsonList1 = wholemycartmodel!.data!
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

    print("Total: $total");
  }

  void chooseaddress(int index) {
    isselected = index;
    update();
    print("Index updated ====>>>>> $isselected");
  }

  void chooseaddressID(int id) {
    isselected1 = id;
    update();
    print("Address Id ====>>>>> $isselected1");
  }

  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  WholeMyCartListModel? wholemycartmodel;
  bool cartlistLoaded = false;

  var subtotal;

  Future<void> init() async {
    showLoading = true;
    update();
    // showLoading = true;
    try {
      // productdeatils
      wholemycartmodel = WholeMyCartListModel.fromJson(await ApiHelper.getApi(
          getUserMyCartUrl + "${storage.read('wholesalerid')}"));
      print("====?//${wholemycartmodel}");
      print("==>MYCARTWHOLE   " +
          getUserMyCartUrl +
          "${storage.read('wholesalerid')}");
      sizes = wholemycartmodel!.data!.map((e) => e.quantity).toList();
      // List<Map<String, dynamic>> cartJsonList =
      //     wholemycartmodel!.data!.map((item) => item.toJson()).toList();
      // cartList = cartJsonList;
      List<Map<String, dynamic>> cartJsonList = wholemycartmodel!.data!
          .map((item) => {
                "product_id": item.itemId,
                "quantity": item.quantity,
                "variation": item.variant,
                "tax_amount": "0",
                "discount_on_item": 20,
                "price": ( item.price! *   item.quantity!.toInt()),
                "return_order":item.returnOrder ,
              })
          .toList();
      cartList = cartJsonList;


      print("URL====${getUserMyCartUrl + "${storage.read('wholesalerid')}"}");
      print(wholemycartmodel);
      cartlistLoaded = true;
       updateTotal();
    
      update();
    } catch (e) {
      print('Error: $e');
 
    }
    showLoading = false;
    update();
  }

  String getUserMyCartDeleteUrl = '${Constants.GET_USER_MYCARTLISTDELETE}';
  WholeMyCartListDeleteModel? wholemycartdeletemodel;
  bool cartlistdeleteLoaded = false;

  Future<void> initdelete() async {
    showLoading = true;
    update();
    try {
      
      wholemycartdeletemodel = WholeMyCartListDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserMyCartDeleteUrl + "$additemid"));
      print(wholemycartdeletemodel);
      print("delete");
      print(getUserMyCartDeleteUrl + "$additemid");
      cartlistLoaded = true;

           print("====>>>>> model: ${wholemycartmodel!.toJson()}");
      wholemycartmodel!.data!.removeWhere((element) => element.id == additemid);
      if (wholemycartmodel!.data!.isEmpty){
        print("mycartmodelis Empty");
        print(wholemycartmodel!.data!.length);
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
    
    }
    showLoading = false;
    update();
  }

  String getUserAllAddressUrl = '${Constants.GET_USER_ALLADDRESSLIST}';
  WholeAllAddressListModel? wholeallAddresslistModel;
  bool addresslistLoaded = false;

  Future<void> alladdressinit() async {
    try {
      
      wholeallAddresslistModel = WholeAllAddressListModel.fromJson(
          await ApiHelper.getApi(getUserAllAddressUrl + "${storage.read('wholesalerid')}"));
      print(wholeallAddresslistModel);

      print(getUserAllAddressUrl + "${storage.read('wholesalerid')}");
      addresslistLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     
    }
  }

  String getUserAdressDeleteUrl = '${Constants.GET_USER_ADDRESS_DELETE}';

  WholeAddressDeleteModel? wholeaddressdeletemodel;
  bool addressdeleteLoaded = false;

  Future<void> addressdeleteinit() async {
    try {
      wholeaddressdeletemodel = WholeAddressDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserAdressDeleteUrl + "$addressid"));
      print(addressdeleteLoaded);
      print("delete");
      print(getUserAdressDeleteUrl + "$addressid");
      addressdeleteLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
    
    }
  }

  Future<void> placeorder() async {
    showLoading = true;
    update();
    MyCartWholeController mycartwholeController =
        Get.put(MyCartWholeController());

    String sendingAddr = "";
    if (mycartwholeController.wholeallAddresslistModel == null ||
        mycartwholeController.wholeallAddresslistModel!.data == null ||
        mycartwholeController.wholeallAddresslistModel!.data!.isEmpty) {
      sendingAddr = "Demo address";
    } else {
      sendingAddr =
          "${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].city ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].area ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].houseNo ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].landmark ?? ""}";
      print(sendingAddr);
    }

    Map<String, dynamic> body = {
      "user_id": storage.read('wholesalerid').toString(),
      "seller_id": null,
      "coupon_discount_amount": ("0.0").toString(),
      "coupon_discount_title":'null',
      "payment_status": "paid",
      "order_status": "pending",
      "payment_mode": paymentmethod1.toString(),
      "gst_bill": gst1,
      "payment_day": paymentdays1.toString(),
      "total_tax_amount": "0",
      "payment_method": paymenttype.toString(),
      "transaction_reference": "sadgash23asds",
      "delivery_address_id": isselected1.toString(),
      "coupon_code":'null',
      "order_type": "delivery",
      "checked": 1.toString(),
      "store_id": 1.toString(),
      "zone_id": 2.toString(),
      "delivered_status": "undelivered",
      "delivery_charge": "0" ,
    "original_delivery_charge":"0" ,
      "delivery_address": sendingAddr,
      "item_campaign_id": "",
      "order_amount": ((total) 
            )
          .toString(),
      "cart": cartList,
    };
    String PlaceOrderUrl = Constants.PLACE_ORDER;
    print(body);
    try {
     

      await ApiHelper.postApi(body: body, url: PlaceOrderUrl);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Order place successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
     
      throw "error";
    }

    showLoading = false;
    update();
  }
}
