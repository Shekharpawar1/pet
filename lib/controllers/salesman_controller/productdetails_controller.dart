import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/models/salesmanModel/mysalesOrderModel.dart';
import 'package:pet/models/salesmanModel/salesProductDetailsModel.dart';

import 'package:pet/models/salesmanModel/orderDetailsModel.dart'as orderDetails;
// import 'package:pet/models/usersModel/ProductDetailsModel.dart';
import 'package:pet/models/salesmanModel/salesProductDetailsModel.dart' as variantFile;
import 'package:pet/models/salesmanModel/salesmycartListModel.dart';
// import 'package:pet/models/usersModel/cardItemModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class SalesProductDetailsController extends GetxController {
final storage = GetStorage();

  TextEditingController emailController = TextEditingController();
 final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
  int? selectImages = 0;
var sellerId = GetStorage().read("sellerid");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
// var wholesellerID = GetStorage().read("wholesalerid");
  int? selecttab;
  bool isAdding = false;
  int? productID;
    String? productname;
  String? variantss;
  double? priceProduct;
  String? homeimage;
  int? qty;
  var wholesellerID;
double? totalAmount;
String? returnorder;

  bool showLoading = false;
   bool isProductInCartBool = false;
// ProductDetailsModel? productdetailsmodel;
// var selectedVariants ;

  void onInit() {
    super.onInit();
    // init();
     wholesellerID = storage.read('wholesalerId');
     print("WholeSellerID ==>${wholesellerID}");
       print("SellerID ==>${sellerId}");
  }

selectImagesProduct(int index) {
    selectImages = index;
    print("Images");
    print(selectImages);
    print(salesproductdetailmodel!.data!.images![selectImages??0]);
    update();
  }
 
  
fethUserId() {
  
     wholesellerID = storage.read('wholesalerId');
     print("WholeSellerID ==>${wholesellerID}");
       print("SellerID ==>${sellerId}");
}

void dispose() {
    clearFields();
   clearPopUpFields();
    // sizeclearFields();
  // salesproductdetailmodel = null;
  update();
  }


  
  @override
  void onClose() {
  clearPopUpFields();
    // clearFields() ;
    // sizecount= 1;
    dispose();
    super.onClose();
  }
  variantFile.Variations? selectedvariants;

  Future<void> updateVariants(variantFile.Variations variants) async {
    selectedvariants = variants;

    showLoading = true;
    update();
    print("variantswhole  ${selectedvariants!.wholeprice} variantstype  ${selectedvariants!.type}  variantsprice  ${selectedvariants!.price}");
// clearFields();
  }

  // var cartItems = <CartItemModel>[];
  int kg = 1;

  var sizecount = 1;
  String? dropdownsize;
  // List<String> sizeDropDownList = ["1kg", "2kg","3kg","4kg","5kg"];



          
  void viewproductHome(int id, String productName, String varianttts, int quantity, double price, String images,String returnorderrr) {
    productID = id;
    productname = productName;
    variantss = varianttts;
     qty  = quantity;
     priceProduct = price;
     homeimage = images;
       returnorder = returnorderrr;  
    update();
    print("productIDnb${productID}   qutyff${qty} variantsbn${variantss} wholePricevhh ${priceProduct} ");
  }
  Future<bool> validateForm(BuildContext context) {
    final completer = Completer<bool>();

    if (formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is valid')),
      // );
      completer.complete(true);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is invalid')),
      // );
      completer.complete(false);
    }

    return completer.future;
  }
   

  // void setSelectedVariant(String variant) {
  //   dropdownsize = variant;
  // }

// updateSize(String? selectTab){
//   dropdownsize = selectTab;
//   update();
// }

  // void incrementSize() {
  //  if (sizecount < selectedvariants!.stock!.toInt()) {
  //   sizecount++;
  //   print("Sizesale: $sizecount");
  //   update();
  // }



 void incrementSize() {

 if (selectedvariants != null && selectedvariants!.stock != null) {
    if (sizecount < selectedvariants!.stock!.toInt()) {
    sizecount++;
    print("Sizewhole: $sizecount");
    update();
  

  if (sizecount == selectedvariants!.stock!.toInt()) {
     showMaxQuantitySnackBar();
    }
   }
  }
   
   else {
    if(salesproductdetailmodel != null && salesproductdetailmodel!.data != null && salesproductdetailmodel!.data!.stock != null){
print("xxnxnxnnx");
     if (sizecount < salesproductdetailmodel!.data!.stock!.toInt()) {
    sizecount++;
    print("Size: $sizecount");
    update();

    if (sizecount ==  salesproductdetailmodel!.data!.stock!.toInt()) {
      showMaxQuantitySnackBar();
    }
  }}
   
  }
  }



