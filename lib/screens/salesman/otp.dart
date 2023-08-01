import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/salesman/Dashboard.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OtpSales extends StatefulWidget {
  const OtpSales({super.key});

  @override
  State<OtpSales> createState() => _OtpSalesState();
}

class _OtpSalesState extends State<OtpSales> {
  bool isFinished = false;
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
                    Text(
                      "8839039838",
                      style: CustomTextStyle.mediumtext,
                    ),
                    Image.asset("assets/image/edit.png")
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: 60,
                  child: OtpTextField(
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
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Center(
                    child:
                        Text("Resend OTP", style: CustomTextStyle.mediumtext)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
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
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        Get.put(HomeSalesController());
                        final HomeSalesController HomesaleController =
                            Get.find<HomeSalesController>();
                        HomesaleController.onInit();
                        await Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: DashboardSales()));

                        //TODO: For reverse ripple effect animation
                        setState(() {
                          isFinished = false;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
