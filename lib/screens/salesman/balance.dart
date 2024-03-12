import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/balance_controller.dart';
import 'package:pet/controllers/salesman_controller/transaction_controller.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment.dart';

class Balancesales extends StatefulWidget {
  const Balancesales({super.key});

  @override
  State<Balancesales> createState() => _BalancesalesState();
}

class _BalancesalesState extends State<Balancesales> {
  BalanceSalesController balancecontoller = Get.put(BalanceSalesController());
    TransactionController transactionsalescontroller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    transactionsalescontroller.init();
    return Scaffold(

           appBar:CustomAppBarSalesWholeback( title: "Transactions",),
//            AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
//           leading: Padding(
//             padding: const EdgeInsets.only(left:5.0,top: 15,bottom: 15),
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
//             InkWell(
//            onTap: (){
//  Get.to (NotificationSales());
// },
//               child: Padding(
//                 padding:  EdgeInsets.only(right:20.0),
//                 child: SvgPicture.asset("assets/image/notification.svg"),
//                 //  Image.asset("assets/image/girl.png"),
//               ),
//             ),
           
//           ],
         
//         ),


    body:
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,primary: true,
      children: [



//  Stack(children: [
//  Image.asset("assets/image/balanceimg1.png"),


//  Center(
//    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//    mainAxisAlignment: MainAxisAlignment.center,
   
   
//      children: [
//    SizedBox(height:10)
// ,           Text("Current Balance",style: CustomTextStyle.popinstextsmall124,),
//       SizedBox(height:2),
      
          
//                 Text("₹ ${balancecontoller.walletBalance}",style: CustomTextStyle.yellowtextbold,
//                 ),
          
//               //  SizedBox(height:2,),
              

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
// await balancecontoller.addWalletsalesinit();

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
//      ],
   
//    ),
//  ),
  
//     ],),
       

  //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),   
    // Text("Transactions",style:CustomTextStyle.popinsmedium),
 SizedBox(height: MediaQuery.of(context).size.height*0.02,), 



         GetBuilder<TransactionController>(
            init: transactionsalescontroller,
            builder: (_) {

        return  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:  transactionsalescontroller.salestransactionmodel!.data!.length,
                    itemBuilder: (context, index) {
                      var item =   transactionsalescontroller.salestransactionmodel!.data![transactionsalescontroller.salestransactionmodel!.data!.length -
                              1 -
                              index];
            return transactionsalescontroller.salestransactionmodel!.data!.isEmpty?
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
  
                  Image.asset("assets/image/girlimg1.png",height: 58,)
  
                ],)
   
,SizedBox(width: 15,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
 Text("John Smith",style: CustomTextStyle.popinsboldlight,),
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
      }
    )



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
    ),)  
    ;
  }
}