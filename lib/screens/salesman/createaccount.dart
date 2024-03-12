import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/salesman_controller/createaccount_controller.dart';
import 'package:pet/models/salesmanModel/zoneModel.dart' as zoneFile;

import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/utils/colors.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountsales extends StatefulWidget {
  const CreateAccountsales({super.key});

  @override
  State<CreateAccountsales> createState() => _CreateAccountsalesState();
}

class _CreateAccountsalesState extends State<CreateAccountsales> {
  // TextEditingController _emailcontroller = TextEditingController();
  // TextEditingController _firstcontroller = TextEditingController();
  //   TextEditingController _lastcontroller = TextEditingController();
  // TextEditingController _desigcontroller = TextEditingController();

  // TextEditingController dateController = TextEditingController();

  // TextEditingController _pincodecontroller = TextEditingController();

  final CreateAccountControllersales salescreateAccountcontroller =
      Get.put(CreateAccountControllersales());
  String filepath = '';
  String filename = '';
  File? file;
  String networkurl = '';

  // String? dropdowncity = "Indore";
  // List<String> cityDropDownList = ["Bhopal", "Indore"];

  // String dropdowncountry = "India";
  // List<String> countryDropDownList = ["India"];

  // String dropdowncurrency = "Rupee";
  // List<String> currencyDropDownList = ["Rupee"];

  // String selectedState = "Madhya Pradesh";
  // List<String> StateDropDownList = [
  //   "Madhya Pradesh",
  // ];

  Future openCameraPopupProfile(
    BuildContext context,
  ) async {
    showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.all(0),
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
              height: 150,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            // color: border,
                          ),
                          onPressed: () {},
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await salescreateAccountcontroller
                                          .getImageGalleryProfile();
                                      Navigator.pop(context);
                                    },
                                    tooltip: "Pick Image form gallery",
                                    child: Icon(Icons.photo),
                                  ),
                                  SizedBox(height: 5),
                                  Text('Gallery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await salescreateAccountcontroller
                                          .getImageCameraProfile();
                                      Navigator.pop(context);

                                      await Future.delayed(
                                          Duration(seconds: 2));
                                    },
                                    tooltip: "Pick Image from camera",
                                    child: Icon(Icons.camera_alt),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Camera',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }

  Future openCameraPopupLogo(
    BuildContext context,
  ) async {
    showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.all(0),
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
              height: 150,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            // color: border,
                          ),
                          onPressed: () {},
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await salescreateAccountcontroller
                                          .getImageGalleryLogo();
                                      Navigator.pop(context);
                                    },
                                    tooltip: "Pick Image form gallery",
                                    child: Icon(Icons.photo),
                                  ),
                                  SizedBox(height: 5),
                                  Text('Gallery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await salescreateAccountcontroller
                                          .getImageCameraLogo();
                                      Navigator.pop(context);

                                      await Future.delayed(
                                          Duration(seconds: 2));
                                    },
                                    tooltip: "Pick Image from camera",
                                    child: Icon(Icons.camera_alt),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Camera',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: MyColors.bgcolor,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                "Create a New Account",
                style: TextStyle(
                    color: MyColors.white,
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),

              Text("Lorem Ipsum is simply dummy text of the printing and",
                  style: CustomTextStyle.popinstextsmall),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              // Container(
              //   width: 335,
              //   height: 45,
              //   decoration: BoxDecoration(
              //       color: Color.fromRGBO(255, 255, 255, 0.10),
              //       boxShadow: [
              //         BoxShadow(
              //           offset: const Offset(0.0, 0.0),
              //           color: Color.fromRGBO(255, 255, 255, 0.10),
              //           blurRadius: 0.0,
              //           spreadRadius: 0.0,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(40)),
              //   child: TextFormField(
              //     controller: _firstcontroller,
              //     style: TextStyle(
              //         fontSize: 14,
              //         color: MyColors.black,
              //         fontFamily: "SF-Pro-Display"),
              //     decoration: InputDecoration(
              //         fillColor: MyColors.white,
              //         focusColor: MyColors.white,
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //         ),
              //         contentPadding: EdgeInsets.only(left: 15),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           //  borderRadius: BorderRadius.circular(50),
              //         ),
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           //  borderRadius: BorderRadius.circular(50),
              //         ),
              //         hintText: "First Name",
              //         hintStyle: CustomTextStyle.popinstextsmall),
              //   ),
              // ),

              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              // Container(
              //   width: 335,
              //   height: 45,
              //   decoration: BoxDecoration(
              //       color: Color.fromRGBO(255, 255, 255, 0.10),
              //       boxShadow: [
              //         BoxShadow(
              //           offset: const Offset(0.0, 0.0),
              //           color: Color.fromRGBO(255, 255, 255, 0.10),
              //           blurRadius: 0.0,
              //           spreadRadius: 0.0,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(40)),
              //   child: TextFormField(
              //     controller: _lastcontroller,
              //     style: TextStyle(
              //         fontSize: 14,
              //         color: MyColors.black,
              //         fontFamily: "SF-Pro-Display"),
              //     decoration: InputDecoration(
              //         fillColor: MyColors.white,
              //         focusColor: MyColors.white,
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //         ),
              //         contentPadding: EdgeInsets.only(left: 15),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           //  borderRadius: BorderRadius.circular(50),
              //         ),
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           //  borderRadius: BorderRadius.circular(50),
              //         ),
              //         hintText: "Last Name",
              //         hintStyle: CustomTextStyle.popinstextsmall),
              //   ),
              // ),

              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),

