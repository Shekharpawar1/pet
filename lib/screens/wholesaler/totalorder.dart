import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
import 'package:pet/controllers/wholesaler_controller/totalorderwhole_controller.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/payment.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/orderDetails.dart';

class TotalOrder extends StatefulWidget {
  const TotalOrder({super.key});

  @override
  State<TotalOrder> createState() => _TotalOrderState();
}

class _TotalOrderState extends State<TotalOrder> {
  TextEditingController _searchcontroller = TextEditingController();
    MyCartWholeController mycartwholeController = Get.put(MyCartWholeController());
WholeTotalOrderController wholetotalordercontroller = Get.put(WholeTotalOrderController());

  WholeMyOrderController wholemyordercontroller = Get.put(WholeMyOrderController());
String? selectone;

  String paymentMethod = '';
  bool includeGST = false;
  String paymentDate = '';
  
   void _showPaymentDialog(double orderamount, int orderid ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Payment'),
                onTap: (){
                   Get.to(Paymentwhole(price:orderamount, ));
                },
                leading: Radio(
                  value: 'payment',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                      Navigator.of(context).pop(); // Close the current dialog
                      // _showCashDialog();
                      Get.to(Paymentwhole(price:orderamount));
                    });
                  },
                ),
              ),
//               ListTile(
//                 title: Text('Wallet'),
//                 onTap: () async {

//                       // print("CashAA ${selectone}");
//                       wholetotalordercontroller.updateAmountStatus(
//                          'offline' 
//                           );

