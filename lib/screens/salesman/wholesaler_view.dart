import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/salesman_controller/addwholeseller_controller.dart';
import 'package:pet/controllers/salesman_controller/dashboard_controller.dart';
import 'package:pet/controllers/salesman_controller/myOrdersales_controller.dart';

import 'package:pet/controllers/salesman_controller/wholesaler_controller.dart';
import 'package:pet/models/salesmanModel/orderTrackerSalesModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/models/salesmanModel/zoneModel.dart' as zoneFile;
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/salesman/orderHistory.dart';
import 'package:pet/screens/salesman/salesmyOrderPage.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class SalesWholeSalerScreen extends StatelessWidget {
  SalesWholeSalerScreen({super.key});
  TextEditingController _searchcontroller = TextEditingController();
  SalesMyOrderController myordercontroller = Get.put(SalesMyOrderController());
  final SalesAddwholeControllers addwholesellerController =
      Get.put(SalesAddwholeControllers());
      final storage = GetStorage();
 DashBoardController dashBoardController = Get.put(DashBoardController());

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
                                      await addwholesellerController
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
                                      await addwholesellerController
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
                                      await addwholesellerController
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
                                      await addwholesellerController
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
       appBar:CustomAppBarSalesWholeback(title:"Total Wholesaller" ,)
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_left, color: MyColors.black)),
//         ),
//         title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child: Text(
//           "Total Wholeseller",
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         )),
//         actions: [
//           //  SvgPicture.asset("assets/image/girl.svg"),

