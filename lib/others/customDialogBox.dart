import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String verificationCode;

  CustomDialog({required this.verificationCode});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Center(child: Text("Verification Code")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Code entered is:'),
          SizedBox(height: 8),
          Text(
            verificationCode,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
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

// Usage:
// To show the dialog, call the CustomDialog like this:
// CustomDialog(verificationCode: '12345').show();
