import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/salesUpiScreen.dart';
import 'package:pet/screens/salesman/salesmyOrderPage.dart';
import 'package:pet/screens/user/myOrderPage.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/payment2.dart';
import 'package:pet/screens/user/userUpiScreen.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/payment2.dart';

enum Choose { upi, cash, phonepay, paytm }

class PaymentSales extends StatefulWidget {
  PaymentSales(
      {super.key, required this.price, this.orderstatus, this.paymentstatus
      //  this.deliveredstatus,
      //  this.deliveredId,this.deliveredAddress,this.cart,this.couponcode,
      //  this.ordertype,this.totaltexamount,this.coupondiscountamount,
      //  this.coupondiscounttitle,this.orderstatus, this.storeId
      });
  String price;

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
  State<PaymentSales> createState() => _PaymentSalesState();
}

class _PaymentSalesState extends State<PaymentSales> {
  SalesMyCartController mycartController = Get.put(SalesMyCartController());

  // String? selectedGender;
  String? selectupi;
  String? selectcredit;
  String? selectphoepay;
  String? selectpaytm;
  // bool _isOn = false;
  Choose? selectone;

  String paymentMethod = '';
  bool includeGST = false;
  String paymentDate = '';

  void _showDateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text('Select Payment Duration'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('6 Days'),
                leading: Radio(
                  value: '6',
                  groupValue: paymentDate,
                  onChanged: (value) {
                    setState(() {
                      paymentDate = value!;
                      includeGST = false;
                      paymentMethod = '';
                      Navigator.of(context).pop(); // Close the current dialog
                      _showPaymentDialog();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('14 Days'),
                leading: Radio(
                  value: '14',
                  groupValue: paymentDate,
                  onChanged: (value) {
                    setState(() {
                      paymentDate = value!;
                      includeGST = false;
                      paymentMethod = '';
                      Navigator.of(context).pop(); // Close the current dialog
                      _showPaymentDialog();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('45 Days'),
                leading: Radio(
                  value: '45',
                  groupValue: paymentDate,
                  onChanged: (value) {
                    setState(() {
                      paymentDate = value!;
                      includeGST = false;
                      paymentMethod = '';
                      Navigator.of(context).pop(); // Close the current dialog
                      _showPaymentDialog(); // Close the current dialog
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPaymentDialog() {
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
                title: Text('Cash'),
                leading: Radio(
                  value: 'Cash',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                      Navigator.of(context).pop(); // Close the current dialog
                      _showCashDialog();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('UPI'),
                leading: Radio(
                  value: 'UPI',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                      includeGST = false;
                      Navigator.of(context).pop(); // Close the current dialog
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Check'),
                leading: Radio(
                  value: 'Check',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                      includeGST = false;
                      Navigator.of(context).pop(); // Close the current dialog
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCashDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text('Cash Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('With GST'),
                leading: Radio(
                  value: true,
                  groupValue: includeGST,
                  onChanged: (value) {
                    setState(() {
                      includeGST = value!;
                      Navigator.of(context).pop(); // Close the current dialog
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Without GST'),
                leading: Radio(
                  value: false,
                  groupValue: includeGST,
                  onChanged: (value) {
                    setState(() {
                      includeGST = value!;
                      Navigator.of(context).pop(); // Close the current dialog
                    });
                  },
                ),
              ),
            ],
          ),
          // actions: <Widget>[
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(); // Close the current dialog
          //     },
          //     child: Text('Cancel'),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(); // Close the current dialog
          //       // Handle the selected payment method and GST preference here
          //       print('Selected Payment Method: $paymentMethod');
          //       print('Include GST: $includeGST');
          //     },
          //     child: Text('OK'),
          //   ),
          // ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
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
                            
                            _showDateDialog();
                            print('Selected Payment Method: $paymentMethod');
                            print('Include GST: $includeGST');
                          }),
                      Image.asset("assets/image/house.png", height: 40),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                      "Pay later",
                        style: CustomTextStyle.popinssmall0,
                      )
                    ],
                  ),
                ),
                 paymentMethod != ""
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Duration: $paymentDate Days, Method: $paymentMethod With GST $includeGST"),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Container(
                //   width: 335,
                //   height: 53,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(55),
                //       gradient: LinearGradient(
                //         begin: Alignment.centerLeft,
                //         end: Alignment.centerRight,
                //         colors: [Color(0xfffdcbcc), Color(0x42fdcbcc)],
                //       )),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Radio(
                //           value: Choose.phonepay,
                //           groupValue: selectone,
                //           onChanged: (Choose? value) {
                //             setState(() {
                //               selectone = value!;
                //             });
                //           }),
                //       Image.asset("assets/image/phonepay1.png", height: 25),
                //     ],
                //   ),
                // ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Container(
                //   width: 335,
                //   height: 53,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(28),
                //       gradient: LinearGradient(
                //         begin: Alignment.centerLeft,
                //         end: Alignment.centerRight,
                //         colors: [Color(0xffffead2), Color(0x56ffead2)],
                //       )),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Radio(
                //           value: Choose.paytm,
                //           groupValue: selectone,
                //           onChanged: (Choose? value) {
                //             setState(() {
                //               selectone = value!;
                //             });
                //           }),
                //       Image.asset("assets/image/paytm.png", height: 25),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),
                InkWell(
                  onTap: () async {
                    // print(selectone == Choose.upi);
                    if (selectone == Choose.upi) {
                      print("UPI payment");
                      mycartController.addpaymentPopup(
                          paymentDate,includeGST, paymentMethod
                          );
                      mycartController.addpaymenttype(
                        selectone == Choose.upi ? 'online' : "offline",
                        selectone == Choose.cash ? "paid" : "unpaid",
                      );

                      Get.to(
                          SalesUpiScreen(amount: double.tryParse(widget.price.toString())));
                    } else if (selectone == Choose.cash) {
                      print("Cash payment");
                         mycartController.addpaymentPopup(
                          paymentDate,includeGST, paymentMethod
                          );
                      mycartController.addpaymenttype(
                          selectone == Choose.cash ? 'offline' : "online",
                          selectone == Choose.cash ? "unpaid" : "paid");
                      await mycartController.salesplaceorder();

                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            // title:  Text("Login"),

                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons
                                        .close), // You can use any close icon you prefer
                                    onPressed: () {
                                      Get.back(); // Close the dialog
                                    },
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "assets/image/success.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Order Placed Successfully"),
                                  ),
                                
SizedBox(height: 10)
,
                                InkWell(
                                  onTap:(){
                                     mycartController.init();

                                       Get.offAll(HomeSales());
                                       Get.to(MyOrderSales());
                                           
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

                      Get.to(MyOrderSales());
                     
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
          GetBuilder<SalesMyCartController>(
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
          GetBuilder<SalesMyCartController>(
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
                 