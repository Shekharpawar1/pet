import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/login_controller.dart';
import 'package:pet/screens/bottomnavbar.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/skip/skipuserhome.dart';
import 'package:pet/screens/user/otp.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/userHome.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  // TextEditingController _numbercontroller = TextEditingController();
  final UserLoginController userLoginController =
      Get.put(UserLoginController());
      
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Column(
                      children: [
                        Image.asset("assets/logo/logo.png"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Enter your mobile number We will send you OTP to verify ",
                          style: CustomTextStyle.boldStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Mobile Number",
                        style: CustomTextStyle.mediumtext,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Form(
                      key: userLoginController.formKey,
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: Container(
                          //  width: 335,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.10),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0.0, 0.0),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,right:8.0),
                            child: GetBuilder<UserLoginController>(
                                init: userLoginController,
                                builder: (_) {
                                  return Column(
                                    children: [
                                      IntlPhoneField(
                                        //  obscureText : false,
// onChanged:(value){
// userLoginController.validatePhoneNumber(
//   value.number
// );
// } ,
                                        controller: userLoginController
                                            .phoneNumberController,
                                            // invalidNumberMessage: ,
                                         disableLengthCheck: false,   
                                        cursorColor: MyColors.white,
                                        showCountryFlag: false,
                                        // validator: (value) {
                                        //   if (value!.number.isEmpty) {
                                        //     return "Please Enter a Phone Number";
                                        //   } else if (!RegExp(
                                        //           r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                        //       .hasMatch(value.number)) {
                                        //     return "Please Enter a Valid Phone Number";
                                        //   }
                                        // },
                                        dropdownIconPosition: IconPosition.trailing,
                                        dropdownTextStyle:
                                            TextStyle(color: MyColors.white),
                                        showDropdownIcon: true,
                                        
                                        dropdownIcon: Icon(
                                          Icons.arrow_drop_down,
                                          color: MyColors.white,
                                        ),
                                        style: TextStyle(color: MyColors.white),
                                        // flagsButtonPadding: EdgeInsets.only(left:10,right: 10,),
                                        decoration: InputDecoration(
                                          // labelText: 'Mobile Number',
                                          //  hiStyle: TextStyle(color:MyColors.white,fontSize: 12),
                                          counterText: '',
                                          contentPadding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          suffixIcon:
                                              Image.asset("assets/image/call.png"),

                                          // fillcolor:MyColors.white,
                                          focusColor: MyColors.white,
                                          //   counterText: '',
                                          // contentPadding: EdgeInsets.all(10),

                                          // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            // borderRadius: BorderRadius.circular(50),
                                          ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide: BorderSide.none,
                                          //   //  borderRadius: BorderRadius.circular(50),
                                          // ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            //  borderRadius: BorderRadius.circular(50),
                                          ),

                                          // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                                          // enabledBorder: OutlineInputBorder(
                                          //   borderSide: BorderSide.none,
                                          //   // borderRadius: BorderRadius.circular(50),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide: BorderSide.none,
                                          //   //  borderRadius: BorderRadius.circular(50),
                                          // ),

                                          // border: OutlineInputBorder(
                                          //   borderSide: BorderSide.none,
                                          //   //  borderRadius: BorderRadius.circular(50),
                                          // ),
                                          hintText: "Mobile Number",
                                          hintStyle: TextStyle(
                                              color: MyColors.white, fontSize: 14),

                                          // border: OutlineInputBorder(

                                          //   borderSide: BorderSide(),
                                          // ),
                                        ),
                                        initialCountryCode:
                                            'IN', // Set initial country code
                                        // onChanged: (PhoneNumber phoneNumber) {
                                        //   print(phoneNumber.completeNumber);
                                        // },
                                      ),
                                     SizedBox(height: 7.0), // Add spacing between TextField and Text
          // Text(
          //  userLoginController.errormsg??'',
          //   style: TextStyle(
          //     color: Colors.red,
          //     fontSize: 16.0,
          //   ),
          // ), 
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
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
                            userLoginController.validateForm(context).then(
                              (isValid) async {
                                if (isValid) {
                                  // print("Valid form");

                                  try {
                                    await userLoginController.getOtp();
                                   
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
                                  // print("InValid form");
                                  // Code to execute when the form is not valid
                                  // Add your logic here
                                }
                              },
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),


                    // InkWell(
                    //   onTap: ()async{
                    //         //  GetStorage().write("skip", true);

                    //       // print(GetStorage().read("skip"));
                    //       if(GetStorage().read("skip") ){
                    //         // homeusercontroller.userId == null;
                    //          await Navigator.pushAndRemoveUntil(
                    //             context,
                    //             PageTransition(
                    //               type: PageTransitionType.fade,
                    //               child: BottomNavBar(),
                    //             ),
                    //             (route) => false,
                    //           );
                    //       }
                            
                    //     //  Get.to(()=>SkipUserHome());
                    //   },
                    //   child: Center(child: Text("Skip"))),
                       SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
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
                  ])),
        ));
  }
}
