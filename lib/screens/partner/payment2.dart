import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/partner/Dashboard.dart';
import 'package:pet/screens/partner/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class Payment2partner extends StatefulWidget {
  const Payment2partner({super.key});

  @override
  State<Payment2partner> createState() => _Payment2partnerState();
}

class _Payment2partnerState extends State<Payment2partner> {
  TextEditingController _cardcontroller = TextEditingController();
     TextEditingController _namecontroller = TextEditingController();
       TextEditingController _cvvcontroller = TextEditingController();
            TextEditingController _datecontroller = TextEditingController();
              String? _expiryDateError;
String? _cvvError;

                @override
  void dispose() {
    _datecontroller.dispose();
     _cvvcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:5.0,top: 15,bottom: 15),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },child:Icon(Icons.arrow_left,color:MyColors. black)
            ),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child:Text("Payment",style: TextStyle(fontSize: 16,color:MyColors. black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),
           
            // SizedBox(width: 20),
            InkWell(
              onTap: (){
                Get.to(NotificationPartner());
              },
              child: Padding(
                padding:  EdgeInsets.only(right:20.0),
                child: SvgPicture.asset("assets/image/notification.svg"),
                //  Image.asset("assets/image/girl.png"),
              ),
            ),
           
          ],
         
        ),
      

      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Center(child: Image.asset("assets/image/creditcard.png")),

            Text("Card Number",style: CustomTextStyle.mediumtextreem,),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
            Container(
width: 335,
height: 53,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(21),
color: Colors.white),
child:TextFormField(
                                   controller: _cardcontroller,
                                                 style: TextStyle(fontSize: 14,color: MyColors.black, fontFamily: "SF-Pro-Display"),
               keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
       
      ],
                                decoration: InputDecoration(
                                  fillColor:MyColors.white,
                                       focusColor:MyColors.white,
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                       ),
                                    contentPadding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
               
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         //  borderRadius: BorderRadius.circular(50),
                                       ),
                                       border: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         //  borderRadius: BorderRadius.circular(50),
                                       ),
                                       hintText:"1235 1254 8697 1234",
                                       hintStyle: CustomTextStyle.popinstextsmall123
                                    ),
                                 ),
),

SizedBox(height: MediaQuery.of(context).size.height*0.02),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
   Expanded(
     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("Expiry Date",style: CustomTextStyle.mediumtextreem,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
   
                    Container(
   //                       width: 200,
                
   // height: 53,
   decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(21),
   color: Colors.white),
                      child: TextField(
                                       controller: _datecontroller,
                                                     style: TextStyle(fontSize: 14,color: MyColors.black, fontFamily: "SF-Pro-Display"),
                                    keyboardType: TextInputType.number,
                  // onChanged: (value) {
                  //   setState(() {
                  //   _expiryDateError = null;
                  //   });
                  // },
                  // onSubmitted: (value) {
                  //   validateExpiryDate(value);
                  // },
                                    decoration: InputDecoration(
                                      fillColor:MyColors.white,
                                           focusColor:MyColors.white,
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                           ),
                                        contentPadding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
                                   
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                             //  borderRadius: BorderRadius.circular(50),
                                           ),
                                           border: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                             //  borderRadius: BorderRadius.circular(50),
                                           ),
                                           hintText:"MM/YY",
                                            errorText: _expiryDateError,
                                           hintStyle: CustomTextStyle.popinstextsmall123,
   
                                           
                                        ),
                                     ),
                    ),
   
       ],
     ),
   ),