//             Container(
//                width: 335,
// height: 45,
// decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.10), borderRadius: BorderRadius.circular(40),  boxShadow: [

//                     BoxShadow(
//                        offset: const Offset(0.0, 0.0),
//                       color:  Color.fromRGBO(255, 255, 255, 0.10),
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ),
//                      ],),

//              child: TextFormField(
//                                    controller: dateController,
//                                                  style: TextStyle(fontSize: 14,color: MyColors.black, fontFamily: "SF-Pro-Display"),

//                                 decoration: InputDecoration(

//                                        // contentPadding: EdgeInsets.only(left: 15),
//                                          fillColor:MyColors. white,
//                                       focusColor:MyColors.white,
//                                       //  readOnly:true,
//                                        enabledBorder: OutlineInputBorder(
//                                          borderSide: BorderSide.none,

//                                          // borderRadius: BorderRadius.circular(50),
//                                        ),
//                                      contentPadding: EdgeInsets.only(left: 15),

//                                        focusedBorder: OutlineInputBorder(
//                                          borderSide: BorderSide.none,
//                                          //  borderRadius: BorderRadius.circular(50),
//                                        ),
//                                        border: OutlineInputBorder(
//                                          borderSide: BorderSide.none,
//                                          //  borderRadius: BorderRadius.circular(50),
//                                        ),
//                                        hintText:"Date Of Birth",
//                                      hintStyle: CustomTextStyle.popinstextsmall),

//                            onTap: ()async {
//                          DateTime? pickedDate = await showDatePicker(
//                              context: context,

//                              initialDate: DateTime.now(),
//                              firstDate:DateTime(1800),
//                              // DateTime.now(),
//                              lastDate: DateTime(2100));

//                          if (pickedDate != null) {
//                            print( pickedDate);
//                            String formattedDate =
//                            DateFormat('dd-MM-yyyy').format(pickedDate);

//                            print(
//                                formattedDate);
//                            setState(() {
//                              dateController.text = formattedDate;
//                            });
//                          } else {}},

//                                  ),
//            ),

