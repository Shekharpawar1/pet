import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/userServicesAddAppointmentController.dart';
import 'package:pet/controllers/user_controller/service_controller.dart';
import 'package:pet/models/TimeslotModel.dart';
import 'package:pet/models/usersModel/GetPetModel.dart' as petFile;
import 'package:pet/others/calender.dart';
import 'package:pet/screens/Mypetdetails.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;

// class UserServicesAddAppointment extends StatefulWidget {
//   const UserServicesAddAppointment({super.key});

//   @override
//   State<UserServicesAddAppointment> createState() =>
//       _UserServicesAddAppointmentState();
// }

class UserServicesAddAppointmentState extends StatelessWidget {
  UserServicesAddAppointmentState({super.key});
  UserServicesAddAppointmentController userServicesAddAppointmentController =
      Get.put(UserServicesAddAppointmentController());
  // var selectedDate;

  @override
  void onClose() {
    userServicesAddAppointmentController.clearFields();
    // super.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarback(),
      // AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
      //     child: GestureDetector(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: Icon(Icons.arrow_left, color: MyColors.black)),
      //   ),
      //   title: Center(
      //       child: Text(
      //     "Services",
      //     style: CustomTextStyle.appbartext,
      //   )),
      //   // actions: [
      //   //   InkWell(
      //   //       onTap: () {
      //   //         Get.to(const NotificationUser());
      //   //       },
      //   //       child: SvgPicture.asset("assets/image/notification.svg")),
      //   //   SizedBox(width: 20),
      //   //   Padding(
      //   //     padding: EdgeInsets.only(right: 20.0),
      //   //     child: SvgPicture.asset("assets/image/bag.svg"),
      //   //   ),
      //   // ],
      // ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
            shrinkWrap: false,
            primary: true,
            scrollDirection: Axis.vertical,

            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Image.asset("assets/image/service1.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

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

              Text(
                "Best prices Find your best pet Brush Services",
                style: CustomTextStyle.popinstext,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: Container(
                    width: 335,
                    height: 193,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: MyColors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        children: [
                          Text(
                            "Date",
                            style: CustomTextStyle.popinstext,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          HorizontalWeekCalendar()
//  GetBuilder<Service2Controller>(
//                       init: service2cntroller,
//                       builder: (_) {
//  return Container(
//                         // height: 600,
//                         child: GridView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 4,
//                                 //  childAspectRatio: 4 / 4,
//                                 crossAxisSpacing: 15,

//                   mainAxisSpacing: 15,
//                   mainAxisExtent: 30),
//                             itemCount:
//                                service2cntroller
//                                 .timeSlots!.length,
//                             itemBuilder: (BuildContext ctx, index) {
//                                final TimeSlot timeSlot = service2cntroller.timeSlots[index];
//                           //  var   item = service2cntroller.
//                           //          timeSlots[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                    service2cntroller.selectTimeSlot(index);

//                                 },
//                                 child: Container(
//                               width: 62,
//                               height: 30,
//                               decoration: BoxDecoration(
//                                 border:Border.all(color: MyColors.grey),
//                               borderRadius: BorderRadius.circular(16),
//                               color:timeSlot.isSelected?MyColors.yellow:MyColors.white),
//                               child: Center(child: Text( timeSlot.time,style: TextStyle(
//                                 color: timeSlot.isSelected?MyColors.white:MyColors.black
//                               ), ))
//                               ),
//                               );
//                             }
//                             ));
//     })
                        ],
                      ),
                    )),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: Container(
                    width: 335,
                    height: 193,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: MyColors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        children: [
                          Text(
                            "Time",
                            style: CustomTextStyle.popinstext,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          GetBuilder<UserServicesAddAppointmentController>(
                              init: userServicesAddAppointmentController,
                              builder: (_) {
                                return Container(
                                    // height: 600,
                                    child: GridView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                //  childAspectRatio: 4 / 4,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,
                                                mainAxisExtent: 30),
                                        itemCount:
                                            userServicesAddAppointmentController
                                                .timeSlots!.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          final TimeSlot timeSlot =
                                              userServicesAddAppointmentController
                                                  .timeSlots[index];
                                          //  var   item = userServicesAddAppointmentController.
                                          //          timeSlots[index];
                                          return GestureDetector(
                                            onTap: () {
                                              userServicesAddAppointmentController
                                                      .bookedServicesIndex
                                                      .contains(index)
                                                  ? null
                                                  : userServicesAddAppointmentController
                                                      .selectTimeSlot(index);
                                            },
                                            child: Container(
                                                width: 62,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: MyColors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: userServicesAddAppointmentController
                                                            .bookedServicesIndex
                                                            .contains(index)
                                                        ? Colors.grey.shade200
                                                        : timeSlot.isSelected
                                                            ? MyColors.yellow
                                                            : MyColors.white),
                                                child: Center(
                                                    child: Text(
                                                  timeSlot.time,
                                                  style: TextStyle(
                                                      color: timeSlot.isSelected
                                                          ? MyColors.white
                                                          : MyColors.black),
                                                ))),
                                          );
                                        }));
                              })
                        ],
                      ),
                    )),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GetBuilder<UserServicesAddAppointmentController>(
                init: userServicesAddAppointmentController,
                // initState: (_) {},
                builder: (_) {
                  return userServicesAddAppointmentController
                          .demoPetsList.isNotEmpty
                      // userServicesAddAppointmentController.petListModel !=
                      //             null &&
                      //         userServicesAddAppointmentController
                      //                 .petListModel!.state !=
                      //             null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
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
                                  value: userServicesAddAppointmentController
                                      .selectedPet,
                                  // .dropdownvalue, // Use directly from the controller
                                  items: userServicesAddAppointmentController
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
                                    userServicesAddAppointmentController.updatePet(
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
                            print(userServicesAddAppointmentController
                                .petListModel!.data!);
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
                                "Add Pet",
                                style: CustomTextStyle.mediumtextreem,
                              )),
                            ),
                          ),
                        );
                },
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
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       height: 50,
              //       width: 335,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 0.5, color: MyColors.grey),
              //           borderRadius: BorderRadius.circular(16),
              //           color: Colors.white),
              //       child: DropdownButtonFormField<String>(
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please select a city';
              //           }
              //           return null;
              //         },
              //         value: userServicesAddAppointmentController
              //             .selectedcity, // S
              //         decoration: InputDecoration(
              //           hintText: "City",
              //           contentPadding:
              //               EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //           border: InputBorder.none,
              //           enabledBorder: InputBorder.none,
              //           focusedBorder: InputBorder.none,
              //         ),
              //         style: TextStyle(
              //           fontSize: 16,
              //           color: MyColors.black,
              //         ),
              //         items: userServicesAddAppointmentController.city
              //             .map((String city) {
              //           return DropdownMenuItem<String>(
              //             value: city,
              //             child: Text(city),
              //           );
              //         }).toList(),
              //         onChanged: (String? value) {
              //           userServicesAddAppointmentController
              //               .updateCity(value ?? "");
              //           // Perform actions when country is changed
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              GetBuilder<UserServicesAddAppointmentController>(
                init: userServicesAddAppointmentController,
                // initState: (_) {},
                builder: (_) {
                  return userServicesAddAppointmentController.stateListModel ==
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
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonFormField<statesFile.State>(
                              validator: (value) {
                                if (value == null || value.stateName!.isEmpty) {
                                  return 'Please select a state';
                                }
                                return null;
                              },
                              value: userServicesAddAppointmentController
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
                              items: userServicesAddAppointmentController
                                  .stateListModel!.state!
                                  .map((state) {
                                return DropdownMenuItem<statesFile.State>(
                                  value: state,
                                  child: Text(state.stateName!),
                                );
                              }).toList(),
                              onChanged: (statesFile.State? value) async {
                                await userServicesAddAppointmentController
                                    .updateState(value!);
                              },
                            ),
                          ),
                        );
                },
              ),

              GetBuilder<UserServicesAddAppointmentController>(
                init: userServicesAddAppointmentController,
                // initState: (_) {},
                builder: (_) {
                  return userServicesAddAppointmentController.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.black, // Color of the progress bar
                            size: 30.0, // Size of the progress bar
                          ),
                        )
                      : userServicesAddAppointmentController.cityListModel ==
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                      DropdownButtonFormField<cityFile.State>(
                                    validator: (value) {
                                      if (value == null ||
                                          value.cityName!.isEmpty) {
                                        return 'Please select a city';
                                      }
                                      return null;
                                    },
                                    value: userServicesAddAppointmentController
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
                                    items: userServicesAddAppointmentController
                                        .cityListModel!.state!
                                        .map((state) {
                                      return DropdownMenuItem<cityFile.State>(
                                        value: state,
                                        child: Text(state.cityName!),
                                      );
                                    }).toList(),
                                    onChanged: (cityFile.State? value) {
                                      userServicesAddAppointmentController
                                          .updateCity(value!);
                                    },
                                  ),
                                ),
                              ),
                            );
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: MyColors.grey),
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
                    maxLength: 10,
                    // maxLengthEnforcement: MaxLengthEnforcement.none,
                    controller:
                        userServicesAddAppointmentController.numberController,
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
                      counterText: '',
                      hintText: "Mobile No",
                      // hintStyle: TextStyle(color: MyColors.white,),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              // userServicesAddAppointmentController.showLoading
              //     ?
              GetBuilder<UserServicesAddAppointmentController>(
                  init: userServicesAddAppointmentController,
                  builder: (_) {
                    return InkWell(
                      onTap: () {
                        userServicesAddAppointmentController.addService();
                        //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                      },
                      child: Center(
                        child: Container(
                          // width: MediaQuery.of(context).size.width*0.8,

                          height: MediaQuery.of(context).size.height * 0.08,

                          decoration: BoxDecoration(
                              color: MyColors.yellow,
                              borderRadius: BorderRadius.circular(25)),

                          child:
                              userServicesAddAppointmentController.showLoading
                                  ? Center(
                                      child: SpinKitCircle(
                                        color: Colors
                                            .black, // Color of the progress bar
                                        size: 30.0, // Size of the progress bar
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                      "Submit",
                                      style: CustomTextStyle.mediumtextreem,
                                    )),
                        ),
                      ),
                    );
                  })

              // : InkWell(
              //     onTap: () {
              //       userServicesAddAppointmentController.addService();
              //       //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
              //     },
              //     child: Center(
              //       child: Container(
              //         // width: MediaQuery.of(context).size.width*0.8,

              //         height: MediaQuery.of(context).size.height * 0.08,

              //         decoration: BoxDecoration(
              //             color: MyColors.yellow,
              //             borderRadius: BorderRadius.circular(25)),

              //         child: Center(
              //             child: Text(
              //           "Submit",
              //           style: CustomTextStyle.mediumtextreem,
              //         )),
              //       ),
              //     ),
              //   ),
            ]),
      ),
    );
  }
}
