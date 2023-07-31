import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/partner/payment2.dart';
import 'package:pet/screens/salesman/payment2.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment2.dart';
  enum Choose {
  creditcard,
phonepay ,
paytm
}
class Paymentsales extends StatefulWidget {
  const Paymentsales({super.key});

  @override
  State<Paymentsales> createState() => _PaymentsalesState();
}

class _PaymentsalesState extends State<Paymentsales> {
  // String? selectedGender;

    String? selectcredit ;
    String? selectphoepay ;
    String? selectpaytm;
    // bool _isOn = false;
Choose? selectone;

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
                },child:Icon(Icons.arrow_left,color:MyColors.black)
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
            Padding(
              padding:  EdgeInsets.only(right:20.0),
              child: SvgPicture.asset("assets/image/notification.svg"),
              //  Image.asset("assets/image/girl.png"),
            ),
           
          ],
         
        ),
      
     
      body: SingleChildScrollView(child:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
      
          Image.asset("assets/image/creditcard.png"),
      
      
          Container(
      width: 335,
      height: 54,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      gradient: LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight,
      colors: [Color(0xffeeeeff), Color(0x59eeeeff)], )),
      
      child:   Row(mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   Radio(
                               value: Choose.creditcard,
          groupValue: selectone,
          onChanged: (Choose? value) {
            setState(() {
               selectone = value!;
            });}),
                 
      
                 Image.asset("assets/image/house.png",height:40),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05),
                 Text("Credit / Debit Card",  style:  CustomTextStyle.popinssmall0, )
                 
                 ],),
      
      )
         , SizedBox(height: MediaQuery.of(context).size.height*0.03),
         Container(
      width: 335,
      height: 53,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(55),
      gradient: LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight,
      colors: [Color(0xfffdcbcc), Color(0x42fdcbcc)], )),
      
      child:   
                 Row(mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   Radio(
                       
                               
                                 value:Choose.phonepay,
          groupValue: selectone,
          onChanged: (Choose? value) {
            setState(() {
              selectone = value!;
            });}    ),
                 
      
                 Image.asset("assets/image/phonepay1.png",height:25),
                
                 
                 ],),
      ),
      
       SizedBox(height: MediaQuery.of(context).size.height*0.03),
      Container(
      width: 335,
      height: 53,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      gradient: LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight,
      colors: [Color(0xffffead2), Color(0x56ffead2)], )),
      child:   
                 Row(mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   Radio(   
                       value: Choose.paytm,
          groupValue: selectone,
          onChanged: (Choose? value) {
            setState(() {
              selectone = value!;
            });} 
                                ),
                 
      
                 Image.asset("assets/image/paytm.png",height:25),
                
                 
                 ],),
      
      ),
      
        SizedBox(height: MediaQuery.of(context).size.height*0.05,),   
                      InkWell(onTap: (){
                       Get.to(
                        Payment2sales()
                       );
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
                                  
                                    Center(child: Text("Next",style: CustomTextStyle.mediumtextreem,))
                                  
                              ,
                                  
                                ),
                        ),
                      ),
         
         
         
        ],),
      )),
    );
  }
}

  // ListTile(
  //                               title: Text("Myself"),
  //                               leading: Radio(
  //                                   value:"",
  //                                 //  activeColor: buttoncolor,
  //                                   groupValue: select,
  //                                   onChanged: (value) {
  //                                     setState(() {
  //                                       select = value.toString();
                                        

  //                                     });
  //                                   }),
  //                             ),
                 