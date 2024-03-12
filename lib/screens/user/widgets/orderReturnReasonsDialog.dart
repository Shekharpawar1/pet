

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/userLocationController.dart';
import 'package:pet/screens/user/widgets/orderCancellationOtherDialog.dart';
import 'package:pet/screens/user/widgets/orderRturnOtherDialog.dart';

class OrderReturnReasonsDialog extends StatelessWidget {
  // List of cancellation reasons
  MyOrderController myordercontroller = Get.put(MyOrderController());

  @override
  Widget build(BuildContext context) {
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
                'Return Order',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text('Select a reason for order return:'),
              SizedBox(height: 16.0),
              // List of cancellation reasons as radio buttons
              GetBuilder<UserLocationController>(
                  init: UserLocationController(),
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.returnReasons.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(controller.returnReasons[index]),
                          value: controller.returnReasons[index],
                          groupValue: controller
                              .selectedValue, // Add the selected value here if using radio buttons
                          onChanged: (value) {
                            // Handle the selected reason here
                            print('Selected reason: $value');
                            controller.updaeSelectedValue(value!);
                          },
                        );
                      },
                    );
                  }),
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
                  GetBuilder<UserLocationController>(
                      init: UserLocationController(),
                      builder: (controller) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () async {
//                           // Perform the order cancellation with the selected reason
//                           // Handle the cancellation logic here
//                           String selectedReason = 'Get the selected reason from the user input';

//                           // Perform the cancellation logic with the selected reason
// if(controller.selectedValue == "Other") {

//                           Get.back();

// }
//                           // Close the dialog
//                           Get.back();
                            if (controller.selectedValue != null) {
                              if (controller.selectedValue == 'Other') {
                                print("Inside");
                                // Get.back();
                                // showTextInputDialog(context);
                                Get.dialog(OrderReturnOtherDialog());
                                return;
                              }
                              // If "Other" is selected, use the custom reason
                              String? cancellationReason =
                                  controller.selectedValue == 'Other'
                                      ? controller.otherReason
                                      : controller.selectedValue!;
                              print('Selected reason: $cancellationReason');
                              controller
                                  .updateSelectedReason(cancellationReason);

                              // Close the dialog
                               await  myordercontroller.reorderinit();
                           
                               Get.back();
                              Get.snackbar(
                                'Request Accepted',
                                'Selected Reason: ${controller.selectedReason}',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              // Show an error message if no reason is selected
                              Get.snackbar(
                                'Error',
                                'Please select a return reason.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: Text('Confirm'),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
