import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/salesmanModel/reviewsalesmanModel.dart';

import 'package:pet/models/usersModel/reviewuserModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;
class SalesReviewController extends GetxController {
  double value = 0;
  int? itemid1;
  int? orderId1;
  var wholesellerId = GetStorage().read("wholesalerid");

bool showLoading = false;
final storage = GetStorage();
  TextEditingController commentController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  // TextEditingController numberController = TextEditingController();
// Review
  String getReviewUrl = '${Constants.GET_USERREVIEW}';
 SalesReviewModel? salesReviewModel;
  bool reviewLoaded = false;


  @override
  void onInit() {
    super.onInit();

    
    init();
  }


  void reviewAdd(int itemid,int orderId) {
    itemid1 = itemid;
    orderId1 = orderId;

    update();
    print("orderID${orderId1}  itemid${itemid1}");
  }
 
  @override
 Future<void> init() async {
   showLoading = true;
    update();
    try {
      // Review
      salesReviewModel = SalesReviewModel.fromJson(
          await ApiHelper.getApi(getReviewUrl+ "${itemid1}"));
          
      print("ReviewURL ===> ${getReviewUrl + "${itemid1}"}");
      reviewLoaded = true;
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
  

  
Future<void> reviewinit() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
        "item_id":itemid1.toString(),
      "user_id": wholesellerId.toString(),
      "order_id":orderId1.toString(),
      "comment":commentController.text.toString(),
      "rating": ratingController.text.toString(),
      
     
    };
    String PurchasePlanURl = Constants.REVIEW;
    print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(PurchasePlanURl));
      request.fields.addAll(body);
      
      await ApiHelper.postFormData(request: request);
      // print("PurchasePlanURL"+PurchasePlanURl);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Purchaes Plan',
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


  List reviewlist = [
    {
      
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
    {
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
    {
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
  ].obs;
  get getreviewList => reviewlist;
}
