
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/userLocationController.dart';

class OrderCancellationOtherDialog extends StatelessWidget {
  final UserLocationController controller = Get.find<UserLocationController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserLocationController>(
      init: controller,
      builder: (_) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Other Reason',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      controller.updateOtherReason(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a reason';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your reason here',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Close the text input dialog
                          Get.back();
                          // Reset the selected reason if the user cancels the custom input
                          controller.updateOtherReason(null);
                          controller
                                  .updateSelectedReason("Eror");

                              // Close the dialog
                              Get.back();
                              Get.snackbar(
                                'Reuest Failed',
                                'Selected Reason: ${controller.selectedReason}',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          String? cancellationReason =
                              controller.selectedValue == 'Other'
                                  ? controller.otherReason
                                  : controller.selectedValue!;
                          print('Selected reason: $cancellationReason');
controller
                                  .updateSelectedReason(cancellationReason);

                              // Close the dialog
                              Get.back();
                              Get.snackbar(
                                'Order Cancelled',
                                'Selected Reason: ${controller.selectedReason}',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );

                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
