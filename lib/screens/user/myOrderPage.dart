import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

import '../../controllers/user_controller/addtocartcontroller.dart';

class MyOrderUser extends StatelessWidget {
  MyOrderUser({super.key});

  final MyOrderController myordercontroller = Get.put(MyOrderController());

  final MyCartController mycartController = Get.put(MyCartController());
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
  
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());

  @override
  void onInit() {
  
     myordercontroller.init() ;
  }
        
                 
  @override
  Widget build(BuildContext context) {
    //  myordercontroller.init() ;
    return Scaffold(
      appBar: 
      CustomAppBarback(title:"My Order"),

      
      body:   myordercontroller.myorderModel == null? SizedBox(): 
        RefreshIndicator(
key: _refreshIndicatorKey,

              onRefresh: () async {
                _refreshIndicatorKey.currentState?.show(atTop: false);
     
        await  myordercontroller.init() ;
   
                await Future.delayed(Duration(seconds: 2));
              },
        child:
        GetBuilder<MyOrderController>(
            init: myordercontroller,
            builder: (_) {
              return myordercontroller.myorderModel!.data!.isEmpty 
                    
                  ? SizedBox(
                      child: Center(
                          child: Image.asset("assets/image/nodataimg.png",
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width)))
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          // primary: true,
                          // shrinkWrap: true,
                          
                          itemCount: myordercontroller.myorderModel!.data!.length,
                          itemBuilder: (context, index) {
                            var item = myordercontroller.myorderModel!.data![
                                myordercontroller.myorderModel!.data!.length -
                                    1 -
                                    index];
      
                            print(
                                "=======>>>>>>>>>>>>  len  ${item.paymentMethod}");
                            print(
                                "=======>>>>>>>>>>>>  coupon  ${item.couponCode}");
                            // String imagePath =
                            //       Constants.PRODUCT_HOME_IMAGE_PATH +
                            //           "/${item.!}";
                            return myordercontroller.myorderModel!.data == null
                                ? const SizedBox()
                                : GestureDetector(
                                    onTap: () async {
                                         myordercontroller.clearFields();
                                      myordercontroller.addorder(item.id ?? 0);
                                      print("Orderid ${item.id}");
      
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
                                      userreviewcontroller.reviewAdd(
                                          0, item.id ?? 0);
                                      await userreviewcontroller.init();
                                      // print(   ""+(item.callback![0].userProfile![0]
                                      //           .fName ??
                                      //       ''),);
       userreviewcontroller.reviewAdd(
                                      0,
                                       item.id??0);
       await mycartController.alladdressinit();
              await myordercontroller.getDeliveryAddress1(item.deliveryAddressId.toString());
              String deliveryAddress=myordercontroller.address.value;
              // print("couponamount${item.couponDiscountAmount??'0.0'}");
              // String? couponsAmount1=(item.couponDiscountAmount == null)? 0.0:item.couponDiscountAmount;
            ///  String couponAmount1=(item.couponDiscountAmount == null)? '0.0':item.couponDiscountAmount;
              print("new Delivery address ${deliveryAddress}");
                                      Get.to(OrderDetailsUser(
                                        storeId:item.storeId ?? 0,
                                        orderId: item.id ?? 0,
                                        couponcode: item.couponCode ?? '',
                                        coupondisAmount :(item.couponDiscountAmount == null)?'0.0':item.couponDiscountAmount,
                                        paymentmethod: item.paymentMethod ?? '',
                                        orderstatus: item.orderStatus ?? '',
                                        orderAmount: item.orderAmount??"",
                                        fname: firstName,
                                        lname: lastName,
                                        phone: phone,
                                        email: email,
                                        address:deliveryAddress ?? '',
                                        delivered: item.delivered ?? '',
                                        deliverycharge: item.deliveryCharge??'',
                                      ));
                                      print("Name");
                                      // print(item.callback![0].userProfile![0]
                                      //         .fName ??
                                      //     '');
                                    },
                                    child: Container(
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
      
                           
                          }),
                    );
            }),
      ),
    );
  }
}
