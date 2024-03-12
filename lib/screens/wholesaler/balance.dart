import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/balance_controller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  BalanceController balancecontoller = Get.put(BalanceController());
   WholeMyOrderController wholemyordercontroller =
      Get.put(WholeMyOrderController());
      
  @override
  Widget build(BuildContext context) {
    wholemyordercontroller.init();
    balancecontoller.transinit();
    return Scaffold(
appBar: CustomAppBarWholeback(title: "Balance",),
//            appBar: AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
//           leading: Padding(
//             padding: const EdgeInsets.only(left:15.0,top: 15,bottom: 15),
//             child: GestureDetector(
//                 onTap: (){
//                   Navigator.pop(context);
//                 },child:Icon(Icons.arrow_left,color:MyColors.black)
//             ),
//           ),
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("Balance",style: TextStyle(fontSize: 16,color:MyColors. black,
// fontWeight: FontWeight.w700,),)
//           ),
//           actions: [
//           //  SvgPicture.asset("assets/image/girl.svg"),
           
//             // SizedBox(width: 20),
//              InkWell(
//               onTap: () {
//                 Get.to(NotificationWhole());
//               },
//               child: SvgPicture.asset("assets/image/notification.svg")),
          
           
//           ],
         
//         ),


    body:SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
    
    Stack(children: [
 Image.asset("assets/image/balanceimg1.png"),


 Center(
   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
   mainAxisAlignment: MainAxisAlignment.center,
   
   
     children: [
   SizedBox(height: Get.height*0.06,)
,           Text("Current Balance",style: CustomTextStyle.popinstextsmall124,),
      SizedBox(height: Get.height*0.03,),
      
          
                Text("₹ ${balancecontoller.walletBalance}",style: CustomTextStyle.yellowtextbold,
                ),
          
              //  SizedBox(height:2,),
              

//   Form(
//     key:balancecontoller.formKey,
//     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 45,
//                           //                    width: 335,
//                           // height: 45,
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(255, 255, 255, 0.10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   offset: const Offset(0.0, 0.0),
//                                   color: Color.fromRGBO(255, 255, 255, 0.10),
//                                   blurRadius: 0.0,
//                                   spreadRadius: 0.0,
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(40)),
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter amount';
//                               }
//                               return null;
//                             },
//                             controller:
//                                 balancecontoller.addbalanceController,
//                             decoration: InputDecoration(
//                               hintText: "₹ Enter Amount",
//                               hintStyle: TextStyle(
//                                       color: MyColors.grey,
//                                     ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               border: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                             ),
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: MyColors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//   ),

//   // SizedBox(height:5),
//              InkWell(
//               onTap: () {
//                balancecontoller
//                                   .validateForm(context)
//                                   .then((isValid)async {
//                                 if (isValid) {
//                                   print("Valid form");
// await balancecontoller.addWalletinit();

//                                 }});
//               },
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                             width: 160,
//                              height: 40
//                              ,
//                              decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(12),
//                              color:MyColors.white.withOpacity(0.2)),
//                              child:Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add,color:MyColors.white,size: 18,),
//                         Text("Add Balance",style:CustomTextStyle.popinstextsmall124 ,),
//                   ],
//                              )
//                              ),
//                ),
//              )
//     , SizedBox(height:3,),
     ],
   
   ),
 ),
  
    ],),
       

         SizedBox(height: MediaQuery.of(context).size.height*0.05,),   
  //                   InkWell(
  //                     onTap: (){
  //                     //  Get.to(Paymentwhole());
  //                   },
  //                     child: Center(
  //                       child: Container(
                                
  //                         width: MediaQuery.of(context).size.width*0.9,
                                
  //                               height: MediaQuery.of(context).size.height*0.08,
                                
  //                               decoration: BoxDecoration(
                                
  //                                 color:MyColors.yellow,
                                
  //                                 borderRadius: BorderRadius.circular(25)
                                
  //                               ),
                                
                                
                                
  //                               child: 
                                
  //                                 Center(child: Text("Withdrawal Amount",style: CustomTextStyle.mediumtextreem,))
                                
  //                           ,
                                
  //                             ),
  //                     ),
  //                   ),
                     
  //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),   
//     Text("Transactions",style:CustomTextStyle.popinsmedium),
//  SizedBox(height: MediaQuery.of(context).size.height*0.02,),   
   
//          GetBuilder<BalanceController>(
//             init: balancecontoller,
//             builder: (_) {

//         return  balancecontoller.wholetransactionmodel == null? SizedBox():
//         ListView.builder(
//                     primary: false,
//                     shrinkWrap: true,
//                     itemCount:  balancecontoller.wholetransactionmodel!.data!.length,
//                     itemBuilder: (context, index) {
//                       var item =   balancecontoller.wholetransactionmodel!.data![  balancecontoller.wholetransactionmodel!.data!.length -
//                               1 -
//                               index];
//             return   balancecontoller.wholetransactionmodel!.data!.isEmpty?
//             Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))
//                           : 
            
//             Container(
//               width: 335,
//               margin: EdgeInsets.all(10),
// height: 75,
// decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),
// child:Padding(
//   padding: const EdgeInsets.all(8.0),
//   child:   Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
  
//             Row(mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
  
//                   Image.asset("assets/image/rightimgg2.png",height: 58,)
  
//                 ],)
   
// ,SizedBox(width: 15,),
//                 Column(crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
                
//                   children: [
//  Text("Paid to",style: CustomTextStyle.popinsboldlight,),
//  Text(item.date.toString(),style: CustomTextStyle.popinsboldlightsmall,)
//                 ],),
//               ],
//             ),

//             Column(crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//               children: [
// //                 (item.type == "debit")?
// // Image.asset("assets/image/rightimg.png",height: 25,):Image.asset("assets/image/arrowgreen.png",color: MyColors.green,height: 25,),
//   (item.type == "credit")?
 
//  Text(
//   "+ ₹"+ item.amount.toString(),style: CustomTextStyle.popinsmediumgreen,)
//   :
//   Text(
  
  
//   "- ₹"+ item.amount.toString(),style: CustomTextStyle.popinsmediumred,)
//             ],)
//   ],),
// )
//             );
//           }
//         );
//       }
//     )


      ],),
    ),)  
    );
  }
}