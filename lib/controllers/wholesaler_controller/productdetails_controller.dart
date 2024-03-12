import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';

import 'package:pet/models/wholesalerModel/ProductDetailsWholeModel.dart';
import 'package:pet/models/wholesalerModel/ProductDetailsWholeModel.dart'as variantFile;
import 'package:pet/models/wholesalerModel/mycartListModel.dart';
import 'package:pet/models/wholesalerModel/orderDetailsModel.dart'as orderDetails;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class WholeProductDetailsController extends GetxController {
   final storage = GetStorage();
  int? selectImages = 0;
  int? selecttab;
  bool isAdding = false;
  int? productID;
  var wholesalerID;
double? totalAmount;
String? returnorder;
  TextEditingController emailController = TextEditingController();
  String? productname;
  String? variants;
  double? priceProduct;
  String? image;
  int? qty;
  bool showLoading = false;
// ProductDetailsModel? productdetailsmodel;
// var selectedVariants ;
 var imagePath;
     var imagesPath;
  void  selectImageUpate( ){

imagesPath =
          "${Constants.BASE_URL}/storage/app/public/product/${productdetailwholemodel!.data!.images??''}";
      imagePath =
          "${Constants.BASE_URL}/storage/app/public/product/${productdetailwholemodel!.data!.images![selectImages??0].toString()}";
    
    // print(imagePath);
    update();
      }

void dispose() {
    clearFields();
   clearPopUpFields();
    // sizeclearFields();
  productdetailwholemodel = null;
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

      selectImagesProduct(int index) {
    selectImages = index;
    print("Images");
    print(selectImages);
    print(productdetailwholemodel!.data!.images![selectImages??0]);
    update();
  }
     
          
  void viewproductHome(int id, String productName, String varianttts, int quantity, 
  double price, String images,String returnorderrr) {
    productID = id;
    productname = productName;
    variants = varianttts;
     qty  = quantity;
     priceProduct = price;
     image = images;
        returnorder = returnorderrr;  
    update();
    print("productID${productID}");
  }
  void onInit() {
    super.onInit();
    // init();
    wholesalerID = storage.read('wholesalerid');
  }



  variantFile.Variations? selectedvariants;

  Future<void> updateVariants(variantFile.Variations variants) async {
    selectedvariants = variants;

    // showLoading = true;
    update();
    print("variants${selectedvariants!.price}");
// clearFields();
  }

  // var cartItems = <CartItemModel>[];
  int kg = 1;

  var sizecount = 1;
  String? dropdownsize;
  // List<String> sizeDropDownList = ["1kg", "2kg","3kg","4kg","5kg"];

  // void setSelectedVariant(String variant) {
  //   dropdownsize = variant;
  // }

// updateSize(String? selectTab){
//   dropdownsize = selectTab;
//   update();
// }
void clearPopUpFields() {
    selectedvariants = null;
         emailController.clear();
    print("Data cleared...");
    update();
  }
  void clearFields() {
    selectedvariants = null;
    print("Data cleared...");
    update();
  }



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
    if(productdetailwholemodel != null && productdetailwholemodel!.data != null && productdetailwholemodel!.data!.stock != null){
print("xxnxnxnnx");
     if (sizecount < productdetailwholemodel!.data!.stock!.toInt()) {
    sizecount++;
    print("Size: $sizecount");
    update();

    if (sizecount ==  productdetailwholemodel!.data!.stock!.toInt()) {
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
 
 void decrementSize() {
  if (sizecount > productdetailwholemodel!.data!.minOrder!.toInt()) {
    sizecount--;
    minishowMaxQuantitySnackBar();
    update();
  }
  }

void minishowMaxQuantitySnackBar() {
  Get.snackbar(
    'Minimum Order',
    'You have reached the minimum order for this item.',
    snackPosition: SnackPosition.BOTTOM,
  );
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
  void inCartUpdate(bool productdetailLoaded1) {
    productdetailLoaded = productdetailLoaded1;
    update();
    print("productdetailLoaded${productdetailLoaded}");
  }

  void  allamount(){
      totalAmount = ((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
              (((selectedvariants?.price ?? 0) * sizecount ?? 0) *
                  (productdetailwholemodel!.data!.discount!) /
                  100))
          ;
          // print("-------"+totalAmount);
  }

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
  ProductDetailsWholeModel? productdetailwholemodel;
  bool productdetailLoaded = false;

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // productdeatils
      productdetailwholemodel = ProductDetailsWholeModel.fromJson(
          await ApiHelper.getApi(getUserProductDetailsUrl + "$productID"));
      print(getUserProductDetailsUrl + "$productID");
      variantslist = productdetailwholemodel!.data!.variations;
      
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
      sizecount = productdetailwholemodel!.data!.minOrder!.toInt();
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
  String getUserMyCartUrl = Constants.GET_USER_MYCARTLIST;
  WholeMyCartListModel? mycartmodel;
  bool isProductInCartBool = false;

  
  Future<void> addNotify() async {
    showLoading = true;
    update();
   
    var body = {
      "user_id": storage.read('wholesalerid').toString(),
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
       "user_id":storage.read('wholesalerid').toString(),
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
      "user_id": storage.read('wholesalerid').toString(),
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
        "user_id": storage.read('wholesalerid').toString(),
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
 
  Future<void> addProductHome() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "user_id":storage.read('wholesalerid').toString(),
      "item_id": productID.toString(),
      "item_name": productname.toString(),
      "variant": variants.toString(),
      "quantity": qty.toString(),
      "image": image.toString(),
      "price": priceProduct
          .toString(),
          "total_quantity":selectedvariants!.stock.toString(), 
 "return_order":(returnorder??'Yes').toString()


      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
     "user_id":storage.read('wholesalerid').toString(),
      "item_id": productID.toString(),
      "item_name": productname.toString(),
      "variant": variants.toString(),
      "quantity": qty.toString(),
      "image": image.toString(),
      "price": priceProduct
          .toString(),
          
          "total_quantity":(selectedvariants!.stock??0).toString(), 
           "return_order":(productdetailwholemodel!.data!.returnable??'Yes').toString()
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

  Future<void> isProductInCart() async {
    showLoading = true;
    update();
    // showLoading = true;
    try {
      // productdeatils
      mycartmodel = WholeMyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('wholesalerid')}"));
      print("====?//${mycartmodel}");
      // sizes = mycartmodel!.data!.map((e) => 1).toList();
      // mycartmodel!.data!.forEach((element) { 
      //   if(element.itemId.toString() == productID.toString()){
      //     isProductInCartBool = true;
      //   }
      // });
      for(var element in mycartmodel!.data!){
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


// List<variantFile.Variations> variants = productdetailmodel!.data!.variants

  Future<void> addProduct() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "user_id": storage.read('wholesalerid').toString(),
      "item_id": productID.toString(),
      "item_name": productdetailwholemodel!.data!.name.toString(),
      "variant":  (productdetailwholemodel!.data!.variations! .isEmpty)?"0":selectedvariants!.type.toString(),
      "quantity": (sizecount ?? 0).toString(),
      "image": productdetailwholemodel!.data!.image ?? '',
      "price":  (selectedvariants?.wholeprice != null)? (((selectedvariants?.wholeprice ?? 0)  -
              (((selectedvariants?.wholeprice ?? 0) ) *
                  (productdetailwholemodel!.data!.discount!) /
                  100))).toString():(((productdetailwholemodel!.data!.wholePrice ?? 0)  -
              (((productdetailwholemodel!.data!.wholePrice ?? 0)) *
                  (productdetailwholemodel!.data!.discount!) /
                  100)))
          .toString(),
          

          // (selectedvariants?.wholeprice != null)? (((selectedvariants?.wholeprice ?? 0) * (sizecount ?? 0) -
          //     (((selectedvariants?.wholeprice ?? 0) * sizecount! ?? 0) *
          //         (productdetailwholemodel!.data!.discount!) /
          //         100))).toString():(((productdetailwholemodel!.data!.wholePrice ?? 0) * (sizecount ?? 0) -
          //     (((productdetailwholemodel!.data!.wholePrice ?? 0) * sizecount! ?? 0) *
          //         (productdetailwholemodel!.data!.discount!) /
          //         100)))
          // .toString(),
          "total_quantity":selectedvariants?.stock.toString(), 
           "return_order":(productdetailwholemodel!.data!.returnable??'Yes').toString()
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print("Product body");
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('wholesalerid').toString(),
        "item_id": productID.toString(),
        "item_name": productdetailwholemodel!.data!.name.toString(),
        "variant": (productdetailwholemodel!.data!.variations! .isEmpty)?"0":selectedvariants!.type.toString(),
        "quantity": (sizecount ?? 0).toString(),
        "image": productdetailwholemodel!.data!.image ?? '',
        "price":
        (selectedvariants?.wholeprice != null)? (((selectedvariants?.wholeprice ?? 0)  -
              (((selectedvariants?.wholeprice ?? 0)) *
                  (productdetailwholemodel!.data!.discount!) /
                  100))).toString():(((productdetailwholemodel!.data!.wholePrice ?? 0)  -
              (((productdetailwholemodel!.data!.wholePrice ?? 0) ) *
                  (productdetailwholemodel!.data!.discount!) /
                  100)))
          .toString(),
        //  ((selectedvariants?.wholeprice ?? 0) * (sizecount ?? 0) -
        //         (((selectedvariants?.wholeprice ?? 0) * sizecount ?? 0) *
        //             (productdetailwholemodel!.data!.discount!) /
        //             100))
        //     .toString(),
            
          "total_quantity":(productdetailwholemodel!.data!.variations! .isEmpty)?"0":selectedvariants!.stock.toString(), 
           "return_order":(productdetailwholemodel!.data!.returnable??'Yes').toString()
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