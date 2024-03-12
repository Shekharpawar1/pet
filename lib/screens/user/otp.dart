import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/login_controller.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/others/customDialogBox.dart';
import 'package:pet/screens/bottomnavbar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OtpUser extends StatelessWidget {
  OtpUser({super.key});
  final UserLoginController userLoginController =
      Get.put(UserLoginController());
        NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
  final foo = Get.put(() => HomeuserController());

 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.bgcolor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Image.asset("assets/logo/logo.png"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Verification",
                  style: CustomTextStyle.boldStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Enter OTP code send to your number",
                  style: CustomTextStyle.mediumtext,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<UserLoginController>(
                        init: userLoginController,
                        builder: (_) {
                          return Text(
                            userLoginController.phoneNumberController.text,
                            style: CustomTextStyle.mediumtext,
                          );
                        }),
                    Image.asset("assets/image/edit.png")
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: 60,
                  child: GetBuilder<UserLoginController>(
                      init: userLoginController,
                      builder: (_) {
                        return OtpTextField(
                          numberOfFields: 4,
                          fieldWidth: 60,
                          enabledBorderColor: MyColors.bgcolorw,

                          focusedBorderColor: MyColors.yellow,
                          textStyle: TextStyle(color: MyColors.white),
                          cursorColor: MyColors.white,
                          fillColor: MyColors.bgcolorw,
                          filled: true,
                          // autoFocus: true,
                          disabledBorderColor: MyColors.bgcolorw,
                          borderRadius: BorderRadius.circular(50),

                          borderWidth: 1.5,

                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            userLoginController.updateOtp(verificationCode);
                           
                            Get.dialog(
                              
                              CustomDialog(isSuccess: true),
                            );
                          }, // end onSubmit
                        );
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Center(
                    child:
                        Text("Resend OTP", style: CustomTextStyle.mediumtext)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GetBuilder<UserLoginController>(
                  init: userLoginController,
                  // initState: (_) {},
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width*0.8,
                        child: SwipeableButtonView(
                          buttonText: 'Swipe to Continue',
                          buttontextstyle: TextStyle(
                              letterSpacing: 2,
                              color: MyColors.voliet,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "ReemKufi-Regular"),
                          // buttonColor: Colors.transparent,
                          // buttoncolor:MyColors.yellow,

                          buttonWidget: CircleAvatar(
                              backgroundColor: MyColors.bgcolor,
                              radius: 30,
                              child: Image.asset("assets/image/swipe.png")),
                          activeColor: MyColors.yellow,
                          isFinished: userLoginController.isFinishedOtp,
                          onWaitingProcess: () {
                           if (userLoginController.otpText == null || userLoginController.otpText == "" || userLoginController.otpText!.isEmpty
                                ) {
                                  print("Tapped");
                             
      // print('Error: 'Invalid Otp');
      Get.snackbar(
        'Error',
        'Invalid Otp',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    
                              return;
                            }  
                            Future.delayed(Duration(seconds: 2), () {
                              // setState(() {
                              //   isFinished = true;
                              // });\
                              userLoginController.updateIsFinishedOtp(true);
                            });
                          },
                          onFinish: () async {

                          if (userLoginController.otpText == null || userLoginController.otpText == "" || userLoginController.otpText!.isEmpty
                                ) {
                                  print("Tapped");
                                    Get.snackbar(
        'Error',
        'Invalid Otp',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
                                  
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text(
                              //     "Invalid OTP",
                              //     style: TextStyle(color: Colors.red),
                              //   )),
                              // );
                              return;
                            } else {

                               Get.put(HomeuserController());
                            final HomeuserController userHomeController =
                                Get.find<HomeuserController>();

                            try {
                              await userLoginController.sendOtp();
                              
                              await Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: BottomNavBar(),
                                ),
                                (route) => false,
                              );
      //                           notificationcontroller.init();
      //  mycartController.init(); 
                              userHomeController.onInit();
                            
                            } catch (e) {}
                            }
                           
                            // try {
                            //   await userLoginController.postUserData();
                            // } catch (e) {}
                            // await userLoginController.sendOtp();
                            // await userLoginController.postUserData();
                            // print("sending to new page...");

                            //TODO: For reverse ripple effect animation
                            // setState(() {
                            //   isFinished = false;
                            // });
                            userLoginController.updateIsFinishedOtp(false);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