//           // SizedBox(width: 20),
//           InkWell(
//             onTap: () {
//               Get.to(NotificationSales());
//             },
//             child: Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: SvgPicture.asset("assets/image/notification.svg"),
//               //  Image.asset("assets/image/girl.png"),
//             ),
//           ),
//         ],
//       ),
     
 ,    
      body:
      
      GetBuilder<SalesAddwholeControllers>(
          init: addwholesellerController,
          builder: (_) {
            return ListView(
              primary: true,
              shrinkWrap: true,
              children: [
              
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          addwholesellerController.wholeSalerView();
                        },
                        child: Container(
                          width: Get.width * 0.3,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: addwholesellerController.isAdding
                                ? Colors.white
                                : Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Wholesaler",
                              style: TextStyle(
                                color: addwholesellerController.isAdding
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          addwholesellerController.addWholeSaler();
                        },
                        child: Container(
                          width: Get.width * 0.6,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: addwholesellerController.isAdding
                                ? Colors.blue
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Add New Wholesaler",
                              style: TextStyle(
                                color: addwholesellerController.isAdding
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                addwholesellerController.isAdding
                    ?  Form(
                key: addwholesellerController.formKey,
                child:  addwholesellerController.showLoading? SizedBox():
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 50,
                        //                    width: 335,
                        // height: 45,
                          height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),
                               
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          controller:
                              addwholesellerController.fullNameController,
                          decoration: InputDecoration(
                            hintText: "First Name",
                            hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                           color: MyColors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        //                    width: 335,
                        // height: 45,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          controller:
                              addwholesellerController.lastNameController,
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                             color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: addwholesellerController.emailController,
                          decoration: InputDecoration(
                            hintText: "Email ID",
                            hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            // Add more validation rules if needed
                            return null; // Return null for no validation errors
                          },
                          onTap: () {
                            addwholesellerController.selectDate(
                                context); // Function to show date picker
                          },
                          controller: addwholesellerController.dobController,
                          style: TextStyle(
                              fontSize: 14,
                              color: MyColors.black,
                              fontFamily: "SF-Pro-Display"),
                          decoration: InputDecoration(

                              // contentPadding: EdgeInsets.only(left: 15),
                              fillColor: MyColors.white,
                              focusColor: MyColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,

                                // borderRadius: BorderRadius.circular(50),
                              ),
                              // contentPadding: EdgeInsets.all(10),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: "DD/MM/YYYY",
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: MyColors.black,
                              ),
                              hintStyle: TextStyle(
                               color: MyColors.black,
                                  fontFamily: "SF-Pro-Display",
                                  fontSize: 14)),
                        ),
                      ),
                    ), // Padding(

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          controller:
                              addwholesellerController.numberController,
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
                            counterText: '',
                            hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                             color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       color: Colors.grey.shade200,
                    //     ),
                    //     child: TextFormField(
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Please Designation';
                    //         }
                    //         return null;
                    //       },
                    //       controller: addwholesellerController
                    //           .designationController,
                    //       decoration: InputDecoration(
                    //         hintText: "Designation",
                    //         contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 20, vertical: 10),
                    //         border: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         focusedBorder: InputBorder.none,
                    //       ),
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),

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
                    //       value: addwholesellerController
                    //           .dropdowntype, // Set the selected country value
                    //       decoration: InputDecoration(
                    //         hintText: "WholeSeller Type",
                    //         hintStyle: TextStyle(
                    //           color: MyColors.white,
                    //         ),
                    //         contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 20, vertical: 5),
                    //         border: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         focusedBorder: InputBorder.none,
                    //         iconColor: MyColors.white,
                    //       ),
                    //       icon: Icon(
                    //         Icons.arrow_drop_down,
                    //         color: MyColors.white,
                    //       ),
                    //       style: TextStyle(fontSize: 16, color: MyColors.white),
                    //       items: addwholesellerController.typeDropDownList
                    //           .map((String country) {
                    //         return DropdownMenuItem<String>(
                    //           value: country,
                    //           child: Text(country),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? value) {
                    //         addwholesellerController.updatetype(value ?? "");
                    //         // Perform actions when country is changed
                    //       },
                    //     ),
                    //   ),
                    // ),

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
                    //           return 'Please select a type';
                    //         }
                    //         return null;
                    //       },
                    //       value: addwholesellerController
                    //           .dropdownzone, // Set the selected country value
                    //       decoration: InputDecoration(
                    //         hintText: "Zone",
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
                    //       items: addwholesellerController.zoneDropDownList
                    //           .map((String country) {
                    //         return DropdownMenuItem<String>(
                    //           value: country,
                    //           child: Text(country),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? value) {
                    //         addwholesellerController.updatezone(value ?? "");
                    //         // Perform actions when country is changed
                    //       },
                    //     ),
                    //   ),
                    // ),

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
                    //       value: addwholesellerController
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
                    //       items: addwholesellerController
                    //           .identityTypeDropDownList
                    //           .map((String type) {
                    //         return DropdownMenuItem<String>(
                    //           value: type,
                    //           child: Text(type,
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //               )),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? value) {
                    //         addwholesellerController
                    //             .updateidentitytype(value ?? "");
                    //         // Perform actions when country is changed
                    //       },
                    //     ),
                    //   ),
                    // ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Aadhar number';
                            }
                            return null;
                          },
                          controller: addwholesellerController.aadharController,
                          decoration: InputDecoration(
                            hintText: "Aadhar Number",
                            hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                           color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter GST number';
                            }
                            return null;
                          },
                          controller: addwholesellerController.gstController,
                          decoration: InputDecoration(
                            hintText: "GST Number",
                            hintStyle: TextStyle(
                               color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                          color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Business Name';
                            }
                            return null;
                          },
                          controller:
                              addwholesellerController.businessNameController,
                          decoration: InputDecoration(
                            hintText: "Business Name",
                            hintStyle: TextStyle(
                               color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter pincode';
                            }
                            return null;
                          },
                          controller: addwholesellerController.pincodeController,
                          decoration: InputDecoration(
                            hintText: "Pincode",
                             hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    ),

                 Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),
                                child: DropdownButtonFormField<zoneFile.Zone>(
                                  validator: (value) {
                                    if (value == null || value.name!.isEmpty) {
                                      return 'Please select a zone';
                                    }
                                    return null;
                                  },

                                  // onTap: (){
                                  //   addwholesellerController.clearzonefield();
                                  // },
                                  value: addwholesellerController
                                      .selectedZone, // Set the selected country value
                                  decoration: InputDecoration(
                                    hintText: "Zone",
                                    hintStyle: TextStyle(
                                      color: MyColors.black,
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
                                    color: MyColors.black,
                                  ),
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.black),
                                  items: addwholesellerController
                                      .zoneListModel!.data!
                                      .map((zoneFile.Zone? zone) {
                                    return DropdownMenuItem<zoneFile.Zone>(
                                      value: zone,
                                      child: Text(zone?.name ?? ""),
                                    );
                                  }).toList(),
                                  onChanged: (zoneFile.Zone? value) {
                                    addwholesellerController.updateZone(value!);
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
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ),                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller:
                              addwholesellerController.passcodeController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: MyColors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                           color: MyColors.black,
                          ),
                        ),
                      ),
                    ),
                 


