import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/subscription_controller.dart';
import 'package:pet/screens/partner/payment.dart';
import 'package:pet/screens/wholesaler/payment.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class subsciptionpage2 extends StatefulWidget {
  const subsciptionpage2({super.key});

  @override
  State<subsciptionpage2> createState() => _subsciptionpage2State();
}

class _subsciptionpage2State extends State<subsciptionpage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          primary: true,
      
          children: [
      
        SizedBox(height: MediaQuery.of(context).size.height*0.02),
      Text("Subscribe for Premium Features",style: CustomTextStyle.popinsmedium ,),
            //  SizedBox(height: MediaQuery.of(context).size.height*0.01),
       Text("Protect up to 10 devices with all features",style: CustomTextStyle.popinsboldlightsmall,),

      SizedBox(height: MediaQuery.of(context).size.height*0.05),
      
     
    Container(width: 335,
// height: 450,
decoration: BoxDecoration(
 borderRadius: BorderRadius.circular(30),
 color: MyColors.white,
     boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset:
                                              Offset(0, 3), // Offset of the shadow
                                        ),
                                      ],
),
child:Column(children: [
  Container(
    height: 150,
    width:  335,
    decoration: BoxDecoration(
      
    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,colors: [
        Color(0xff8496f3), Color(0xff2d4be7)
      ])
    ),
    child: Padding(
      padding: const EdgeInsets.only(left:40,right:40,top:10,bottom:10),
      child: Image.asset("assets/image/subcriptionimg.png",fit: BoxFit.cover,),
    ),
  )
,

      SizedBox(height: MediaQuery.of(context).size.height*0.02),
Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(
  
    children: [
  
          Text("My Spy discount now. Link a device to enjoy a 50% OFF for new users, first month only 2430.00",style: CustomTextStyle.popinsboldlightsmall)
  
      
  
      , SizedBox(height: MediaQuery.of(context).size.height*0.02),    
  
      
  
      
  
      
  
      
  
      
  
           Container(
  
      
  
            height: 50,
  
      
  
            width: 150,
  
      
  
             child: Row(mainAxisAlignment: MainAxisAlignment.center,
  
      
  
             children: [
  
      
  
                 Text("\$49.00",style: CustomTextStyle.popinsboldblue),
  
      
  
                 Text(" /first\nmonth ",style: CustomTextStyle.popinssmall0),
  
      
  
             ],
  
      
  
           ),
  
      
  
           ),
  
      
  
       Text("3850.00/month",style: CustomTextStyle.popinsbold),
  
      
  
       SizedBox(height: MediaQuery.of(context).size.height*0.05),
  
      
  
       InkWell(
        onTap: (){
          Get.to(Paymentpartner());
        },
         child: Container(
         
             
         
             width: 180,
         
             
         
             height: 40,
         
             
         
             decoration: BoxDecoration(
         
             
         
          
         
             
         
             borderRadius: BorderRadius.circular(60),
         
             
         
             color: Color(0xffffcc00)),
         
             
         
             child: Center(child: Text("By Now",style:CustomTextStyle.popinstextsmall ,)),
         
             
         
             ),
       ),SizedBox(height: MediaQuery.of(context).size.height*0.04),
  
      
  
       Row(mainAxisAlignment: MainAxisAlignment.center,
  
      
  
        children: [
  
      
  
      Text("Expiration Date: ",style: CustomTextStyle.popinssmallnormalpink,),SizedBox(width: 5,),
  
      
  
      Container(
  
      
  
      width: 152,
  
      
  
      height: 35,
  
      
  
      decoration: BoxDecoration(
  
      
  
      borderRadius: BorderRadius.circular(23.5),
  
      
  
      color: Color(0xb2ef0940)),
  
      
  
      child: Center(child: Text("07/15/2022 15:07",style: CustomTextStyle.popinstextsmall12)),
  
      
  
      )
  
      
  
      ],),
  
    ],
  
  ),
),
],)
),



      SizedBox(height: MediaQuery.of(context).size.height*0.05),



    // InkWell(onTap: (){
    //                   // Get.to(WholeSalerScreenpartner());
    //                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
    //                 },
    //                   child: Center(
    //                     child: Container(
                                
    //                       width: MediaQuery.of(context).size.width,
                                
    //                             height: MediaQuery.of(context).size.height*0.07,
                                
    //                             decoration: BoxDecoration(
                                
    //                               color:MyColors.yellow,
                                
    //                               borderRadius: BorderRadius.circular(25)
                                
    //                             ),
                                
                                
                                
    //                             child: 
                                
    //                               Center(child: Text("Subscriptions",style: CustomTextStyle.mediumtextreem,))
                                
    //                         ,
                                
    //                           ),
    //                   ),
    //                 ),
         
          ],
        ),
      ),
    
    );
  }
}