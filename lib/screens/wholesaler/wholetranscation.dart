import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/transactionController.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment.dart';

class wholeTranscation extends StatelessWidget {
   wholeTranscation({super.key});


  TransactionHistoryController transactionhistoryController = Get.put(TransactionHistoryController());

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
            child:Text("Transactions",style: TextStyle(fontSize: 16,color:MyColors. black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
                   
          Stack(
            children: [
              InkWell(
                  onTap: () {
                     Get.to(const NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
                 SizedBox(width: 20),
 Stack(
            children: [
              InkWell(
                  onTap: () {
                      // Get.to(const AddToCardUser());
                   
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
           
          ],
         
        ),


    body:Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,
        primary: true,
      children: [

                   
   SizedBox(height: MediaQuery.of(context).size.height*0.03,),   
    Text("Transactions",style:CustomTextStyle.popinsmedium),
 SizedBox(height: MediaQuery.of(context).size.height*0.02,),  

  GetBuilder<TransactionHistoryController>(
                      init: transactionhistoryController,
                      builder: (_) {
return
 ListView.builder(
                                primary: false,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    transactionhistoryController.gettranscationList.length,
                                itemBuilder: (context, index) {
                                  var item =
                                      transactionhistoryController.gettranscationList[index];
   
    return 
    Container(
      width: 335,
height: 75,
margin: EdgeInsets.all(10),
decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),
child:Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
  
    Row(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
  
          Image.asset(item["image"],height: 58,)
  
        ],)
   
,SizedBox(width: 15,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
 Text(item["name"],style: CustomTextStyle.popinsboldlight,),
 Text(item["datetime"],style: CustomTextStyle.popinsboldlightsmall,),
 Text(item["invoicenumber"],style: CustomTextStyle.popinsboldlightsmall,)
        ],),
      ],
    ),

    Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
Image.asset("assets/image/rightimg.png",height: 25,),
 Text("₹"+item["amount"],style: CustomTextStyle.popinsboldlight,)
    ],)
  ],),
)
    );
                                });

                      })
// ,SizedBox(height: 10,),
//     Container(
//       width: 335,
// height: 75,
// decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),
// child:Padding(
//   padding: const EdgeInsets.all(8.0),
//   child:   Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
  
//     Row(mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
  
//           Image.asset("assets/image/girlimg1.png",height: 58,)
  
//         ],)
   
// ,SizedBox(width: 15,),
//         Column(crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.center,
        
//           children: [
//  Text("John Smith",style: CustomTextStyle.popinsboldlight,),
//  Text("10 May 10:30 PM",style: CustomTextStyle.popinsboldlightsmall,)
//         ],),
//       ],
//     ),

//     Column(crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.center,
//       children: [
// Image.asset("assets/image/rightimg.png",height: 25,),
//  Text("\$30.00",style: CustomTextStyle.popinsboldlight,)
//     ],)
//   ],),
// )
//     )
// ,SizedBox(height: 10,),
//     Container(
//       width: 335,
// height: 75,
// decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),
// child:Padding(
//   padding: const EdgeInsets.all(8.0),
//   child:   Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
  
//     Row(mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
  
//           Image.asset("assets/image/girlimg1.png",height: 58,)
  
//         ],)
   
// ,SizedBox(width: 15,),
//         Column(crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.center,
        
//           children: [
//  Text("John Smith",style: CustomTextStyle.popinsboldlight,),
//  Text("10 May 10:30 PM",style: CustomTextStyle.popinsboldlightsmall,)
//         ],),
//       ],
//     ),

//     Column(crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.center,
//       children: [
// Image.asset("assets/image/rightimg.png",height: 25,),
//  Text("\$30.00",style: CustomTextStyle.popinsboldlight,)
//     ],)
//   ],),
// )
//     )
// ,SizedBox(height: 10,)


      ],),
    )  
    );
  }
}