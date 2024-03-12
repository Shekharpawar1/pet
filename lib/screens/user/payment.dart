import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/screens/user/myOrderPage.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/payment2.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:pet/screens/user/userUpiScreen.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment2.dart';

enum Choose { upi, cash, phonepay, paytm }

class PaymentUser extends StatefulWidget {
  PaymentUser(
      {super.key, required this.price, this.orderstatus, this.paymentstatus,required this.screenName
      //  this.deliveredstatus,
      //  this.deliveredId,this.deliveredAddress,this.cart,this.couponcode,
      //  this.ordertype,this.totaltexamount,this.coupondiscountamount,
      //  this.coupondiscounttitle,this.orderstatus, this.storeId
      });
  double price;
  String screenName;

  // String? deliveredstatus;
  // int? deliveredId;
  // String? deliveredAddress;
  // List<dynamic>? cart;
  // String? ordertype;
  // String? couponcode;
  // String? totaltexamount;
  // String? coupondiscountamount;
  // String? coupondiscounttitle;
  String? orderstatus;
  String? paymentstatus;
  // int? storeId;

  @override
  State<PaymentUser> createState() => _PaymentUserState();
}

class _PaymentUserState extends State<PaymentUser> {
  MyCartController mycartController = Get.put(MyCartController());

  // String? selectedGender;
  String? selectupi;
  String? selectcredit;
  String? selectphoepay;
  String? selectpaytm;
  // bool _isOn = false;
  Choose? selectone;

  @override
  Widget build(BuildContext context) {
    print("Price");
    print(widget.price ?? '');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
          "Payment",
          style: TextStyle(
            fontSize: 16,
            color: MyColors.black,
            fontWeight: FontWeight.w700,
          ),
        )),
        // actions: [
        //   //  SvgPicture.asset("assets/image/girl.svg"),

        //   // SizedBox(width: 20),
        //   InkWell(
        //       onTap: () {
        //         Get.to(NotificationWhole());
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(right:20.0),
        //         child: SvgPicture.asset("assets/image/notification.svg"),
        //       )),
        // ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                // Image.asset("assets/image/creditcard.png"),
                Container(
                  width: 335,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: Choose.upi,
                          groupValue: selectone,
                          onChanged: (Choose? value) {
                            setState(() {
                              selectone = value!;
                            });
                          }),
                      Image.asset("assets/image/upi.png", height: 40),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  width: 335,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: Choose.cash,
                          groupValue: selectone,
                          onChanged: (Choose? value) {
                            setState(() {
                              selectone = value!;
                            });
                          }),
                      Image.asset("assets/image/house.png", height: 40),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        "Cash",
                        style: CustomTextStyle.popinssmall0,
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                InkWell(
                  onTap: () async {
                    if (selectone == Choose.upi) {
                      print("UPI payment");

                      mycartController.addpaymenttype(
                        selectone == Choose.upi ? 'online' : "offline",
                        selectone == Choose.cash ? "paid" : "unpaid",
                        selectone == Choose.upi ? 'upi' : "cash",
                      );
                      /// phone pay gateway function
                      ///  await mycartController.initPayment();
                      ///  then startPgTransaction()
                      ///  await startPgTransaction()
                      ///  
                      Get.to(UserUpiScreen(amount: (widget.price)));

                    } else if (selectone == Choose.cash) {
                      print("Cash payment");
                      mycartController.addpaymenttype(
                        selectone == Choose.cash ? 'offline' : "online",
                        selectone == Choose.cash ? "unpaid" : "paid",
                        selectone == Choose.cash ? 'cash' : "upi",
                      );
                      try {
                        await mycartController.placeorder();

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              // title:  Text("Login"),

                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "assets/image/success.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Order Placed Successfully"),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      mycartController.init();
                                      // Get.close();
                                      Get.offAll(HomeUser());
                                      Get.to(MyOrderUser());
                                    },
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Ok")),
                                  )
                                ],
                              ),
                            );
                          },
                        );

                        Get.offAll(MyOrderUser());
                      } catch (e) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "assets/image/multiply.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Failed"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: MyColors.yellow,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        "Next",
                        style: CustomTextStyle.mediumtextreem,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          GetBuilder<MyCartController>(
              init: mycartController,
              builder: (_) {
                return mycartController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      )
                    : SizedBox();
              }),
          // Progress bar
          GetBuilder<MyCartController>(
              init: mycartController,
              builder: (_) {
                return mycartController.showLoading
                    ? Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : SizedBox();
              }),
        ],
      ),
    );
  }
}

// ListTile(
//                               title: Text("Myself"),
//                               leading: Radio(
//                                   value:"",
//                                 //  activeColor: buttoncolor,
//                                   groupValue: select,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       select = value.toString();

//                                     });
//                                   }),
//                             ),
