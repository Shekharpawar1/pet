import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addresscontroller.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/screens/partner/partneraddress.dart';

import 'package:pet/screens/swepcard.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/screens/user/userAddress.dart';
import 'package:pet/screens/user/usercouponPage.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class AddToCardUser extends StatefulWidget {
  const AddToCardUser({super.key});

  @override
  State<AddToCardUser> createState() => _AddToCardUserState();
}

class _AddToCardUserState extends State<AddToCardUser> {
  AddressController addressController = Get.put( AddressController());
  AddToCartController addtocartController = Get.put(AddToCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.0, top: 10, bottom: 10, right: 0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
             child: Icon(Icons.arrow_left, color: MyColors.black)
          ),
        ),
        title: Center(
            child: Text(
          "Add to Cart",
          style: CustomTextStyle.appbartext,
        )),
     actions: [
        

                  
          Stack(
            children: [
              InkWell(
                  onTap: () {
                     Get.to(NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
                SizedBox(width: 20),
 Stack(
            children: [
              InkWell(
                  onTap: () {
                      Get.to(AddToCardUser());
                   
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
    
        ], 
      
      
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          primary: true,
          //  physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.66,
                child: Column(
                  children: [
                     Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.boxbgcolor),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Icon(Icons.edit_outlined),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                InkWell(
                                    onTap: () {
                                      //  items.removeAt(index);
                                    },
                                    child: Icon(Icons.delete_outline)),
                              ],
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "assets/image/fooddog.png",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mars Petcare Inc",
                                  style: CustomTextStyle.popinsmedium,
                                ),
                                Text("with paneer or cottage cheese",
                                    style: CustomTextStyle.popinssmall0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ 620.00",
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Row(
                                      children: [
                                          GestureDetector(
                                    onTap: (){
                                      addtocartController.decrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child:  Icon(Icons.remove,
                                          size: 15, color: Colors.black),
                                          //  Icon(
                                          //   Icons.minimize,
                                          //   size: 8,
                                          //   color: Colors.white,
                                          // ),
                                          
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),

  GetBuilder<AddToCartController>(
                  init: addtocartController,
                  builder: (_) {
                    return
                                  Container(
                                      width: 30,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                          child: Text(
                                        addtocartController.sizecount.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )));
                  }),   
                                  
                                  SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                     onTap: (){
                                      addtocartController.incrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          //shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          color: MyColors.yellow),
                                      child: Icon(Icons.add,
                                          size: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 20,
                    ),
                     Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.boxbgcolor),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Icon(Icons.edit_outlined),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                InkWell(
                                    onTap: () {
                                    
                                    },
                                    child: Icon(Icons.delete_outline)),
                              ],
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "assets/image/fooddog.png",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mars Petcare Inc",
                                  style: CustomTextStyle.popinsmedium,
                                ),
                                Text("with paneer or cottage cheese",
                                    style: CustomTextStyle.popinssmall0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ 620.00",
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Row(
                                      children: [
                                          GestureDetector(
                                    onTap: (){
                                      addtocartController.decrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child:  Icon(Icons.remove,
                                          size: 15, color: Colors.black),
                                          //  Icon(
                                          //   Icons.minimize,
                                          //   size: 8,
                                          //   color: Colors.white,
                                          // ),
                                          
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),

  GetBuilder<AddToCartController>(
                  init: addtocartController,
                  builder: (_) {
                    return
                                  Container(
                                      width: 30,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                          child: Text(
                                        addtocartController.sizecount.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )));
                  }),   
                                  
                                  SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                     onTap: (){
                                      addtocartController.incrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          //shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          color: MyColors.yellow),
                                      child: Icon(Icons.add,
                                          size: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.boxbgcolor),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Icon(Icons.edit_outlined),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                InkWell(
                                    onTap: () {
                                        // items.removeAt(index);
                                    },
                                    child: Icon(Icons.delete_outline)),
                              ],
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "assets/image/fooddog.png",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mars Petcare Inc",
                                  style: CustomTextStyle.popinsmedium,
                                ),
                                Text("with paneer or cottage cheese",
                                    style: CustomTextStyle.popinssmall0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ 620.00",
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Row(
                                      children: [
                                          GestureDetector(
                                    onTap: (){
                                      addtocartController.decrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child:  Icon(Icons.remove,
                                          size: 15, color: Colors.black),
                                          //  Icon(
                                          //   Icons.minimize,
                                          //   size: 8,
                                          //   color: Colors.white,
                                          // ),
                                          
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),

  GetBuilder<AddToCartController>(
                  init: addtocartController,
                  builder: (_) {
                    return
                                  Container(
                                      width: 30,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                          child: Text(
                                        addtocartController.sizecount.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )));
                  }),   
                                  
                                  SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                     onTap: (){
                                      addtocartController.incrementSize();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          //shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          color: MyColors.yellow),
                                      child: Icon(Icons.add,
                                          size: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
   GestureDetector(

      onTap: () {
                          Get.to( UsercouponPage());
                        },
    
     child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  color:  MyColors.blue123,
                  borderRadius: BorderRadius.circular(20)
                ) ,
                
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                Row(
                  children: [
                        Image.asset("assets/image/applycodeimg.png"),
                    
                    SizedBox(width: 10,),
                    Text("Apply coupon", style: CustomTextStyle.popinslight ,),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                
                  ],),
                )
                ),
   ),
        
         SizedBox(
                      height: 20,
                    ),
            Container(
              height: MediaQuery.of(context).size.height * 0.26,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: MyColors.white),
              child: DottedBorder(
                color: Colors.black26,
                borderType: BorderType.Rect,
                radius: Radius.circular(25),
                //  strokeWidth: 1,
                child: Container(
                  // height:MediaQuery.of(context).size.height*0.28,

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            "Sub Total",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "₹620.00",
                            style: CustomTextStyle.popinstext,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Divider(
                        color: MyColors.lightdivider,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          Text(
                            "Tex(5%)",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "₹00.00",
                            style: CustomTextStyle.popinstext,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Divider(
                        color: MyColors.lightdivider,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          Text(
                            "Rounding Adjust",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "₹00.00",
                            style: CustomTextStyle.popinstext,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Text(
              "Address",
              style: CustomTextStyle.popinslight,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            Container(
              // height:  MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: MyColors.blue123),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 10, bottom: 10, right: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: Text(
                                 addressController.isselected.toString(),
                                  style: CustomTextStyle.popinstext)),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                        
                       

                      showModalBottomSheet(
  isScrollControlled: true,
  context: context,
  backgroundColor: Colors.transparent,
  builder: (context) => Container(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
       
        GetBuilder<AddressController>(
                  init: addressController,
                  builder: (_) {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: addressController.addaddressall.length,
                      itemBuilder: (context, index) {
                        var item = addressController.addaddressall[index];

                        return 
      
           Padding(
             padding:  EdgeInsets.all(10),
             child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height*0.2,
              width:MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:MyColors.grey)
              ),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              
              
                   Text(
                            item!.firstname.toString(),
                            style: CustomTextStyle.popinstext,
                          ),
                          
                   Text(
                            item!.lastname.toString(),
                            style: CustomTextStyle.popinssmallnormal,
                          ),
                Text(
                           item.address1.toString(),
                            style: CustomTextStyle.popinssmallnormal,
                          ),
                           Text(
                          item.address2.toString(),
                            style: CustomTextStyle.popinssmallnormal,
                          ),
                        Text(
                            "Phone number:${item.number.toString()}",
                            style: CustomTextStyle.popinssmallnormal,
                          ),
           
           
           SizedBox(height:10),
                          Row(children:[
                            InkWell(
                              onTap:(){
                                Get.to(UserAddress());
                              },
                              child: Container(
                              height:25,
                                  width: 60,
                               decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color:MyColors.grey)
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(child: Text("Edit",style: CustomTextStyle.popinssmallnormal,)),
                                )),
                            ),
                            SizedBox(width:5),
                            
                            InkWell(
                              onTap: (){
                                 addressController.removeaddress(index);
                              },
                              child: Container(
                              height:25,
                              width: 60,
                               decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color:MyColors.grey)
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(child: Text("Delete",style: CustomTextStyle.popinssmallnormal,)),
                                )),
                            ),
                           SizedBox(width:5),
                            
                            GestureDetector(
                              onTap: (){
               // addressController.areaaddressController.toString();
            addressController.chooseaddress(index);
            Get.back();
                              },
                              child: Container(
                              height:25,
                                  width: 60,
                               decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color:MyColors.grey)
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(child: Text("Choose",style: CustomTextStyle.popinssmallnormal,)),
                                )),
                            ),
                          
                          
                          ])
                ],),
              )
           
             ),
           );
      
           },
                    );
                  }),


SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              style:  ElevatedButton.styleFrom(
              primary: MyColors.yellow,
            ),
              onPressed: () {
               Get.to(PaymentUser());
              },
              child: Text('Save Address',style:CustomTextStyle.popinssmall,),
            ),
          ),
        ],
      ),
    ),
  ),
);

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: MyColors.yellow,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text(
                            "Change",
                            style: CustomTextStyle.mediumtextreem,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
 SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

InkWell(
  onTap:(){
Get.to(UserAddress());
  },

  child:   Row(
  
  
  
    children: [
  
  
  
      Icon(Icons.add,size: 15,color:MyColors.yellow),
  
  
  
          Text("Add new address", style:CustomTextStyle.yellowtextnormal),
  
  
  
    ],
  
  
  
  ),
),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: MyColors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 5, bottom: 5, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Row(
                        //         children: [
                        //           Text(
                        //               "₹ 620",
                        //               style: CustomTextStyle.discounttext),
                        //           SizedBox(width: 3),
                        //           Container(
                        //             height: 20,
                        //             width: 40,
                        //             decoration: BoxDecoration(
                        //                 color: MyColors.red,
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 border:
                        //                     Border.all(color: MyColors.red)),
                        //             child: Center(
                        //               child: Text(
                        //                   // item.discount.toString(),
                        //                   "Save20%",
                        //                   style: CustomTextStyle
                        //                       .popinstextsmal2222),
                        //             ),
                        //           ),
                        //             SizedBox(width: 10),     
                        //   Text( "₹ 520", style: CustomTextStyle.appbartext),
                          
                        //         ],
                        //       ),
                        Text("Total", style: CustomTextStyle.popinstext),
                        Text("₹520.00", style: CustomTextStyle.appbartext),
                          Row(
                                children: [
                                  Text(
                                      "₹ 620",
                                      style: CustomTextStyle.discounttext),
                                  SizedBox(width: 3),
                                  Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: MyColors.red,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: MyColors.red)),
                                    child: Center(
                                      child: Text(
                                          // item.discount.toString(),
                                          "Save20%",
                                          style: CustomTextStyle
                                              .popinstextsmal2222),
                                    ),
                                  ),
                       
                          
                                ],
                              ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary()));
                        Get.to(PaymentUser());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: MyColors.yellow,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          "Proceed To Buy",
                          style: CustomTextStyle.mediumtextreem,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //           Container(height:   MediaQuery.of(context).size.height*0.2,
            //      width:MediaQuery.of(context).size.width ,
            //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: boxbgcolor),
            //      child: Row(children: [

            //              Padding(
            //                padding: const EdgeInsets.all(0.0),
            //                child: Image.asset("assets/image/fooddog.png",),
            //              ),

            //              Column(crossAxisAlignment: CrossAxisAlignment.start,

            //               children: [

            // Text("Mars Petcare Inc",style: CustomTextStyle.popinsmedium,),

            // Text(" with paneer or cottage cheese",style: CustomTextStyle.popinsmedium)

            //              ],)

            //      ]),

            //      )
          ],
        ),
      ),
    );
  }
}
