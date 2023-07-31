import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pet/screens/swepcard.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
leading: Padding(
  padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
  child:   InkWell(onTap: (){
    Navigator.pop(context);
  },
    child: Icon(Icons.arrow_back_ios,color: MyColors. black,size: 20,
    
    ),
  ),
),
         
        title: Center(child: Text("Order Summary",style: CustomTextStyle.appbartext,)),
        ),
     body: Padding(
       padding:  EdgeInsets.all(15),
       child: SingleChildScrollView(
         child: Column(
          children: [
       
            Container(height:   MediaQuery.of(context).size.height*0.66,child: SwipeList()),
   
       
            Container(
       height:   MediaQuery.of(context).size.height*0.26,
       width:  MediaQuery.of(context).size.width,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:MyColors.white),
         child: DottedBorder(
           color: Colors.black26,
           borderType: BorderType.Rect,
         radius: Radius.circular(25),
          //  strokeWidth: 1,
           child: Container(
          // height:MediaQuery.of(context).size.height*0.28,
          
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(children: [
         
            Row(children: [

          Text("Sub Total",style:CustomTextStyle.popinslight,),
          SizedBox(width: MediaQuery.of(context).size.width*0.2,),
            Text("₹620.00",style:CustomTextStyle.popinstext,),
         
            
         ],),
         SizedBox(height: MediaQuery.of(context).size.height*0.02),  
             Divider(color:MyColors.  lightdivider,thickness: 1,height: 1,),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),  
             Row(children: [

          Text("Tex(5%)",style:CustomTextStyle.popinslight,),
          SizedBox(width: MediaQuery.of(context).size.width*0.2,),
             Text("₹00.00",style:CustomTextStyle.popinstext,),
            
         ],),
                     SizedBox(height: MediaQuery.of(context).size.height*0.02),  
             Divider(color: MyColors. lightdivider,thickness: 1,height: 1,),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),  

               Row(children: [

          Text("Rounding Adjust",style:CustomTextStyle.popinslight,),
          SizedBox(width: MediaQuery.of(context).size.width*0.2,),
             Text("₹00.00",style:CustomTextStyle.popinstext,),
            
         ],),
              
          
           ]),
         ),
          
          )
          
          
          
          ,
           ),
            ),
           Text("Address",style:CustomTextStyle.popinslight,),    

               Container(height:  MediaQuery.of(context).size.height*0.09,
width:MediaQuery.of(context).size.width ,

decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:MyColors.white),
  child:   Padding(
    padding: const EdgeInsets.only(left:15.0,top:5,bottom: 5,right: 15),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    
    
    
    
    
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total",style:CustomTextStyle.popinstext),
          Text("₹620.00",style:CustomTextStyle.popinstext),
        ],
      ),
    
      InkWell(onTap: (){
  // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary()));
     
      },
        child: Container(
          
          width: MediaQuery.of(context).size.width*0.4,
          
          height: MediaQuery.of(context).size.height*0.06,
          
          decoration: BoxDecoration(
          
            color:MyColors.yellow,
          
            borderRadius: BorderRadius.circular(25)
          
          ),
          
          
          
          child: 
          
            Center(child: Text("Pay",style: CustomTextStyle.mediumtextreem,))
          
       ,
          
        ),
      )
    
    
    
    
    
    ],),
  ),
)
,





           SizedBox(height: MediaQuery.of(context).size.height*0.03),  
Container(height:  MediaQuery.of(context).size.height*0.09,
width:MediaQuery.of(context).size.width ,

decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:MyColors.white),
  child:   Padding(
    padding: const EdgeInsets.only(left:15.0,top:5,bottom: 5,right: 15),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    
    
    
    
    
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total",style:CustomTextStyle.popinstext),
          Text("₹620.00",style:CustomTextStyle.popinstext),
        ],
      ),
    
      InkWell(onTap: (){
  // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary()));
     
      },
        child: Container(
          
          width: MediaQuery.of(context).size.width*0.4,
          
          height: MediaQuery.of(context).size.height*0.06,
          
          decoration: BoxDecoration(
          
            color:MyColors.yellow,
          
            borderRadius: BorderRadius.circular(25)
          
          ),
          
          
          
          child: 
          
            Center(child: Text("Pay",style: CustomTextStyle.mediumtextreem,))
          
       ,
          
        ),
      )
    
    
    
    
    
    ],),
  ),
)



       
       
       
       //           Container(height:   MediaQuery.of(context).size.height*0.2,
       //      width:MediaQuery.of(context).size.width ,
       //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: boxbgcolor),
       //      child: Row(children: [
               
       
       
       //              Padding(
       //                padding: const EdgeInsets.all(0.0),
       //                child: Image.asset("assets/image/fooddog.png",),
       //              ),
       
       //              Column(crossAxisAlignment: CrossAxisAlignment.start,
                
       //               children: [
       
       
       // Text("Mars Petcare Inc",style: CustomTextStyle.popinsmedium,),
       
       // Text(" with paneer or cottage cheese",style: CustomTextStyle.popinsmedium)
       
       //              ],)
             
       //      ]),
            
       //      )
             
             
          ],
         ),
       ),
     ),
    );
  }
}