void showMaxQuantitySnackBar() {
  Get.snackbar(
    'Maximum Quantity Reached',
    'You have reached the maximum stock for this item.',
    snackPosition: SnackPosition.BOTTOM,
  );
}
 

  

  decrementSize() {

    print("MinOrder ${ salesproductdetailmodel!.data!.minOrder}");
    if (sizecount > salesproductdetailmodel!.data!.minOrder!.toInt()) {
      sizecount = sizecount!-1; 
      update();
    }
  }





  int? id;

//  calculateTotalPrice() {
//    String originalPrice = productdetailmodel!.data!.price.toString();
//    d discountPercentage = (productdetailmodel!.data!.discount)/ 100;
//    discountedPrice = originalPrice * (1 - discountPercentage);

//   return discountedPrice * sizecount;
// }
  updateSelectTab(int? selectTab) {
    selecttab = selectTab;
    update();
  }

//  bool isAdding = false;



  List<variantFile.Variations>? variantslist;

  void addproduct() {
    isAdding = true;
    update();
  }

  void userproductView() {
    isAdding = false;
    update();
  }

  void viewproduct(int id) {
    productID = id;
    update();
    print("productID${productID}");
  }

  // void  allamount(){
  //     totalAmount = ((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
  //             (((selectedvariants?.price ?? 0) * sizecount ?? 0) *
  //                 (salesproductdetailmodel!.data!.discount!) /
  //                 100))
  //         ;
  //         // print("-------"+totalAmount);
  // }

  // void addToCart(String brandname, String variant, String size) {
  //   final cartItem = CartItemModel(
  //     product: brandname,
  //     variant: variant,
  //     size: size,
  //   );
  //   cartItems.add(cartItem);
  //   // Reset selections after adding to cart
  //   selectedVariants.clear();
  //   // dropdownsize = null;
  //   sizecount = 0;
  //   update();
  // }

// void addVariant( variant) {
//     selectedVariants = variant;
//     print("vriants${selectedVariants}");
//   }
  //   void removeVariant(int index) {
  //   selectedVariants.remove(index);
  // }

  //   get totalCost {
  //   var total = 0.0;
  //   selectedVariants.forEach((key, value) {
  //     final product = productList.firstWhere((e) => e == key);
  //     final price = double.parse(productList.price.toString());
  //     total += price;
  //   });
  //   return total;
  // }
  // categories
  // String getUserCategoriesUrl =
  //     '${Constants.BASE_URL}${Constants.API_PATH}${Constants.GET_USER_CATEGORIES}';
  // UserCategoriesModel? userCategoriesModel;
  // bool categoryLoaded = false;

  // // properties
  // String getUserPropertiesUrl =
  //     '${Constants.BASE_URL}${Constants.API_PATH}${Constants.GET_USER_PROPERTIES}';
  // UserPropertiesModel? userPropertiesModel;
  // bool propertyLoaded = false;

  // @override
  // void onInit() {
  //   super.onInit();
  //   init();
  // }

  // void init() async {
  //   try {
  //     // categories
  //     userCategoriesModel = UserCategoriesModel.fromJson(
  //         await ApiHelper.getApi(getUserCategoriesUrl));
  //     print(userCategoriesModel);
  //     categoryLoaded = true;
  //     update();

  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'An error occurred: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  //   try {
  //     // properties
  //     userPropertiesModel = UserPropertiesModel.fromJson(
  //         await ApiHelper.getApi(getUserPropertiesUrl));
  //     print(userPropertiesModel);
  //     propertyLoaded = true;
  //     update();
  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'An error occurred: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }


  // productdetails
  String getUserProductDetailsUrl = '${Constants.GET_USER_PRODUCTDETAILS}';
  SalesProductDetailsModel? salesproductdetailmodel;
  bool productdetailLoaded = false;



    void clearPopUpFields() {
    selectedvariants = null;
         emailController.clear();
    print("Data cleared...");
    update();
  }


  void clearFields() {
    //  selectedvariants = null;
         sizecount = 1;
    print("Data cleared...");
    update();
  }


orderDetails.Data? orderReOrder;
 Future<void> updateReOrder(orderDetails.Data orderreOrder) async {
    orderReOrder = orderreOrder;

    update();
    print("Revariants  ${orderReOrder!.variant}");
// clearFields();
  }

