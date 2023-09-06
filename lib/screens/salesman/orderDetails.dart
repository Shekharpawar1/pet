import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/dashboard_controller.dart';
import 'package:pet/controllers/salesman_controller/order_tracker_controller.dart';
import 'package:pet/screens/salesman/locationScreenSalesMan.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class OrderDetailssales extends StatefulWidget {
   OrderDetailssales({super.key,   this.orderId, this.orderstatus, this.couponcode,this.paymentmethod});
     int? orderId;
  String? couponcode;
  String? paymentmethod;
  String? orderstatus;
  @override
  State<OrderDetailssales> createState() => _OrderDetailssalesState();
}

class _OrderDetailssalesState extends State<OrderDetailssales> {
  
  DashBoardController dashBoardController = Get.put(DashBoardController());

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:15.0,top: 15,bottom: 15),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },child:Icon(Icons.arrow_left,color:MyColors.black)
            ),
          ),
          title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child:Text("Order Details",style: TextStyle(fontSize: 16,color: MyColors.black,
fontWeight: FontWeight.w700,),)
          ),
          actions: [
          //  SvgPicture.asset("assets/image/girl.svg"),
           
            // SizedBox(width: 20),
            InkWell(
              onTap: (){
 Get.to (NotificationSales());
},
              child: Padding(
                padding:  EdgeInsets.only(right:20.0),
                child: SvgPicture.asset("assets/image/notification.svg"),
                //  Image.asset("assets/image/girl.png"),
              ),
            ),
           
          ],
         
        ),
      
     body:

            Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: GetBuilder<DashBoardController>(
            init: dashBoardController,
                      builder: (_) {
                    
                        return   dashBoardController.salesorderdetailsModel!.data == null?SizedBox():
          ListView( 
                           shrinkWrap: false,
                     primary: true,
          
         
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Image.asset(
                    "assets/image/logocanine.png",
                    height: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Canine Products",
                        style: CustomTextStyle.popinsmedium,
                      ),
                      Text(
                        "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                        style: CustomTextStyle.popinssmall0,
                      ),
                    ],
                  ),
                ],
              ),
              Row(children: [
                Container(
                    width: 134,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFCEE8FC),
                            Color.fromRGBO(206, 232, 252, 0.00),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(37)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("assets/image/file.png"),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "download invoice",
                            style: CustomTextStyle.popinssmall01,
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Container(
                    width: 147,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFBF1C8),
                            Color.fromRGBO(251, 241, 200, 0.00),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(37)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("assets/image/file.png"),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "download summary",
                            style: CustomTextStyle.popinssmall01,
                          )
                        ],
                      ),
                    ))
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                width: 335,
                // height: 300,
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(21)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            //alignment: Alignment.topRight,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                color: (widget.orderstatus == "pending")?MyColors.orange:MyColors.green1,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                                child: Text(
                              widget.orderstatus.toString(),
                              style: CustomTextStyle.popinstextsmall12,
                            )),
                          ),
                        ),
                      ],
                    ),

                         ListView.builder(
                              primary: false,
                           
                              shrinkWrap: true,
                                 itemCount: dashBoardController.salesorderdetailsModel!.data!.length,
                  itemBuilder: (context, index) {
                    var item = dashBoardController.salesorderdetailsModel!.data![index];
                      String imagePath =
                      
                                          Constants.PRODUCT_HOME_IMAGE_PATH +
                                              "/${item.itemDetails![0].image??''}";

                                              print("====>>>>imagepath ${ imagePath}");
return 

Container(
  margin: EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:  CachedNetworkImage(
                                    imageUrl: imagePath, fit: BoxFit.cover,
                                    // width: 61,
                                    // height: 75,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ), // Replace with your own placeholder widget
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons
                                            .error), // Replace with your own error widget
                                  ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   item.??'',
                        //   style: CustomTextStyle.popinsmedium,
                        // ),
                        Text(item.discountType??'',
                            style: CustomTextStyle.popinssmall0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             item.totalAddOnPrice??'',
                              style: CustomTextStyle.popinsmedium,
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                );
                
                }),
 
                         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

//                             Divider(
//                               indent: 1,
//                               thickness: 1,
//                             ),

//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

//                             Divider(
//                               indent: 1,
//                               thickness: 1,
//                             ),
//                             Text(
//                               "Order ID:12568",
//                               style: CustomTextStyle.popinssmall014,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "1 X Food bowl",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "2 X Food Food 5 kg",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                                 Text(
//                                   "\$138.00",
//                                   style: CustomTextStyle.popinssmallnormal,
//                                 ),
//                               ],
//                             ),

// // Divider(indent: 1,thickness: 1,)
//                           ],
//                         ),
//                       )
                 
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style: CustomTextStyle.popinssmall014,
                  ),
                  Text(
                    "\$50",
                    style: CustomTextStyle.popinssmall014,
                  ),
                ],
              ),
              Divider(
                indent: 1,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Moving Cart",
                        style: CustomTextStyle.popinssmall014,
                      ),
                      Text(
                        "Additional Services",
                        style: CustomTextStyle.popinssmallnormal,
                      ),
                    ],
                  ),
                  Text(
                    "\$20",
                    style: CustomTextStyle.popinssmall014,
                  ),
                ],
              ),
              Divider(
                indent: 1,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discount",
                        style: CustomTextStyle.popinssmall014,
                      ),
                      // Text(
                      //     "Promo Code: " +  widget..toString(),
                      //   style: CustomTextStyle.popinssmallnormal,
                      // ),
                    ],
                  ),
                  // Text(
                  //   dashBoardController.salesorderdetailsModel!.data![0].discountOnItem??'',
                  //   style: CustomTextStyle.popinssmall014,
                  // ),
                ],
              ),
              Divider(
                indent: 1,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: CustomTextStyle.popinssmall014,
                  ),
                  Text(
                    "\$138.00",
                    style: CustomTextStyle.popinssmall014,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                "Order Details",
                style: CustomTextStyle.popinssmall014,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                "Order Number",
                style: CustomTextStyle.popinsboldlight,
              ),
              Text(
                  (dashBoardController.orderID??0).toString(),
                style: CustomTextStyle.popinsboldlightsmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Payment",
                style: CustomTextStyle.popinsboldlight,
              ),
               Text(
                 "Paid:"+  widget.paymentmethod.toString(),
                style: CustomTextStyle.popinsboldlightsmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Date",
                style: CustomTextStyle.popinsboldlight,
              ),
              Text(
                "10 Feb 2023  10:20 AM",
                style: CustomTextStyle.popinsboldlightsmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // Text(
              //   "Phone Number",
              //   style: CustomTextStyle.popinsboldlight,
              // ),
              // Text(
              //    "Phone Number:"+ (dashBoardController.salesorderdetailsModel!.data![0].m) .toString(),
              //   style: CustomTextStyle.popinsboldlightsmall,
              // ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Deliver To",
                style: CustomTextStyle.popinsboldlight,
              ),
              Text(
                "10 Feb 2023  10:20 AM",
                style: CustomTextStyle.popinsboldlightsmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Call",
                style: CustomTextStyle.popinssmall014,
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(21)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nity Make",
                                style: CustomTextStyle.popinsmedium,
                              ),
                              Container(
                                height: 30, width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: MyColors.yellowcir,
                                    width: 1.0,
                                  ),
                                ),
                                // child:Center(child: Text("05"))
                              )
                            ],
                          ),

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

                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+91 2536874562",
                            style: CustomTextStyle.popinssmall01,
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              InkWell(
                onTap: () async {
                       OrderTrackerSalesController ordertrackcontroller = Get.put(OrderTrackerSalesController());
                  ordertrackcontroller.updateOrder(widget.orderId??0);

                 await ordertrackcontroller.init();
                  Get.to(LocationPickerMapSalesMan(
                    
                  ));
                },
                child: Center(
                  child: Container(
                    // width: MediaQuery.of(context).size.width*0.8,

                    height: MediaQuery.of(context).size.height * 0.08,

                    decoration: BoxDecoration(
                        color: MyColors.yellow,
                        borderRadius: BorderRadius.circular(25)),

                    child: Center(
                        child: Text(
                      "Track order",
                      style: CustomTextStyle.mediumtextreem,
                    )),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          );
      
    }  )
      

        )
  
     
    );
  }
}



