

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholeLocationController.dart';
import 'package:pet/screens/wholesaler/widget/orderCancellationOtherDialog.dart';
class OrderCancellationReasonsDialogwhole extends StatelessWidget {
  // List of cancellation reasons
  
    //  final WholeLocationController controller = Get.find<WholeLocationController>();
 WholeMyOrderController myorderwholeController = Get.put(WholeMyOrderController());

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
              GetBuilder<WholeLocationController>(
                  init: WholeLocationController(),
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cancellationReasons.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(controller.cancellationReasons[index]),
                          value: controller.cancellationReasons[index],
                          groupValue: controller
                              .selectedValue,
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
                  GetBuilder<WholeLocationController>(
                      init: WholeLocationController(),
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
                               
                                Get.dialog(OrderCancellationOtherDialogwhole());
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
                            
                               await  myorderwholeController.cancelorderinit();
                              myorderwholeController.isButtonEnabled = false;

      print(myorderwholeController.isButtonEnabled);
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
