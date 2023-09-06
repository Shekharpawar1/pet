import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/profilewhole_controller.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class WholeSalerProfile extends StatefulWidget {
  const WholeSalerProfile({super.key});

  @override
  State<WholeSalerProfile> createState() => _WholeSalerProfileState();
}
WholeProfileController wholeprofilecontroller = Get.put(WholeProfileController());
class _WholeSalerProfileState extends State<WholeSalerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
          child: Image.asset(
            "assets/image/menu2.png",
          ),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
          "Profile",
          style: CustomTextStyle.appbartext,
        )),
        actions: [
          InkWell(
              onTap: () {
                Get.to(NotificationUser());
              },
              child: SvgPicture.asset("assets/image/notification.svg")),
          // Image.asset("assets/image/cartimg.png"),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/image/bag.svg"),
          ),
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
         GetBuilder<WholeProfileController>(
              init: wholeprofilecontroller,
              builder: (_) {
                 return 
              
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        //  ListView(shrinkWrap: true,primary: true,
        // children: [
         Form(
                  key: wholeprofilecontroller.formKey,
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
                  wholeprofilecontroller.profileImage != null
                                ? CachedNetworkImage(
                                    imageUrl:
                                         "${Constants.BASE_URL}${Constants.API_V1_PATH}" +
                                            wholeprofilecontroller.profileImage.toString(),
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
                    wholeprofilecontroller.selectedImage != null
                                    ? Image.file(wholeprofilecontroller.selectedImage!)
                                    : Image.asset(
                                        "assets/image/boyprofile3.png"),
                  
                  ),
                      ),
                        
                  Positioned(
                   
                    bottom: 0,
                    child: GestureDetector(
                            onTap: wholeprofilecontroller.pickImage,
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
                                wholeprofilecontroller.fullNameController,
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
                                wholeprofilecontroller.lastNameController,
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
                                wholeprofilecontroller.emailController,
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
                                wholeprofilecontroller.numberController,
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
       
      Padding(
        padding: const EdgeInsets.only(left:15.0,),
        child:   Text("Address",style:  CustomTextStyle.popinstext,),
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
                                wholeprofilecontroller.addressController,
                            decoration: InputDecoration(
                              hintText: "Mumbai",
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
                            controller: wholeprofilecontroller
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
      
     
      
 SizedBox(height:10),
       GestureDetector(
                        onTap: () async {
//                       profilecontroller. updatepofile1(profilecontroller.fullNameController.text,
//                     profilecontroller.lastNameController.text,
//                     profilecontroller.emailController.text,
//                      profilecontroller.numberController.text,
//                     profilecontroller.selectedImagePath.toString()
// );
                   await wholeprofilecontroller.updateProfile();
                   

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