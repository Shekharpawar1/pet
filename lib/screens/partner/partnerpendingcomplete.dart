import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet/controllers/partner_controller/dashBoard_controller.dart';

import 'package:pet/models/partnerModel/partnerTotalOrderModel.dart' as TotalOrder;
import 'package:pet/models/partnerModel/partnerTotalProductModel.dart' as TotalProduct;
import 'package:pet/screens/partner/widget/wholeAppBar.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
// import 'package:pet/controllers/wholesaler_controller/myOrder_controller.dart';
// import 'package:pet/models/wholesalerModel/myOrderModel.dart' as OrderModel;
// import 'package:pet/screens/wholesaler/orderDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:pet/models/salesmanModel/totalOrderSellerModel.dart' as TotalOrder;


class partnerPendingCompleteSreen extends StatefulWidget {
 
   partnerPendingCompleteSreen({super.key, required this.data});
  List<TotalOrder.Data>? data;
  
  @override
  State<partnerPendingCompleteSreen> createState() => _partnerPendingCompleteSreenState();
}

class _partnerPendingCompleteSreenState extends State<partnerPendingCompleteSreen> {
    TextEditingController _searchcontroller = TextEditingController();
PartnerDashBoardController partnerdashBoardController = Get.put(PartnerDashBoardController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar:CustomAppBarPartnerback(title: (widget.data == null || widget.data!.isEmpty)?'':widget.data![0].orderStatus .toString() ,),
      body:
        widget.data!.isEmpty ? Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
       ListView(
        shrinkWrap: true,
        primary: true,
           children:[
      
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 265,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(17),
            
                      // border: Border.all(color:brandcolor ),
            
                      color: MyColors.white,
                    ),
                    child: TextFormField(
                      controller: _searchcontroller,
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.voliet,
                        fontFamily: "SF-Pro-Display",
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15),
                          fillColor: MyColors.white,
                          focusColor: MyColors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            //  borderRadius: BorderRadius.circular(50),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            //  borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Search",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/image/searchnormal.png",
                              width: 10,
                            ),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
            
                  //  SizedBox(width: 10,),
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffffcc00)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/image/filter3.png",
                        ),
                      ))
                ],
              ),
            ),
//  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

//  GetBuilder<WholeMyOrderController>(
//             init: wholemyordercontroller,
//             builder: (_) {
//               return 
             widget.data == null  ? SizedBox() :

        Padding(
               padding: const EdgeInsets.all(10.0),
               child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount:widget.data!.length,
                    itemBuilder: (context, index) {
                      var item =widget.data![index];
                  
                     return
                    //  (item.orderStatus == "pending")?
                    // widget.data == null
                    //       ? SizedBox()
                    //       : 
                   InkWell(onTap: (){
                       partnerdashBoardController.addorder(item.id??0);
                              print("Orderid ${item.id}");
                             partnerdashBoardController.orderdetailsinit();
                        Get.to(OrderDetailssales(
                          orderId: item.id??0,
                          orderstatus: item.orderStatus??'',

                        ));
                      },
                        child: Container(
                                    // width: 335,
                                     height:  MediaQuery.of(context).size.height*0.4,
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
                                        
                                    
                                        Align(alignment: Alignment.topRight,
                        child: Container(
                         //alignment: Alignment.topRight,
                         height: MediaQuery.of(context).size.height*0.05,
                         width: MediaQuery.of(context).size.width*0.3,
                         decoration: BoxDecoration(color:(item.orderStatus == "pending") ?MyColors.orange :MyColors.green1,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(20))),
                                        child: Center(child: Text(item.orderStatus??'',style: CustomTextStyle.popinstextsmall12,)), ),
                                        ),
                                        
                                    
                                    
                                     
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
                                    SizedBox(  width: MediaQuery.of(context).size.width*0.15,),
                                        Positioned(right:0,child: Text("₹${item.orderAmount.toString()}",style:CustomTextStyle.popinsmedium,)),
                                      ],
                                    ),
                                    
                                    
                                    Row(
                                      children: [
                                       Text("Payment status :  ${item.paymentStatus.toString()}",style:CustomTextStyle.popinssmall0,),
                                       SizedBox(  width: MediaQuery.of(context).size.width*0.08,),
                                        // Text("2+ more",style:CustomTextStyle.popinssmall0,),
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
                                      Text("Delivery Address : ${item.deliveryAddress.toString()}",style:CustomTextStyle.popinssmall0,),
                                     
                                    ],)
                                        
                                        ,
                                      
                        
                                         ],),
                                    
                        //                  Padding(
                        //  padding: const EdgeInsets.only(left:17),
                        //  child: Text("Sales Man",style:CustomTextStyle.popinssmall1,),
                        //                  ),

                                //      ...item.userId!.map((e) {
                
                                // return 
