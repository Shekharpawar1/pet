import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart' as suggestions;

import 'package:pet/models/usersModel/ProductDetailsModel.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart' as variantFile;
import 'package:pet/models/usersModel/cardItemModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/mycartListModel.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pet/models/usersModel/orderDetailsModel.dart' as orderDetails;

class ProductDetailsController extends GetxController {
  final storage = GetStorage();
  // MyCartController addtocartController = Get.put(MyCartController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  int? selecttab;
  bool isAdding = false;
  int? productID;
  String? productname;
  String? variants;
  double? priceProduct;
  String? homeimage;
  String? returnorder;
  int total = 0;

  int totalDiscount = 0;
  int totalPrice = 0;
  int? qty;
  var userId;

  List sizes = [];
  double? totalAmount;
  bool showLoading = false;
  int? selectImages = 0;

// ProductDetailsModel? productdetailsmodel;
// var selectedVariants ;
  int? productIDD;
  String? productName;
  void onInit() {
    super.onInit();

    userId = storage.read('id');
  }

  var imagePath;
  var imagesPath;

  // if (productdetailmodel != null) {

  void selectImageUpate() {
    imagesPath =
        "${Constants.BASE_URL}/storage/app/public/product/${productdetailmodel!.data!.images ?? ''}";
    imagePath =
        "${Constants.BASE_URL}/storage/app/public/product/${productdetailmodel!.data!.images![selectImages ?? 0].toString()}";

    // print(imagePath);
    update();
  }

  // } else {
  //   imagePath = "";
  // }

  selectImagesProduct(int index) {
    selectImages = index;
    print("Images");
    print(selectImages);
    print(productdetailmodel!.data!.images![selectImages ?? 0]);
    update();
  }

  variantFile.Variations? selectedvariants;

  Future<void> updateVariants(variantFile.Variations variants) async {
    selectedvariants = variants;

    // showLoading = true;
    update();
    print("variants${selectedvariants!.stock}");
// clearFields();
  }

  // var cartItems = <CartItemModel>[];
  int kg = 1;

  int sizecount = 1;
  String? dropdownsize;
  // List<String> sizeDropDownList = ["1kg", "2kg","3kg","4kg","5kg"];
//  @override
//   void onClose() {
//     print("closing...");
//   clearFields();
//     super.onClose();
//   }

  void clearFields() {
    selectedvariants = null;
    sizecount = 1;
    print("Data cleared...");
    update();
  }

  void clearPopUpFields() {
    selectedvariants = null;
    emailController.clear();
    print("Data cleared...");
    update();
  }

  void incrementSize() {
    if (selectedvariants != null && selectedvariants!.stock != null) {
      print("nmdmddmd");
      if (sizecount < selectedvariants!.stock!.toInt()) {
        sizecount++;
        print("Size: $sizecount");
        update();

        if (sizecount == selectedvariants!.stock!.toInt()) {
          showMaxQuantitySnackBar();
        }
      }
    } else {
      if (productdetailmodel != null &&
          productdetailmodel!.data != null &&
          productdetailmodel!.data!.stock != null) {
        print("xxnxnxnnx");
        if (sizecount < productdetailmodel!.data!.stock!.toInt()) {
          sizecount++;
          print("Size: $sizecount");
          update();

          if (sizecount == productdetailmodel!.data!.stock!.toInt()) {
            showMaxQuantitySnackBar();
          }
        }
      }
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
    if (sizecount! > 1) {
      sizecount = sizecount! - 1;
      update();

      ;
    }
  }
//   decrementSize() {
//     if (sizecount! > 1) {
//        sizecount = sizecount!-1;
//       update();

// ;    }
//   }

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

  List<variantFile.Variations>? variantslist;

  void addproduct() {
    isAdding = true;
    update();
  }

  void userproductView() {
    isAdding = false;
    update();
  }

  void viewproductHome(int id, String productName, String varianttts,
      int quantity, double price, String imagess, String returnorderrr) {
    productID = id;
    productname = productName;
    variants = varianttts;
    qty = quantity;
    priceProduct = price;
    homeimage = imagess;
    returnorder = returnorderrr;
    print("ImagesHommee ${homeimage}");
    update();
    print("productID${productID} Images** ${homeimage}");
  }

  orderDetails.Data? orderReOrder;
  Future<void> updateReOrder(orderDetails.Data orderreOrder) async {
    orderReOrder = orderreOrder;

    update();
    print("Revariants  ${orderReOrder!.variant}");
// clearFields();
  }

  void viewproduct(int id) {
    productID = id;
    update();
    print("productID${productID}");
  }

// void addProductComboForSuggestions() {
//   List<SuggestionProduct>? suggestionProducts = productdetailmodel!.data!.suggestionProduct;

//   for (SuggestionProduct suggestionProduct in suggestionProducts!) {
//     addProductCombo(suggestionProduct);
//   }
// }

  String getUserProductDetailsUrl = '${Constants.GET_USER_PRODUCTDETAILS}';
  ProductDetailsModel? productdetailmodel;
  bool productdetailLoaded = false;
  void dispose() {
    clearFields();
    clearPopUpFields();
    productdetailmodel = null;
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

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      productdetailmodel = ProductDetailsModel.fromJson(
          await ApiHelper.getApi(getUserProductDetailsUrl + "$productID"));
      print("Urlllll ${productdetailmodel!.data!.id!.toString() + "$productID"}");
      variantslist = productdetailmodel!.data!.variations;
      if (variantslist!.isNotEmpty)
        updateVariants(
          variantslist![0],
        );
      // var totalprice = 0;

      var suggestionProduct = productdetailmodel!.data!.suggestionProduct;

//  for (var product in productdetailmodel!.data!.suggestionProduct!) {

//    productIDD = product.id;
//    productName = product.name;
//       print('Product ID: ${product.id}');
//       print('Product Name: ${product.name}');
//       print('Product Price: ${product.price}');

//     }
// List<SuggestionProduct> suggestionProducts = suggestions.SuggestionProduct as List<suggestions.SuggestionProduct>; // Assuming this is your list

// for (SuggestionProduct suggestionProduct in suggestionProducts) {
//   await addProductCombo(suggestionProduct);
// }

      totalPrice = suggestionProduct!.fold(0, (sum, product) {
        return sum + (int.tryParse(product.price.toString()) ?? 0);
      });

      print('Total Price99: $totalPrice');

      totalDiscount = suggestionProduct!.fold(0, (sum, product) {
        return sum + (int.tryParse(product.discount.toString()) ?? 0);
      });

      calculateTotalPrice();

      print(getUserProductDetailsUrl + "$productID");
      productdetailLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
    }
    showLoading = false;
    update();
  }