//   Text("Wholeseller",style: CustomTextStyle.popinssmall014,),


//       Card(elevation: 1.5,
//         shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(21.0),
//                 ),
//         child: Container(
//               width: MediaQuery.of(context).size.width,
//                 height:  MediaQuery.of(context).size.height*0.45,
//                 decoration: BoxDecoration(color:MyColors.white, borderRadius: BorderRadius.circular(21)),child:Padding(
//                   padding:  EdgeInsets.only(left:15.0,right:15,top:10,bottom:10),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    
//                     children: [
                
                 
//                       Text("Nity Make",style:CustomTextStyle.popinsmedium,),
           
              
              
              
             
              
//              SizedBox(height: 5,),
//         Text("Canine Products",style: CustomTextStyle.popinssmall01,),
//   SizedBox(height: MediaQuery.of(context).size.height*0.03),
//            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text("Email ID", style: CustomTextStyle.popinsboldlightsmall,),
//                                  Text("xyz@gmail.com", style: CustomTextStyle.popinssmall014,),  
//                              ],
//                            ),
                        
// Divider(indent: 1,thickness: 1,),  
//       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text("City", style: CustomTextStyle.popinsboldlightsmall,),
//                                  Text("Mumbai", style: CustomTextStyle.popinssmall014,),  
//                              ],
//                            ),
                        
// Divider(indent: 1,thickness: 1,),     

//   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text("Registration no", style: CustomTextStyle.popinsboldlightsmall,),
//                                  Text("#125863", style: CustomTextStyle.popinssmall014,),  
//                              ],
//                            ),
                        
// Divider(indent: 1,thickness: 1,),    

//  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text("Location", style: CustomTextStyle.popinsboldlightsmall,),
//                                  SizedBox(width:  MediaQuery.of(context).size.width*0.3,
//                                   child: Text("1901 Thornridge", style: CustomTextStyle.popinssmall014,)),  
//                              ],
//                            ),
                        
// Divider(indent: 1,thickness: 1,),   
//  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text("GST No", style: CustomTextStyle.popinsboldlightsmall,),
//                                  Text("125863", style: CustomTextStyle.popinssmall014,),  
//                              ],
//                            ),
                        
// Divider(indent: 1,thickness: 1,),    

//                   ],),
//                 )
//                 ),
//       ),
//  SizedBox(height: MediaQuery.of(context).size.height*0.03),
//           GestureDetector(
//                               onTap: () {
                             
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color:MyColors.yellow,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Add Product",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
                   