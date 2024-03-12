

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/userLocationController.dart';
import 'package:pet/screens/user/widgets/orderCancellationOtherDialog.dart';

class OrderCancellationReasonsDialog extends StatelessWidget {
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
                'Cancel Order',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text('Select a reason for order cancellation:'),
              SizedBox(height: 16.0),
              // List of cancellation reasons as radio buttons
              GetBuilder<UserLocationController>(
                  init: UserLocationController(),
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cancellationReasons.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(controller.cancellationReasons[index]),
                          value: controller.cancellationReasons[index],
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
                                Get.back();
                                // showTextInputDialog(context);
                                Get.dialog(OrderCancellationOtherDialog());
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
                            
                               await  myordercontroller.cancelorderinit();
                              myordercontroller.  isButtonEnabled = false;

      print(myordercontroller.isButtonEnabled);
                              Get.back();
                              Get.snackbar(
                                'Order Cancelled',
                                'Selected Reason: ${controller.selectedReason}',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              // Show an error message if no reason is selected
                              Get.snackbar(
                                'Error',
                                'Please select a cancellation reason.',
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