  int calculateTotalPrice() {
    total = 0;
    for (var product in productdetailmodel!.data!.suggestionProduct!) {
      num price = product.price ?? 0;
      num discount = product.discount ?? 0;

      // Calculate discounted price for each product
      double discountedPrice = price - (price * discount / 100);

      total += discountedPrice.toInt();
    }
    print("Totalllll ${total}");
    return total;
  }

  String getUserMyCartUrl = Constants.GET_USER_MYCARTLIST;
  MyCartListModel? mycartmodel;
  bool isProductInCartBool = false;

  Future<void> suggestioninit() async {
    showLoading = true;
    update();
    try {
      productdetailmodel = ProductDetailsModel.fromJson(
          await ApiHelper.getApi(getUserProductDetailsUrl + "$productID"));
      print(getUserProductDetailsUrl + "$productID");

      variantslist = productdetailmodel!.data!.variations;
      if (variantslist!.isNotEmpty)
        updateVariants(
          variantslist![0],
        );

      print(getUserProductDetailsUrl + "$productID");
      productdetailLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
    }
    showLoading = false;
    update();
  }

  Future<void> isProductInCart() async {
    showLoading = true;
    update();
    // showLoading = true;
    try {
      // productdeatils
      mycartmodel = MyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('id')}"));
      print("MyCart====?//${mycartmodel}");

      for (var element in mycartmodel!.data!) {
        if (element.itemId.toString() == productID.toString()) {
          Get.snackbar(
            'Success',
            'Already Added',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }

        isProductInCartBool = false;
      }
      update();

      update();
    } catch (e) {
      print('Error: $e');
    }
    showLoading = false;
    update();
  }

