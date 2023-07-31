import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ordersummary.dart';
import 'package:pet/screens/user/notification.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.itemdetails});
  dynamic itemdetails;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());
  List kg = [1, 2, 5];

  @override
  Widget build(BuildContext context) {
    var imagePath =
        "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${widget.itemdetails.image ?? ""}";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.lightbg,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left:20.0,top: 15,bottom: 15),
        //   child: Image.asset(
        //     "assets/image/menu2.png",
        //   ),
        // ),

//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),
        actions: [
          InkWell(
              onTap: () {
                Get.to(NotificationUser());
              },
              child: SvgPicture.asset("assets/image/notification.svg")),
          // Image.asset("assets/image/cartimg.png"),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/image/bag.svg"),
          ),
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MyColors.lightbg,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(500))),
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    width: 61,
                    height: 75,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ), // Replace with your own placeholder widget
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error), // Replace with your own error widget
                  ),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: kg
                            .sublist(0, 3)
                                                  .map(
                                                    (e) => Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                            // var tab = e 
                                            //
                      //  e  *  ( widget.itemdetails.price) ;     
                    //  productdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: productdetailscontroller
                                                      .isAdding
                                                  ? MyColors.pink
                                                  : MyColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: imagePath,
                                              width: 61,
                                              height: 75,
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ), // Replace with your own placeholder widget
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Icon(Icons
                                                      .error), // Replace with your own error widget
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("$e Kg",
                                            style: CustomTextStyle.popinssmall0)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        // [
                        //   Container(
                        //     child: Column(
                        //       children: [
                        //         Container(
                        //           height: 60,
                        //           width: 60,
                        //           decoration: BoxDecoration(
                        //               color: MyColors.pink,
                        //               borderRadius: BorderRadius.circular(15)),
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(8.0),
                        //             child: CachedNetworkImage(
                        //               imageUrl: imagePath,
                        //               width: 61,
                        //               height: 75,
                        //               placeholder: (context, url) => Center(
                        //                 child: CircularProgressIndicator(),
                        //               ), // Replace with your own placeholder widget
                        //               errorWidget: (context, url, error) => Icon(Icons
                        //                   .error), // Replace with your own error widget
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: 5,
                        //         ),
                        //         Text("2 Kg", style: CustomTextStyle.popinssmall0)
                        //       ],
                        //     ),
                        //   ),
                        //  ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    
                      Row(
              children: [
                Column(
                  children: [
                    Text( "" +( widget.itemdetails.price),style: CustomTextStyle.popinstext,),
  Row(
              children: [
                Container(
                    width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:MyColors.yellow,
                 borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child:Text("-",style: TextStyle(color:MyColors. black,fontSize: 18),)
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
                Container(
                    width: 30,
                    height: 40,
                    decoration: BoxDecoration(

                        borderRadius:
                            BorderRadius.circular(50),
                      

                        ),
                    child: Center(
                        child: Text(
                      "4",
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                    ))),
                SizedBox(
                  width: 3,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    //shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
color:MyColors.yellow
                  ),
                  child: Icon(
                    Icons.add,size: 15,
                    color: Colors.black
                  ),
                ),
              ],
            )



                  ],
                ),
              ],
            )
            
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
 
       

                   Row(children: [
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(width: 5,),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(width: 5,),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(width: 5,),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(width: 5,),
                                SvgPicture.asset("assets/image/yellowstar.svg"),
                                SizedBox(width: 5,),
                                Text("4.5")
                                ],),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.04),          
                  Text(
                    "Product details",
                    style: CustomTextStyle.popinstext,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    widget.itemdetails.description,
                    style: CustomTextStyle.popinssmall0,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Text(
                    "About Us",
                    style: CustomTextStyle.popinstext,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    children: [
                      Text(
                        "Brand",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        widget.itemdetails.name,
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Divider(
                    color: MyColors.lightdivider,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Row(
                    children: [
                      Text(
                        "Flavour",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        "Chicken",
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Divider(
                    color: MyColors.lightdivider,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Row(
                    children: [
                      Text(
                        "Diet type",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        "Non Vegetarian",
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Divider(
                    color: MyColors.lightdivider,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Row(
                    children: [
                      Text(
                        "Age Range",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                      ),
                      Text(
                        "Adult",
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Divider(
                    color: MyColors.lightdivider,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Row(
                    children: [
                      Text(
                        "Traget Species",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        "Dog",
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Divider(
                    color: MyColors.lightdivider,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  Row(
                    children: [
                      Text(
                        "Item From ",
                        style: CustomTextStyle.popinslight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        "Pellet",
                        style: CustomTextStyle.popinstext,
                      ),
                    ],
                  ),
                  //           SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  //  Divider(color: lightdivider,thickness: 1,height: 1,),

                   Text(
                    "Product Review",
                    style: CustomTextStyle.popinstext,
                  ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: CustomTextStyle.popinssmall0,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: MyColors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹620.00", style: CustomTextStyle.popinstext),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddToCardUser()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: MyColors.yellow,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/image/bagadd.png",
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Add To Cart",
                                    style: CustomTextStyle.mediumtextreem,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
