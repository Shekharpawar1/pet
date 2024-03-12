

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/screens/wholesaler/widget/orderReturnReasonsDialog.dart';

class OrderReturnDialogwhole extends StatelessWidget {
  // final OrderCancellationController controller = Get.put(OrderCancellationController());

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: 
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Return Order',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text('Are you sure you want to return this order?'),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Get.back();
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () async {
                          // Call the order cancellation function from the controller
                          // Replace `cancelOrder` with the actual function in your controller to cancel the order
                          // controller.cancelOrder();

                          // Close the dialog
                           
                          Get.back();
                          // Get.back();
                          Get.dialog(OrderReturnReasonsDialogwhole());
                        },
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
   
          
          ),
        
    );
  }
}