Future<void> ReOrderProduct() async {
    showLoading = true;
    update();
    
    var body = {
      "user_id": storage.read('wholesalerId').toString(),
      "item_id": orderReOrder!.itemId.toString(),
      "item_name": orderReOrder!.variant.toString(),
      "variant": orderReOrder!.variation.toString(),
      "quantity":orderReOrder!.quantity.toString(),
      "image":orderReOrder!.itemDetails![0].image.toString(),
      "price": orderReOrder!.price
          .toString(),
            "total_quantity":0.toString(), 
           "return_order":"yes"
          // "total_quantity":selectedvariants?.stock.toString(), 
          //  "return_order":(productdetailmodel!.data!.returnable??'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('wholesalerId').toString(),
      "item_id": orderReOrder!.itemId.toString(),
      "item_name": orderReOrder!.variant.toString(),
      "variant": orderReOrder!.variation.toString(),
      "quantity":orderReOrder!.quantity.toString(),
      "image": orderReOrder!.itemDetails![0].image.toString(),
      "price": (double.parse(orderReOrder!.price!)/(orderReOrder!.quantity ??0))
            .toString(),
           "total_quantity":0.toString(), 
           "return_order":'Yes',
      });

     var response =   ( await ApiHelper.postFormData(request: request));
  String? message ;
    
final RegExp messageRegExp = RegExp(r'message: ([^}]*)}', caseSensitive: false);

final Match? messageMatch = messageRegExp.firstMatch(response.toString());

