import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/userfavourite_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/wholesaler/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class Userfavourite extends StatefulWidget {
  const Userfavourite({super.key});

  @override
  State<Userfavourite> createState() => _UserfavouriteState();
}

class _UserfavouriteState extends State<Userfavourite> {
  TextEditingController _searchcontroller = TextEditingController();
  UserfavouriteController userfavouriteController = Get.put(UserfavouriteController()); 
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
          "Favourite",
          style: TextStyle(
            fontSize: 16,
            color: MyColors.black,
            fontWeight: FontWeight.w700,
          ),
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
     body:ListView(shrinkWrap: true,
     primary: true,
     children: [
       Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                     GetBuilder<UserfavouriteController>(
                      init: userfavouriteController,
                      builder: (_) {
                        return 
            GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 280),
                              itemCount: userfavouriteController
                                  .getwishList!.length, // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                 var item = userfavouriteController
                                  .getwishList![index];
return
                  Container(
                  height: MediaQuery.of(context).size.width * 0.7,
                  // width: MediaQuery.of(context).size.width * 0.46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: MyColors.white),
                            child:Image.asset( item["image"],
                                fit: BoxFit.fill, height: 135),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.favorite,color: MyColors.bgcolor,)),
                          ),
                        ],
                      ),

                      // SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["title"],
                                style: CustomTextStyle.popinsmedium),
                            Text(item["subtitle"],
                                style: CustomTextStyle.popinssmall0),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(item["price"],
                                            style:
                                                CustomTextStyle.discounttext),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 18,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: MyColors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: MyColors.red)),
                                          child: Center(
                                            child: Text(
                                                // item.discount.toString(),
                                               item["discount"],
                                                style: CustomTextStyle
                                                    .popinstextsmal2222),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                    item["totalprice"],
                                      style: CustomTextStyle.popinsmedium,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffffcc00)),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          "assets/image/bag2.png",
                                          height: 25,
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  );
              
                              });      
                })
              
              ],
            ),
          ),
     ],
     )
    );
  }
}