  Future<void> addNotify() async {
    showLoading = true;
    update();

    var body = {
      "user_id": storage.read('id').toString(),
      "item_id": productID.toString(),
      "email": emailController.text.toString(),
      "stock": selectedvariants!.stock.toString(),
      "variation": selectedvariants!.type.toString(),
    };
    String AddNotify = Constants.ADD_Notify;
    print(AddNotify);
    print("notify***");
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddNotify));
      request.fields.addAll({
        "user_id": storage.read('id').toString(),
        "item_id": productID.toString(),
        "email": emailController.text.toString(),
        "stock": selectedvariants!.stock.toString(),
        "variation": selectedvariants!.type.toString(),
      });

      await ApiHelper.postFormData(request: request);
      update();

      Get.snackbar(
        'Success',
        'Data Successfully Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.back();
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

  Future<void> ReOrderProduct() async {
    showLoading = true;
    update();

    var body = {
      "user_id": storage.read('id').toString(),
      "item_id": orderReOrder!.itemId.toString(),
      "item_name": orderReOrder!.variant.toString(),
      "variant": orderReOrder!.variation.toString(),
      "quantity": orderReOrder!.quantity.toString(),
      "image": orderReOrder!.itemDetails![0].image.toString(),
      "price": orderReOrder!.price.toString(),
      "total_quantity": 0.toString(),
      "return_order": "yes"
      // "total_quantity":selectedvariants?.stock.toString(),
      //  "return_order":(productdetailmodel!.data!.returnable??'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('id').toString(),
        "item_id": orderReOrder!.itemId.toString(),
        "item_name": orderReOrder!.variant.toString(),
        "variant": orderReOrder!.variation.toString(),
        "quantity": orderReOrder!.quantity.toString(),
        "image": orderReOrder!.itemDetails![0].image.toString(),
        "price":
            (double.parse(orderReOrder!.price!) / (orderReOrder!.quantity ?? 0))
                .toString(),
        "total_quantity": 0.toString(),
        "return_order": 'Yes',
      });

      var response = (await ApiHelper.postFormData(request: request));
      String? message;

      final RegExp messageRegExp =
          RegExp(r'message: ([^}]*)}', caseSensitive: false);

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
      print('Product Added  11: $message');
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

  Future<void> addProduct() async {
    showLoading = true;
    update();

    var body = {
      "user_id": storage.read('id').toString(),
      "item_id": productID.toString(),
      "item_name": productdetailmodel!.data!.name.toString(),
      "variant": (productdetailmodel!.data!.variations!.isEmpty)
          ? "0"
          : selectedvariants!.type.toString(),
      "quantity": (sizecount ?? 0).toString(),
      "image": productdetailmodel!.data!.image ?? '',
      "price": (selectedvariants?.price != null)
          ? (((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
                  (((selectedvariants?.price ?? 0) * sizecount! ?? 0) *
                      (productdetailmodel!.data!.discount!) /
                      100)))
              .toString()
          : (((productdetailmodel!.data!.price ?? 0) * (sizecount ?? 0) -
                  (((productdetailmodel!.data!.price ?? 0) * sizecount! ?? 0) *
                      (productdetailmodel!.data!.discount!) /
                      100)))
              .toString(),
      "total_quantity": (productdetailmodel!.data!.variations!.isEmpty)
          ? "0"
          : (selectedvariants?.stock ?? 0).toString(),
      "return_order": (productdetailmodel!.data!.returnable ?? 'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('id').toString(),
        "item_id": productID.toString(),
        "item_name": productdetailmodel!.data!.name.toString(),
        "variant": (productdetailmodel!.data!.variations!.isEmpty)
            ? "0"
            : selectedvariants!.type.toString(),
        "quantity": (sizecount ?? 0).toString(),
        "image": productdetailmodel!.data!.image ?? '',
        "price": (selectedvariants?.price != null)
            ? (((selectedvariants?.price ?? 0) -
                    (((selectedvariants?.price ?? 0)) *
                        (productdetailmodel!.data!.discount!) /
                        100)))
                .toString()
            : (((productdetailmodel!.data!.price ?? 0) -
                    (((productdetailmodel!.data!.price ?? 0)) *
                        (productdetailmodel!.data!.discount!) /
                        100)))
                .toString(),

        //     (selectedvariants?.price != null)? (((selectedvariants?.price ?? 0) *
        //  (sizecount ?? 0) -
        //       (((selectedvariants?.price ?? 0) * sizecount! ?? 0) *
        //           (productdetailmodel!.data!.discount!) /
        //           100))).toString():(((productdetailmodel!.data!.price ?? 0) * (sizecount ?? 0) -
        //       (((productdetailmodel!.data!.price ?? 0) * sizecount! ?? 0) *
        //           (productdetailmodel!.data!.discount!) /
        //           100)))

        //     .toString(),
        "total_quantity": (productdetailmodel!.data!.variations!.isEmpty)
            ? "0"
            : (selectedvariants?.stock ?? 0).toString(),
        "return_order":
            (productdetailmodel!.data!.returnable ?? 'Yes').toString()
      });

      var response = (await ApiHelper.postFormData(request: request));
      String? message;

      final RegExp messageRegExp =
          RegExp(r'message: ([^}]*)}', caseSensitive: false);

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
      print('Product Added: $message');
      Get.snackbar(
        'Success',
        'Product Added: $message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.to(AddToCardUser(
          // userID :productdetailscontroller.userId
          ));
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

// Assuming you have a function like this for making API requests
// Future<void> postApiRequest(Map<String, dynamic> requestData) async {
//   // Your API endpoint
//    String apiUrl = Constants.ADD_COMBO_PRODUCT;

//   try {
//     var response = await http.post(Uri.parse(apiUrl), body: requestData);
//     // Handle the response as needed
//     print('Response: ${response.body}');
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// // Your loop to fetch data and make API requests
// void fetchDataAndMakeRequests(List<Map<String, dynamic>> productdetailsmodel.suggestionProducts) {
//   for (var element in suggestionProduct) {
//     // Extract data from the current element and create a request data map
//     Map<String, dynamic> requestData = {
//       "item_name": element['name'],
//       "variant": "", // Update this based on your data
//       "image": element['image'],
//       "quantity": 1,
//       "total_quantity": element['stock'],
//       "return_order": element['returnable'] ?? "yes",
//       "price": element['price'],
//       "user_id": 314,
//       "item_id": element['id'],
//       "type": "combo",
//       "min_order": "",
//       "seller_id": "",
//     };

//     // Make the API request
//      }
// }

  Future<void> addProductCombo() async {
    showLoading = true;
    update();

    String? itemName;
    int? itemIdd;
    String? image;
    String? returnorder;
    int? stock;
    int? priceitem;

    var suggestionProducts = productdetailmodel!.data!.suggestionProduct;
    List listToSend = [];
    for (int i = 0; i < suggestionProducts!.length; i++) {
      var element = suggestionProducts[i];
      // itemName = element.name;
      // stock = element.stock;
      // itemIdd = element.id;
      // returnorder = element.returnable;
      // image = element.image;
      // priceitem = element.price;
      print("IDITem ${itemIdd}");
      listToSend.add(suggestionProducts[i]);
    }

    var bod = suggestionProducts
        .map((e) => {
              "user_id": storage.read('id').toString(),
              "item_id": e.id.toString(),
              "item_name": e.name.toString(),
              "variant": "1",
              "quantity": 1.toString(),
              "image": e.image ?? '',
              "price": e.price.toString(),
              "total_quantity": e.stock.toString(),
              "return_order": e.returnable.toString(),
              "type": "combo",
              "min_order": "0",
              "seller_id": "0",
            })
        .toList();

    // Map<String, String>body = {

    //   "user_id": storage.read('id').toString(),
    //   "item_id": suggestionProducts.map((e) => e.id).toList().toString(),
    //   "item_name": itemName.toString(),
    //   "variant": "1",
    //   "quantity": 1.toString(),
    //   "image": image ?? '',
    //   "price": priceitem.toString(),
    //   "total_quantity": stock.toString(),
    //   "return_order": returnorder.toString(),
    //   "type": "combo",
    //   "min_order": "0",
    //   "seller_id": "0",
    // };

    print(bod);
    String AddProductCombo = Constants.ADD_COMBO_PRODUCT;
    print(bod);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProductCombo));
      print("### ====>>>> Body $bod");
      // Map<String, String> combinedData = {};
      // for (var element in bod) {
      //   combinedData.addAll(element);
      // }
      // request.fields.addAll(combinedData);

      // Add each item as a separate field
    //   for (var i = 0; i < bod.length; i++) {
    //     var element = bod[i];
    //     element.forEach((key, value) {
    // request.fields['$key'] = value;
    //     });
    //   }

      // print("### ====>>>> Sending Fields ${request.fields}");
      var response = await ApiHelper.postApi(body: bod, url: AddProductCombo);
      String? message;
      print("### ====>>>> Response $response");
      final RegExp messageRegExp =
          RegExp(r'message: ([^}]*)}', caseSensitive: false);

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
      print('Product Added: $message');
      Get.snackbar(
        'Success',
        'Product Added: $message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.to(AddToCardUser());
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

  Future<void> addProductHome() async {
    showLoading = true;
    update();
    var body = {
      "user_id": storage.read('id').toString(),
      "item_id": productID.toString(),
      "item_name": productname.toString(),
      "variant": variants.toString(),
      "quantity": qty.toString(),
      "image": homeimage.toString(),
      "price": priceProduct.toString(),
      "total_quantity": (selectedvariants?.stock ?? 0).toString(),
      "return_order": (returnorder ?? 'Yes').toString()
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('id').toString(),
        "item_id": productID.toString(),
        "item_name": productname.toString(),
        "variant": variants.toString(),
        "quantity": qty.toString(),
        "image": homeimage.toString(),
        "price": priceProduct.toString(),
        "total_quantity": (selectedvariants?.stock ?? 0).toString(),
        "return_order": (returnorder ?? 'Yes').toString().toString()
      });

      var response = await ApiHelper.postFormData(request: request);
      String? message;
      print("=====respoooo${response}");
      final RegExp messageRegExp =
          RegExp(r'message: ([^}]*)}', caseSensitive: false);

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
      print('Product Added: $message');
      Get.snackbar(
        'Success',
        'Product Added: $message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
    }

    showLoading = false;
    update();
  }
}
