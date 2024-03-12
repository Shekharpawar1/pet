import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet/controllers/partner_controller/login_controller.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/partner/createaccount.dart';
import 'package:pet/screens/partner/otp.dart';
import 'package:pet/screens/partner/subsciption.dart';
import 'package:pet/screens/salesman/createaccount.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/salesman/otp.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:http/http.dart' as http;
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginPartner extends StatefulWidget {
  const LoginPartner({super.key});

  @override
  State<LoginPartner> createState() => _LoginPartnerState();
}

class _LoginPartnerState extends State<LoginPartner> {
  PartnerLoginController partnercontroller = Get.put(PartnerLoginController());
  // TextEditingController _numbercontroller = TextEditingController();
  bool isFinished = false;

//   void handleApiResponse(BuildContext context, http.Response response) {
//   
//     print(response.body);
//   if (response.statusCode == 200) {
//     // Navigate to the next screen
//     Navigator.push(
//       context,
//       PageTransition(
//         type: PageTransitionType.fade,
//         child: Subscription(),
//       ),
//     );

//   } else {
//     print("object======");
//     // Handle API errors or non-200 responses


//     Get.snackbar(
//       'Error',
//        'API Error: ${response.body}',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.bgcolor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: partnercontroller.formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/logo/logo.png"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              "Enter your Email and Password",
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
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(40)),
                            child: GetBuilder<PartnerLoginController>(
                                init: partnercontroller,
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
                                        partnercontroller.emailController,
                                    decoration: InputDecoration(
                                      hintText: "Email ID",
                                      hintStyle: TextStyle(
                                          color: MyColors.white, fontSize: 14),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
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
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(40)),
                            child: GetBuilder<PartnerLoginController>(
                                init: partnercontroller,
                                builder: (_) {
                                  return TextFormField(
                                    obscureText:
                                        !partnercontroller.passwordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                    controller:
                                        partnercontroller.passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          partnercontroller.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 15,
                                          color: MyColors.white,
                                        ),
                                        onPressed: () {
                                          partnercontroller.updatepass();
                                        },
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: MyColors.white, fontSize: 14),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.white,
                                    ),
                                  );
                                })),
                      ),

                      //         Padding(
                      //               padding: EdgeInsets.only(left: 18,right: 18),
                      //               child: Container(
                      //             //  width: 335,
                      // height: 50,
                      //                 decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.10), borderRadius: BorderRadius.circular(40),  boxShadow: [

                      //                     BoxShadow(
                      //                        offset: const Offset(0.0, 0.0),
                      //                       color:  Color.fromRGBO(255, 255, 255, 0.10),
                      //                       blurRadius: 0.0,
                      //                       spreadRadius: 0.0,
                      //                     ),
                      //                      ]),
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: IntlPhoneField(
                      //                     //  obscureText : false,
                      //                     controller:_numbercontroller ,
                      //                     cursorColor:MyColors.white,
                      //                     showCountryFlag: false,

                      //                     dropdownIconPosition :IconPosition.trailing,
                      //                     dropdownTextStyle: TextStyle(color:MyColors.white),
                      //                        showDropdownIcon: true,
                      //                        dropdownIcon: Icon(Icons.arrow_drop_down,color:MyColors.white,),
                      //                        style: TextStyle(color:MyColors.white),
                      //                     // flagsButtonPadding: EdgeInsets.only(left:10,right: 10,),
                      //                     decoration: InputDecoration(
                      //                       // labelText: 'Mobile Number',
                      //                     //  hiStyle: TextStyle(color:MyColors.white,fontSize: 12),
                      //                       counterText: '',
                      //                       contentPadding: EdgeInsets.only(left:10,right: 10,),
                      //                     suffixIcon: Image.asset("assets/image/call.png"),

                      //                                         // fillcolor:MyColors.white,
                      //                                         focusColor:MyColors.white,
                      //                                     //   counterText: '',
                      //                                  // contentPadding: EdgeInsets.all(10),

                      //                                         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                      //                                         enabledBorder: OutlineInputBorder(
                      //                                           borderSide: BorderSide.none,
                      //                                           // borderRadius: BorderRadius.circular(50),
                      //                                         ),
                      //                                         // focusedBorder: OutlineInputBorder(
                      //                                         //   borderSide: BorderSide.none,
                      //                                         //   //  borderRadius: BorderRadius.circular(50),
                      //                                         // ),
                      //                                         border: OutlineInputBorder(
                      //                                           borderSide: BorderSide.none,
                      //                                           //  borderRadius: BorderRadius.circular(50),
                      //                                         ),

                      //                         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                      //                                             // enabledBorder: OutlineInputBorder(
                      //                                             //   borderSide: BorderSide.none,
                      //                                             //   // borderRadius: BorderRadius.circular(50),
                      //                                             // ),
                      //                                             // focusedBorder: OutlineInputBorder(
                      //                                             //   borderSide: BorderSide.none,
                      //                                             //   //  borderRadius: BorderRadius.circular(50),
                      //                                             // ),

                      //                                             // border: OutlineInputBorder(
                      //                                             //   borderSide: BorderSide.none,
                      //                                             //   //  borderRadius: BorderRadius.circular(50),
                      //                                             // ),
                      //                                             hintText:"Mobile Number",
                      //                                             hintStyle: TextStyle(color:MyColors.white,fontSize: 14),

                      //                       // border: OutlineInputBorder(

                      //                       //   borderSide: BorderSide(),
                      //                       // ),
                      //                     ),
                      //                     initialCountryCode: 'IN', // Set initial country code
                      //                     // onChanged: (PhoneNumber phoneNumber) {
                      //                     //   print(phoneNumber.completeNumber);
                      //                     // },
                      //                   ),
                      //                 ),
                      //               ),

                      //         ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: SwipeableButtonView(
                            buttonText: 'Swipe to login',
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
                              partnercontroller.validateForm(context).then(
                                (isValid) async {
                                  if (isValid) {
                                    print("Valid form");
                                    try {
                                      
                                        await partnercontroller.getOtp();
   
                                    
                                    } catch (e) {
                                      print("Error :$e");
                                     
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
                              );
                              // await Navigator.push(context,
                              //               PageTransition(
                              //                   type: PageTransitionType.fade,
                              //                   child: OtpPartner() ));

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
                                Get.to(CreateAccountpartner());
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
