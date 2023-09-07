import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/reviewsalesModel.dart';
import 'package:pet/models/usersModel/reviewuserModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';

class UserReviewController extends GetxController {
  double value = 3.5;
bool showLoading = false;

// Review
  String getReviewUrl = '${Constants.GET_USERREVIEW}';
 UserReviewModel? userReviewModel;
  bool reviewLoaded = false;


 
  @override
 Future<void> init() async {
   showLoading = true;
    update();
    try {
      // coupon
      userReviewModel = UserReviewModel.fromJson(
          await ApiHelper.getApi(getReviewUrl));
          
      print(getReviewUrl);
      reviewLoaded = true;
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
