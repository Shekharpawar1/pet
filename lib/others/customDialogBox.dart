import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final bool isSuccess;

  CustomDialog({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    Color titleColor = isSuccess ? Colors.green : Colors.red;
    String titleText =
        isSuccess ? "Verification Success" : "Verification Failed";
    String imagePath =
        isSuccess ? "assets/image/success.png" : "assets/image/multiply.png";

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
              color: titleColor,
            ),
            SizedBox(width: 8),
            Text(
              titleText,
              style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ),
      ],
    );
  }
}
