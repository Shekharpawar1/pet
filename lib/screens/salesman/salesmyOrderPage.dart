import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/myOrdersales_controller.dart';
import 'package:pet/controllers/salesman_controller/salesreview_controller.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class MyOrderSales extends StatelessWidget {
  MyOrderSales({super.key, this.wholesellerID});
  int? wholesellerID;
SalesReviewController salesreviewController = Get.put(SalesReviewController());
  SalesMyOrderController myordercontroller = Get.put(SalesMyOrderController());
   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
  SalesMyCartController addtocartController = Get.put(SalesMyCartController());
  
  @override
  void onInit() {
  
        myordercontroller.init();
  }
       
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBarSalesback(title: "My Order",),
        body:
        
          RefreshIndicator(
key: _refreshIndicatorKey,

              onRefresh: () async {
                _refreshIndicatorKey.currentState?.show(atTop: false);
     
        await  myordercontroller.init() ;
   
                await Future.delayed(Duration(seconds: 2));
              },
           child: GetBuilder<SalesMyOrderController>(
              init: myordercontroller,
              builder: (_) {
                return 
              
                myordercontroller.salesmyorderModel
               == null ||   myordercontroller.salesmyorderModel!.data!.isEmpty ? Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount:  myordercontroller.salesmyorderModel!.data!.length,
                      itemBuilder: (context, index) {
                        var item =   myordercontroller.salesmyorderModel!.data![myordercontroller.salesmyorderModel!.data!.length -
                                1 -
                                index];
         
                     
                        return   myordercontroller.salesmyorderModel ==  null || myordercontroller.salesmyorderModel!.data == null
                            ? Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))
                            : 
                            
         
                            GestureDetector(
                              onTap: ()async{
           
            
                                    myordercontroller.addorder(item.id ?? 0);
                                        print("Orderid ${item.id}");
                 myordercontroller.clearFields();
         
            final userProfile = item.callback != null && item.callback!.isNotEmpty
                 ? item.callback![0].userProfile
                 : null;
             final firstName = userProfile != null 
                 ? userProfile[0].fName ?? 'No Name'
                 : 'No Name';
             final lastName = userProfile != null 
                 ? userProfile[0].lName ?? 'No Name'
                 : 'No Name';
             final phone = userProfile != null
                 ? userProfile[0].phone ?? 'No Number'
                 : 'No Number';
             final email = userProfile != null
                 ? userProfile[0].email ?? 'No Email'
                 : 'No Email';
         
                 print("Userrr${userProfile}");
                 print("fname${firstName}");
                                        myordercontroller.orderdetailsinit();
                                        // myordercontroller. orderdetailsupdateTotal();
                                        salesreviewController.reviewAdd(
                                            item.callback![0].itemId??0, item.id ?? 0);
                                        await salesreviewController.init();
                                
              
                                        Get.to(OrderDetailssales(
                                          orderId: item.id ?? 0,
                                          couponcode: item.couponCode ?? '',
                                          paymentmethod: item.paymentMethod ?? '',
                                          orderstatus: item.orderStatus ?? '',
                                          orderAmount: item.orderAmount,
                                            fname: firstName,
                                          lname: lastName,
                                          phone: phone,
                                          email: email,
                                         
                                            address: item.deliveryAddress ?? '',
                                          delivered: item.delivered ?? '',
                                          deliverycharge: item.deliveryCharge??'',
                                        ));
                   
                            
                            
                              },
                              child:  
                              Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10),
      height: Get.height * 0.22,
      width: Get.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: MyColors.grey, width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: MyColors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left:15.0,bottom: 15,top:15),
                                                child: Container(
                                                  width: Get.width * 0.24,
                                                  child: Image.asset(
                                                    "assets/image/logocanine.png",
                                                    // height: 80,
                                                  ),
                                                 
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "OrderId: ${(item.id ?? 0).toString()}",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  Text(
                                                    "CouponCode : ${item.couponCode ?? ''}",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  Text(
                                                    "Payment Status: ${item.paymentMethod ?? ''}",
                                                    style: CustomTextStyle
                                                        .popinsmedium,
                                                  ),
                                                  SizedBox(width: Get.width*0.55,
                                                    child: Text(
                                                        "Order Status: ${item.orderStatus ?? ''}",
                                                        maxLines: 1,
                                                             overflow: TextOverflow.ellipsis,
                                                        style: CustomTextStyle
                                                            .popinsmedium),
                                                  ),
                                                  Text(
                                                      "Order Type: ${(item.orderType ?? 0)}"
                                                          .toString(),
                                                      style: CustomTextStyle
                                                          .popinsmedium),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount: ₹${item.orderAmount ?? ''}",
                                                        style: CustomTextStyle
                                                            .popinsmedium,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )));
      
                             
                                   
                }  ),
                            );
                      }),
         ),
              );
            
  }
}
