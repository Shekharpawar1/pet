import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addresscontroller.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class UserAddress extends StatelessWidget {
   UserAddress({super.key});

AddressController addressController = Get.put( AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                       appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,top: 15,bottom: 15),
              child: Icon(Icons.arrow_back_ios_new_outlined,color:MyColors.black)
            ),
          ),
          title: Center(
              child:Text("Address",style:  CustomTextStyle.appbartext,)
          ),
          actions: [
            InkWell(
              onTap: (){
 Get.to (NotificationUser());
},
              child: SvgPicture.asset("assets/image/notification.svg")),
    
            SizedBox(width: 20),
            Padding(
              padding:  EdgeInsets.only(right:20.0),
              child: SvgPicture.asset("assets/image/bag.svg"),
            ),
           
          ],
        ),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(shrinkWrap: true,primary: true,
        children: [
         Form(
                  key: addressController.formKey,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
      Padding(
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("First Name",style:  CustomTextStyle.popinstext,),
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
                          ), child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            controller:
                                addressController.fullNameController,
                            decoration: InputDecoration(
                              hintText: "Dev",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Last Name",style:  CustomTextStyle.popinstext,),
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
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            controller:
                                addressController.lastNameController,
                            decoration: InputDecoration(
                              hintText: "Soni",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Mobile Number",style:  CustomTextStyle.popinstext,),
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
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your number';
                              }
                              return null;
                            },
                            controller:
                                addressController.lastNameController,
                            decoration: InputDecoration(
                              hintText: "9089789878",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Flat,House no.,Building,Company,Apartment",style:  CustomTextStyle.popinstext,),
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
                          ), child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                            controller:
                                addressController.fullNameController,
                            decoration: InputDecoration(
                              hintText: "N7/19-R-2-A-A-98,Vivek niwas",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Area, Street,Sector,Village",style:  CustomTextStyle.popinstext,),
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
                          ), child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                            controller:
                                addressController.fullNameController,
                            decoration: InputDecoration(
                              hintText: "Ind Road",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Landmark",style:  CustomTextStyle.popinstext,),
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
                          ), child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                            controller:
                                addressController.fullNameController,
                            decoration: InputDecoration(
                              hintText: "Behind hydel sub power station",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Pincode",style:  CustomTextStyle.popinstext,),
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
                                return 'Please pincode';
                              }
                              return null;
                            },
                            controller: addressController
                                .pincodeController,
                            decoration: InputDecoration(
                              hintText: "78980",
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("State",style:  CustomTextStyle.popinstext,),
      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade200,
                          ),child: DropdownButtonFormField<String>(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a state';
                              }
                              return null;
                            },
                            value: addressController
                                .dropdownstate, // Set the selected country value
                            decoration: InputDecoration(
                              hintText: "State",
                              hintStyle: TextStyle(
                                color: MyColors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // iconColor: MyColors.black,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: MyColors.black,
                            ),
                            style: TextStyle(fontSize: 16, color: MyColors.black),
                            items: addressController.stateDropDownList
                                .map((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              addressController.updateSate(value ?? "");
                              // Perform actions when country is changed
                            },
                          ),
                        ),
                      ),
       Padding(
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("City",style:  CustomTextStyle.popinstext,),
      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade200,
                          ), child: DropdownButtonFormField<String>(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a city';
                              }
                              return null;
                            },
                            value: addressController
                                .dropdowncity, // Set the selected country value
                            decoration: InputDecoration(
                              hintText: "City",
                              hintStyle: TextStyle(
                                color: MyColors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // iconColor: MyColors.black,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: MyColors.black,
                            ),
                            style: TextStyle(fontSize: 16, color: MyColors.black),
                            items: addressController
                                .cityDropDownList
                                .map((String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              addressController
                                  .updatecity(value ?? "");
                              // Perform actions when country is changed
                            },
                          ),
                        ),
                      ),
      
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
                      //                   hintStyle: TextStyle(color: MyColors.black,),
                      //                 contentPadding: EdgeInsets.symmetric(
                      //                     horizontal: 20, vertical: 10),
                      //                 border: InputBorder.none,
                      //                 enabledBorder: InputBorder.none,
                      //                 focusedBorder: InputBorder.none,
                      //               ),
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //                 color:MyColors.black
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
                      //                       color: MyColors.black,
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
      

      SizedBox(height:10),
       GestureDetector(
                        onTap: () {
                          // createAccountcontroller.validateForm(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColors.yellow,
                            ),
                            child: Center(
                              child: Text(
                                "Save Changes",
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
             SizedBox(height:10),     
                  
                    ],
                  ),
                )
      
      
        ],),
      )
    );
  }
}