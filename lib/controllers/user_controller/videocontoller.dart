


import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/partnerModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:video_player/video_player.dart';

class VideoBannerController extends GetxController{
 bool showLoading = false;
 var videopath;
   late VideoPlayerController videoPlayerController;
  int? vendorId;


  @override
  void onInit() {
     super.onInit();
     partnerBannerinit();
  
//  =  GetStorage().read("showvideobanner");

var videourl ="http://caninedemo.caninetest.xyz/storage/app/${videopath}";
print("kkk");
print(videopath);
print("VideoPath!!${videourl}");
      try {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        videourl)
  )..initialize().then((_) {
    videoPlayerController.play();
    update();
      videoPlayerController.setLooping(true);
  });
} catch (error) {
  print("Error initializing the video: $error");
} 
    // super.onInit();
  }

void viewpartner1(int vendorid) {
   vendorId = vendorid;
    update();
    print("VentorpartnerId${vendorId}");
  }
 
//partner
 String getPartnerBannerUrl = '${Constants.GET_PRODUCT_PARTNER_BANNER}';
PartnerModel?  userpartnerbannerModel;
  bool partnerbannerLoaded = false;

  Future<void> partnerBannerinit() async {
    showLoading = true;
     try {
      // partner
      userpartnerbannerModel =
          PartnerModel.fromJson(await ApiHelper.getApi(getPartnerBannerUrl+"${vendorId}"));
      print(getPartnerBannerUrl+"${vendorId}");
      partnerbannerLoaded = true;
     var advertismentShow = userpartnerbannerModel!.data!.map((e) => e.advertisement);
     
     
    // Convert the list of strings to a JSON-encoded string
    String advertisementJson = jsonEncode(advertismentShow);
    
    // Store the JSON-encoded string in GetStorage
    GetStorage().write("showvideobanner", advertisementJson);
videopath = GetStorage().read("showvideobanner");
     print(GetStorage().read("showvideobanner"));
     print("jjjj");
     print(videopath);
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





  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

}