SizedBox(width: 15,),
   Expanded(
     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("CVV",style: CustomTextStyle.mediumtextreem,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
                    Container(
                    
   
   decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(21),
   color: Colors.white),
                      child: TextField(
                                       controller: _cvvcontroller,
                                                     style: TextStyle(fontSize: 14,color: MyColors.black, fontFamily: "SF-Pro-Display"),
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                     onChanged: (value) {
        setState(() {
          _cvvError = null;
        });
      },
      onSubmitted: (value) {
     validateCVV(value);
      },
                                    decoration: InputDecoration(
                                      fillColor:MyColors.white,
                                           focusColor:MyColors.white,
                                           counterText: '',
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                           ),
                                        contentPadding: EdgeInsets.only(left: 15,top: 15,bottom: 10),
                                   
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                             //  borderRadius: BorderRadius.circular(50),
                                           ),
                                           border: OutlineInputBorder(
                                             borderSide: BorderSide.none,
                                             //  borderRadius: BorderRadius.circular(50),
                                           ),
                                           hintText:"****",
                                           hintStyle: CustomTextStyle.popinstextsmall123
                                        ),
                                     ),
                    ),
   
       ],
     ),
   ),

],),
SizedBox(height: MediaQuery.of(context).size.height*0.02),



  Text("Name",style: CustomTextStyle.mediumtextreem,),

  SizedBox(height: MediaQuery.of(context).size.height*0.01),
            Container(
width: 335,
height: 53,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(21),
color: Colors.white),
child:TextFormField(
                                   controller: _namecontroller,
                                                 style: TextStyle(fontSize: 14,color: MyColors.black, fontFamily: "SF-Pro-Display"),
               
                                decoration: InputDecoration(
                                  fillColor:MyColors.white,
                                       focusColor:MyColors.white,
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                       ),
                                    contentPadding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
               
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         //  borderRadius: BorderRadius.circular(50),
                                       ),
                                       border: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         //  borderRadius: BorderRadius.circular(50),
                                       ),
                                       hintText:"Rahul vishwakara",
                                       hintStyle: CustomTextStyle.popinstextsmall123
                                    ),
                                 ),
),



   SizedBox(height: MediaQuery.of(context).size.height*0.09),
    InkWell(onTap: (){
                        validateExpiryDate(_datecontroller.text);
validateCVV(_cvvcontroller.text);
  Get.to(DashboardPartner());
                      },
                        child: Center(
                          child: Container(
                                  
                            width: MediaQuery.of(context).size.width*0.9,
                                  
                                  height: MediaQuery.of(context).size.height*0.08,
                                  
                                  decoration: BoxDecoration(
                                  
                                    color:MyColors.yellow,
                                  
                                    borderRadius: BorderRadius.circular(25)
                                  
                                  ),
                                  
                                  
                                  
                                  child: 
                                  
                                    Center(child: Text("Payment",style: CustomTextStyle.mediumtextreem,))
                                  
                              ,
                                  
                                ),
                        ),
                      ),
        ],),
      ),),
     
    );
  }

  void validateExpiryDate(String input) {
    if (input.isEmpty) {
      setState(() {
        _expiryDateError = 'Please enter the expiry date';
      });
    } else if (input.length != 5 || input[2] != '/') {
      setState(() {
        _expiryDateError = 'Invalid format. Please enter MM/YY';
      });
    } else {
      String month = input.substring(0, 2);
      String year = input.substring(3);
      int? parsedMonth = int.tryParse(month);
      int? parsedYear = int.tryParse(year);

      if (parsedMonth == null || parsedYear == null) {
        setState(() {
          _expiryDateError = 'Invalid format. Please enter MM/YY';
        });
      } else if (parsedMonth < 1 || parsedMonth > 12) {
        setState(() {
          _expiryDateError = 'Invalid month. Please enter a valid month (01-12)';
        });
      } else if (parsedYear < 0 || parsedYear > 99) {
        setState(() {
          _expiryDateError = 'Invalid year. Please enter a valid year (00-99)';
        });
      } else {
        // Expiry date is valid
        setState(() {
          _expiryDateError = null;
        });
        // Perform any desired actions with the expiry date
        print('Expiry Date: $input');
      }
    }

  
}

  void validateCVV(String input) {
    if (input.isEmpty) {
      setState(() {
        _cvvError = 'Please enter the CVV';
      });
    } else if (input.length != 3 && input.length != 4) {
      setState(() {
        _cvvError = 'Invalid CVV. Please enter a 3 or 4-digit CVV';
      });
    } else if (int.tryParse(input) == null) {
      setState(() {
        _cvvError = 'Invalid CVV. Please enter numeric digits only';
      });
    } else {
      // CVV is valid
      setState(() {
        _cvvError = null;
      });
      // Perform any desired actions with the CVV
      print('CVV: $input');
    }
  }
}