import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/wholesaler/orderDetails.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class PaymentDoneScreenwhole extends StatefulWidget {
  const PaymentDoneScreenwhole({super.key});

  @override
  State<PaymentDoneScreenwhole> createState() => _PaymentDoneScreenwholeState();
}

class _PaymentDoneScreenwholeState extends State<PaymentDoneScreenwhole> {
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
      
     body: ListView(primary: true,
     shrinkWrap: true,
      children: [
Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
           
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        // SizedBox(height: MediaQuery.of(context).size.height*0.01),
        // Text("Subscribe for Premium Features",style: CustomTextStyle.popinsmedium ,),
      
        SizedBox(height: MediaQuery.of(context).size.height*0.03),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Image.asset("assets/image/paymentdone.png"),
         ),
         
       
       SizedBox(height: MediaQuery.of(context).size.height*0.05),
      
              //  SizedBox(height: MediaQuery.of(context).size.height*0.01),
         Text("Lorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesetting",style: CustomTextStyle.popinsboldlightsmall,),
          InkWell(onTap: (){
                      
 Get.to(OrderDetailswhole());                      },
                        child: Center(
                          child: Container(
                                  
                            width: MediaQuery.of(context).size.width,
                                  
                                  height: MediaQuery.of(context).size.height*0.08,
                                  
                                  decoration: BoxDecoration(
                                  
                                    color:MyColors.yellow,
                                  
                                    borderRadius: BorderRadius.circular(25)
                                  
                                  ),
                                  
                                  
                                  
                                  child: 
                                  
                                    Center(child: Text("Done",style: CustomTextStyle.mediumtextreem,))
                                  
                              ,
                                  
                                ),
                        ),
                      ),
           
            ],
          ),
        ),


      ],),
    );
  }
}