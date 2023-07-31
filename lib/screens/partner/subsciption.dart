import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/subscription_controller.dart';
import 'package:pet/screens/partner/payment.dart';
import 'package:pet/screens/partner/subsciptionpage2.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  SubscriptionController subscriptioncontroller = SubscriptionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
           
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        SizedBox(height: MediaQuery.of(context).size.height*0.01),
        Text("Subscribe for Premium Features",style: CustomTextStyle.popinsmedium ,),
              //  SizedBox(height: MediaQuery.of(context).size.height*0.01),
         Text("Protect up to 10 devices with all features",style: CustomTextStyle.popinsboldlightsmall,),
      
        SizedBox(height: MediaQuery.of(context).size.height*0.03),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Image.asset("assets/image/subcriptionimg.png"),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.05),
           
          
      //  GetBuilder<SubscriptionController>(
      //                   init: subscriptioncontroller,
      //                   builder: (_) {
      //                     return
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             InkWell(
              onTap: (){
              Get.to(subsciptionpage2());
              },
               child: Container(
                height: 95,
                width: 140,
                decoration: BoxDecoration(
                      boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset:
                                                Offset(0, 3), // Offset of the shadow
                                          ),
                                        ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter
                    ,colors: [
                  
                    Color(0xff3faafe),
                    Color(0xff1789e3)
                  ]
                    
                    // subscriptioncontroller.toggle()
                    
                  //  
                  )
                ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  
                children: [
                Container(
                  width: 45,
                height: 25,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomRight: Radius.circular(15)),
                color: Color(0xfff95fae)),
                child: Center(child: Text("50% Off",style: CustomTextStyle.popinstextsmall12,)),
                
                )
                      ,  Center(
               child: Column(
                children: [
                      
                Text("Annual",style: CustomTextStyle.popinstextsmall124,),SizedBox(height: 2,),
                 Text("\$490.00",style: CustomTextStyle.popinstextsmall12,),SizedBox(height: 2,),
                  Text("\$49.00/month",style: CustomTextStyle.popinstextsmall12,)
               ],),
                      )
                       
                       
                       
               ],),
               ),
             ),
          InkWell(
              onTap: (){
              Get.to(subsciptionpage2());
              },
            child: Container(
            height: 95,
            width: 140,
            decoration: BoxDecoration(
                  boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset:
                                                Offset(0, 3), // Offset of the shadow
                                          ),
                                        ],
              borderRadius: BorderRadius.circular(15),
                   color:MyColors.white
            ),
            child: Center(
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
             
                Text("Monthly",style: CustomTextStyle.popinsboldlightsmall,),SizedBox(height: 2,),
                 Text("\$490.00",style: CustomTextStyle.popinssmall0,),
                  // Text("\$49.00/month",style: CustomTextStyle.popinstextsmall12,)
               ],),
             )
              
                   ),
          )
           
          
           ],
         ),
      
      
         
       
      //                   }
      //  ),
      
       SizedBox(height: MediaQuery.of(context).size.height*0.05),
      
          InkWell(onTap: (){
                         Get.to(Paymentpartner());
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                      },
                        child: Center(
                          child: Container(
                                  
                            width: MediaQuery.of(context).size.width,
                                  
                                  height: MediaQuery.of(context).size.height*0.08,
                                  
                                  decoration: BoxDecoration(
                                  
                                    color:MyColors.yellow,
                                  
                                    borderRadius: BorderRadius.circular(25)
                                  
                                  ),
                                  
                                  
                                  
                                  child: 
                                  
                                    Center(child: Text("Subscriptions",style: CustomTextStyle.mediumtextreem,))
                                  
                              ,
                                  
                                ),
                        ),
                      ),
           
            ],
          ),
        ),
      ),
    );
  }
}