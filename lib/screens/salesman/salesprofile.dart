import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/salesprofile_controller.dart';
import 'package:pet/controllers/user_controller/profile_controller.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/userMyPet.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class salesProfile extends StatefulWidget {
  const salesProfile({super.key});

  @override
  State<salesProfile> createState() => _salesProfileState();
}
SalesProfileController salesprofilecontroller = Get.put(SalesProfileController());
class _salesProfileState extends State<salesProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CustomAppBarSalesWholeback(title: "My Profile",),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
         GetBuilder<SalesProfileController>(
              init: salesprofilecontroller,
              builder: (_) {
                 return 
              
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        //  ListView(shrinkWrap: true,primary: true,
        // children: [
         Form(
                  key: salesprofilecontroller.formKey,
                  child: ListView(
                  shrinkWrap: true,primary: false,
                    children: [

                       Center(
                child: Stack(
              alignment: Alignment.topCenter,
                  children:[
                      Padding(
                    padding: EdgeInsets.only(bottom: 20),
                 child:

                   CircleAvatar(
                                          radius: 60,
                                                                              backgroundColor: Colors.transparent,
                                                                              
                                          child: ClipOval(
                                                                              child: (
                                                salesprofilecontroller.selectedImage ==
                                                    null)
                                            ? CachedNetworkImage(
                                                        imageUrl:
                                                            "${Constants.SALESMAN_IMAGEPATH_URL}" +
                                                               salesprofilecontroller
                                                                    .salesprofilemodel!
                                                                    .data![0]
                                                                    .image
                                                                    .toString(),
                                                                    height: Get.height*0.15,
                                                                    width: Get.width*0.35,
                                                                    fit: BoxFit.cover,
                                                        // imageUrl:
                                                        //      "${Constants.BASE_URL}${Constants.API_V1_PATH}" +
                                                        //         wholeprofilecontroller.profileImage.toString(),
                                                        progressIndicatorBuilder: (context,
                                                                url,
                                                                downloadProgress) =>
                                                            CircularProgressIndicator(
                                                                color: Colors.grey
                                                                    .shade700,
                                                                value:
                                                                    downloadProgress
                                                                        .progress),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      )
                                                             
                                            : ( salesprofilecontroller
                                                                    .salesprofilemodel!
                                                            .data![0].image ==
                                                        null) &&
                                                    salesprofilecontroller
                                                            .selectedImage ==
                                                        null
                                                ? Image.asset(
                                                    "assets/image/boyprofile3.png")
                                                : salesprofilecontroller
                                                            .selectedImage !=
                                                        null
                                                    ? Image.file(salesprofilecontroller
                                                        .selectedImage!)
                                                    : CachedNetworkImage(
                                                        imageUrl:
                                                            "${Constants.SALESMAN_IMAGEPATH_URL}" +
                                                                salesprofilecontroller
                                                                    .salesprofilemodel!
                                                                    .data![0]
                                                                    .image
                                                                    .toString(),
                                                                    height: Get.height*0.15,
                                                                    width: Get.width*0.35,
                                                                    fit: BoxFit.cover,
                                                        // imageUrl:
                                                        //      "${Constants.BASE_URL}${Constants.API_V1_PATH}" +
                                                        //         wholeprofilecontroller.profileImage.toString(),
                                                        progressIndicatorBuilder: (context,
                                                                url,
                                                                downloadProgress) =>
                                                            CircularProgressIndicator(
                                                                color: Colors.grey
                                                                    .shade700,
                                                                value:
                                                                    downloadProgress
                                                                        .progress),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                                              //  Image.asset("assets/image/boyprofile3.png"),
                                                                            ),
                                        ),
                    // CircleAvatar(
                    //                       radius: 60,
                    //                                                           backgroundColor: Colors.transparent,
                                                                              
                    //                       child: ClipOval(
                    //                                                           child: (salesprofilecontroller
                    //                                     .salesprofilemodel ==
                    //                                 null &&
                    //                             salesprofilecontroller.selectedImage ==
                    //                                 null)
                    //                         ? Image.asset(
                    //                             "assets/image/boyprofile3.png")
                    //                         : (salesprofilecontroller.salesprofilemodel!
                    //                                         .data![0].image ==
                    //                                     null) &&
                    //                                 salesprofilecontroller
                    //                                         .selectedImage ==
                    //                                     null
                    //                             ? Image.asset(
                    //                                 "assets/image/boyprofile3.png")
                    //                             : salesprofilecontroller
                    //                                         .selectedImage !=
                    //                                     null
                    //                                 ? Image.file(salesprofilecontroller
                    //                                     .selectedImage!)
                    //                                 : CachedNetworkImage(
                    //                                     imageUrl:
                    //                                         "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                    //                                             salesprofilecontroller
                    //                                                 .salesprofilemodel!
                    //                                                 .data![0]
                    //                                                 .image
                    //                                                 .toString(),
                    //                                                 height: Get.height*0.15,
                    //                                                 width: Get.width*0.35,
                    //                                                 fit: BoxFit.cover,
                    //                                     // imageUrl:
                    //                                     //      "${Constants.BASE_URL}${Constants.API_V1_PATH}" +
                    //                                     //         salesprofilecontroller.profileImage.toString(),
                    //                                     progressIndicatorBuilder: (context,
                    //                                             url,
                    //                                             downloadProgress) =>
                    //                                         CircularProgressIndicator(
                    //                                             color: Colors.grey
                    //                                                 .shade700,
                    //                                             value:
                    //                                                 downloadProgress
                    //                                                     .progress),
                    //                                     errorWidget: (context,
                    //                                             url, error) =>
                    //                                         Icon(Icons.error),
                    //                                   ),
                    //                                                           //  Image.asset("assets/image/boyprofile3.png"),
                    //                                                         ),
                    //                     ),
                                     
                
                //  CircleAvatar(
                //   radius:60,
                //   backgroundColor: Colors.transparent,
                //     child:
                //   salesprofilecontroller.profileImage != null
                //                 ? CachedNetworkImage(
                //                     imageUrl:
                //                          "${Constants.SALESMAN_IMAGEPATH_URL}" +
                //                             salesprofilecontroller.profileImage.toString(),
                //                     progressIndicatorBuilder: (context, url,
                //                             downloadProgress) =>
                //                         CircularProgressIndicator(
                //                             color: Colors.grey.shade700,
                //                             value: downloadProgress.progress),
                //                     errorWidget: (context, url, error) =>
                //                         Icon(Icons.error),
                //                   )
                //     //  Image.asset("assets/image/boyprofile3.png"),
                //   :
                //     salesprofilecontroller.selectedImage != null
                //                     ? Image.file(salesprofilecontroller.selectedImage!)
                //                     : Image.asset(
                //                         "assets/image/boyprofile3.png"),
                  
                //   ),
                      
                      
                      ),
                        
                  Positioned(
                   
                    bottom: 0,
                    child: GestureDetector(
                            onTap: salesprofilecontroller.pickImage,
                 child:   Image.asset("assets/image/drawer2.png",height: 35,),)
                
                  ) 
                
                
                ]),
              ),
          
        SizedBox(height:MediaQuery.of(context).size.height*0.03,),
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
                                salesprofilecontroller.fullNameController,
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
                                salesprofilecontroller.lastNameController,
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
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Email",style:  CustomTextStyle.popinstext,),
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
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            controller:
                                salesprofilecontroller.emailController,
                                keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "email",
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
                           keyboardType: TextInputType.phone,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  maxLength: 10,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Phone Number";
                            } else if (!RegExp(
                                    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Phone Number";
                            }
                          },
                            controller:
                                salesprofilecontroller.numberController,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
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
       
      // Padding(
      //   padding: const EdgeInsets.only(left:15.0,),
      //   child:   Text("Address",style:  CustomTextStyle.popinstext,),
      // ),
      
      
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Container(
      //                     height: 50,
      //                     //                    width: 335,
      //                     // height: 45,
      //                    decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(50),
      //                       color: Colors.grey.shade200,
      //                     ), child: TextFormField(
      //                       validator: (value) {
      //                         if (value == null || value.isEmpty) {
      //                           return 'Please enter your address';
      //                         }
      //                         return null;
      //                       },
      //                       controller:
      //                           salesprofilecontroller.addressController,
      //                       decoration: InputDecoration(
      //                         hintText: "Mumbai",
      //                         hintStyle: TextStyle(
      //                           color: MyColors.black,
      //                         ),
      //                         contentPadding: EdgeInsets.symmetric(
      //                             horizontal: 20, vertical: 10),
      //                         border: InputBorder.none,
      //                         enabledBorder: InputBorder.none,
      //                         focusedBorder: InputBorder.none,
      //                       ),
      //                       style: TextStyle(
      //                         fontSize: 16,
      //                         color: MyColors.black,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
                  
      
                  
    
      //   Padding(
      //   padding: const EdgeInsets.only(left:15.0,),
      //   child:   Text("Pincode",style:  CustomTextStyle.popinstext,),
      // ),
      //                Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Container(
      //                     height: 50,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(50),
      //                       color: Colors.grey.shade200,
      //                     ),
      //                     child: TextFormField(
      //                       validator: (value) {
      //                         if (value == null || value.isEmpty) {
      //                           return 'Please pincode';
      //                         }
      //                         return null;
      //                       },
      //                       controller: salesprofilecontroller
      //                           .pincodeController,
      //                       decoration: InputDecoration(
      //                         hintText: "78980",
      //                          hintStyle: TextStyle(
      //                           color: MyColors.black,
      //                         ),
      //                         contentPadding: EdgeInsets.symmetric(
      //                             horizontal: 20, vertical: 10),
      //                         border: InputBorder.none,
      //                         enabledBorder: InputBorder.none,
      //                         focusedBorder: InputBorder.none,
      //                       ),
      //                       style: TextStyle(
      //                         fontSize: 16,
      //                         color: MyColors.black,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      
     
      
 SizedBox(height:10),
       GestureDetector(
                        onTap: () async {
//                       profilecontroller. updatepofile1(profilecontroller.fullNameController.text,
//                     profilecontroller.lastNameController.text,
//                     profilecontroller.emailController.text,
//                      profilecontroller.numberController.text,
//                     profilecontroller.selectedImagePath.toString()
// );
                   await salesprofilecontroller.salesUpdateProfile();
                   

// profilecontroller.validateForm(context);
// profilecontroller.clearFields();
//                           if(isSelected){
//   await addressController.addaddress();
//                           }else{
// addressController.updateaddaddress() ;
//                           }
//                         addressController.validateForm(context);

// addressController .clearFields();
                   
// Get.showSnackbar(SnackBar(content: content));


                        // print("===="+addressController.addaddress());
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
                                "Update",
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
      
     
      );
                        // });
              })
       
        ],
      ),
    );
  }
}
