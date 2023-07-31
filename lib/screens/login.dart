// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:pet/style/colors.dart';
// import 'package:pet/style/fontstyle.dart';
// import 'package:pet/view/user/home.dart';
// import 'package:pet/view/otp.dart';
// import 'package:swipeable_button_view/swipeable_button_view.dart';
// import 'package:page_transition/page_transition.dart';


  
// class Loginwhole extends StatefulWidget {
//   const Loginwhole({super.key});

//   @override
//   State<Loginwhole> createState() => _LoginwholeState();
// }

// class _LoginwholeState extends State<Loginwhole> {
//     TextEditingController _numbercontroller = TextEditingController();
//     bool isFinished = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//        backgroundColor: bgcolor,
//        resizeToAvoidBottomInset: true,

//        body: SingleChildScrollView(
//          child: Padding(
//            padding: const EdgeInsets.all(15.0),
//            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            
//             children: [
                
//             SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                
                
//             Column(
//               children: [
//                 Image.asset("assets/logo/logo.png"),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.03,),
           
//                 Text("Enter your mobile number We will send you OTP to verify ",style: CustomTextStyle.boldStyle,textAlign: TextAlign.center,),
//               ],
//             ),
               
//          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
       
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15,right: 15),
//                     child: Text("Mobile Number", style:CustomTextStyle.mediumtext ,),
//                   ),
//        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//         Padding(
//               padding: EdgeInsets.only(left: 18,right: 18),
//               child: Container(
//             //  width: 335,
// height: 50,
//                 decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.10), borderRadius: BorderRadius.circular(40),  boxShadow: [

    
//                     BoxShadow(
//                        offset: const Offset(0.0, 0.0),
//                       color:  Color.fromRGBO(255, 255, 255, 0.10), 
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ),
//                      ]),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IntlPhoneField(
//                     //  obscureText : false,
//                     controller:_numbercontroller ,
//                     cursorcolor:MyColors.white,
//                     showCountryFlag: false,
                    
//                     dropdownIconPosition :IconPosition.trailing,
//                     dropdownTextStyle: TextStyle(color:MyColors.white),
//                        showDropdownIcon: true,
//                        dropdownIcon: Icon(Icons.arrow_drop_down,color:MyColors.white,),
//                        style: TextStyle(color:MyColors.white),
//                     // flagsButtonPadding: EdgeInsets.only(left:10,right: 10,),
//                     decoration: InputDecoration(
//                       // labelText: 'Mobile Number',
//                     //  hiStyle: TextStyle(color:MyColors.white,fontSize: 12),
//                       counterText: '',
//                       contentPadding: EdgeInsets.only(left:10,right: 10,),
//                     suffixIcon: Image.asset("assets/image/call.png"),
                    
//                                         // fillcolor:MyColors.white,
//                                         focuscolor:MyColors.white,
//                                     //   counterText: '',
//                                  // contentPadding: EdgeInsets.all(10),
                                      
//                                         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none,
//                                           // borderRadius: BorderRadius.circular(50),
//                                         ),
//                                         // focusedBorder: OutlineInputBorder(
//                                         //   borderSide: BorderSide.none,
//                                         //   //  borderRadius: BorderRadius.circular(50),
//                                         // ),
//                                         border: OutlineInputBorder(
//                                           borderSide: BorderSide.none,
//                                           //  borderRadius: BorderRadius.circular(50),
//                                         ),
                
//                         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
//                                             // enabledBorder: OutlineInputBorder(
//                                             //   borderSide: BorderSide.none,
//                                             //   // borderRadius: BorderRadius.circular(50),
//                                             // ),
//                                             // focusedBorder: OutlineInputBorder(
//                                             //   borderSide: BorderSide.none,
//                                             //   //  borderRadius: BorderRadius.circular(50),
//                                             // ),
                       
//                                             // border: OutlineInputBorder(
//                                             //   borderSide: BorderSide.none,
//                                             //   //  borderRadius: BorderRadius.circular(50),
//                                             // ),
//                                             hintText:"Mobile Number",
//                                             hintStyle: TextStyle(color:MyColors.white,fontSize: 14),
                              
//                       // border: OutlineInputBorder(
                        
//                       //   borderSide: BorderSide(),
//                       // ),
//                     ),
//                     initialCountryCode: 'IN', // Set initial country code
//                     // onChanged: (PhoneNumber phoneNumber) {
//                     //   print(phoneNumber.completeNumber);
//                     // },
//                   ),
//                 ),
//               ),
          
//         ),
             
       
          
       
//          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
//        Padding(
//          padding: const EdgeInsets.all(15.0),
//          child: Container( 
         
//            child: SwipeableButtonView(
//                buttonText: 'Swipe to login',
//                buttontextstyle: TextStyle(letterSpacing: 2,color: voliet,fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "ReemKufi-Regular"),
//                // buttonColor: Colors.transparent,
//                // buttoncolor:MyColors.yellow,
               
//                buttonWidget: CircleAvatar(backgroundColor: bgcolor,radius: 30,child: Image.asset("assets/image/swipe.png")),
//                activeColor:yellow,
//                isFinished: isFinished,
//                onWaitingProcess: () {
//                Future.delayed(Duration(seconds: 2), () {
//                 setState(() {
//                     isFinished = true;
//                           });
//                         });
//                       },
//                onFinish: () async {
//               await Navigator.push(context,
//                             PageTransition(
//                                 type: PageTransitionType.fade,
//                                 child: Otp() ));
           
//                         //TODO: For reverse ripple effect animation
//                         setState(() {
//                           isFinished = false;
//                         });
//                       },
           
//                ),
//          ),
//        ),
       
       
       
       
       
//          ])),
//        ));
    
//   }
// }