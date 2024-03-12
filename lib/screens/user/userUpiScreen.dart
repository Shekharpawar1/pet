import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/paymentdone.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:upi_india/upi_india.dart';
import "package:http/http.dart" as http;

class UserUpiScreen extends StatefulWidget {
    UserUpiScreen({super.key,this.amount});
    double? amount;
  @override
  _UserUpiScreenState createState() => _UserUpiScreenState();
}

class _UserUpiScreenState extends State<UserUpiScreen> {
    MyCartController mycartController = Get.put(MyCartController());

  // Future<UpiResponse>? _transaction;
  // UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;
    String merchantId = 'PHONEPEPGUAT8';
    String AppId = "";
    String ApiKey='aeed1568-1a76-4fa4-9f47-3e1c81232660';
    String Env = 'SANDBOX';double price=0.0;
    bool enableLogging = true;
    String checksum = '';
    String saltIndex = '1';
    String callbackUrl ='https://canine.hirectjob.in/api/v1/auth/payment/callback';
    String body = '';
    Object? result;
    String apiEndPoint = "/pg/v1/pay";
    String transactionID=DateTime.now().millisecondsSinceEpoch.toString();
    // String user_id=mycartController.user_id;
    String getCheckSum() {
      final requestData = {
        "merchantId": merchantId,
        "merchantTransactionId": transactionID,
        "merchantUserId": mycartController.userID.toString(),
        "amount": (widget.amount ?? 0) * 100,
        "callbackUrl": callbackUrl,

        "paymentInstrument": {"type": "PAY_PAGE"}
      };

      String base64body = base64.encode(utf8.encode(json.encode(requestData)));
      print("transactionID${requestData}");
      setState(() {
        checksum =
        '${sha256.convert(utf8.encode(base64body + apiEndPoint + ApiKey)).toString()}###$saltIndex';

      });
      return base64body;
    }


    void paymentInit() {
      print("${[Env, AppId, merchantId, enableLogging]}");
      PhonePePaymentSdk.init(Env, AppId, merchantId, enableLogging)
          .then((val) {
        setState(() {
          result = 'PhonePe SDK Initialized - $val';
          body=getCheckSum().toString();
        });
         print("body${body}");
        startPgTransaction();
      })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }

    Future<void> checkStatus() async {
      print("check called");
      String url = 'https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/$merchantId/$transactionID';
      String concatString = '/pg/v1/status/$merchantId/$transactionID$ApiKey';
      print("concatString{$concatString");
      var bytes = utf8.encode(concatString);
      var digest = sha256.convert(bytes).toString();
      String xVerify = '$digest###$saltIndex';

      Map<String, String> headers = {
        "Content-Type":"application/json",
        "X-VERIFY":xVerify,
        "X-MERCHANT-ID":merchantId,
      };


      print("check headers${headers}");
      print("url${url}");
      try {
        await http.get(Uri.parse(url), headers: headers).then(
                (value) {
              Map<String, dynamic> res = jsonDecode(value.body);
              print("Response: ${res}");
              if (res['success'] && res['code'] == 'PAYMENT_SUCCESS' &&
                  res['data']['state'] == 'COMPLETED') {
                print("Response: ${res}");
                Get.to(PaymentDoneScreenuser());
                mycartController.placeorder();
              } else {
                print("Response: ${res}");
              }
            });
        // print("Response: ${res}");



      } catch (e) {
        print('Error: $e');

      }
    }
    void startPgTransaction() async {
      try {
        String base64body = getCheckSum();
        var response = await PhonePePaymentSdk.startTransaction(
          base64body,
          callbackUrl,
          checksum,
          "",
        );

        if (response != null) {
          String status = response['status'].toString();
          String error = response['error'].toString();
          print("sdk response${response}");
          if (status == 'SUCCESS') {
            result = "Flow Completed - Status:${response}";
            await checkStatus();
          } else {
            result = "Flow Completed - Status: $status and Error: $error";
          }
        } else {
          result = "Flow Incomplete";
        }
      } catch (err) {
        print(err);
      }
    }
    void handleError(err) {
      setState(() {
        result = {"error": err};
      });
    }
  @override
  void initState() {


    paymentInit();


    print("screen is on stack");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
}