if (messageMatch != null) {
 message = messageMatch.group(1)!;
    print("=====message${message}");
  print(message); 
} else {
  print("Message not found");
}
      update();
      // Get.back();
      print( 'Product Added  11: $message');
      Get.snackbar(
        'Success',
         'Product Added: $message',
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
    }

    showLoading = false;
    update();
  }
 

  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  SalesMyCartListModel? salemycartmodel;
  bool cartlistLoaded = false;

  var subtotal;

  Future<void> salesisProductInCart() async {
    showLoading = true;
    update();
    // showLoading = true;
    try {
      // productdeatils
      salemycartmodel = SalesMyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('wholesalerId')}"));
      print("====?//${salemycartmodel}");
      // sizes = mycartmodel!.data!.map((e) => 1).toList();
      // mycartmodel!.data!.forEach((element) { 
      //   if(element.itemId.toString() == productID.toString()){
      //     isProductInCartBool = true;
      //   }
      // });
      for(var element in salemycartmodel!.data!){
        if(element.itemId.toString() == productID.toString()){
          isProductInCartBool = true;
          break;
        }
        isProductInCartBool = false;
      }
      update();
      // List<Map<String, dynamic>> cartJsonList =
      //     mycartmodel!.data!.map((item) => {
      //       "product_id": item.itemId,
      //       "quantity":item.quantity,
      //       "variation":item.variant,
      //       "tax_amount":13,
      //       "discount_on_item":20,
      //       "price":item.price
      //     }).toList();
      // cartList = cartJsonList;
      

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


  Future<void> addNotify() async {
    showLoading = true;
    update();
   
    var body = {
      "user_id":storage.read('wholesalerId').toString(),
      "item_id": productID.toString(),
      "email": emailController.text.toString(),
      "stock": selectedvariants!.stock.toString(),
      "variation": selectedvariants!.type.toString(),
    
     
    };
    String AddNotify = Constants.ADD_Notify;
    print(AddNotify);
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddNotify));
      request.fields.addAll({
       "user_id": storage.read('wholesalerId').toString(),
      "item_id": productID.toString(),
      "email": emailController.text.toString(),
      "stock": selectedvariants!.stock.toString(),
      "variation": selectedvariants!.type.toString(),
    
      });

      await ApiHelper.postFormData(request: request);
      update();
      // Get.back();
      Get.snackbar(
        'Success',
        'Data Successfully Added',
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


  Future<void> init() async {
    try {
      // productdeatils
      salesproductdetailmodel = SalesProductDetailsModel.fromJson(
          await ApiHelper.getApi(getUserProductDetailsUrl + "$productID"));
      print("urlapi");
      variantslist = salesproductdetailmodel!.data!.variations;
       
      if(variantslist!.isNotEmpty)
      updateVariants(variantslist![0]);
      // var totalprice = 0;
// var pricecount = productdetailmodel!.data!.price;
// for(var i = 0; i< pricecount; i++){
// totalprice +=  ;

// }

// print('Total Price: $totalprice');

      print(getUserProductDetailsUrl + "$productID");
      productdetailLoaded = true;
      sizecount = salesproductdetailmodel!.data!.minOrder!.toInt();

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


// List<variantFile.Variations> variants = productdetailmodel!.data!.variants

  Future<void> addProduct() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "user_id": storage.read('wholesalerId').toString(),
      "item_id": productID.toString(),
      "item_name": salesproductdetailmodel!.data!.name.toString(),
       "variant": (selectedvariants?.type??'').toString(),
       "quantity": (sizecount ?? 0).toString(),
      "image": salesproductdetailmodel!.data!.image ?? '',
      "price":(selectedvariants?.wholeprice != null)? (((selectedvariants?.wholeprice ?? 0)  -
              (((selectedvariants?.wholeprice ?? 0) ) *
                  (salesproductdetailmodel!.data!.discount!) /
                  100))).toString():(((salesproductdetailmodel!.data!.wholePrice ?? 0)  -
              (((salesproductdetailmodel!.data!.wholePrice ?? 0)) *
                  (salesproductdetailmodel!.data!.discount!) /
                  100)))
          .toString(),
    
          "seller_id": GetStorage().read("sellerid").toString(),
          "total_quantity":selectedvariants?.stock.toString(), 
           "return_order":(salesproductdetailmodel!.data!.returnable??'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
     print("BodyAddProduct  ");
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
       "user_id": storage.read('wholesalerId').toString(),
        "item_id": productID.toString(),
        "item_name": salesproductdetailmodel!.data!.name.toString(),
        "variant": (selectedvariants!.type??'').toString(),
       "quantity": (sizecount ?? 0).toString(),
      "image": salesproductdetailmodel!.data!.image ?? '',
      "price":(selectedvariants?.wholeprice != null)? (((selectedvariants?.wholeprice ?? 0)  -
              (((selectedvariants?.wholeprice ?? 0) ) *
                  (salesproductdetailmodel!.data!.discount!) /
                  100))).toString():(((salesproductdetailmodel!.data!.wholePrice ?? 0)  -
              (((salesproductdetailmodel!.data!.wholePrice ?? 0)) *
                  (salesproductdetailmodel!.data!.discount!) /
                  100)))
          .toString(),
    
          "seller_id":GetStorage().read("sellerid").toString(),
          
          "total_quantity":selectedvariants!.stock.toString(), 
           "return_order":(salesproductdetailmodel!.data!.returnable??'Yes').toString()
      });

        var response = await ApiHelper.postFormData(request: request);
      update();
      // Get.back();
      print("Response555");
    print(response);
    
print('Product Added: $response');
 String responseMessage = response['message'];
 
Get.snackbar(
        'Success',
        'Product Added: $responseMessage',
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



  Future<void> addProductHome() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "user_id":storage.read('wholesalerId').toString(),
      "item_id": productID.toString(),
      "item_name": productname.toString(),
      "variant": variantss.toString(),
      "quantity": qty.toString(),
      "image": homeimage.toString(),
      "price": priceProduct.toString(),
        "seller_id":GetStorage().read("sellerid").toString(),
           "total_quantity":(selectedvariants?.stock??0).toString(), 
        "return_order":(returnorder??'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print("HomeAddedProduct");
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
     "user_id":storage.read('wholesalerId').toString(),
      "item_id": productID.toString(),
      "item_name": productname.toString(),
      "variant": variantss.toString(),
      "quantity": qty.toString(),
      "image": homeimage.toString(),
      "price": priceProduct
          .toString(),
            "seller_id":GetStorage().read("sellerid").toString(),
            "total_quantity":(selectedvariants!.stock??0).toString(), 
            "return_order":(returnorder??'Yes').toString()
      });

           var response = await ApiHelper.postFormData(request: request);
  String? message ;
    print("=====respoooo${response}");
final RegExp messageRegExp = RegExp(r'message: ([^}]*)}', caseSensitive: false);

final Match? messageMatch = messageRegExp.firstMatch(response.toString());

if (messageMatch != null) {
 message = messageMatch.group(1)!;
    print("===ggg==message${message}");
  print(message); 
} else {
  print("Message not found");
}
      update();
      // Get.back();
      print( 'Product Added: $message');
      Get.snackbar(
        'Success',
         'Product Added: $message',
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

  // var productList = ProductDetailsModel(

  //     id: 1,
  //     brandname: 'Product 1',
  //     flavour: "Chicken",
  //     price: 500,
  //     agerange: "Adult",
  //     diettype: "Non Vegetarian",
  //     itemfram: "Pellet",
  //     discount: 5,
  //     targetspace: "Dog",
  //     variants: ['1kg', '2kg', '5kg'],
  // );
}


  // <ProductDetailsModel> get productList => _productList;





  // List _productList = [
  //   {
  //     "image": "assets/image/food3.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/dog2.png",
  //     "title": "Foam Pet Dog Bed",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/food3.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/food5.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   }
  // ].obs;
  //  get getOurBrandList => _ourbandList;
  //  get getproductList => _productList;

   

