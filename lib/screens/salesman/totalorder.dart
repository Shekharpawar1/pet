import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/dashboard_controller.dart';
import 'package:pet/screens/salesman/home.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/salesman/orderHistory.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/wholesaler/orderDetails.dart';

class TotalOrdersales extends StatefulWidget {
  const TotalOrdersales({super.key});

  @override
  State<TotalOrdersales> createState() => _TotalOrdersalesState();
}

class _TotalOrdersalesState extends State<TotalOrdersales> {
  TextEditingController _searchcontroller = TextEditingController();
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarSalesWholeback(title: "Total Order ",),  body: GetBuilder<DashBoardController>(
            init: dashBoardController,
            builder: (_) {
              return ListView(
                shrinkWrap: true,
                primary: true,
                children: [
                  //  Container(
                  //   decoration:  BoxDecoration(
                  //     image:  DecorationImage(image:  AssetImage("assets/image/background.png"), fit: BoxFit.cover,),
                  //   ),

                  // ),

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

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: dashBoardController
                          .totalordersellerModel!.data!.length,
                      itemBuilder: (context, index) {
                        var item = dashBoardController
                            .totalordersellerModel!.data![index];

                        return dashBoardController
                                    .totalordersellerModel!.data ==
                                null
                            ? SizedBox()
                            : InkWell(
                                onTap: () {
                                  Get.to(OrderDetailssales(
                                    orderId:item.id??0,
                                    orderstatus: item.orderStatus??'',
                                    couponcode: item.couponCode??'',
                                    paymentmethod: item.paymentMethod??'',
                                  ));
                                },
                                child: Container(
                                    width: 335,
                                    margin:EdgeInsets.only(top: 10,bottom:25),
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      gradient: item.orderStatus == "pending"
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFFFEAD2),
                                                Color.fromRGBO(
                                                    255, 234, 210, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            )
                                          : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFEEEEFF),
                                                Color.fromRGBO(
                                                    238, 238, 255, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                //alignment: Alignment.topRight,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                decoration: BoxDecoration(
                                                    color: item.orderStatus ==
                                                            "pending"
                                                        ? MyColors.orange
                                                        : MyColors.green1,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(25),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20))),
                                                child: Center(
                                                    child: Text(
                                                  item.orderStatus.toString(),
                                                  style: CustomTextStyle
                                                      .popinstextsmall12,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/image/logocanine.png",
                                              height: 80,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Order ID : ${item.id.toString()}",
                                                      style: CustomTextStyle
                                                          .popinsmedium,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                    ),
                                                    Positioned(
                                                        right: 0,
                                                        child: Text(
                                                        "₹${item.orderAmount}",
                                                          style: CustomTextStyle
                                                              .popinsmedium,
                                                        )),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "Payment status : ${item.paymentStatus.toString()}",
                                                      style: CustomTextStyle
                                                          .popinssmall0,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                    ),
                                                    // Text("2+ more",style:CustomTextStyle.popinssmall0,),
                                                  ],
                                                ),

                                                // Text("Order By : ${item.userId[0]}",style:CustomTextStyle.popinssmall0,),
                                              ],
                                            ),
                                          ],
                                        ),

                                        //                  Padding(
                                        //  padding: const EdgeInsets.only(left:17),
                                        //  child: Text("Sales Man",style:CustomTextStyle.popinssmall1,),
                                        //                  ),
...item.userId!.map((e) {
                   return                     Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Card(
                                            elevation: 1.5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21.0),
                                            ),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                decoration: BoxDecoration(
                                                    color: MyColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21)),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.0,
                                                      right: 15,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${e.fName} ${e.lName}",
                                                            style: CustomTextStyle
                                                                .popinsmedium,
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: MyColors
                                                                    .yellowcir,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            // child:Center(child: Text("05"))
                                                          )
                                                        ],
                                                      ),
                                                         Text(
                                                      "${e.email}",
                                                        style: CustomTextStyle
                                                            .popinssmall01,
                                                      ),
                                                      Text(
                                                      "${e.phone}",
                                                        style: CustomTextStyle
                                                            .popinssmall01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              "assets/image/yellowstar.svg"),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SvgPicture.asset(
                                                              "assets/image/yellowstar.svg"),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SvgPicture.asset(
                                                              "assets/image/yellowstar.svg"),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SvgPicture.asset(
                                                              "assets/image/yellowstar.svg"),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SvgPicture.asset(
                                                              "assets/image/yellowstar.svg"),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text("4.5")
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                      "${e.businessName}",
                                                        style: CustomTextStyle
                                                            .popinssmall01,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        );

                      }),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, top: 10),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(HomeSales(
                                                    // wholesellerId: item.id??0,
                                                  ));
                                                },
                                                child: Container(
                                                    width: 130,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                26.405324935913086),
                                                        color:
                                                            Color(0xffffcc00)),
                                                    child: Center(
                                                        child: Text(
                                                      "Add Product",
                                                      style: CustomTextStyle
                                                          .popinssmall1,
                                                    ))),
                                              ),
                                              SizedBox(width: 20),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(OrderHistorysales());
                                                },
                                                child: Container(
                                                    width: 130,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                26.405324935913086),
                                                        color: MyColors
                                                            .yellowlight),
                                                    child: Center(
                                                        child: Text(
                                                      "Order History",
                                                      style: CustomTextStyle
                                                          .popinssmall1,
                                                    ))),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
