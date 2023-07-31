import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/drawer.dart';
import 'package:pet/screens/partner/balance.dart';
import 'package:pet/screens/partner/complete.dart';
import 'package:pet/screens/partner/pending.dart';
import 'package:pet/screens/partner/totalorder.dart';
import 'package:pet/screens/partner/wholesaler_view.dart';
import 'package:pet/screens/salesman/balance.dart';
import 'package:pet/screens/salesman/complete.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/pending.dart';
import 'package:pet/screens/salesman/totalorder.dart';
import 'package:pet/screens/salesman/wholesaler_view.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/balance.dart';
import 'package:pet/screens/wholesaler/home.dart';
import 'package:pet/screens/wholesaler/totalorder.dart';

class DashboardPartner extends StatefulWidget {
  const DashboardPartner({super.key});

  @override
  State<DashboardPartner> createState() => _DashboardPartnerState();
}

class _DashboardPartnerState extends State<DashboardPartner> {
 final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _drawerkey,
       drawer: drawer(),
          appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:0.0,top: 15,bottom: 15),
            child: GestureDetector(
                onTap: (){
                  _drawerkey.currentState!.openDrawer();
                },child: Image.asset(
                "assets/image/menu2.png",
              ),
            ),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child:Text("DashBoard",style: TextStyle(fontSize: 16,color:MyColors. black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),
           
            // SizedBox(width: 20),
            InkWell(
              onTap: (){
                // Get.to();
              },
              child: Padding(
                padding:  EdgeInsets.only(right:20.0),
                child:  Image.asset("assets/image/girl.png"),
              ),
            ),
           
          ],
         
        ),
        // backgroundcolor:MyColors.white,
