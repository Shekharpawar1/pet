import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/partnerprofile_controller.dart';
import 'package:pet/controllers/user_controller/profile_controller.dart';
import 'package:pet/screens/partner/widget/wholeAppBar.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/userMyPet.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class PartnerProfile extends StatefulWidget {
  const PartnerProfile({super.key});

  @override
  State<PartnerProfile> createState() => _PartnerProfileState();
}
PartnerProfileController profilecontroller = Get.put(PartnerProfileController());
class _PartnerProfileState extends State<PartnerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBarPartnerback(title:"Profile"),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
         GetBuilder<PartnerProfileController>(
              init: profilecontroller,
              builder: (_) {
                 return 
              
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        //  ListView(shrinkWrap: true,primary: true,
        // children: [
         Form(
                  key: profilecontroller.formKey,
                  child: ListView(
                  shrinkWrap: true,primary: false,
                    children: [

                       Center(
                child: Stack(
              alignment: Alignment.topCenter,
                  children:[
                      Padding(
                    padding: EdgeInsets.only(bottom: 20),
                 child:CircleAvatar(
                  radius:60,
                  backgroundColor: Colors.transparent,
                    child:
                  profilecontroller.  profileImage != null
                                ? CachedNetworkImage(
                                    imageUrl:
                                         "${Constants.BASE_URL}${Constants.API_V1_PATH}" +
                                            profilecontroller.profileImage.toString(),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            color: Colors.grey.shade700,
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                    //  Image.asset("assets/image/boyprofile3.png"),
                  :
                    profilecontroller.selectedImage != null
                                    ? Image.file(profilecontroller.selectedImage!)
                                    : Image.asset(
                                        "assets/image/boyprofile3.png"),
                  
                  ),
                      ),
                        
                  Positioned(
                   
                    bottom: 0,
                    child: GestureDetector(
                            onTap: profilecontroller.pickImage,
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
                                profilecontroller.fullNameController,
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
                                profilecontroller.lastNameController,
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
                                profilecontroller.emailController,
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
                                profilecontroller.mobileNumberController,
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
       
      //  Padding(
      //   padding: const EdgeInsets.only(left:15.0,),
      //   child:   Text("Shop Name",style:  CustomTextStyle.popinstext,),
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
      //                           return 'Please enter your name';
      //                         }
      //                         return null;
      //                       },
      //                       controller:
      //                           profilecontroller.shopNameController,
      //                       decoration: InputDecoration(
      //                         hintText: "Shop Name",
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
      //                           profilecontroller.addressController,
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
      //                       controller: profilecontroller
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

                   await profilecontroller.partnerupdateProfile();
        
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