// wholetotalordercontroller.updateOrder(orderid,orderamount.toInt());
// await wholetotalordercontroller. walletinit() ;
//                 },
//                 leading: Radio(
//                   value: 'wallet',
//                   groupValue: paymentMethod,
//                   onChanged: (value) {
//                     setState(() {
//                       paymentMethod = value!;
//                       // includeGST = false;
//                       Navigator.of(context).pop(); // Close the current dialog
//                     });
//                   },
//                 ),
//               ),
         


           ],
          ),
          actions: <Widget>[
    TextButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
      child: Text('Close'),
    ),
  ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: CustomAppBarWholeback(
         title: "Total Order",
      ),
      body:

       GetBuilder<WholeTotalOrderController>(
                           init: wholetotalordercontroller,
                           builder: (_) {
                            
                            return SingleChildScrollView(
             child: Column(
                 children:[
                 
                   wholetotalordercontroller.
                   wholetotalorderModel == null ? SizedBox() :
                              
                          ListView.builder(
                                           shrinkWrap: true,
                                           physics: NeverScrollableScrollPhysics(),
                                           itemCount:wholetotalordercontroller.
                                           wholetotalorderModel!.data!.length,
                                           itemBuilder: (context, index) {
                                            var item = wholetotalordercontroller.
                                           wholetotalorderModel!.data![index];
                             
                                           return wholetotalordercontroller.
                                           wholetotalorderModel!.data == null
                                                ? SizedBox()
                                                : 
                             GestureDetector(onTap: (){
                                                 wholemyordercontroller.addorder(item.id??0);
                            print("Orderid ${item.id}");
                           wholemyordercontroller.orderdetailsinit();
                          
                                              
                                            },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:10.0,right:8,bottom:10),
                                                child: Container(
                                    width: double.infinity,
                                    
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                      gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: [
                               Color(0xFFEEEEFF),
                             Color.fromRGBO(238, 238, 255, 0.00),
                           ],
                           stops: [0.0, 1.0],
                                                 ),
                                    ),
                                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      
                                      children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                                        
                                    
                                        Container(
                                         //alignment: Alignment.topRight,
                                         height: MediaQuery.of(context).size.height*0.05,
                                         width: MediaQuery.of(context).size.width*0.3,
                                         decoration: BoxDecoration(color:(item.orderStatus == "pending") ?MyColors.orange :MyColors.green1,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(20))),
                                        child: Center(child: Text(item.orderStatus??'',style: CustomTextStyle.popinstextsmall12,)), ),
                                        
                                    
                                    
                                     
                                                 ],),
                                         
                                         SizedBox(height: 10,),
                                    
                                    
                                         Row(
                                                 
                                                 children: [
                                    
                                                 Image.asset("assets/image/logocanine.png",
                                    height:80,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    
                                      children: [
                                    
                                    
                                    Row(
                                      children: [
                                       Text("Order ID : ${item.id.toString()}",style:CustomTextStyle.popinsmedium,),
                                    SizedBox(  width: MediaQuery.of(context).size.width*0.11,),
                                        Text("₹${double.parse(item.orderAmount??"0.0").toString()}",style:CustomTextStyle.popinsmedium,),
                                      ],
                                    ),
                                    
                                    
                                    Row(
                                      children: [
                                       Text("Payment status :  ${item.paymentStatus.toString()}",style:CustomTextStyle.popinssmall0,),
                                       SizedBox(  width: MediaQuery.of(context).size.width*0.08,),
                                        // Text("2+ more",style:CustomTextStyle.popinssmall0,),
                                      ],
                                    ),
                                    
                                    Text("Coupon Title : ${item.couponDiscountTitle}",style:CustomTextStyle.popinssmall0,),
                                    Text("Delivery Address : ${
                                     item.deliveryAddress
                                                                          .toString()
                                                                          .length <
                                                                      25
                                                                  ? item
                                                                      .deliveryAddress!
                                                                  : item
                                                                      .deliveryAddress!
                                                                      .substring(
                                                                          0,
                                                                          19)
                                    }",textAlign: TextAlign.left,
                                    style:CustomTextStyle.popinssmall0,),
                                    ],) ,
                                      
                                                
                                         ],),
                                    
                                         Padding(
                                                 padding: const EdgeInsets.only(left:17),
                                                 child: Text("Wholeseller",style:CustomTextStyle.popinssmall1,),
                                         ),
                                    
                                         Padding(
                                                 padding: const EdgeInsets.only(left:15,right:15),
                                                 child: Card(elevation: 1.5,
                           shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(21.0),
                                      ),
                           child: 
                          //  item.callback...map()
                           Container(
                                 width: MediaQuery.of(context).size.width * .8,
                                   height:  MediaQuery.of(context).size.height*0.16,
                                   decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
                                     padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
                                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                       
                                       children: [
                                   
                                       
                                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text("Nity Make",style:CustomTextStyle.popinsmedium,),
                                    Container(height: 30,width: 30,
                                    decoration: BoxDecoration(
                                      
                                         shape: BoxShape.circle,
                                      border: Border.all(
                            color:MyColors.yellowcir,
                            width:1.0,
                          ),
                                    ),
                                    // child:Center(child: Text("05"))
                                    )
                                        
                                           ],
                                    
                                          
                                         ),
                                    
                                    
                                    
                                    Row(children: [
                                    SvgPicture.asset("assets/image/yellowstar.svg"),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/yellowstar.svg"),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/yellowstar.svg"),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/yellowstar.svg"),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/yellowstar.svg"),
                                    SizedBox(width: 5,),
                                    Text("4.5")
                                    ],)
                                    
                                    ,SizedBox(height: 5,),
                           Text("Lorem Ipsum is simply dummy text of the printing and typesetting",style: CustomTextStyle.popinssmall01,)               
                                     ],),
                                   )
                                   ),
                                                 ),
                                         )
                                
                                 ,
                                 
                                 if(item.paymentStatus == "unpaid")
                                 InkWell(
                          
                                  onTap: (){
                          
                          _showPaymentDialog(double.parse(item.orderAmount??'').toDouble(),item.id??0,);
                          
                          wholetotalordercontroller.updateOrder(item.id??0,int.parse(item.orderAmount??''));
                                  },
                                   child: Center(
                                     child: Container(
                                                            width: 130,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        26.405324935913086),
                                                                color:MyColors.yellow
                                                                  ),
                                                            child: Center(
                                                                child: Text(
                                                              "Pay",
                                                              style: CustomTextStyle
                                                                  .popinsbold,
                                                            ))),
                                   ),
                                 ),
                                                 
                                    ],)
                                    ),
                                              ),
                                            );
                                           
                           
                            
                           
                           
                              },)
                
                
                 ],
               ),
           );
         }
       )
      
    );
  }
}