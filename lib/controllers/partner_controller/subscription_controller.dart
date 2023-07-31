
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController{
  RxInt selectedIndex = 0.obs;

   toggle(int index) => selectedIndex.value = index;
}