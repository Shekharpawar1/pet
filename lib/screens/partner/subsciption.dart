import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/subscription_controller.dart';
import 'package:pet/screens/partner/partnerpayment.dart';
import 'package:pet/screens/partner/payment.dart';
import 'package:pet/screens/partner/subsciptionpage2.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  SubscriptionController subscriptioncontroller = SubscriptionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            "Subscribe for Premium Features",
            style: CustomTextStyle.popinsmedium,
          ),
          //  SizedBox(height: MediaQuery.of(context).size.height*0.01),
          Text(
            "Protect up to 10 devices with all features",
            style: CustomTextStyle.popinsboldlightsmall,
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("assets/image/subcriptionimg.png"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          //  GetBuilder<SubscriptionController>(
          //                   init: subscriptioncontroller,
          //                   builder: (_) {
          //
          //
          // subscriptioncontroller
          //                           .subscriptionModel == null?SizedBox():
          Container(
            height: Get.height * 0.17,
            child: GetBuilder<SubscriptionController>(
                init: subscriptioncontroller,
                builder: (_) {
                  return subscriptioncontroller.subscriptionModel == null ||
                          subscriptioncontroller.subscriptionModel!.data! ==
                              null ||
                          subscriptioncontroller
                              .subscriptionModel!.data!.isEmpty
                      ? SizedBox()
                      : ListView.builder(
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: subscriptioncontroller
                              .subscriptionModel!.data!.length,
                          itemBuilder: (context, index) {
                            var item = subscriptioncontroller
                                .subscriptionModel!.data![index];
                            return subscriptioncontroller
                                        .subscriptionModel!.data! ==
                                    null
                                ? SizedBox()
                                :

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onLongPress: () {
                                         Get.to(subsciptionpage2(
                                          // id:item.id??0,
                                           plantime:item.plantime??'',
                                          description: item.description ?? '',
                                          // price: item.price??'',
                                        ));
                                      },
                                      onTap: () {
                                        DateTime initialDate = DateTime
                                            .now();
                                             // Replace with your initial date
print("item.price: ${item.plantime}");
                                        if (item.plantime == "Monthly") {
                                          initialDate = initialDate
                                              .add(Duration(days: 30));
                                          // subscriptioncontroller.plantype1;
                                        } else if (item.plantime ==
                                            "Half-Yearly") {
                                          initialDate = initialDate
                                              .add(Duration(days: 30 * 6));
                                        } else if (item.plantime == "Annual") {
                                          initialDate = initialDate
                                              .add(Duration(days: 365));
                                        }
                                        // DateTime expirationDate = initialDate;
                                        
print("initialDate: $initialDate"); // Debugging statement

// print("expDate: $expirationDate"); // Debugging statement

                                        subscriptioncontroller
                                            .updateSelectedIndex(
                                                item.id ?? 0,
                                                item.price ?? '',
                                                item.pname ?? '',
                                                item.plantime ?? '',
                                                item.limit ?? '',
                                                item.advertisement ?? '',
                                                initialDate, item.image??'');
// subscriptioncontroller.Dateinit();
                                        // Get.to(subsciptionpage2(
                                        //   // id:item.id??0,
                                        //   // plantime:item.plantime??'',
                                        //   description: item.description ?? '',
                                        //   // price: item.price??'',
                                        // ));
                                      },
                                      child: Container(
                                        // height: 100,
                                        //  width: 150,

                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              // spreadRadius: 2,
                                              // blurRadius: 7,
                                              offset: Offset(
                                                  0, 3), // Offset of the shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: (subscriptioncontroller
                                                      .selectedIndex ==
                                                  item.id)
                                              ? LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0xff3faafe),
                                                      Color(0xff1789e3)
                                                    ]

                                                  // subscriptioncontroller.toggle()

                                                  //
                                                  )
                                              : LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0xFFEEEEFF),
                                                      Color(0xFFEEEEFF)
                                                    ]

                                                  // subscriptioncontroller.toggle()

                                                  //
                                                  ),
                                        ),
                                        //  ,MyColors.white ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Container(
                                              //   width: 45,
                                              //   height: 25,

                                              //   decoration: BoxDecoration(
                                              //       borderRadius: BorderRadius.only(
                                              //           topLeft: Radius.circular(10),
                                              //           bottomRight: Radius.circular(15)),
                                              //       color: Color(0xfff95fae)),
                                              //   child: Center(
                                              //       child: Text(
                                              //     "50% Off",
                                              //     style: CustomTextStyle.popinstextsmall12,
                                              //   )),
                                              // ),

                                              Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      item.pname ?? '',
                                                      style: (subscriptioncontroller
                                                                  .selectedIndex ==
                                                              item.id)
                                                          ? CustomTextStyle
                                                              .yellowtextnormal
                                                          : CustomTextStyle
                                                              .popinsboldlightsmall,
                                                    ),

                                                    // Text(
                                                    //   "₹${item.price}",
                                                    //   style: (subscriptioncontroller.selectedIndex == item.id)? CustomTextStyle.popinstextsmall124:CustomTextStyle.popinsboldlightsmall,
                                                    // ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "₹${item.price}",
                                                          style: (subscriptioncontroller
                                                                      .selectedIndex ==
                                                                  item.id)
                                                              ? CustomTextStyle
                                                                  .yellowtextnormal
                                                              : CustomTextStyle
                                                                  .popinsboldlightsmall,
                                                        ),
                                                        Text(
                                                          "/${item.plantime}",
                                                          style: (subscriptioncontroller
                                                                      .selectedIndex ==
                                                                  item.id)
                                                              ? CustomTextStyle
                                                                  .popinstextsmall124
                                                              : CustomTextStyle
                                                                  .popinsboldlightsmall,
                                                        ),
                                                      ],
                                                    ),

                                                    Text(
                                                      "Product Upload limit/ ${item.limit}",
                                                      style: (subscriptioncontroller
                                                                  .selectedIndex ==
                                                              item.id)
                                                          ? CustomTextStyle
                                                              .popinstextsmall124
                                                          : CustomTextStyle
                                                              .popinsboldlightsmall,
                                                    ),
                                                    Text(
                                                      "${item.advertisement} advertisement ",
                                                      style: (subscriptioncontroller
                                                                  .selectedIndex ==
                                                              item.id)
                                                          ? CustomTextStyle
                                                              .popinstextsmall124
                                                          : CustomTextStyle
                                                              .popinsboldlightsmall,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                            ;
                            // InkWell(
                            //   onTap: () {
                            //     Get.to(subsciptionpage2());
                            //   },
                            //   child: Container(
                            //       height: 95,
                            //       width: 140,
                            //       decoration: BoxDecoration(
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.grey.withOpacity(0.3),
                            //               spreadRadius: 3,
                            //               blurRadius: 7,
                            //               offset: Offset(0, 3), // Offset of the shadow
                            //             ),
                            //           ],
                            //           borderRadius: BorderRadius.circular(15),
                            //           color: MyColors.white),
                            //       child: Center(
                            //         child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Text(
                            //               item.plantime??'',
                            //               style: CustomTextStyle.popinsboldlightsmall,
                            //             ),
                            //             SizedBox(
                            //               height: 2,
                            //             ),
                            //             Text(
                            //               "\$490.00",
                            //               style: CustomTextStyle.popinssmall0,
                            //             ),
                            //             // Text("\$49.00/month",style: CustomTextStyle.popinstextsmall12,)
                            //           ],
                            //         ),
                            //       )),
                            // )

                            //   ],
                            // );
                          });
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),

          InkWell(
            onTap: ()async{
            //   (subscriptioncontroller .selectedIndex == 0)?
            //  Text("Please select the plan"):
           await  subscriptioncontroller.purchaseinit();
              Get.to(Paymentpartner(
                 price: subscriptioncontroller.price1??'',
              ));
          
            
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPetDetails()));
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: MyColors.yellow,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                  "Proceed",
                  style: CustomTextStyle.mediumtextreem,
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