//                                          Padding(
//                          padding: const EdgeInsets.only(left:15,right:15),
//                          child: Card(elevation: 1.5,
//                            shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(21.0),
//                                       ),
//                            child: Container(
//                                  width: MediaQuery.of(context).size.width,
//                                    height:  MediaQuery.of(context).size.height*0.16,
//                                    decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
//                                      padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
//                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                       
//                                        children: [
                                   
                                       
//                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                            children: [
//                                              Text("${e.fName} ${e.lName}",style:CustomTextStyle.popinsmedium,),
//                                     Container(height: 30,width: 30,
//                                     decoration: BoxDecoration(
                                      
//                                          shape: BoxShape.circle,
//                                       border: Border.all(
//                             color:MyColors.yellowcir,
//                             width:1.0,
//                           ),
//                                     ),
//                                     // child:Center(child: Text("05"))
//                                     )
                                        
//                                            ],
                                    
                                          
//                                          ),
                                    
//                                                                Text("${e.phone}",style: CustomTextStyle.popinssmall01,) ,              
//  Text("${e.email}",style: CustomTextStyle.popinssmall01,) ,              

                                    
//                                     Row(children: [
//                                     SvgPicture.asset("assets/image/yellowstar.svg"),
//                                     SizedBox(width: 5,),
//                                     SvgPicture.asset("assets/image/yellowstar.svg"),
//                                     SizedBox(width: 5,),
//                                     SvgPicture.asset("assets/image/yellowstar.svg"),
//                                     SizedBox(width: 5,),
//                                     SvgPicture.asset("assets/image/yellowstar.svg"),
//                                     SizedBox(width: 5,),
//                                     SvgPicture.asset("assets/image/yellowstar.svg"),
//                                     SizedBox(width: 5,),
//                                     Text("4.5")
//                                     ],)
                                    
