

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/transactionModel.dart';

import '../../utils/api_helper.dart';
import '../../utils/constants.dart';

class TransactionUserController extends GetxController{

bool showLoading = false;
  var userId = GetStorage().read("id");

  String gettransuserUrl = '${Constants.GET_TRANSACTIONS}';
  UserTransactionModel? usertransactionmodel;
  bool transLoaded = false;
@override
  void onInit() {
    super.onInit();
    init();}

    Future<void> init() async {
    showLoading = true;
     try {
      // trans
     usertransactionmodel =
          UserTransactionModel.fromJson(await ApiHelper.getApi(gettransuserUrl+"${userId}"));
      print(gettransuserUrl+"${userId}");
      transLoaded = true;
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
  
}