//     GetBuilder<SalesAddwholeControllers>(
//                 init: addwholesellerController,
//                 // initState: (_) {},
//                 builder: (_) {
//                   return 
//                   addwholesellerController.stateListModel ==
//                           null
//                       // ? Center(
//                       //     child: SpinKitCircle(
//                       //       color:
//                       //           Colors.white, // Color of the progress bar
//                       //       size: 50.0, // Size of the progress bar
//                       //     ),
//                       //   )
//                       ?  Center(
//                                           child: SpinKitCircle(
//                                             color: Colors
//                                                 .grey, // Color of the progress bar
//                                             size:
//                                                 20.0, // Size of the progress bar
//                                           ),
//                                         )
//                       : 
//                       Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 50,
//                         decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   color: Colors.grey.shade200,
//                                 ),                        
//                             child: DropdownButtonFormField<statesFile.State>(
//                               validator: (value) {
//                                 if (value == null || value.stateName!.isEmpty) {
//                                   return 'Please select a state';
//                                 }
//                                 return null;
//                               },
// onTap: (){
//   addwholesellerController.clearcity();

// },
//                               value: addwholesellerController
//                                   .selectedState,
//                               decoration: InputDecoration(
//                                 hintText: "State",
//                                  hintStyle: TextStyle(
//                            color: MyColors.black,
//                             ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 5),
//                                 border: InputBorder.none,
//                                 enabledBorder: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                               ),
//                               style: TextStyle(
//                                 fontSize: 16,
//                                  color: MyColors.black,
//                               ),
//                               items: addwholesellerController
//                                   .stateListModel!.state!
//                                   .map((statesFile.State state) {
//                                 return DropdownMenuItem<statesFile.State>(
//                                   value: state,
//                                   child: Text(state.stateName!),
//                                 );
//                               }).toList(),
//                               onChanged: (statesFile.State? value) async {
//                                 await addwholesellerController
//                                     .updateState(value!);
//                               },
//                             ),
//                           ),
//                         );
//                 },
//               ),


                            GetBuilder<SalesAddwholeControllers>(
                              init: addwholesellerController,
                              // initState: (_) {},
                              builder: (_) {
                                return addwholesellerController
                                            .stateListModel ==
                                        null
                                    // ? Center(
                                    //     child: SpinKitCircle(
                                    //       color:
                                    //           Colors.white, // Color of the progress bar
                                    //       size: 50.0, // Size of the progress bar
                                    //     ),
                                    //   )
                                    ? Center(
                                        child: SpinKitCircle(
                                          color: Colors
                                              .grey, // Color of the progress bar
                                          size:
                                              20.0, // Size of the progress bar
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.grey.shade200,
                                          ),
                                          child: DropdownButtonFormField<
                                              statesFile.State>(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.stateName!.isEmpty) {
                                                return 'Please select a state';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              addwholesellerController
                                                  .clearcity();
                                            },
                                            value: addwholesellerController
                                                .selectedState,
                                            decoration: InputDecoration(
                                              hintText: "State",
                                              hintStyle: TextStyle(
                                                color: MyColors.black,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: MyColors.black,
                                            ),
                                            items: addwholesellerController
                                                .stateListModel!.state!
                                                .map((statesFile.State state) {
                                              return DropdownMenuItem<
                                                  statesFile.State>(
                                                value: state,
                                                child: Text(state.stateName!),
                                              );
                                            }).toList(),
                                            onChanged: (statesFile.State?
                                                value) async {
                                              await addwholesellerController
                                                  .updateState(value!);
                                            },
                                          ),
                                        ),
                                      );
                              },
                            ),

                            GetBuilder<SalesAddwholeControllers>(
                              init: addwholesellerController,
                              // initState: (_) {},
                              builder: (_) {
                                return addwholesellerController.showLoading
                                    ? Center(
                                        child: SpinKitCircle(
                                          color: Colors
                                              .black, // Color of the progress bar
                                          size:
                                              30.0, // Size of the progress bar
                                        ),
                                      )
                                    : addwholesellerController.citieslist ==
                                            null
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.grey.shade200,
                                              ),
                                              child: DropdownButtonFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value
                                                          .toString()
                                                          .isEmpty) {
                                                    return 'Please select a city';
                                                  }
                                                  return null;
                                                },
                                                value: addwholesellerController
                                                    .selectedCity,
                                                decoration: InputDecoration(
                                                  hintText: "City",
                                                  hintStyle: TextStyle(
                                                    color: MyColors.black,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: MyColors.black,
                                                ),
                                                items: addwholesellerController
                                                    .citieslist
                                                    .map((items) {
                                                  return DropdownMenuItem(
                                                    value: items["city_name"]
                                                        .toString(),
                                                    child: Text(
                                                        items["city_name"]
                                                            .toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  addwholesellerController
                                                      .updateCity(value!);
                                                },
                                              ),
                                            ),
                                          );
                              },
                            ),



