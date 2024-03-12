import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet/controllers/wholesaler_controller/login_controller.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/wholesaler/Dashboard.dart';
import 'package:pet/screens/wholesaler/createaccount.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/userHome.dart';

import 'package:pet/screens/wholesaler/otp.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginWhole extends StatefulWidget {
  const LoginWhole({super.key});

  @override
  State<LoginWhole> createState() => _LoginWholeState();
}

class _LoginWholeState extends State<LoginWhole> {
  LoginWholeController loginwholeController = Get.put(LoginWholeController());
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.bgcolor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: loginwholeController.formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Image.asset("assets/logo/logo.png"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              "Enter your email and password ",
                              style: CustomTextStyle.boldStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Email",
                          style: CustomTextStyle.mediumtext,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(40)),
                            child: GetBuilder<LoginWholeController>(
                                init: loginwholeController,
                                builder: (_) {
                                  return TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller:
                                        loginwholeController.emailController,
                                    decoration: const InputDecoration(
                                      hintText: "Email ID",
                                      hintStyle: TextStyle(
                                          color: MyColors.white, fontSize: 14),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: MyColors.white,
                                    ),
                                  );
                                })),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Password",
                          style: CustomTextStyle.mediumtext,
                        ),
                      ),
                      //  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(40)),
                            child: GetBuilder<LoginWholeController>(
                                init: loginwholeController,
                                builder: (_) {
                                  return TextFormField(
                                    obscureText:
                                        !loginwholeController.passwordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                    controller:
                                        loginwholeController.passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          loginwholeController.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 15,
                                          color: MyColors.white,
                                        ),
                                        onPressed: () {
                                          loginwholeController.updatepass();
                                        },
                                      ),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                          color: MyColors.white, fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),

                                    // decoration: InputDecoration(
                                    //   suffixIcon: IconButton(
                                    //     icon: Icon(
                                    //       loginwholeController.passwordVisible
                                    //           ? Icons.visibility
                                    //           : Icons.visibility_off,
                                    //       size: 15,
                                    //       color: MyColors.white,
                                    //     ),
                                    //     onPressed: () {
                                    //       loginwholeController.updatepass();
                                    //     },
                                    //   ),
                                    //   hintText: "Password",
                                    //   hintStyle: TextStyle(
                                    //       color: MyColors.white, fontSize: 14),
                                    //     contentPadding: EdgeInsets.symmetric(
                                    //       horizontal: 20, vertical: 15),
                                    //    border: InputBorder.none,
                                    //   enabledBorder: InputBorder.none,
                                    //   focusedBorder: InputBorder.none,
                                    // ),

                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: MyColors.white,
                                    ),
                                  );
                                })),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: SwipeableButtonView(
                            buttonText: 'Swipe to login',
                            buttontextstyle: const TextStyle(
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
                              //  saleslogincontroller.validateForm(context);

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: () async {
                              loginwholeController.validateForm(context).then(
                                (isValid) async {
                                  if (isValid) {
                                    // print("Valid form");

                                    try {
                                      await loginwholeController.loginEmail();
                                      // Navigator.push(
                                      //   context,
                                      //   PageTransition(
                                      //     type: PageTransitionType.fade,
                                      //     child: const DashboardWhole(),
                                      //   ),
                                      // );
                                    } catch (e) {
                                      Get.snackbar(
                                        'Error',
                                        'Something Went Wrong: $e',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  } else {
                                    print("InValid form");
                                    // Code to execute when the form is not valid
                                    // Add your logic here
                                  }
                                },
                                // await Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: HomeWhole()));

                                //TODO: For reverse ripple effect animation
                              );
                              //TODO: For reverse ripple effect animation
                              setState(() {
                                isFinished = false;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Or",
                            style: CustomTextStyle.boldStyle,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const CreateAccountwhole());
                              },
                              child: Center(
                                  child: Text(
                                "Create  a New Account",
                                 style: TextStyle(
                                    color: MyColors.yellow,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ],
                      ),



                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(Common());
                        },
                        
                        child: Center(
                            child: Text(
                          "Other Login",
                          style: CustomTextStyle.yellowtext,
                        ))),
               
               
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ]),
              )),
        ));
  }
}
