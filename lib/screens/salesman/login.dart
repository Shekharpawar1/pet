import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet/controllers/salesman_controller/createaccount_controller.dart';
import 'package:pet/controllers/salesman_controller/login_controller.dart';
import 'package:pet/controllers/user_controller/login_controller.dart';
import 'package:pet/screens/common/common.dart';
import 'package:pet/screens/salesman/Dashboard.dart';
import 'package:pet/screens/salesman/createaccount.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/salesman/otp.dart';
import 'package:pet/screens/user/userHome.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginSales extends StatefulWidget {
  const LoginSales({super.key});

  @override
  State<LoginSales> createState() => _LoginSalesState();
}

class _LoginSalesState extends State<LoginSales> {
  // TextEditingController _numbercontroller = TextEditingController();

  SalesLoginController saleslogincontroller = Get.put(SalesLoginController());
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
                
                  key: saleslogincontroller.formKey,
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
                      Padding(
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
                            child: Form(
                              child: 
                              
                                  Column(
                                    children: [
                                      IntlPhoneField(
                                            //  obscureText : false,
// onChanged:(value){
// userLoginController.validatePhoneNumber(
//   value.number
// );
// } ,
                                            controller: saleslogincontroller
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
                                 SizedBox(height: 7.0),
                                 
                                    ],
                                  ),
                                   
                              // IntlPhoneField(
                              //   //  obscureText : false,
                              //   controller:
                              //       saleslogincontroller.phoneNumberController,
                              //   cursorColor: MyColors.white,
                              //   showCountryFlag: false,
              
                              //   dropdownIconPosition: IconPosition.trailing,
                              //   dropdownTextStyle:
                              //       TextStyle(color: MyColors.white),
                              //   showDropdownIcon: true,
                              //   dropdownIcon: Icon(
                              //     Icons.arrow_drop_down,
                              //     color: MyColors.white,
                              //   ),
                              //   style: TextStyle(color: MyColors.white),
                              //   // flagsButtonPadding: EdgeInsets.only(left:10,right: 10,),
                              //   validator: (value) {
                              //     if (value == null || value.number.isEmpty) {
                              //       return 'Please enter number';
                              //     }
                              //     return null;
                              //   },
                              //   decoration: InputDecoration(
                              //     // labelText: 'Mobile Number',
                              //     //  hiStyle: TextStyle(color:MyColors.white,fontSize: 12),
                              //     counterText: '',
                              //     contentPadding: EdgeInsets.only(
                              //       left: 10,
                              //       right: 10,
                              //     ),
                              //     suffixIcon:
                              //         Image.asset("assets/image/call.png"),
              
                              //     // fillcolor:MyColors.white,
                              //     focusColor: MyColors.white,
                              //     //   counterText: '',
                              //     // contentPadding: EdgeInsets.all(10),
              
                              //     // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       // borderRadius: BorderRadius.circular(50),
                              //     ),
                              //     // focusedBorder: OutlineInputBorder(
                              //     //   borderSide: BorderSide.none,
                              //     //   //  borderRadius: BorderRadius.circular(50),
                              //     // ),
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       //  borderRadius: BorderRadius.circular(50),
                              //     ),
              
                              //     // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                              //     // enabledBorder: OutlineInputBorder(
                              //     //   borderSide: BorderSide.none,
                              //     //   // borderRadius: BorderRadius.circular(50),
                              //     // ),
                              //     // focusedBorder: OutlineInputBorder(
                              //     //   borderSide: BorderSide.none,
                              //     //   //  borderRadius: BorderRadius.circular(50),
                              //     // ),
              
                              //     // border: OutlineInputBorder(
                              //     //   borderSide: BorderSide.none,
                              //     //   //  borderRadius: BorderRadius.circular(50),
                              //     // ),
                              //     hintText: "Mobile Number",
                              //     hintStyle: TextStyle(
                              //         color: MyColors.white, fontSize: 14),
              
                              //     // border: OutlineInputBorder(
              
                              //     //   borderSide: BorderSide(),
                              //     // ),
                              //   ),
                              //   initialCountryCode:
                              //       'IN', // Set initial country code
                              //   // onChanged: (PhoneNumber phoneNumber) {
                              //   //   print(phoneNumber.completeNumber);
                              //   // },
                              // ),
                           
                            ),
                          ),
                        ),
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
                                child: GetBuilder<SalesLoginController>(
                                    init: saleslogincontroller,
                                    builder: (_) {
                                      return TextFormField(
                                        obscureText:
                                            !saleslogincontroller.passwordVisible,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                        controller:
                                            saleslogincontroller.passwordController,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              saleslogincontroller.passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 15,
                                              color: MyColors.white,
                                            ),
                                            onPressed: () {
                                              saleslogincontroller.updatepass();
                                            },
                                          ),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: MyColors.white, fontSize: 14),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
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
                              //  saleslogincontroller.validateForm(context);
              
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: ()  async {
              
                                saleslogincontroller.validateForm(context).then(
                                (isValid) async {
                                  if (isValid) {
                                    // print("Valid form");
              
                                    try {
                                      await saleslogincontroller.loginsales();
                                      // Navigator.push(
                                      //     context,
                                      //     PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         child: DashboardSales()));
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
                              // await Navigator.push(
                              //     context,
                              //     PageTransition(
                              //         type: PageTransitionType.fade,
                              //         child: OtpSales()));
              
                              //TODO: For reverse ripple effect animation
                           
                            
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
                              onTap: () async {
                                Get.put(CreateAccountControllersales());
                                final CreateAccountControllersales
                                    userHomeController =
                                    Get.find<CreateAccountControllersales>();
                                userHomeController.onInit();
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccountsales()));
              
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: CreateAccountsales()));
                                // Get.to(()=>CreateAccountsales());
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
