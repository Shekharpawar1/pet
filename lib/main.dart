

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pet/screens/partner/paymentdone.dart';
import 'package:pet/screens/user/home.dart';
import 'package:pet/screens/splash.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/orderDetails.dart';
import 'package:pet/screens/wholesaler/payment.dart';
import 'package:pet/screens/wholesaler/totalorder.dart';
import 'package:provider/provider.dart';

import 'screens/salesman/home.dart';
import 'screens/user/services2.dart';
import 'screens/wholesaler/balance.dart';
import 'screens/wholesaler/payment2.dart';

void main() {
  runApp( const MyApp(),);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.blue,
      ),
      home: Splash()
      
    );
  }
}