//                                     ,SizedBox(height: 5,),
//                            Text("${e.businessName}",style: CustomTextStyle.popinssmall01,)               
//                                      ],),
//                                    )
//                                    ),
//                          ),
//                                          );
//                     })
                    ],)
                                    ),
                      );
                    
                
                  // Column(
                  //   children: [
                  //      ...item.userId!.map((e) {
                  //                   // print("=====>>>>> zebra ff ${e.itemDetails![0].image.toString()}");
                  //                    String imagePath = Constants.PRODUCT_HOME_IMAGE_PATH +"/${e.image.toString()}";
                  //                   //  var imagePath  = Constants.PRODUCT_HOME_IMAGE_PATH +
                  //                   //               "/${e.itemDetails![0].image!}";
                                   
                                   
                                   
                  //                   return 
                  //  })
                  //   ],
                  // );
                  // :Text("");
               
            //    SizedBox(height: 15,),
               
            //     Container(
            // width: 335,
            //  height:  MediaQuery.of(context).size.height*0.4,
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(28),
            //   gradient: LinearGradient(
            //          begin: Alignment.topCenter,
            //          end: Alignment.bottomCenter,
            //          colors: [
            //              Color(0xFFFFEAD2),
            //          Color.fromRGBO(255, 234, 210, 0.00),
            //          ],
            //          stops: [0.0, 1.0],
            //        ),
            // ),
            // child:Column(crossAxisAlignment: CrossAxisAlignment.start,
              
            //   children: [
            //   Row(mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
                
            
            //     Align(alignment: Alignment.topRight,
            //       child: Container(
            //        //alignment: Alignment.topRight,
            //        height: MediaQuery.of(context).size.height*0.05,
            //        width: MediaQuery.of(context).size.width*0.3,
            //        decoration: BoxDecoration(color: MyColors.orange,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(20))),
            //     child: Center(child: Text("Pending",style: CustomTextStyle.popinstextsmall12,)), ),
            //     ),
                
            
            
             
            //        ],),
                 
            //      SizedBox(height: 10,),
            
            
            //      Row(
                   
            //        children: [
            
            //        Image.asset("assets/image/logocanine.png",
            // height:80,),
            // Column(crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            
            //   children: [
            
            
            // Row(
            //   children: [
            //    Text("Order ID : 125683",style:CustomTextStyle.popinsmedium,),
            // SizedBox(  width: MediaQuery.of(context).size.width*0.15,),
            //     Positioned(right:0,child: Text("138.00",style:CustomTextStyle.popinsmedium,)),
            //   ],
            // ),
            
            
            // Row(
            //   children: [
            //    Text("Payment status : Completed",style:CustomTextStyle.popinssmall0,),
            //    SizedBox(  width: MediaQuery.of(context).size.width*0.08,),
            //     Text("2+ more",style:CustomTextStyle.popinssmall0,),
            //   ],
            // ),
            
            
            // Text("Order By : Sales Man",style:CustomTextStyle.popinssmall0,),
            // ],)
                
            //     ,
              
                  
            //      ],),
            
            //      Padding(
            //        padding: const EdgeInsets.only(left:17),
            //        child: Text("Sales Man",style:CustomTextStyle.popinssmall1,),
            //      ),
            
            //      Padding(
            //        padding: const EdgeInsets.only(left:15,right:15),
            //        child: Card(elevation: 1.5,
            //          shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(21.0),
            //   ),
            //          child: Container(
            //                width: MediaQuery.of(context).size.width,
            //                  height:  MediaQuery.of(context).size.height*0.16,
            //                  decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
            //                    padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
            //                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 
            //                      children: [
                             
               
            //                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                          children: [
            //                            Text("Nity Make",style:CustomTextStyle.popinsmedium,),
            // Container(height: 30,width: 30,
            // decoration: BoxDecoration(
              
            //      shape: BoxShape.circle,
            //   border: Border.all(
            //           color:MyColors.yellowcir,
            //           width:1.0,
            //         ),
            // ),
            // // child:Center(child: Text("05"))
            // )
                
            //                          ],
            
                                    
            //                        ),
            
            
            
            // Row(children: [
            // SvgPicture.asset("assets/image/yellowstar.svg"),
            // SizedBox(width: 5,),
            // SvgPicture.asset("assets/image/yellowstar.svg"),
            // SizedBox(width: 5,),
            // SvgPicture.asset("assets/image/yellowstar.svg"),
            // SizedBox(width: 5,),
            // SvgPicture.asset("assets/image/yellowstar.svg"),
            // SizedBox(width: 5,),
            // SvgPicture.asset("assets/image/yellowstar.svg"),
            // SizedBox(width: 5,),
            // Text("4.5")
            // ],)
            
            // ,SizedBox(height: 5,),
            //          Text("Lorem Ipsum is simply dummy text of the printing and typesetting",style: CustomTextStyle.popinssmall01,)               
            //                    ],),
            //                  )
            //                  ),
            //        ),
            //      )
            // ],)
            // )
         
         
            },),
                  )
            // })
           ],
         )
      
    );
  }
}