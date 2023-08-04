import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myPetController.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/Mypetdetails.dart';
import 'package:pet/screens/user/notification.dart';

class Mypet extends StatelessWidget {
  Mypet({super.key});
  UserMyPetController userMyPetController = Get.put(UserMyPetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.green,
        // leading: Padding(
        //   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
        //   child:   InkWell(onTap: (){
        //     Navigator.pop(context);
        //   },
        //     child: Icon(Icons.arrow_back_ios,color: black,size: 20,

        //     ),
        //   ),
        // ),

        actions: [
           

                  
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.white,),)),
 

 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: MyColors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
               SizedBox(width: 20),


          
          Stack(
            children: [
              InkWell(
                  onTap: () {
                       Get.to(AddToCardUser());
                 
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg", color: Colors.white,))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
    
        // ],
        //   InkWell(
        //       onTap: () {
        //         Get.to(NotificationUser());
        //       },
        //       child: SvgPicture.asset(
        //         "assets/image/notification.svg",
        //         color: MyColors.white,
        //       )),
        //   // Image.asset("assets/image/cartimg.png"),
        //   SizedBox(width: 20),
        //   Padding(
        //     padding: EdgeInsets.only(right: 20.0),
        //     child: SvgPicture.asset(
        //       "assets/image/bag.svg",
        //       color: MyColors.white,
        //     ),
        //   ),
        ],

        title: Text(
          "My Pet",
          style: CustomTextStyle.appbartextwhite,
        ),
      ),
      body: GetBuilder<UserMyPetController>(
          init: userMyPetController,
          // initState: (_) {},
          builder: (_) {
            return Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/image/frame.png",
                      fit: BoxFit.cover,
                    )),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Text(
                        "Uplode image",
                        style: CustomTextStyle.appbartextwhite,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Image.asset(
                        "assets/image/uploadimg.png",
                        height: 25,
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 160.0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20.0, right: 20, top: 10),
                          child: Form(
                            key: userMyPetController.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                                Text(
                                  "Avatar",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),

                                // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       children: [
                                //         SvgPicture.asset(
                                //             "assets/image/dogavatar.svg"),
                                //         SizedBox(
                                //           width: 15,
                                //         ),
                                //         SvgPicture.asset(
                                //             "assets/image/avatardogyellow.svg"),
                                //         // SizedBox(width: 15,),
                                //         //                       SvgPicture.asset("assets/image/avatardoggreen.svg"),
                                //       ]),
                                // ),

                                GetBuilder<UserMyPetController>(
                                  init: userMyPetController,
                                  // initState: (_) {},
                                  builder: (_) {
                                    return userMyPetController.isDog
                                        ? Image.asset(
                                            "assets/image/cutedog.png",
                                            height: 80,
                                          )
                                        : Image.asset(
                                            "assets/image/cutecat.png",
                                            height: 60,
                                          );
                                  },
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),

                                Text(
                                  "Pet Type",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                GetBuilder<UserMyPetController>(
                                  init: userMyPetController,
                                  builder: (_) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userMyPetController
                                                .changePetType('Dog');
                                            userMyPetController
                                                .isDogMaker(true);
                                            print(
                                                "values: ${userMyPetController.petType} ${userMyPetController.isDog}");
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: userMyPetController.isDog
                                                  ? MyColors.greenlight
                                                  : Colors.white,
                                              border: Border.all(
                                                color: userMyPetController.isDog
                                                    ? MyColors.greenlight
                                                    : Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  "Dog",
                                                  style: userMyPetController
                                                          .isDog
                                                      ? CustomTextStyle
                                                          .popinssmall
                                                      : TextStyle(
                                                          color: Colors.black26,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        InkWell(
                                          onTap: () {
                                            userMyPetController
                                                .changePetType('Cat');
                                            userMyPetController
                                                .isDogMaker(false);
                                            print(
                                                "values: ${userMyPetController.petType} ${userMyPetController.isDog}");
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: userMyPetController.isDog
                                                  ? Colors.white
                                                  : MyColors.greenlight,
                                              border: Border.all(
                                                color: userMyPetController.isDog
                                                    ? Colors.black26
                                                    : MyColors.greenlight,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  "Cat",
                                                  style: userMyPetController
                                                          .isDog
                                                      ? TextStyle(
                                                          color: Colors.black26,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )
                                                      : CustomTextStyle
                                                          .popinssmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                      ],
                                    );
                                  },
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  "Gender",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                GetBuilder<UserMyPetController>(
                                  init: userMyPetController,
                                  // initState: (_) {},
                                  builder: (_) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userMyPetController
                                                .changeGender("Female");
                                            userMyPetController
                                                .isMaleMaker(false);
                                            print(
                                                "values: ${userMyPetController.gender} ${userMyPetController.isMale}");
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      userMyPetController.isMale
                                                          ? Colors.black26
                                                          : MyColors.greenlight,
                                                ),
                                                color:
                                                    userMyPetController.isMale
                                                        ? Colors.white
                                                        : MyColors.greenlight,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text("Female",
                                                    style: userMyPetController
                                                            .isMale
                                                        ? TextStyle(
                                                            color:
                                                                Colors.black26,
                                                            fontWeight:
                                                                FontWeight.w500)
                                                        : CustomTextStyle
                                                            .popinssmall),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            userMyPetController
                                                .changeGender("Male");
                                            userMyPetController
                                                .isMaleMaker(true);
                                            print(
                                                "values: ${userMyPetController.gender} ${userMyPetController.isMale}");
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color:
                                                    userMyPetController.isMale
                                                        ? MyColors.greenlight
                                                        : Colors.white,
                                                border: Border.all(
                                                    color: userMyPetController
                                                            .isMale
                                                        ? MyColors.greenlight
                                                        : Colors.black26,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text("Male",
                                                    style:
                                                        userMyPetController
                                                                .isMale
                                                            ? CustomTextStyle
                                                                .popinssmall
                                                            : TextStyle(
                                                                color: Colors
                                                                    .black26,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  "Breed",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                Container(
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
                                            userMyPetController.dropdownvalue,
                                        items: userMyPetController.items
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  color: Colors.black26,
                                                  fontFamily: "SF-Pro-Display",
                                                  fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          // setState(() {
                                          //   dropdownvalue = newValue!;
                                          // });
                                          userMyPetController
                                              .setDropdownValue(newValue!);
                                        },
                                        // validator:
                                        //     _controller.dropdownValidator,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  "DOB",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
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
                                        return 'Please enter a value';
                                      }
                                      // Add more validation rules if needed
                                      return null; // Return null for no validation errors
                                    },
                                    onTap: () {
                                      userMyPetController.selectDate(
                                          context); // Function to show date picker
                                    },
                                    controller:
                                        userMyPetController.dobController,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black26,
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
                                          color: Colors.black26,
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontFamily: "SF-Pro-Display",
                                            fontSize: 14)),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  "Age",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 50,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: MyColors.greenlight,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: TextFormField(
                                              controller: userMyPetController
                                                  .yearController,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter a value';
                                                }
                                                // Add more validation rules if needed
                                                return null; // Return null for no validation errors
                                              },
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: "SF-Pro-Display",
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            8), // Add padding here
                                                border: InputBorder.none,

                                                hintText: 'Year',
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "SF-Pro-Display",
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Center(
                                      child: Container(
                                        height: 50,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black26,
                                              width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: TextFormField(
                                              controller: userMyPetController
                                                  .monthController,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter a value';
                                                }
                                                // Add more validation rules if needed
                                                return null; // Return null for no validation errors
                                              },
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black26,
                                                fontFamily: "SF-Pro-Display",
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            8), // Add padding here
                                                border: InputBorder.none,

                                                hintText: 'Month',
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "SF-Pro-Display",
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  "Pet Name",
                                  style: CustomTextStyle.popinstext,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black26, width: 0.5),
                                      color: MyColors.white),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      // Add more validation rules if needed
                                      return null; // Return null for no validation errors
                                    },
                                    controller:
                                        userMyPetController.petNameController,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black26,
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
                                        hintText: "Jumba",
                                        // suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.black26,),
                                        hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontFamily: "SF-Pro-Display",
                                            fontSize: 14)),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (userMyPetController
                                        .formKey.currentState!
                                        .validate()) {
                                      // print("Tapped");
                                      Get.snackbar(
                                        'Form Status',
                                        'Form is valid',
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        borderRadius: 8,
                                      );
                                      userMyPetController.clearFields();
                                      // Form is valid, do something here
                                      // Access the validated value using _textEditingController.text
                                    } else {
                                      Get.snackbar(
                                        'Form Status',
                                        'Form is invalid',
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        borderRadius: 8,
                                      );
                                    }

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MyPetDetails()));
                                  },
                                  child: Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
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

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            );
          }),
    );
  }
}