//   SizedBox(height: 15,),
              Form(
                key: salescreateAccountcontroller.formKey,
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        //                    width: 335,
                        // height: 45,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          controller:
                              salescreateAccountcontroller.fullNameController,
                          decoration: InputDecoration(
                            hintText: "First Name",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
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
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       print("Tapped...");
                    //       createAccountcontroller.selectDate(
                    //           context); // Show date picker when container is tapped
                    //       // final DateTime? picked = await showDatePicker(
                    //       //   context: context,
                    //       //   initialDate: DateTime.now(),
                    //       //   firstDate: DateTime(1900),
                    //       //   lastDate: DateTime.now(),
                    //       // );
                    //       // if (picked != null) {
                    //       //   createAccountcontroller.selectedDate = picked;
                    //       //   wholeSalerController.dobController.text =
                    //       //       DateFormat('yyyy-MM-dd').format(
                    //       //           wholeSalerController.selectedDate!);
                    //       //   // update();
                    //       // }
                    //     },
                    //     child: Container(
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Colors.grey.shade200,
                    //       ),
                    //       child: TextFormField(
                    //         readOnly: true,
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Please enter DOB';
                    //           }
                    //           return null;
                    //         },
                    //         controller:
                    //             createAccountcontroller.dobController,
                    //         decoration: InputDecoration(
                    //           hintText: "Date of Birth",
                    //           contentPadding: EdgeInsets.symmetric(
                    //               horizontal: 20, vertical: 10),
                    //           border: InputBorder.none,
                    //           enabledBorder: InputBorder.none,
                    //           focusedBorder: InputBorder.none,
                    //         ),
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        //                    width: 335,
                        // height: 45,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          controller:
                              salescreateAccountcontroller.lastNameController,
                          decoration: InputDecoration(
                            hintText: "Last Name",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
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
                        ),
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: salescreateAccountcontroller.emailController,
                          decoration: InputDecoration(
                            hintText: "Email ID",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
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
                        ),
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
                        child: TextFormField(
                          controller:
                              salescreateAccountcontroller.phonenumberController,
                                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  maxLength: 10,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Phone Number";
                            } else if (!RegExp(
                                    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Phone Number";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Mobile No",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
                            counterText: "",
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
                        ),
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Identity Number';
                            }
                            return null;
                          },
                          controller: salescreateAccountcontroller
                              .identitynumberController,
                          decoration: InputDecoration(
                            hintText: "Identity Number",
                               hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),  contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
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
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a tpye';
                            }
                            return null;
                          },
                          value: salescreateAccountcontroller
                              .dropdownIdentityType, // Set the selected country value
                          decoration: InputDecoration(
                            hintText: "Identity Type",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // iconColor: MyColors.white,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: MyColors.white,
                          ),
                          style: TextStyle(fontSize: 16, color: MyColors.black),
                          items: salescreateAccountcontroller
                              .identityTypeDropDownList
                              .map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            salescreateAccountcontroller
                                .updateidentitytype(value ?? "");
                            // Perform actions when country is changed
                          },
                        ),
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
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a tpye';
                            }
                            return null;
                          },
                          value: salescreateAccountcontroller
                              .dropdowntype, // Set the selected country value
                          decoration: InputDecoration(
                            hintText: "SalesManType",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            iconColor: MyColors.white,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: MyColors.white,
                          ),
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 26, 5, 5)),
                          items: salescreateAccountcontroller.typeDropDownList
                              .map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            salescreateAccountcontroller.updatetype(value ?? "");
                            // Perform actions when country is changed
                          },
                        ),
                      ),
                    ),

                
  salescreateAccountcontroller.zoneListModel == null
                              ?  Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        )
                              :
                               Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.10),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0.0, 0.0),
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.10),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child:
                                        DropdownButtonFormField<zoneFile.Zone>(
                                      validator: (value) {
                                        if (value == null ||
                                            value.name!.isEmpty) {
                                          return 'Please select a zone';
                                        }
                                        return null;
                                      },
                                      value: salescreateAccountcontroller
                                          .selectedZone, // Set the selected country value
                                      decoration: InputDecoration(
                                        hintText: "Zone",
                                        hintStyle: TextStyle(
                                          color: MyColors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        // iconColor: MyColors.white,
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: MyColors.white,
                                      ),
                                      style: TextStyle(
                                          fontSize: 16, color: MyColors.black),
                                      items: salescreateAccountcontroller
                                          .zoneListModel!.data!
                                          .map((zone) {
                                        return DropdownMenuItem<zoneFile.Zone>(
                                          value: zone,
                                          child: Text(zone.name??''),
                                        );
                                      }).toList(),
                                      onChanged: (zoneFile.Zone? value) {
                                        salescreateAccountcontroller
                                            .updateZone(value!);
                                        // Perform actions when country is changed
                                      },
                                    ),
                                  ),
                                ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         color: Color.fromRGBO(255, 255, 255, 0.10),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             offset: const Offset(0.0, 0.0),
                    //             color: Color.fromRGBO(255, 255, 255, 0.10),
                    //             blurRadius: 0.0,
                    //             spreadRadius: 0.0,
                    //           ),
                    //         ],
                    //         borderRadius: BorderRadius.circular(40)),
                    //     child: DropdownButtonFormField<String>(
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Please select a tpye';
                    //         }
                    //         return null;
                    //       },
                    //       value: createAccountcontroller
                    //           .dropdownIdentityType, // Set the selected country value
                    //       decoration: InputDecoration(
                    //         hintText: "Identity Type",
                    //         hintStyle: TextStyle(
                    //           color: MyColors.white,
                    //         ),
                    //         contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 20, vertical: 5),
                    //         border: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         focusedBorder: InputBorder.none,
                    //         // iconColor: MyColors.white,
                    //       ),
                    //       icon: Icon(
                    //         Icons.arrow_drop_down,
                    //         color: MyColors.white,
                    //       ),
                    //       style: TextStyle(fontSize: 16, color: MyColors.white),
                    //       items: createAccountcontroller
                    //           .identityTypeDropDownList
                    //           .map((String type) {
                    //         return DropdownMenuItem<String>(
                    //           value: type,
                    //           child: Text(type),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? value) {
                    //         createAccountcontroller
                    //             .updateidentitytype(value ?? "");
                    //         // Perform actions when country is changed
                    //       },
                    //     ),
                    //   ),
                    // ),

                    //          Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Container(
                    //             height: 50,
                    //            decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 255, 255, 0.10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0.0, 0.0),
                    //     color: Color.fromRGBO(255, 255, 255, 0.10),
                    //     blurRadius: 0.0,
                    //     spreadRadius: 0.0,
                    //   ),
                    // ],
                    // borderRadius: BorderRadius.circular(40)),
                    //             child: TextFormField(
                    //               validator: (value) {
                    //                if (value == null ||
                    //                           value.isEmpty) {
                    //                         return 'Please select a type';
                    //                       }
                    //                       return null;

                    //               },
                    //               controller: createAccountcontroller
                    //                   .identitytypeController,
                    //               decoration: InputDecoration(
                    //                 hintText: "Identity Type",
                    //                   hintStyle: TextStyle(color: MyColors.white,),
                    //                 contentPadding: EdgeInsets.symmetric(
                    //                     horizontal: 20, vertical: 10),
                    //                 border: InputBorder.none,
                    //                 enabledBorder: InputBorder.none,
                    //                 focusedBorder: InputBorder.none,
                    //               ),
                    //               style: TextStyle(
                    //                 fontSize: 16,
                    //                 color:MyColors.white
                    //               ),
                    //             ),
                    //           ),
                    //         ),

                    //         createAccountcontroller.showLoading
                    //             ? Center(
                    //                 child: CircularProgressIndicator(),
                    //               )
                    //             :
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Container(
                    //                   height: 50,
                    //                    decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 255, 255, 0.10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0.0, 0.0),
                    //     color: Color.fromRGBO(255, 255, 255, 0.10),
                    //     blurRadius: 0.0,
                    //     spreadRadius: 0.0,
                    //   ),
                    // ],
                    // borderRadius: BorderRadius.circular(40)),

                    //                   child: DropdownButtonFormField<
                    //                       statesFile.State>(
                    //                     validator: (value) {
                    //                       if (value == null ||
                    //                           value.stateName!.isEmpty) {
                    //                         return 'Please select a state';
                    //                       }
                    //                       return null;
                    //                     },
                    //                     value:
                    //                         createAccountcontroller.selectedState,
                    //                     decoration: InputDecoration(
                    //                       hintText: "State",
                    //                       contentPadding: EdgeInsets.symmetric(
                    //                           horizontal: 20, vertical: 5),
                    //                       border: InputBorder.none,
                    //                       enabledBorder: InputBorder.none,
                    //                       focusedBorder: InputBorder.none,
                    //                     ),
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       color: MyColors.white,
                    //                     ),
                    //                     items: createAccountcontroller
                    //                         .stateListModel!.state!
                    //                         .map((state) {
                    //                       return DropdownMenuItem<
                    //                           statesFile.State>(
                    //                         value: state,
                    //                         child: Text(state.stateName!),
                    //                       );
                    //                     }).toList(),
                    //                     onChanged:
                    //                         (statesFile.State? value) async {
                    //                       await createAccountcontroller
                    //                           .updateState(value!);
                    //                     },
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(width: 8.0),
                    //             !createAccountcontroller.cityLoaded
                    //                 ? SizedBox()
                    //                 : Expanded(
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(8.0),
                    //                       child: Container(
                    //                         height: 50,
                    //                           decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 255, 255, 0.10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0.0, 0.0),
                    //     color: Color.fromRGBO(255, 255, 255, 0.10),
                    //     blurRadius: 0.0,
                    //     spreadRadius: 0.0,
                    //   ),
                    // ],
                    // borderRadius: BorderRadius.circular(40)),
                    //                         child: DropdownButtonFormField<
                    //                             cityFile.State>(
                    //                           validator: (value) {
                    //                             if (value == null ||
                    //                                 value.cityName!.isEmpty) {
                    //                               return 'Please select a city';
                    //                             }
                    //                             return null;
                    //                           },
                    //                           value: createAccountcontroller
                    //                               .selectedCity,
                    //                           decoration: InputDecoration(
                    //                             hintText: "City",
                    //                             contentPadding:
                    //                                 EdgeInsets.symmetric(
                    //                                     horizontal: 20,
                    //                                     vertical: 5),
                    //                             border: InputBorder.none,
                    //                             enabledBorder: InputBorder.none,
                    //                             focusedBorder: InputBorder.none,
                    //                           ),
                    //                           style: TextStyle(
                    //                             fontSize: 16,
                    //                             color: MyColors.black,
                    //                           ),
                    //                           items: createAccountcontroller
                    //                               .cityListModel!.state!
                    //                               .map((state) {
                    //                             return DropdownMenuItem<
                    //                                 cityFile.State>(
                    //                               value: state,
                    //                               child: Text(state.cityName!),
                    //                             );
                    //                           }).toList(),
                    //                           onChanged:
                    //                               (cityFile.State? value) {
                    //                             createAccountcontroller
                    //                                 .updateCity(value!);
                    //                           },
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //           ],
                    //         ),

                  
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller:
                              salescreateAccountcontroller.passcodeController,
                          decoration: InputDecoration(
                            hintText: "Password",
                             hintStyle: TextStyle(
                                    color: MyColors.grey,
                                  ),
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
                        ),
                      ),
                    ),
                   
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                                    // createAccountpartnercontroller
                                    //     .getImageGallery(
                                    openCameraPopupProfile(
                                  context,
                                  
                                ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: Get.width * 0.40,
                              height: 80,
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
                              child: Center(
                                child:  Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Upload Profile",
                                              style: CustomTextStyle
                                                  .popinstextsmall124,
                                            ),
                                            salescreateAccountcontroller
                                                        .profileFilePath ==
                                                    ""
                                                ? Icon(
                                                    Icons.upload,
                                                    color: MyColors.white,
                                                    size: 25,
                                                  )
                                                : SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.file(
                                                        fit: BoxFit.fill,
                                                        salescreateAccountcontroller
                                                            .profileFile!),
                                                  ),
                                          ],
                                        ),
                                           ),
                            ),
                          ),
                        ),
                        GestureDetector(
                             onTap: () =>
                                    // createAccountpartnercontroller
                                    //     .getImageGallery(
                                    openCameraPopupLogo(
                                  context,
                                  // file: createAccountpartnercontroller.logoFile,
                                  // fileName: createAccountpartnercontroller
                                  //     .logoFileName,
                                  // filePath: createAccountpartnercontroller
                                  //     .logoFilePath,
                                ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 2, top: 10, bottom: 10),
                            child: Container(
                              height: 80,
                              width: Get.width * 0.40,
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
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Upload Document",
                                      style: CustomTextStyle.popinstextsmall124,
                                    ),
                                    Text(
                                      "Ex. GST, Adhar card...",
                                      style: CustomTextStyle.popinstextsmall124,
                                    ),
                                  salescreateAccountcontroller
                                                      .logoFilePath ==
                                                  ""
                                              ? Icon(
                                                  Icons.upload,
                                                  color: MyColors.white,
                                                  size: 25,
                                                )
                                              : SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.file(
                                                      fit: BoxFit.fill,
                                                      salescreateAccountcontroller
                                                          .logoFile!),
                                                ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   GestureDetector(
                      onTap: () async {
                          salescreateAccountcontroller
                                  .validateForm(context)
                                  .then((isValid) {
                                if (isValid) {
                                  print("Valid form");
                                  List<Map<String, String>> documentList = [];
                                  documentList.add({
                                    'value': salescreateAccountcontroller
                                        .profileFilePath,
                                    'key': 'upload_1'
                                  });
                                  documentList.add({
                                    'value': salescreateAccountcontroller
                                        .logoFilePath,
                                    'key': 'upload_2'
                                  });

                                  Map<String, String> body = {
                                  
                                 
                                    "f_name": salescreateAccountcontroller
                                        .fullNameController.text
                                        .trim()
                                        .toString(),
                                    "l_name": salescreateAccountcontroller
                                        .lastNameController.text
                                        .trim()
                                        .toString(),
                                          'email':  salescreateAccountcontroller
                                        .emailController.text
                                        .trim()
                                        .toString(),
                                    "phone": salescreateAccountcontroller
                                        .phonenumberController.text
                                        .trim()
                                        .toString(),
                                        "identity_number": salescreateAccountcontroller
                                        .identitynumberController.text
                                        .trim()
                                        .toString(),
                                  
                                    "identity_type":salescreateAccountcontroller
                                        .identitytypeController.text
                                        .trim()
                                        .toString(),
                                      "zone_id": salescreateAccountcontroller.selectedZone!.id.toString(),
                                    "earning":
                                      (  (salescreateAccountcontroller
                                            .dropdowntype.toString() == "seller") ? 1 : 0).toString(),
                                    
                                   
                                    // "dob": createAccountpartnercontroller
                                    //     .dobController.text
                                    //     .trim()
                                    //     .toString(),
                                    "password":   salescreateAccountcontroller.passcodeController.text
                                        .trim()
                                        .toString(),

                                       
                                        // "upload_1": createAccountcontroller
                                        //                     .profileFile!,
                                        // "upload_2":createAccountcontroller
                                        //                   .logoFile!
                                    
                                  };
                                  // documentList.forEach((element) async {
                                  //   print(element["key"]! +
                                  //       "  >   " +
                                  //       element["value"]!);
                                  // });
                                  try {
                                    print(body);
                                    salescreateAccountcontroller.postWholeData(
                                        documentList,
                                        body,
                                        Constants.SALESMAN_REGISTER);
                                    Get.back();
                                    Get.snackbar(
                                      'Success',
                                      'Registered Succesfully',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  } catch (e) {
                                    Get.snackbar(
                                      'Error',
                                      'An error occurred: $e',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }

                                  // Code to execute when the form is valid
                                  // Add your logic here
                                } else {
                                  print("InValid form");
                                  // Code to execute when the form is not valid
                                  // Add your logic here
                                }
                              });
                            },
                            child: salescreateAccountcontroller.isLoading
                                ? Center(child: CircularProgressIndicator())
                                :Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MyColors.yellow,
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

              //  InkWell(onTap: ()   {

              //  },
              //    child: Container(
              //      height: MediaQuery.of(context).size.height*0.07,
              //      width: MediaQuery.of(context).size.width*0.8,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(30),

              //                   gradient: LinearGradient(
              //                    begin: Alignment.centerLeft,
              //            end: Alignment.centerRight,
              //            colors:
              //                       [

              //                     ],)
              //                 ),

              //                 child: Center(child:  Text('Create Account',style: TextStyle(color:MyColors.white,fontSize: 16,fontFamily: "SF-Pro-Display",fontWeight: FontWeight.w500),)),

              //         ),
              //  ),

              ,
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              //  InkWell(onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              // },child: Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Login",style: TextStyle(fontSize: 14,fontFamily:  "SF-Pro-Display",color: black),),SizedBox(width: 5,),
              //     Icon(Icons.arrow_forward_outlined,color: black,size: 18,)
              //   ],
              // )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ));
  
  
  }

// void validateForm(BuildContext context) {
//     if (formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Form is valid')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Form is Invalid')),
//       );
//     }
//   }
}