//  addwholesellerController.cityListModel == null ?SizedBox():
//               GetBuilder<SalesAddwholeControllers>(
//                 init: addwholesellerController,
//                 // initState: (_) {},
//                 builder: (_) {
//                   return addwholesellerController.showLoading
//                       ? Center(
//                           child: SpinKitCircle(
//                             color: Colors.black, // Color of the progress bar
//                             size: 30.0, // Size of the progress bar
//                           ),
//                         )
//                       : addwholesellerController.cityListModel ==
//                               null && addwholesellerController.cityListModel!.state == "" && addwholesellerController.cityListModel!.state!.isEmpty
//                           ? SizedBox()
//                           : Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.grey.shade200,
//                           ),
//                               child:
//                                   DropdownButtonFormField<cityFile.State>(
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.cityName!.isEmpty) {
//                                     return 'Please select a city';
//                                   }
//                                   return null;
//                                 },
//                                 value: addwholesellerController
//                                     .selectedCity,
//                                 decoration: InputDecoration(
//                                   hintText: "City",
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   border: InputBorder.none,
//                                   enabledBorder: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                 ),
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: MyColors.black,
//                                 ),
//                                 items: addwholesellerController
//                                     .cityListModel!.state!
//                                     .map((state) {
//                                   return DropdownMenuItem<cityFile.State>(
//                                     value: state,
//                                     child: Text(state.cityName!),
//                                   );
//                                 }).toList(),
//                                 onChanged: (cityFile.State? value) async{
//                                   addwholesellerController
//                                       .updateCity(value!);
//                                 },
//                               ),
//                             ),
//                           );
//                 },
//               ),

//               GetBuilder<SalesAddwholeControllers>(
//                 init: addwholesellerController,
//                 // initState: (_) {},
//                 builder: (_) {
//                   return addwholesellerController.showLoading
//                       ? Center(
//                           child: SpinKitCircle(
//                             color: Colors.black, // Color of the progress bar
//                             size: 30.0, // Size of the progress bar
//                           ),
//                         )
//                       : addwholesellerController.cityListModel ==
//                               null
//                           ? SizedBox()
//                           : Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 50,
//                         decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   color: Colors.grey.shade200,
//                                 ),                        
//                               child:
//                                   DropdownButtonFormField<cityFile.State>(
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.cityName!.isEmpty) {
//                                     return 'Please select a city';
//                                   }
//                                   return null;
//                                 },
//                                onTap: (){
//   addwholesellerController.clearcity();

// },
//                                 value: addwholesellerController
//                                     .selectedCity,
//                                 decoration: InputDecoration(
//                                   hintText: "City",
//                                    hintStyle: TextStyle(
//                                color: MyColors.black,
//                             ),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   border: InputBorder.none,
//                                   enabledBorder: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                 ),
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: MyColors.black,
//                                 ),
//                                 items: addwholesellerController
//                                     .cityListModel!.state!
//                                     .map((state) {
//                                   return DropdownMenuItem<cityFile.State>(
//                                     value: state,
//                                     child: Text(state.cityName!),
//                                   );
//                                 }).toList(),
//                                 onChanged: (cityFile.State? value) {
//                                   addwholesellerController
//                                       .updateCity(value!);
//                                 },
//                               ),
//                             ),
//                           );
//                 },
//               ),


// addwholesellerController.zoneListModel ==
//                               null
//                           ? SizedBox(): 
//      GetBuilder<SalesAddwholeControllers>(
//                 init: addwholesellerController,
//                 // initState: (_) {},
//                 builder: (_) {
//                   return addwholesellerController.zoneListModel!.data ==
//                               ""
//                           ? SizedBox(): Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 50,
//                                          decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(50),
//                                       color: Colors.grey.shade200,
//                                     ),                 
//                                         child:
//                                             DropdownButtonFormField<zoneFile.Zone>(
//                                           //      onTap: (){
//                                           // },
//                                           validator: (value) {
//                                             if (value == null ||
//                                                 value.name!.isEmpty) {
//                                               return 'Please select a zone';
//                                             }
//                                             return null;
//                                           },
                                          
                                         
//                                           value: addwholesellerController
//                                               .selectedZone, // Set the selected country value
//                                           decoration: InputDecoration(
//                                             hintText: "Zone",
//                                             hintStyle: TextStyle(
//                                               color: MyColors.black,
//                                             ),
//                                             contentPadding: EdgeInsets.symmetric(
//                                                 horizontal: 20, vertical: 5),
//                                             border: InputBorder.none,
//                                             enabledBorder: InputBorder.none,
//                                             focusedBorder: InputBorder.none,
//                                             // iconColor: MyColors.white,
//                                           ),
//                                           icon: Icon(
//                                             Icons.arrow_drop_down,
//                                             color: MyColors.black,
//                                           ),
//                                           style: TextStyle(
//                                               fontSize: 16, color: MyColors.black),
//                                           items: addwholesellerController
//                                               .zoneListModel!.data!
//                                               .map((zoneFile.Zone? zone) {
                                                 
//                                             return DropdownMenuItem<zoneFile.Zone>(
//                                               value: zone,
//                                               child: Text(zone?.name??""),
//                                             );
//                                           }).toList(),
//                                           onChanged: (zoneFile.Zone? value) {
//                                             addwholesellerController
//                                                 .updateZone(value!);
//                                             // Perform actions when country is changed
//                                           },
//                                         ),
//                                       ),
//                                     );
//                                  }
//                                ),
         
         




// addwholesellerController.zoneListModel == null || addwholesellerController.zoneListModel!.data == null
//                               ?  Center(
//                                           child: SpinKitCircle(
//                                             color: Colors
//                                                 .grey, // Color of the progress bar
//                                             size:
//                                                 20.0, // Size of the progress bar
//                                           ),
//                                         )
//                               :
                          


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
                    //               controller: addwholesellerController
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

                    //         addwholesellerController.showLoading
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
                    //                         addwholesellerController.selectedState,
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
                    //                     items: addwholesellerController
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
                    //                       await addwholesellerController
                    //                           .updateState(value!);
                    //                     },
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(width: 8.0),
                    //             !addwholesellerController.cityLoaded
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
                    //                           value: addwholesellerController
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
                    //                           items: addwholesellerController
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
                    //                             addwholesellerController
                    //                                 .updateCity(value!);
                    //                           },
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //           ],
                    //         ),

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
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ), 
                              child: Center(
                                child:  Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Upload Profile",
                                              style: CustomTextStyle
                                                  .popinssmall0,
                                            ),
                                            addwholesellerController
                                                        .profileFilePath ==
                                                    ""
                                                ? Icon(
                                                    Icons.upload,
                                                  color: MyColors.black,
                                                    size: 25,
                                                  )
                                                : SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.file(
                                                        fit: BoxFit.fill,
                                                        addwholesellerController
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
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade200,
                                ), 
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Upload Document",
                                      style: CustomTextStyle.popinssmall0,
                                    ),
                                    Text(
                                      "Ex. GST, Adhar card...",
                                      style: CustomTextStyle.popinssmall0,
                                    ),
                                  addwholesellerController
                                                      .logoFilePath ==
                                                  ""
                                              ? Icon(
                                                  Icons.upload,
                                                   color: MyColors.black,
                                                  size: 25,
                                                )
                                              : SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.file(
                                                      fit: BoxFit.fill,
                                                      addwholesellerController
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
                      onTap: () {
                  //       print("bbbbbb");
                  //            List<Map<String, String>> documentList = [];
                  //                 documentList.add({
                  //                   'value': addwholesellerController
                  //                       .profileFilePath,
                  //                   'key': 'upload_1'
                  //                 });
                  //                 documentList.add({
                  //                   'value': addwholesellerController
                  //                       .logoFilePath,
                  //                   'key': 'upload_2'
                  //                 });

                  //         addwholesellerController
                  //                 .validateForm(context)
                        
                        
                        
                  //                 .then((isValid) {
                  //               if (isValid) {
                  //                 print("Valid form");
                             
                  //                 Map<String, String> body = {
                                  
                                 
                  //                   "f_name": addwholesellerController
                  //                       .fullNameController.text
                  //                       .trim()
                  //                       .toString(),
                  //                   "l_name": addwholesellerController
                  //                       .lastNameController.text
                  //                       .trim()
                  //                       .toString(),
                  //                  "dateofbirth": addwholesellerController
                  //                       .dobController.text
                  //                       .trim()
                  //                       .toString(),
                  //                   'email':  addwholesellerController
                  //                       .emailController.text
                  //                       .trim()
                  //                       .toString(),
                  //                   "phone": addwholesellerController
                  //                       .numberController.text
                  //                       .trim()
                  //                       .toString(),
                  //                   "state": addwholesellerController
                  //                       .selectedState!.stateName.toString(),
                  //                    "city": addwholesellerController
                  //                       .selectedCity!.cityName.toString(),
                  //                   "business_name":
                  //                       addwholesellerController
                  //                           .businessNameController.text
                  //                           .trim()
                  //                           .toString(),
                  //                    "aadhar_number":
                  //                       addwholesellerController
                  //                           .aadharController.text
                  //                           .trim()
                  //                           .toString(),
                  //                    "zone_id":addwholesellerController.selectedZone!.id.toString(),

                  //                    "gst_number":
                  //                       addwholesellerController
                  //                           .gstController.text
                  //                           .trim()
                  //                           .toString(),
                  //                    "pincode":
                  //                       addwholesellerController
                  //                           .pincodeController.text
                  //                           .trim()
                  //                           .toString(),
                                   
                  //                   "password":addwholesellerController.passcodeController.text
                  //                       .trim()
                  //                       .toString(),
                  //                     "role":1.toString(),
                  //  "seller_id": addwholesellerController.sellerId.toString(),
                                      
                  //                       // "upload_1": addwholesellerController
                  //                       //                     .profileFile!,
                  //                       // "upload_2":addwholesellerController
                  //                       //                   .logoFile!
                                    
                  //                 };
                  //                 // documentList.forEach((element) async {
                  //                 //   print(element["key"]! +
                  //                 //       "  >   " +
                  //                 //       element["value"]!);
                  //                 // });
                  //                 try {
                  //                   print(body);
                  //                   addwholesellerController.postWholeData(
                  //                       documentList,
                  //                       body,
                  //                       Constants.WHOLESALER_REGISTER);
                                         
                  //                   Get.back();
                  //                   Get.snackbar(
                  //                     'Success',
                  //                     'WholeSaller Succesfully Added',
                  //                     snackPosition: SnackPosition.BOTTOM,
                  //                     backgroundColor: Colors.green,
                  //                     colorText: Colors.white,
                  //                   );
                  //                 } catch (e) {
                  //                   Get.snackbar(
                  //                     'Error',
                  //                     'An error occurred: $e',
                  //                     snackPosition: SnackPosition.BOTTOM,
                  //                     backgroundColor: Colors.red,
                  //                     colorText: Colors.white,
                  //                   );
                  //                 }

                  //                 // Code to execute when the form is valid
                  //                 // Add your logic here
                  //               } else {
                  //                 print("InValid form");
                  //                 // Code to execute when the form is not valid
                  //                 // Add your logic here
                  //               }
                  //             });
                           

    List<Map<String, String>> documentList = [];
                                  documentList.add({
                                    'value': addwholesellerController
                                        .profileFilePath,
                                    'key': 'upload_1'
                                  });
                                  documentList.add({
                                    'value': addwholesellerController
                                        .logoFilePath,
                                    'key': 'upload_2'
                                  });
                              addwholesellerController
                                  .validateForm(context)
                                  .then((isValid) {
                                if (isValid) {
                                  print("Valid form");
                              

                                  Map<String, String> body = {
                                  
                                 
//                                     "f_name": addwholesellerController
//                                         .fullNameController.text
//                                         .trim()
//                                         .toString(),
//                                     "l_name": addwholesellerController
//                                         .lastNameController.text
//                                         .trim()
//                                         .toString(),
//                                     "phone": addwholesellerController
//                                         .numberController.text
//                                         .trim()
//                                         .toString(),
//                                         "dateofbirth": addwholesellerController
//                                         .dobController.text
//                                         .trim()
//                                         .toString(),
//                                     'email':  addwholesellerController
//                                         .emailController.text
//                                         .trim()
//                                         .toString(),
//                                     "state": addwholesellerController
//                                         .selectedState!.stateName.toString(),
//                                          "city": addwholesellerController
//                                         .selectedState!.stateName.toString(),
//                                     "business_name":
//                                         addwholesellerController
//                                             .businessNameController.text
//                                             .trim()
//                                             .toString(),
//                                      "aadhar_number":
//                                         addwholesellerController
//                                             .aadharController.text
//                                             .trim()
//                                             .toString(),
//                                      "gst_number":
//                                         addwholesellerController
//                                             .gstController.text
//                                             .trim()
//                                             .toString(),
//                                      "pincode":
//                                         addwholesellerController
//                                             .pincodeController.text
//                                             .trim()
//                                             .toString(),
//                                       "zone_id":1.toString(),
//                                     "password":addwholesellerController.passcodeController.text
//                                         .trim()
//                                         .toString(),
// "seller_id": 17.toString(),
//                                         "role":1.toString(),

  
                                      "f_name": addwholesellerController
                                        .fullNameController.text
                                        .trim()
                                        .toString(),
                                    "l_name": addwholesellerController
                                        .lastNameController.text
                                        .trim()
                                        .toString(),
                                    "phone": addwholesellerController
                                        .numberController.text
                                        .trim()
                                        .toString(),
                                        "dateofbirth": addwholesellerController
                                        .dobController.text
                                        .trim()
                                        .toString(),
                                    'email':  addwholesellerController
                                        .emailController.text
                                        .trim()
                                        .toString(),
                                    "state": addwholesellerController
                                        .selectedState!.stateName.toString(),
                                         "city": addwholesellerController
                                        .selectedState!.stateName.toString(),
                                    "business_name":
                                        addwholesellerController
                                            .businessNameController.text
                                            .trim()
                                            .toString(),
                                     "aadhar_number":
                                        addwholesellerController
                                            .aadharController.text
                                            .trim()
                                            .toString(),
                                     "gst_number":
                                        addwholesellerController
                                            .gstController.text
                                            .trim()
                                            .toString(),
                                     "pincode":
                                        addwholesellerController
                                            .pincodeController.text
                                            .trim()
                                            .toString(),
                                            "zone":addwholesellerController.selectedZone!.id.toString(),

                                    "password":addwholesellerController.passcodeController.text
                                        .trim()
                                        .toString(),
  "seller_id": addwholesellerController.sellerId.toString(),
                                        "role":1.toString(),
                                      
                                    
                                  };
                                  // documentList.forEach((element) async {
                                  //   print(element["key"]! +
                                  //       "  >   " +
                                  //       element["value"]!);
                                  // });
                                  try {
                                    print(documentList);
                                    print(body);
                                    print(Constants.WHOLESALER_REGISTER);
                                    addwholesellerController.postWholeData(
                                        documentList,
                                        body,
                                        Constants.WHOLESALER_REGISTER);
                                    // Get.back();
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
                            child: addwholesellerController.isLoading
                                ? Center(child: CircularProgressIndicator())
                                : Padding(
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
                    : 
                  
                    Column(children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Container(
                        //   height: 45,
                        //   width: 265,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.rectangle,
                        //     borderRadius: BorderRadius.circular(17),
                        
                        //     // border: Border.all(color:brandcolor ),
                        
                        //     color: MyColors.white,
                        //   ),
                        //   child: TextFormField(
                        //     controller: _searchcontroller,
                        //     style: TextStyle(
                        //       fontSize: 14,
                        //       color: MyColors.voliet,
                        //       fontFamily: "SF-Pro-Display",
                        //     ),
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(left: 15),
                        //         fillColor: MyColors.white,
                        //         focusColor: MyColors.white,
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide.none,
                        //           // borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide.none,
                        //           //  borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         border: OutlineInputBorder(
                        //           borderSide: BorderSide.none,
                        //           //  borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         hintText: "Search",
                        //         prefixIcon: Padding(
                        //           padding: const EdgeInsets.all(10.0),
                        //           child: Image.asset(
                        //             "assets/image/searchnormal.png",
                        //             width: 10,
                        //           ),
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Colors.grey,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w400)),
                        //   ),
                        //                   ),
                        
                        //                   //  SizedBox(width: 10,),
                        //                   Container(
                        //     width: 45,
                        //     height: 45,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //         color: Color(0xffffcc00)),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Image.asset(
                        //         "assets/image/filter3.png",
                        //       ),
                        //     ))
                        //                 ],
                        //               ),
                        // ),
SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height * 0.02,
                                    ),
                         
                    GetBuilder<DashBoardController>(
          init: dashBoardController,
          builder: (_) {
                        return  ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:dashBoardController.total1wholesellerModel
              !.data!.length,
                    itemBuilder: (context, index) {
                      var item = dashBoardController.
              total1wholesellerModel!.data![index];
                  
                     return  dashBoardController.
              total1wholesellerModel!.data == null
                          ? SizedBox()
                          : 
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                  
            
                                    InkWell(
                                      onTap: () {
                                        
//                                          print("iTem  ${item.id}");

// }
                                         storage.write('wholesalerId', item.id);
  print("IDDDD");
 print(storage.read('wholesalerId').toString());
                                        // Get.to(OrderDetailssales());
                                        
//  wholesalerid = total1wholesellerModel!.data!.map((e) => e.id);

                                      },
                                      child: Container(
                                          width: 335,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.3,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(28),
                                            gradient: LinearGradient(

                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFEEEEFF),
                                                Color.fromRGBO(238, 238, 255, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.end,
                                              //   children: [
                                              //     Align(
                                              //       alignment: Alignment.topRight,
                                              //       child: Container(
                                              //         //alignment: Alignment.topRight,
                                              //         height: MediaQuery.of(context)
                                              //                 .size
                                              //                 .height *
                                              //             0.05,
                                              //         width: MediaQuery.of(context)
                                              //                 .size
                                              //                 .width *
                                              //             0.3,
                                              //         decoration: BoxDecoration(
                                              //             color: MyColors.green1,
                                              //             borderRadius:
                                              //                 BorderRadius.only(
                                              //                     topRight: Radius
                                              //                         .circular(25),
                                              //                     bottomLeft: Radius
                                              //                         .circular(
                                              //                             20))),
                                              //         child: Center(
                                              //             child: Text(
                                              //           "Completed",
                                              //           style: CustomTextStyle
                                              //               .popinstextsmall12,
                                              //         )),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/image/logocanine.png",
                                                    height: 80,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "${item.fName.toString()} ${item.lName.toString()}",
                                                          style: CustomTextStyle
                                                              .popinsmedium,
                                                        ),
                                                        Text(
                                                          "${item.phone.toString()}",
                                                          style: CustomTextStyle
                                                              .popinstextsmall123,
                                                        ),
                                                   Text(
                                                          "${item.email.toString()}",
                                                          style: CustomTextStyle
                                                              .popinstextsmall123,
                                                        ),
                                                    Text(
                                                          "${item.businessName.toString()}",
                                                          style: CustomTextStyle
                                                              .popinstextsmall123,
                                                        ),
                                                        //  Text(
                                                        //   "${item.city.toString()} ${item.state.toString()}",
                                                        //   style: CustomTextStyle
                                                        //       .popinsmedium,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     SvgPicture.asset(
                                                        //         "assets/image/yellowstar.svg"),
                                                        //     SizedBox(
                                                        //       width: 5,
                                                        //     ),
                                                        //     SvgPicture.asset(
                                                        //         "assets/image/yellowstar.svg"),
                                                        //     SizedBox(
                                                        //       width: 5,
                                                        //     ),
                                                        //     SvgPicture.asset(
                                                        //         "assets/image/yellowstar.svg"),
                                                        //     SizedBox(
                                                        //       width: 5,
                                                        //     ),
                                                        //     SvgPicture.asset(
                                                        //         "assets/image/yellowstar.svg"),
                                                        //     SizedBox(
                                                        //       width: 5,
                                                        //     ),
                                                        //     SvgPicture.asset(
                                                        //         "assets/image/yellowstar.svg"),
                                                        //     SizedBox(
                                                        //       width: 5,
                                                        //     ),
                                                        //     Text("4.5")
                                                        //   ],
                                                        // ),
                                                        // SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        Text(
                                                       "${item.city}, ${item.state}",
                                                          style: CustomTextStyle
                                                              .popinssmall0,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){

        storage.write('wholesalerId', item.id);
  print("IDDDD");
 print(storage.read('wholesalerId').toString());
      print("IDItem ${item.id}");
                                                         Get.to(HomeSales(
                                                        wholeseller: item.id??0
                    
                                                         ));

                                                      },
                                                      child: Container(
                                                          width: 130,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      26.405324935913086),
                                                              color:MyColors.yellow
                                                                ),
                                                          child: Center(
                                                              child: Text(
                                                            "Add Product",
                                                            style: CustomTextStyle
                                                                .popinsbold,
                                                          ))),
                                                    ),
                                                    SizedBox(width: 20),
                                                    GestureDetector(
                                                      onTap: () async{
                                                          
      myordercontroller.fethUserId();
        await myordercontroller.init();
             print("IDItem ${item.id}");

                          storage.write('wholesalerId', item.id);
  print("IDDDD");
 print(storage.read('wholesalerId').toString());
                                                         Get.to(MyOrderSales(
                                                          wholesellerID: item.id??0,
                                                         ));
                                                         print(item.id??0);
                                                        //  Get.to(OrderHistorysales());
                                                      },
                                                      child: Container(
                                                          width: 130,
                                                          height: 40,
                                                         decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      26.405324935913086),
                                                              color:MyColors.yellow
                                                                ),
                                                          child: Center(
                                                              child: Text(
                                                            "Order",
                                                            style: CustomTextStyle
                                                                .popinsbold,
                                                          ))),
                                                    )
                                                   ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                   ],
                                ),
                              )
                  ;  },
                          );
                      }
                    )
              
                   
                    ],),
              ],
            );
          }),
    );
  }
}