body: SingleChildScrollView(child: Padding(
  padding: const EdgeInsets.all(15.0),
  child:   Column(crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [
  
  
  
  
  
  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
  
  
  
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  
  
      children: [
  
        InkWell(
          onTap: (){
          Get.to(WholeSalerScreenpartner());
        },
          child: Container(
          
          width: 103,
          
          height: 92,
          
          decoration: BoxDecoration(color:Color(0xff008FFF), borderRadius: BorderRadius.circular(20)),
          
          child:Column(crossAxisAlignment: CrossAxisAlignment.center,
          
          mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
          
            Text( "250",
           style: CustomTextStyle.boldStyle1
          
              ),
          
          
          
          Center(
          
            child: Text(
           "Total Order",textAlign: TextAlign.center,
          style: CustomTextStyle.popinstextsmall12
            ),
          
          ),
          
            ],
          
          ),
          
            ),
        ),
  
  
  
    InkWell(onTap: (){
      Get.to(Balancepartner());
    },
      child: Container(
      
      width: 103,
      
      height: 92,
      
      decoration: BoxDecoration(color: Color(0xffFFCC00), borderRadius: BorderRadius.circular(20),
      
      
      
      
      
      ),
      
      child:
      
      Column(crossAxisAlignment: CrossAxisAlignment.center,
      
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
      
            Text("150",
        style: CustomTextStyle.boldStyle1
      
        
      
        ),
      
      
      
          Center(
      
            child: Text(
      
              
      
              "Transactions",textAlign: TextAlign.center,
      
              
      
              style: CustomTextStyle.popinstextsmall12
      
              
      
              ),
      
          ),
      
      ],
      
      ),
      
       
      
      ),
    )
  
    
  
    ,
  
    InkWell(
      onTap: (){
        Get.to(  TotalOrderpartner());
      },
      child: Container(
      
      width: 103,
      
      height: 92,
      
      decoration: BoxDecoration(color: Color(0xffA7D441), borderRadius: BorderRadius.circular(20),
      
      
      
      
      
      ),
      
      child:
      
      Column(crossAxisAlignment: CrossAxisAlignment.center,
      
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
      
            Text(
      
        
      
        "105",
      
        
      
        style: CustomTextStyle.boldStyle1
      
        
      
        ),
      
      
      
          Center(
      
            child: Text(
      
              
      
              "Total Order",textAlign: TextAlign.center,
      
              
      
              style: CustomTextStyle.popinstextsmall12
      
              
      
              ),
      
          ),
      
      ],
      
      ),
      
       
      
      ),
    )
  
    
  
    
  
    
  
    ],
  
    
  
    
  
    
  
    
  
    )
  ,
    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
  
  Text("My Order", style:
      CustomTextStyle.popinstext,),
   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
 
 InkWell(
    onTap:(){
    // Get.to( Completedsales());
 
    },
  
    child: Container(
  
  height: 60,
  decoration: BoxDecoration(color:MyColors.white,  borderRadius: BorderRadius.circular(37)),
  
  child:Padding(
    padding: const EdgeInsets.only(left:15,right: 0),
    child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
    
            Text("Current Order",style:TextStyle(fontSize: 14,
    
    fontWeight: FontWeight.w400,)),
    
  
    Padding(
      padding: const EdgeInsets.only(left:8.0,top:8,bottom:8),
      child: Container(height: 100,width: 100,
      decoration: BoxDecoration(
        
           shape: BoxShape.circle,
        border: Border.all(
                     color:MyColors.yellowcir,
                     width:1.0,
                   ),
      ),
      child:Center(child: Text("05"))
      ),
    )
      ],
    
    ),
  )
  ),
  ),
  SizedBox(height: 10,),
  
  InkWell(
     onTap:(){
    Get.to( Pendingpartner());
 
    },
    child: Container(
  
  height: 60,
  decoration: BoxDecoration(color:MyColors.white,  borderRadius: BorderRadius.circular(37)),
  
  child:Padding(
    padding: const EdgeInsets.only(left:15,right: 0),
    child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
    
            Text("Pending",style:TextStyle(fontSize: 14,
    
    fontWeight: FontWeight.w400,)),
    
  
    Padding(
      padding: const EdgeInsets.only(left:8.0,top:8,bottom:8),
      child: Container(height: 100,width: 100,
      decoration: BoxDecoration(
        
           shape: BoxShape.circle,
        border: Border.all(
                     color:MyColors.yellowcir,
                     width:1.0,
                   ),
      ),
      child:Center(child: Text("05"))
      ),
    )
      ],
    
    ),
  )
  ),
  ),
  SizedBox(height: 10,),

  InkWell(
    onTap:(){
    Get.to( Completedpartner());
 
    },
  
    child: Container(
  
  height: 60,
  decoration: BoxDecoration(color:MyColors.white,  borderRadius: BorderRadius.circular(37)),
  
  child:Padding(
    padding: const EdgeInsets.only(left:15,right: 0),
    child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
    
            Text("Completed",style:TextStyle(fontSize: 14,
    
    fontWeight: FontWeight.w400,)),
    
  
    Padding(
      padding: const EdgeInsets.only(left:8.0,top:8,bottom:8),
      child: Container(height: 100,width: 100,
      decoration: BoxDecoration(
        
           shape: BoxShape.circle,
        border: Border.all(
                     color:MyColors.yellowcir,
                     width:1.0,
                   ),
      ),
      child:Center(child: Text("05"))
      ),
    )
      ],
    
    ),
  )
  ),
  ),
  SizedBox(height: 10,),

  

    // SizedBox(height: MediaQuery.of(context).size.height*0.08,),   
                    // InkWell(onTap: (){
                    //   Get.to(WholeSalerScreenpartner());
                    //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
                    // },
                    //   child: Center(
                    //     child: Container(
                                
                    //       width: MediaQuery.of(context).size.width,
                                
                    //            height: MediaQuery.of(context).size.height*0.08,
                                
                    //             decoration: BoxDecoration(
                                
                    //               color:MyColors.yellow,
                                
                    //               borderRadius: BorderRadius.circular(25)
                                
                    //             ),
                                
                                
                                
                    //             child: 
                                
                    //               Center(child: Text("Add Wholeseller ",style: CustomTextStyle.mediumtextreem,))
                                
                    //         ,
                                
                    //           ),
                    //   ),
                    // ),
                     
  
  ],),
),),

    );
  }
}