//                SizedBox(height: 15,),

//                 Container(
//             width: 335,
//              height:  MediaQuery.of(context).size.height*0.5,
//             decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(28),
//               gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [
//                          Color(0xFFFFEAD2),
//                      Color.fromRGBO(255, 234, 210, 0.00),
//                      ],
//                      stops: [0.0, 1.0],
//                    ),
//             ),
//             child:Column(crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//               Row(mainAxisAlignment: MainAxisAlignment.end,
//                     children: [

//                 Align(alignment: Alignment.topRight,
//                   child: Container(
//                    //alignment: Alignment.topRight,
//                    height: MediaQuery.of(context).size.height*0.05,
//                    width: MediaQuery.of(context).size.width*0.3,
//                    decoration: BoxDecoration(color: MyColors.orange,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(20))),
//                 child: Center(child: Text("Pending",style: CustomTextStyle.popinstextsmall12,)), ),
//                 ),

//                    ],),

//                  SizedBox(height: 10,),

//                  Row(

//                    children: [

//                    Image.asset("assets/image/logocanine.png",
//             height:80,),
//             Column(crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,

//               children: [

//             Row(
//               children: [
//                Text("Order ID : 125683",style:CustomTextStyle.popinsmedium,),
//             SizedBox(  width: MediaQuery.of(context).size.width*0.15,),
//                 Positioned(right:0,child: Text("138.00",style:CustomTextStyle.popinsmedium,)),
//               ],
//             ),

//             Row(
//               children: [
//                Text("Payment status : Completed",style:CustomTextStyle.popinssmall0,),
//                SizedBox(  width: MediaQuery.of(context).size.width*0.08,),
//                 Text("2+ more",style:CustomTextStyle.popinssmall0,),
//               ],
//             ),

//             Text("Order By : Sales Man",style:CustomTextStyle.popinssmall0,),
//             ],)

//                 ,

//                  ],),

//                  Padding(
//                    padding: const EdgeInsets.only(left:17),
//                    child: Text("Sales Man",style:CustomTextStyle.popinssmall1,),
//                  ),

//                  Padding(
//                    padding: const EdgeInsets.only(left:15,right:15),
//                    child: Card(elevation: 1.5,
//                      shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(21.0),
//               ),
//                      child: Container(
//                            width: MediaQuery.of(context).size.width,
//                              height:  MediaQuery.of(context).size.height*0.16,
//                              decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
//                                padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
//                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,

//                                  children: [

//                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                      children: [
//                                        Text("Nity Make",style:CustomTextStyle.popinsmedium,),
//             Container(height: 30,width: 30,
//             decoration: BoxDecoration(

//                  shape: BoxShape.circle,
//               border: Border.all(
//                       color:MyColors.yellowcir,
//                       width:1.0,
//                     ),
//             ),
//             // child:Center(child: Text("05"))
//             )

//                                      ],

//                                    ),

//             Row(children: [
//             SvgPicture.asset("assets/image/yellowstar.svg"),
//             SizedBox(width: 5,),
//             SvgPicture.asset("assets/image/yellowstar.svg"),
//             SizedBox(width: 5,),
//             SvgPicture.asset("assets/image/yellowstar.svg"),
//             SizedBox(width: 5,),
//             SvgPicture.asset("assets/image/yellowstar.svg"),
//             SizedBox(width: 5,),
//             SvgPicture.asset("assets/image/yellowstar.svg"),
//             SizedBox(width: 5,),
//             Text("4.5")
//             ],)

//             ,SizedBox(height: 5,),
//                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting",style: CustomTextStyle.popinssmall01,)
//                                ],),
//                              )
//                              ),
//                    ),
//                  )

//          ,

//                                          Padding(
//                                            padding: const EdgeInsets.only(left:15,right:15,top: 10  ),
//                                            child: Row(
//                                             children: [
//                                                                              InkWell(
//                                                                               onTap:(){
// Get.to(HomeSales());
//                                                                              },
//                                                                                child: Container(
//                                                                                                                         width: 130,
//                                                                                                                         height: 40,
//                                                                                                                         decoration: BoxDecoration(
//                                                                                                                         borderRadius: BorderRadius.circular(26.405324935913086),
//                                                                                                                         color: Color(0xffffcc00)),
//                                                                                                                         child:Center(child: Text("Add Product",style: CustomTextStyle.popinssmall1,))
//                                                                                                                         ),
//                                                                              ),
//                                          SizedBox(width:20),
//                                              InkWell(
//                                                 onTap:(){
// Get.to(OrderHistorysales());
//                                                                              },
//                                                child: Container(
//                                                                                         width: 130,
//                                                                                         height: 40,
//                                                                                         decoration: BoxDecoration(
//                                                                                         borderRadius: BorderRadius.circular(26.405324935913086),
//                                                                                         color:MyColors.yellowlight),
//                                                                                         child:Center(child: Text("Order History",style: CustomTextStyle.popinssmall1,))
//                                                                                         ),
//                                              )

//                                                                            ],),
//                                          )

//                                        ],)
//             )
                      },
                    ),
                  )
                ],
              );
            }));
  }
}
