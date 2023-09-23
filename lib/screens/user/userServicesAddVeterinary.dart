import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/userServicesAddVeterinaryController.dart';
import 'package:pet/controllers/user_controller/service_controller.dart';
import 'package:pet/controllers/user_controller/userServicesAddVeterinaryController.dart';
import 'package:pet/models/TimeslotModel.dart';
import 'package:pet/others/calender.dart';
import 'package:pet/screens/Mypetdetails.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:pet/models/cityModel.dart' as cityFile;
// class UserServicesAddAppointment extends StatefulWidget {
//   const UserServicesAddAppointment({super.key});

//   @override
//   State<UserServicesAddAppointment> createState() =>
//       _UserServicesAddVeterinary();
// }

class UserServicesAddVeterinary extends StatelessWidget {
  UserServicesAddVeterinary({super.key});
  UserServicesAddVeterinaryController userServicesAddVeterinaryController =
      Get.put(UserServicesAddVeterinaryController());
  var selectedDate;

  @override
  void onClose() {
    userServicesAddVeterinaryController.clearFields();
    // super.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: Center(
            child: Text(
          "Services",
          style: CustomTextStyle.appbartext,
        )),
        // actions: [
        //   InkWell(
        //       onTap: () {
        //         Get.to(const NotificationUser());
        //       },
        //       child: SvgPicture.asset("assets/image/notification.svg")),
        //   SizedBox(width: 20),
        //   Padding(
        //     padding: EdgeInsets.only(right: 20.0),
        //     child: SvgPicture.asset("assets/image/bag.svg"),
        //   ),
        // ],
      ),
      body: Stack(
        children: [
          GetBuilder<UserServicesAddVeterinaryController>(
              init: userServicesAddVeterinaryController,
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                      shrinkWrap: true,
                      primary: true,
                      scrollDirection: Axis.vertical,

                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                        // Image.asset("assets/image/service1.png"),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),

                        Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black26, width: 0.3),
                                borderRadius: BorderRadius.circular(25),
                                color: MyColors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 15),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/image/doctorgirl.png"),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cameron Williamson",
                                            style: CustomTextStyle.popinsbold,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/image/footprint.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Pharmacology",
                                                style: CustomTextStyle
                                                    .popinssmall0,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "Pharmacology",
                                            style: CustomTextStyle.popinssmall0,
                                          ),
                                          SizedBox(
                                            height: 5,
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
                                                  "assets/image/whitestar.svg"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height * 0.03,
                                  // ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     UserServicesAddVeterinaryController
                                  //         userServicesAddVeterinaryController =
                                  //         Get.put(UserServicesAddVeterinaryController());
                                  //     userServicesAddVeterinaryController.clearFields();
                                  //     Get.to(UserServicesAddVeterinary());
                                  //   },
                                  //   child: Container(
                                  //     width: MediaQuery.of(context).size.width * 0.6,
                                  //     height: MediaQuery.of(context).size.height * 0.06,
                                  //     decoration: BoxDecoration(
                                  //         color: MyColors.yellow,
                                  //         borderRadius: BorderRadius.circular(15)),
                                  //     child: Center(
                                  //         child: Text(
                                  //       "Appointment",
                                  //       style: CustomTextStyle.mediumtextreem,
                                  //     )),
                                  //   ),
                                  // ),
                                ],
                              ),
                            )),

                        //       Container(
                        //         height: MediaQuery.of(context).size.height*0.3,
                        //  width: MediaQuery.of(context).size.height*0.5 ,

                        //       padding: EdgeInsets.all(12.0),
                        //       child: GridView.builder(
                        //         itemCount: 6,
                        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 4,
                        //             // mainAxisExtent: 5,
                        //             crossAxisSpacing: 15.0,
                        //             mainAxisSpacing: 10.0  ,
                        //             mainAxisExtent: 100
                        //         ),
                        //         itemBuilder: (BuildContext context, int index){
                        //           return  Column(
                        //             children: [
                        //               Container(
                        //                 height: 60,width:60,
                        //                 decoration:BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(15),
                        //                 border: Border.all(color: Colors.black26)
                        //               )
                        //                              ,),

                        //                              SizedBox(height: 3,),
                        //            Text("Brush")

                        //             ],
                        //           );
                        //         },
                        //       )),

                        // Text(
                        //   "Best prices Find your best pet Brush Services",
                        //   style: CustomTextStyle.popinstext,
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),
                        // Card(
                        //   elevation: 1.5,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(21.0),
                        //   ),
                        //   child: Container(
                        //       width: 335,
                        //       height: 193,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           border: Border.all(color: MyColors.grey),
                        //           color: Colors.white),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(15.0),
                        //         child: ListView(
                        //           children: [
                        //             Text(
                        //               "Date",
                        //               style: CustomTextStyle.popinstext,
                        //             ),
                        //             SizedBox(
                        //               height: MediaQuery.of(context).size.height * 0.05,
                        //             ),
                        //             // HorizontalWeekCalendar()
                        //           ],
                        //         ),
                        //       )),
                        // ),

                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),
                        // Card(
                        //   elevation: 1.5,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(21.0),
                        //   ),
                        //   child: Container(
                        //       width: 335,
                        //       height: 193,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           border: Border.all(color: MyColors.grey),
                        //           color: Colors.white),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(15.0),
                        //         child: ListView(
                        //           children: [
                        //             Text(
                        //               "Time",
                        //               style: CustomTextStyle.popinstext,
                        //             ),
                        //             SizedBox(
                        //               height: MediaQuery.of(context).size.height * 0.02,
                        //             ),
                        //             GetBuilder<UserServicesAddVeterinaryController>(
                        //                 init: userServicesAddVeterinaryController,
                        //                 builder: (_) {
                        //                   return Container(
                        //                       // height: 600,
                        //                       child: GridView.builder(
                        //                           primary: false,
                        //                           shrinkWrap: true,
                        //                           scrollDirection: Axis.vertical,
                        //                           physics: NeverScrollableScrollPhysics(),
                        //                           gridDelegate:
                        //                               SliverGridDelegateWithFixedCrossAxisCount(
                        //                                   crossAxisCount: 4,
                        //                                   //  childAspectRatio: 4 / 4,
                        //                                   crossAxisSpacing: 15,
                        //                                   mainAxisSpacing: 15,
                        //                                   mainAxisExtent: 30),
                        //                           itemCount:
                        //                               userServicesAddVeterinaryController
                        //                                   .timeSlots!.length,
                        //                           itemBuilder: (BuildContext ctx, index) {
                        //                             final TimeSlot timeSlot =
                        //                                 userServicesAddVeterinaryController
                        //                                     .timeSlots[index];
                        //                             //  var   item = userServicesAddVeterinaryController.
                        //                             //          timeSlots[index];
                        //                             return GestureDetector(
                        //                               onTap: () {
                        //                                 userServicesAddVeterinaryController
                        //                                     .selectTimeSlot(index);
                        //                               },
                        //                               child: Container(
                        //                                   width: 62,
                        //                                   height: 30,
                        //                                   decoration: BoxDecoration(
                        //                                       border: Border.all(
                        //                                           color: MyColors.grey),
                        //                                       borderRadius:
                        //                                           BorderRadius.circular(
                        //                                               16),
                        //                                       color: timeSlot.isSelected
                        //                                           ? MyColors.yellow
                        //                                           : MyColors.white),
                        //                                   child: Center(
                        //                                       child: Text(
                        //                                     timeSlot.time,
                        //                                     style: TextStyle(
                        //                                         color: timeSlot.isSelected
                        //                                             ? MyColors.white
                        //                                             : MyColors.black),
                        //                                   ))),
                        //                             );
                        //                           }));
                        //                 })
                        //           ],
                        //         ),
                        //       )),
                        // ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: MyColors.grey),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: userServicesAddVeterinaryController
                                  .nameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                // hintStyle: TextStyle(color: MyColors.white,),
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
                                border: Border.all(
                                    width: 0.5, color: MyColors.grey),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: userServicesAddVeterinaryController
                                  .emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                // hintStyle: TextStyle(color: MyColors.white,),
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

                        // Text(
                        //   "DOB",
                        //   style: CustomTextStyle.popinstext,
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.01,
                        // ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.black26, width: 0.5),
                                color: MyColors.white),
                            child: TextFormField(
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Date';
                                }
                                // Add more validation rules if needed
                                return null; // Return null for no validation errors
                              },
                              onTap: () {
                                userServicesAddVeterinaryController.selectDate(
                                    context); // Function to show date picker
                              },
                              controller: userServicesAddVeterinaryController
                                  .dobController,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
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
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SF-Pro-Display",
                                      fontSize: 14)),
                            ),
                          ),
                        ),

                        userServicesAddVeterinaryController
                                .demoPetsList.isNotEmpty
                            // userServicesAddVeterinaryController.petListModel !=
                            //             null &&
                            //         userServicesAddVeterinaryController
                            //                 .petListModel!.state !=
                            //             null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black26, width: 0.5),
                                      color: MyColors.white),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.black26,
                                        ),
                                        value:
                                            userServicesAddVeterinaryController
                                                .selectedPet,
                                        // .dropdownvalue, // Use directly from the controller
                                        items:
                                            userServicesAddVeterinaryController
                                                // .petListModel!.state!
                                                .demoPetsList
                                                // .map((petFile.State item) {
                                                .map((String item) {
                                          return DropdownMenuItem(
                                            // value: item.petName,
                                            value: item,
                                            child: Text(
                                              // item.petName!,
                                              item,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "SF-Pro-Display",
                                                fontSize: 14,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          userServicesAddVeterinaryController
                                              .updatePet(
                                                  newValue); // Update the value in the controller
                                        },
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            //   child: Container(
                            //     height: 50,
                            //     width: 335,
                            //     decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: 0.5, color: MyColors.grey),
                            //         borderRadius: BorderRadius.circular(16),
                            //         color: Colors.white),
                            //     child: DropdownButtonFormField<String>(
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return 'Please select a pet';
                            //         }
                            //         return null;
                            //       },
                            //       value: userServicesAddAppointmentController
                            //           .selectedPet, // S
                            //       decoration: InputDecoration(
                            //         hintText: "Select Pet",
                            //         contentPadding: EdgeInsets.symmetric(
                            //             horizontal: 20, vertical: 5),
                            //         border: InputBorder.none,
                            //         enabledBorder: InputBorder.none,
                            //         focusedBorder: InputBorder.none,
                            //       ),
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: MyColors.black,
                            //       ),
                            //       items: userServicesAddAppointmentController
                            //           .demoPetsList
                            //           .map((String pet) {
                            //         return DropdownMenuItem<String>(
                            //           value: pet,
                            //           child: Text(pet),
                            //         );
                            //       }).toList(),
                            //       onChanged: (String? value) {
                            //         userServicesAddAppointmentController
                            //             .updatePet(value ?? "");
                            //         // Perform actions when country is changed
                            //       },
                            //     ),
                            //   ),
                            // )
                            : InkWell(
                                onTap: () {
                                  // Get.to(MyPetDetails());
                                  print(userServicesAddVeterinaryController
                                      .petListModel!.data!);
                                },
                                child: Center(
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width*0.8,

                                    height: MediaQuery.of(context).size.height *
                                        0.08,

                                    decoration: BoxDecoration(
                                        color: MyColors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(25)),

                                    child: Center(
                                        child: Text(
                                      "Add Pet",
                                      style: CustomTextStyle.mediumtextreem,
                                    )),
                                  ),
                                ),
                              ),

                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),
                        //                 // :
                        //                 Expanded(
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
                        //                           value: selectedCity,
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
                        //                           items: v
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

                        // !createAccountcontroller.cityLoaded
                        //                           ? SizedBox()

                        userServicesAddVeterinaryController.stateListModel ==
                                null
                            // ? Center(
                            //     child: SpinKitCircle(
                            //       color:
                            //           Colors.white, // Color of the progress bar
                            //       size: 50.0, // Size of the progress bar
                            //     ),
                            //   )
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: MyColors.grey),
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
                                      borderRadius: BorderRadius.circular(40)),
                                  child:
                                      DropdownButtonFormField<statesFile.State>(
                                    validator: (value) {
                                      if (value == null ||
                                          value.stateName!.isEmpty) {
                                        return 'Please select a state';
                                      }
                                      return null;
                                    },
                                    value: userServicesAddVeterinaryController
                                        .selectedState,
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
                                      color: MyColors.black,
                                    ),
                                    items: userServicesAddVeterinaryController
                                        .stateListModel!.state!
                                        .map((state) {
                                      return DropdownMenuItem<statesFile.State>(
                                        value: state,
                                        child: Text(state.stateName!),
                                      );
                                    }).toList(),
                                    onChanged: (statesFile.State? value) async {
                                      await userServicesAddVeterinaryController
                                          .updateState(value!);
                                    },
                                  ),
                                ),
                              ),
                        userServicesAddVeterinaryController.cityListModel ==
                                null
                            ? SizedBox()
                            : Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: MyColors.grey),
                                        // color: Color.fromRGBO(255, 255, 255, 0.10),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     offset: const Offset(0.0, 0.0),
                                        //     color: Color.fromRGBO(255, 255, 255, 0.10),
                                        //     blurRadius: 0.0,
                                        //     spreadRadius: 0.0,
                                        //   ),
                                        // ],
                                        // borderRadius: BorderRadius.circular(16),

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
                                        DropdownButtonFormField<cityFile.State>(
                                      validator: (value) {
                                        if (value == null ||
                                            value.cityName!.isEmpty) {
                                          return 'Please select a city';
                                        }
                                        return null;
                                      },
                                      value: userServicesAddVeterinaryController
                                          .selectedCity,
                                      decoration: InputDecoration(
                                        hintText: "City",
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: MyColors.black,
                                      ),
                                      items: userServicesAddVeterinaryController
                                          .cityListModel!.state!
                                          .map((state) {
                                        return DropdownMenuItem<cityFile.State>(
                                          value: state,
                                          child: Text(state.cityName!),
                                        );
                                      }).toList(),
                                      onChanged: (cityFile.State? value) {
                                        userServicesAddVeterinaryController
                                            .updateCity(value!);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     height: 50,
                        //     width: 335,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(width: 0.5, color: MyColors.grey),
                        //         borderRadius: BorderRadius.circular(16),
                        //         color: Colors.white),
                        //     child: DropdownButtonFormField<String>(
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return 'Please select a city';
                        //         }
                        //         return null;
                        //       },
                        //       value:
                        //           userServicesAddVeterinaryController.selectedcity, // S
                        //       decoration: InputDecoration(
                        //         hintText: "City",
                        //         contentPadding:
                        //             EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        //         border: InputBorder.none,
                        //         enabledBorder: InputBorder.none,
                        //         focusedBorder: InputBorder.none,
                        //       ),
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //         color: MyColors.black,
                        //       ),
                        //       items: userServicesAddVeterinaryController.city
                        //           .map((String city) {
                        //         return DropdownMenuItem<String>(
                        //           value: city,
                        //           child: Text(city),
                        //         );
                        //       }).toList(),
                        //       onChanged: (String? value) {
                        //         userServicesAddVeterinaryController
                        //             .updateCity(value ?? "");
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
                                border: Border.all(
                                    width: 0.5, color: MyColors.grey),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: userServicesAddVeterinaryController
                                  .numberController,
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
                                // hintStyle: TextStyle(color: MyColors.white,),
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
                                border: Border.all(
                                    width: 0.5, color: MyColors.grey),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: userServicesAddVeterinaryController
                                  .addressController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Address",
                                // hintStyle: TextStyle(color: MyColors.white,),
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
                                border: Border.all(
                                    width: 0.5, color: MyColors.grey),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: userServicesAddVeterinaryController
                                  .petProblemController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pet problem';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter pet problem",
                                // hintStyle: TextStyle(color: MyColors.white,),
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

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            userServicesAddVeterinaryController.addVeterinary();

                            //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                          },
                          child: Center(
                            child: Container(
                              // width: MediaQuery.of(context).size.width*0.8,

                              height: MediaQuery.of(context).size.height * 0.08,

                              decoration: BoxDecoration(
                                  color: MyColors.yellow,
                                  borderRadius: BorderRadius.circular(25)),

                              child: Center(
                                  child: Text(
                                "Submit",
                                style: CustomTextStyle.mediumtextreem,
                              )),
                            ),
                          ),
                        ),
                      ]),
                );
              }),
          GetBuilder<UserServicesAddVeterinaryController>(
              init: userServicesAddVeterinaryController,
              builder: (_) {
                return userServicesAddVeterinaryController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      )
                    : SizedBox();
              }),
          // Progress bar
          GetBuilder<UserServicesAddVeterinaryController>(
              init: userServicesAddVeterinaryController,
              builder: (_) {
                return userServicesAddVeterinaryController.showLoading
                    ? Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : SizedBox();
              }),
        ],
      ),
    );
  }
}
