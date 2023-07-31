import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:pet/controllers/salesman_controller/wholesaler_controller.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/salesman/orderHistory.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class WholeSalerScreen extends StatelessWidget {
  WholeSalerScreen({super.key});
  TextEditingController _searchcontroller = TextEditingController();
  final WholeSaleController wholeSalerController =
      Get.put(WholeSaleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
          "Total Wholeseller",
          style: TextStyle(
            fontSize: 16,
            color: MyColors.black,
            fontWeight: FontWeight.w700,
          ),
        )),
        actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),

          // SizedBox(width: 20),
          InkWell(
            onTap: () {
              Get.to(NotificationSales());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/image/notification.svg"),
              //  Image.asset("assets/image/girl.png"),
            ),
          ),
        ],
      ),
      body: GetBuilder<WholeSaleController>(
          init: wholeSalerController,
          builder: (_) {
            return ListView(
              primary: true,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          wholeSalerController.wholeSalerView();
                        },
                        child: Container(
                          width: Get.width * 0.3,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: wholeSalerController.isAdding
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
                                color: wholeSalerController.isAdding
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
                          wholeSalerController.addWholeSaler();
                        },
                        child: Container(
                          width: Get.width * 0.6,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: wholeSalerController.isAdding
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
                                color: wholeSalerController.isAdding
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
                wholeSalerController.isAdding
                    ? Form(
                        key: wholeSalerController.formKey,
                        child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: [
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
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  controller:
                                      wholeSalerController.fullNameController,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  print("Tapped...");
                                  wholeSalerController.selectDate(
                                      context); // Show date picker when container is tapped
                                  // final DateTime? picked = await showDatePicker(
                                  //   context: context,
                                  //   initialDate: DateTime.now(),
                                  //   firstDate: DateTime(1900),
                                  //   lastDate: DateTime.now(),
                                  // );
                                  // if (picked != null) {
                                  //   wholeSalerController.selectedDate = picked;
                                  //   wholeSalerController.dobController.text =
                                  //       DateFormat('yyyy-MM-dd').format(
                                  //           wholeSalerController.selectedDate!);
                                  //   // update();
                                  // }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter DOB';
                                      }
                                      return null;
                                    },
                                    controller:
                                        wholeSalerController.dobController,
                                    decoration: InputDecoration(
                                      hintText: "Date of Birth",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
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
                                      return 'Please enter emil';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller:
                                      wholeSalerController.emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email ID",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                                      return 'Please Designation';
                                    }
                                    return null;
                                  },
                                  controller: wholeSalerController
                                      .designationController,
                                  decoration: InputDecoration(
                                    hintText: "Designation",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a country';
                                    }
                                    return null;
                                  },
                                  value: wholeSalerController
                                      .selectedCountry, // Set the selected country value
                                  decoration: InputDecoration(
                                    hintText: "Country",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  items: wholeSalerController.countries
                                      .map((String country) {
                                    return DropdownMenuItem<String>(
                                      value: country,
                                      child: Text(country),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    wholeSalerController
                                        .updateCountry(value ?? "");
                                    // Perform actions when country is changed
                                  },
                                ),
                              ),
                            ),
                            wholeSalerController.showLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                :
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
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
                                        value:
                                            wholeSalerController.selectedState,
                                        decoration: InputDecoration(
                                          hintText: "State",
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        items: wholeSalerController
                                            .stateListModel!.state!
                                            .map((state) {
                                          return DropdownMenuItem<
                                              statesFile.State>(
                                            value: state,
                                            child: Text(state.stateName!),
                                          );
                                        }).toList(),
                                        onChanged:
                                            (statesFile.State? value) async {
                                          await wholeSalerController
                                              .updateState(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                !wholeSalerController.cityLoaded
                                    ? SizedBox()
                                    : Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.grey.shade200,
                                            ),
                                            child: DropdownButtonFormField<
                                                cityFile.State>(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.cityName!.isEmpty) {
                                                  return 'Please select a city';
                                                }
                                                return null;
                                              },
                                              value: wholeSalerController
                                                  .selectedCity,
                                              decoration: InputDecoration(
                                                hintText: "City",
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
                                                color: Colors.black,
                                              ),
                                              items: wholeSalerController
                                                  .cityListModel!.state!
                                                  .map((state) {
                                                return DropdownMenuItem<
                                                    cityFile.State>(
                                                  value: state,
                                                  child: Text(state.cityName!),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (cityFile.State? value) {
                                                wholeSalerController
                                                    .updateCity(value!);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
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
                                  controller:
                                      wholeSalerController.pincodeController,
                                  decoration: InputDecoration(
                                    hintText: "Pincode",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a currency';
                                    }
                                    return null;
                                  },
                                  value: wholeSalerController
                                      .selectedCurrency, // Set the selected country value
                                  decoration: InputDecoration(
                                    hintText: "Currency",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  items: wholeSalerController.currency
                                      .map((String currency) {
                                    return DropdownMenuItem<String>(
                                      value: currency,
                                      child: Text(currency),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    wholeSalerController
                                        .updateCurrency(value ?? "");
                                    // Perform actions when country is changed
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: Get.width * 0.45,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Upload"),
                                          Icon(Icons.upload),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: Get.width * 0.45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Upload"),
                                          Icon(Icons.upload),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),




                            GestureDetector(
                              onTap: () {
                                wholeSalerController.validateForm(context);
                               
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: MyColors.yellow,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Product",
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
                    : ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 265,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(17),

                      // border: Border.all(color:brandcolor ),

                      color: MyColors.white,
                    ),
                    child: TextFormField(
                      controller: _searchcontroller,
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.voliet,
                        fontFamily: "SF-Pro-Display",
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15),
                          fillColor: MyColors.white,
                          focusColor: MyColors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            //  borderRadius: BorderRadius.circular(50),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            //  borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Search",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/image/searchnormal.png",
                              width: 10,
                            ),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  //  SizedBox(width: 10,),
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffffcc00)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/image/filter3.png",
                        ),
                      ))
                ],
              ),
SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(OrderDetailssales());
                                  },
                                  child: Container(
                                      width: 335,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
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
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  //alignment: Alignment.topRight,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  decoration: BoxDecoration(
                                                      color: MyColors.green1,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Center(
                                                      child: Text(
                                                    "Completed",
                                                    style: CustomTextStyle
                                                        .popinstextsmall12,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/image/logocanine.png",
                                                height: 80,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nity Make",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("4.5")
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                                                    style: CustomTextStyle
                                                        .popinssmall0,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
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
                                                     Get.to(HomeSales());
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
                                                            .popinssmall1,
                                                      ))),
                                                ),
                                                SizedBox(width: 20),
                                                GestureDetector(
                                                  onTap: (){
                                                     Get.to(OrderHistorysales());
                                                  },
                                                  child: Container(
                                                      width: 130,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  26.405324935913086),
                                                          color: MyColors
                                                              .yellowlight),
                                                      child: Center(
                                                          child: Text(
                                                        "Order History",
                                                        style: CustomTextStyle
                                                            .popinssmall1,
                                                      ))),
                                                )
                                               ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(OrderDetailssales());
                                  },
                                  child: Container(
                                      width: 335,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
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
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  //alignment: Alignment.topRight,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  decoration: BoxDecoration(
                                                      color: MyColors.green1,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Center(
                                                      child: Text(
                                                    "Completed",
                                                    style: CustomTextStyle
                                                        .popinstextsmall12,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/image/logocanine.png",
                                                height: 80,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nity Make",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/image/yellowstar.svg"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("4.5")
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                                                    style: CustomTextStyle
                                                        .popinssmall0,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
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
                                                     Get.to(HomeSales());
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
                                                            .popinssmall1,
                                                      ))),
                                                ),
                                                SizedBox(width: 20),
                                                GestureDetector(
                                                  onTap: (){
                                                     Get.to(OrderHistorysales());
                                                  },
                                                  child: Container(
                                                      width: 130,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  26.405324935913086),
                                                          color: MyColors
                                                              .yellowlight),
                                                      child: Center(
                                                          child: Text(
                                                        "Order History",
                                                        style: CustomTextStyle
                                                            .popinssmall1,
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
                        ],
                      )
              ],
            );
          }),
    );
  }
}
