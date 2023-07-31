import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class OrderDetailssales extends StatefulWidget {
  const OrderDetailssales({super.key});

  @override
  State<OrderDetailssales> createState() => _OrderDetailssalesState();
}

class _OrderDetailssalesState extends State<OrderDetailssales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:15.0,top: 15,bottom: 15),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },child:Icon(Icons.arrow_left,color:MyColors.black)
            ),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child:Text("Order Details",style: TextStyle(fontSize: 16,color: MyColors.black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),
           
            // SizedBox(width: 20),
            InkWell(
              onTap: (){
 Get.to (NotificationSales());
},
              child: Padding(
                padding:  EdgeInsets.only(right:20.0),
                child: SvgPicture.asset("assets/image/notification.svg"),
                //  Image.asset("assets/image/girl.png"),
              ),
            ),
           
          ],
         
        ),
      
     body:SingleChildScrollView(child: 
     
     Padding(
       padding: const EdgeInsets.only(left:15,right:15,bottom:10 ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
         SizedBox(height: MediaQuery.of(context).size.height*0.02),
         
            Row(
                       
                       children: [
                
                       Image.asset("assets/image/logocanine.png",
                height:80,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                
                  children: [
                
                
                Text("Canine Products",style:CustomTextStyle.popinsmedium,),
             
                
                Text("1901 Thornridge Cir. Shiloh, Hawaii 81063",style:CustomTextStyle.popinssmall0,),
               
                ],)
                    
                    ,
                  
                      
                     ],),
                
        Row(
         children:[
           
         Container(
           width: 134,
           height: 40,
           decoration: BoxDecoration(   gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFCEE8FC),
                  Color.fromRGBO(206, 232, 252, 0.00),
                ],
              ), borderRadius: BorderRadius.circular(37)),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  Image.asset("assets/image/file.png"),
                  SizedBox(width: 3,),
                  Text("download invoice",style:CustomTextStyle.popinssmall01, )
                ],),
              )
         )
        ,
        SizedBox(width: 15,),
           
         Container(
           width: 147,
           height: 40,
           decoration: BoxDecoration(   gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    Color(0xFFFBF1C8),
                  Color.fromRGBO(251, 241, 200, 0.00),
                ],
              ), borderRadius: BorderRadius.circular(37)),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  Image.asset("assets/image/file.png"),
                  SizedBox(width: 3,),
                  Text("download summary",style:CustomTextStyle.popinssmall01, )
                ],),




              )
         )
        
        
        
        
        ]),

    SizedBox(height: MediaQuery.of(context).size.height*0.03),
        Container(
          width: 335,
height: 300,
decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),

child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                 Align(alignment: Alignment.topRight,
                    child: Container(
                     //alignment: Alignment.topRight,
                     height: MediaQuery.of(context).size.height*0.05,
                     width: MediaQuery.of(context).size.width*0.3,
                     decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(20))),
                  child: Center(child: Text("10 Feb 2023",style: CustomTextStyle.popinstextsmall12,)), ),
                  ),
                  
              
                     ],), 


                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Order ID:12568", style: CustomTextStyle.popinssmall014,),
                           SizedBox(height: 5,),
                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("1 X Food bowl", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                           
                             ],
                           )
                     
                          ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("2 X Food Food 5 kg", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),


      Text("Order ID:12568", style: CustomTextStyle.popinssmall014,),
                           SizedBox(height: 5,),
                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("1 X Food bowl", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                           
                             ],
                           )
                     
                          ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("2 X Food Food 5 kg", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),
      Text("Order ID:12568", style: CustomTextStyle.popinssmall014,),
                           SizedBox(height: 5,),
                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("1 X Food bowl", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                           
                             ],
                           )
                     
                          ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("2 X Food Food 5 kg", style: CustomTextStyle.popinssmallnormal,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmallnormal,),  
                             ],
                           ),
                        
// Divider(indent: 1,thickness: 1,)
                        
                         ],
                       ),
                     )





]




,),
)
,
         SizedBox(height: MediaQuery.of(context).size.height*0.03),   

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Sub Total", style: CustomTextStyle.popinssmall014,),
                                 Text("\$50", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),

    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Moving Cart", style: CustomTextStyle.popinssmall014,),
                                     Text("Additional Services", style: CustomTextStyle.popinssmallnormal,),
                                 ],
                               ),
                                 Text("\$20", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),


    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Discount", style: CustomTextStyle.popinssmall014,),
                                     Text("Promo Code: 554dffd", style: CustomTextStyle.popinssmallnormal,),
                                 ],
                               ),
                                 Text("-\$20", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),

   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Total", style: CustomTextStyle.popinssmall014,),
                                 Text("\$138.00", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
 
         SizedBox(height: MediaQuery.of(context).size.height*0.03),
                               Text("Order Details", style: CustomTextStyle.popinssmall014,),
 SizedBox(height: MediaQuery.of(context).size.height*0.01),
                               Text("Order Number",style: CustomTextStyle.popinsboldlight,),
                                  Text("4797290627",style: CustomTextStyle.popinsboldlightsmall,),
SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                   Text("Payment",style: CustomTextStyle.popinsboldlight,),
                                  Text("Paid: Using Upi",style: CustomTextStyle.popinsboldlightsmall,),
                             SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                   Text("Date",style: CustomTextStyle.popinsboldlight,),
                                  Text("10 Feb 2023  10:20 AM",style: CustomTextStyle.popinsboldlightsmall,),

                                    SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                   Text("Phone Number",style: CustomTextStyle.popinsboldlight,),
                                  Text("10 Feb 2023  10:20 AM",style: CustomTextStyle.popinsboldlightsmall,),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                   Text("Deliver To",style: CustomTextStyle.popinsboldlight,),
                                  Text("10 Feb 2023  10:20 AM",style: CustomTextStyle.popinsboldlightsmall,),
       
       
         SizedBox(height: MediaQuery.of(context).size.height*0.05),
       Text("Wholeseller",style: CustomTextStyle.popinssmall014,),


      Card(elevation: 1.5,
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
        child: Container(
              width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height*0.45,
                decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
                  padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                
                 
                      Text("Nity Make",style:CustomTextStyle.popinsmedium,),
           
              
              
              
             
              
             SizedBox(height: 5,),
        Text("Canine Products",style: CustomTextStyle.popinssmall01,),
  SizedBox(height: MediaQuery.of(context).size.height*0.03),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Email ID", style: CustomTextStyle.popinsboldlightsmall,),
                                 Text("xyz@gmail.com", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),  
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("City", style: CustomTextStyle.popinsboldlightsmall,),
                                 Text("Mumbai", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),     

  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Registration no", style: CustomTextStyle.popinsboldlightsmall,),
                                 Text("#125863", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),    

 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Location", style: CustomTextStyle.popinsboldlightsmall,),
                                 SizedBox(width:  MediaQuery.of(context).size.width*0.3,
                                  child: Text("1901 Thornridge", style: CustomTextStyle.popinssmall014,)),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),   
 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("GST No", style: CustomTextStyle.popinsboldlightsmall,),
                                 Text("125863", style: CustomTextStyle.popinssmall014,),  
                             ],
                           ),
                        
Divider(indent: 1,thickness: 1,),    

                  ],),
                )
                ),
      ),
 SizedBox(height: MediaQuery.of(context).size.height*0.03),
          GestureDetector(
                              onTap: () {
                             
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:MyColors.yellow,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Product",
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
                        
             



       ],),
     ),)
    );
  }
}