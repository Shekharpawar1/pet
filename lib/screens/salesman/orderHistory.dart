import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class OrderHistorysales extends StatefulWidget {
  const OrderHistorysales({super.key});

  @override
  State<OrderHistorysales> createState() => _OrderHistorysalesState();
}

class _OrderHistorysalesState extends State<OrderHistorysales> {
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
            child:Text("Order History",style: TextStyle(fontSize: 16,color: MyColors.black,
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
                
                
                Text("Shop name",style:CustomTextStyle.popinsmedium,),
             
                
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

SizedBox(height: MediaQuery.of(context).size.height*0.02),
    Text("10 Feb 2023",style:CustomTextStyle.popinsmedium,),
    SizedBox(height: MediaQuery.of(context).size.height*0.02),
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
   Text("10 Feb 2023",style:CustomTextStyle.popinsmedium,),
    SizedBox(height: MediaQuery.of(context).size.height*0.02),
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

       ],),
     ),)
    );
  }
}