import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/transactionController.dart';
import 'package:pet/controllers/user_controller/transaction_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment.dart';

class Usertranscation extends StatelessWidget {
   Usertranscation({super.key});

  TransactionUserController transactionuserController = Get.put(TransactionUserController());

  @override
  Widget build(BuildContext context) {
    transactionuserController.init();
    return Scaffold(

           appBar: 
            
            CustomAppBarback(title:"Transactions"),
        
    body:Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,
        primary: true,
      children: [

                   
   SizedBox(height: MediaQuery.of(context).size.height*0.03,),   
    Text("Transactions",style:CustomTextStyle.popinsmedium),
 SizedBox(height: MediaQuery.of(context).size.height*0.02,),  

  GetBuilder<TransactionUserController>(
                      init: transactionuserController,
                      builder: (_) {
return transactionuserController.usertransactionmodel == null?
SizedBox():
ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:  transactionuserController.usertransactionmodel!.data!.length,
                    itemBuilder: (context, index) {
                      var item =    transactionuserController.usertransactionmodel!.data![ transactionuserController.usertransactionmodel!.data!.length -
                              1 -
                              index];
            return  transactionuserController.usertransactionmodel!.data!.isEmpty?
            Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))
                          : 
            
            Container(
              width: 335,
              margin: EdgeInsets.all(10),
height: 75,
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
  
                  Image.asset("assets/image/rightimgg2.png",height: 58,)
  
                ],)
   
,SizedBox(width: 15,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
 Text("Paid to",style: CustomTextStyle.popinsboldlight,),
 Text(item.date.toString(),style: CustomTextStyle.popinsboldlightsmall,)
                ],),
              ],
            ),

            Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                 (item.type == "debit")?
// Image.asset("assets/image/rightimg.png",height: 25,):Image.asset("assets/image/arrowgreen.png",color: MyColors.green,height: 25,),
  (item.type == "credit")?
 
 Text(
  "+ ₹"+ item.amount.toString(),style: CustomTextStyle.popinsmediumgreen,)
  :
  Text(
  
  
  "- ₹"+ item.amount.toString(),style: CustomTextStyle.popinsmediumred,)
            ],)
  ],),
)
            );
          }
        );
     
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