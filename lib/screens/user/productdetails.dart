import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/payment.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart'as variantFile;
import 'package:pet/screens/user/userAllReview.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ordersummary.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:pet/screens/user/notification.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key});
  // dynamic itemdetails;

  final ProductDetailsController productdetailscontroller =
      Get.put(ProductDetailsController());

  final HomeuserController homeusercontroller = Get.put(HomeuserController());
  MyCartController mycartController = Get.put(MyCartController());
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());

  List kg = [1, 2, 5];

  @override
  Widget build(BuildContext context) {
    
    var imagePath =
    // "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
        "${Constants.BASE_URL}/storage/app/public/product/${productdetailscontroller!.productdetailmodel!.data!.image??''}";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.lightbg,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
              child: Icon(Icons.arrow_back_ios_new_outlined,
                  color: MyColors.black)),
        ),

//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),
        actions: [
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationUser());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ('5').toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
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
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ('5').toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          Stack(
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
                      errorWidget: (context, url, error) => Icon(
                          Icons.error), // Replace with your own error widget
                    ),
                  )),
           
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.favorite_outline,
                    )),
              ),
            ],
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
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
                                    color: productdetailscontroller.isAdding
                                        ? MyColors.pink
                                        : MyColors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: imagePath,
                                    width: 61,
                                    height: 75,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ), // Replace with your own placeholder widget
                                    errorWidget: (context, url, error) => Icon(Icons
                                        .error), // Replace with your own error widget
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Text("$e Kg",
                              //     style: CustomTextStyle.popinssmall0)
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
          ),
          
          GetBuilder<ProductDetailsController>(
              init: productdetailscontroller,
              builder: (_) {
                 final variations = productdetailscontroller.productdetailmodel!.data!.variations!.length;
                // var product = productdetailscontro
                // printller.productList.length;
                return 
             (productdetailscontroller!.productdetailmodel!.data == null )?SizedBox(

             ):


                
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Size", style: CustomTextStyle.popinstext),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Row(
                          //   children: kg
                          //       .sublist(0, 3)
                          //       .map(
                          //         (e) => Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: GestureDetector(
                          //             onTap: () {
                          //               // var tab = e
                          //               //
                          //               //  e  *  ( widget.itemdetails.price) ;
                          //               //  productdetailscontroller. updateSelectTab(e *( widget.itemdetails.price) )  ;
                          //             },
                          //             child: Container(
                          //               child: Column(
                          //                 children: [
                          //                   Container(
                          //                     height: 60,
                          //                     width: 60,
                          //                     decoration: BoxDecoration(
                          //                         color: productdetailscontroller
                          //                                 .isAdding
                          //                             ? MyColors.pink
                          //                             : MyColors.grey,
                          //                         borderRadius:
                          //                             BorderRadius.circular(15)),
                          //                     child: Padding(
                          //                       padding: const EdgeInsets.all(8.0),
                          //                       child: CachedNetworkImage(
                          //                         imageUrl: imagePath,
                          //                         width: 61,
                          //                         height: 75,
                          //                         placeholder: (context, url) =>
                          //                             Center(
                          //                           child:
                          //                               CircularProgressIndicator(),
                          //                         ), // Replace with your own placeholder widget
                          //                         errorWidget: (context, url,
                          //                                 error) =>
                          //                             Icon(Icons
                          //                                 .error), // Replace with your own error widget
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   Text("$e Kg",
                          //                       style: CustomTextStyle.popinssmall0)
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          //   // [
                          //   //   Container(
                          //   //     child: Column(
                          //   //       children: [
                          //   //         Container(
                          //   //           height: 60,
                          //   //           width: 60,
                          //   //           decoration: BoxDecoration(
                          //   //               color: MyColors.pink,
                          //   //               borderRadius: BorderRadius.circular(15)),
                          //   //           child: Padding(
                          //   //             padding: const EdgeInsets.all(8.0),
                          //   //             child: CachedNetworkImage(
                          //   //               imageUrl: imagePath,
                          //   //               width: 61,
                          //   //               height: 75,
                          //   //               placeholder: (context, url) => Center(
                          //   //                 child: CircularProgressIndicator(),
                          //   //               ), // Replace with your own placeholder widget
                          //   //               errorWidget: (context, url, error) => Icon(Icons
                          //   //                   .error), // Replace with your own error widget
                          //   //             ),
                          //   //           ),
                          //   //         ),
                          //   //         SizedBox(
                          //   //           height: 5,
                          //   //         ),
                          //   //         Text("2 Kg", style: CustomTextStyle.popinssmall0)
                          //   //       ],
                          //   //     ),
                          //   //   ),
                          //   //  ],
                          // ),
   productdetailscontroller.productdetailmodel!.data!.variations ==
                                null
                                //  && productdetailscontroller.productdetailmodel!.data!.variations ==
                                // "" && productdetailscontroller.productdetailmodel!.data!.variations!.isEmpty
                            // ? Center(
                            //     child: SpinKitCircle(
                            //       color:
                            //           Colors.white, // Color of the progress bar
                            //       size: 50.0, // Size of the progress bar
                            //     ),
                            //   )
                            ? SizedBox()
                            :
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: MyColors.grey),
                                    color: Color.fromRGBO(255, 255, 255, 0.10),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     offset: const Offset(0.0, 0.0),
                                    //     color: Color.fromRGBO(255, 255, 255, 0.10),
                                    //     blurRadius: 0.0,
                                    //     spreadRadius: 0.0,
                                    //   ),
                                    // ],
                                    borderRadius: BorderRadius.circular(40)),
                                child: DropdownButtonFormField<variantFile.Variations>(
                                  validator: (value) {
                                     if (value == null ) {
                                      return 'Please select a tpye';
                                    }
                                    return null;
                                  },
                                  // value: productdetailscontroller.dropdownsize,
                                  value: productdetailscontroller
                                          .selectedvariants,
                                  decoration: InputDecoration(
                                    hintText: "Kg",
                                    hintStyle: TextStyle(
                                      color: MyColors.black,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    // iconColor: MyColors.white,
                                  ),
                                  icon: Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: MyColors.black,
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.black),
                                   items:   productdetailscontroller
                                            .variantslist!
                                            .map((variantFile.Variations variants) {
                                          return DropdownMenuItem<
                                            variantFile.Variations>(
                                            value: variants,
                                            child: Text(variants.type??''),
                                          );
                                        }).toList(),
//                                    items:   productdetailscontroller.productdetailmodel!.data!.variations!.map<DropdownMenuItem<String>>(
//   (var variant) {
//     return DropdownMenuItem<String>(
//       value: variant.type, 
//       child: Text(variant.type.toString() ),
//     );
//   },
// ).toList() ?? [],
                                  // items: productdetailscontroller
                                  //     .productdetailsmodel.data.variations
                                  //     .map((String variant) {
                                  //   return DropdownMenuItem<String>(
                                  //     value: variant,
                                  //     child: Text(variant),
                                  //   );
                                  // }).toList(),
                                     onChanged:
                                            (variantFile.Variations? variants) async {
                                          await productdetailscontroller
                                              .updateVariants(variants!);
                                        },
                                  // onChanged: (String? value)  {
                                  //   productdetailscontroller.addVariant(value);
                                  //   // productdetailscontroller
                                  //   //     .updateSize(value ?? "");
                                  //   // Perform actions when country is changed
                                  // },
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                       
                                         "₹"+ ( (productdetailscontroller.selectedvariants?.price??0)*(productdetailscontroller.sizecount??0)).toString(),
                            
                            //  (     (productdetailscontroller.productList.price)! * (productdetailscontroller.productList.discount!)/100).toString()

                                           style: CustomTextStyle.discounttext),
                                      SizedBox(width: 3),
                                      Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: MyColors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: MyColors.red)),
                                        child: Center(
                                          child: Text(
                                        
                                              "Save${productdetailscontroller.productdetailmodel!.data!.discount!.toString()}%",
                                              style: CustomTextStyle
                                                  .popinstextsmal2222),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "₹"+((productdetailscontroller.selectedvariants?.price??0)*(productdetailscontroller.sizecount??0)-(  ( (productdetailscontroller.selectedvariants?.price??0)*productdetailscontroller.sizecount??0)*(productdetailscontroller.productdetailmodel!.data!.discount!)/100)).toString(),
                                  //  "₹"+(  (     (productdetailscontroller.productdetailmodel!.data!.price)! * (productdetailscontroller.productdetailmodel!.data!.discount!)/100)* productdetailscontroller.sizecount).toString(),
                                    //  "₹${productdetailscontroller.productdetailmodel!.data!.price.toString()}",
                                    style: CustomTextStyle.popinstext,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          productdetailscontroller
                                              .decrementSize();
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: MyColors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(Icons.remove,
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
                                      Container(
                                          width: 30,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                              child: Text(
                                            productdetailscontroller.sizecount
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ))),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          productdetailscontroller
                                              .incrementSize();
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              //shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: MyColors.yellow),
                                          child: Icon(Icons.add,
                                              size: 15, color: Colors.black),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        "Product details",
                        style: CustomTextStyle.popinstext,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                      productdetailscontroller.productdetailmodel!.data!.description.toString(),
                        style: CustomTextStyle.popinssmall0,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),

                      Text(
                        "About Us",
                        style: CustomTextStyle.popinstext,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
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
                             productdetailscontroller.productdetailmodel!.data!.name.toString(),
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
                            "Flavour",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "",
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
                            "Diet type",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                           (productdetailscontroller.productdetailmodel!.data!.veg == 1)?"Veg":"Nonveg",
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
                            "Age Range",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18,
                          ),
                          Text("",
                            // productdetailscontroller.productList.agerange
                            //     .toString(),
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
                            "Traget Species",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text(
                            productdetailscontroller.productdetailmodel!.data!.module!.moduleName.toString(),
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
                            "Item From ",
                            style: CustomTextStyle.popinslight,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "",
                            style: CustomTextStyle.popinstext,
                          ),
                        ],
                      ),
                      //           SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      //  Divider(color: lightdivider,thickness: 1,height: 1,),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Review",
                            style: CustomTextStyle.popinstext,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Get.to(UserAllReview());
                          //   },
                          //   child: Text(
                          //     "See All",
                          //     style: CustomTextStyle.popinstext,
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),

                      GetBuilder<UserReviewController>(
                          init: userreviewcontroller,
                          builder: (_) {
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount:
                                  userreviewcontroller.getreviewList.length,
                              itemBuilder: (context, index) {
                                var item =
                                    userreviewcontroller.getreviewList[index];

                                return ListView(
                                  primary: false,
                                  shrinkWrap: true,
                                  children: [
                                    Text(
                                      item["title"],
                                      style: CustomTextStyle.popinssmall0,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Row(
                                      children: [
                                        RatingStars(
                                          value: userreviewcontroller.value!,
                                          // onValueChanged: (v) {
                                          //   //
                                          //   setState(() {
                                          //     value = v;
                                          //   });
                                          // },
                                          starBuilder: (index, color) => Icon(
                                            Icons.star,
                                            color: color,
                                            size: 15,
                                          ),
                                          starCount: 5,
                                          starSize: 20,
                                          // valueLabelColor: const Color(0xff9b9b9b),
                                          // valueLabelTextStyle: const TextStyle(
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.w400,
                                          //     fontStyle: FontStyle.normal,
                                          //     fontSize: 12.0),
                                          // valueLabelRadius: 10,
                                          maxValue: 5,
                                          starSpacing: 0.5,
                                          maxValueVisibility: true,
                                          valueLabelVisibility: false,
                                          animationDuration:
                                              Duration(milliseconds: 5000),
                                          // valueLabelPadding:
                                          //     const EdgeInsets.symmetric(
                                          //         vertical: 1, horizontal: 8),
                                          // valueLabelMargin:
                                          //     const EdgeInsets.only(right: 8),
                                          starOffColor: const Color(0xffe7e8ea),
                                          starColor: MyColors.yellow,
                                        ),
                                        SizedBox(width: 10),
                                        Image.asset(item["image"], height: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item["name"],
                                              style: CustomTextStyle.popinstext,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person_2_outlined,
                                                  size: 13,
                                                ),
                                                Text(
                                                  item["count"],
                                                  style: CustomTextStyle
                                                      .popinssmall0,
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Divider(
                                      color: MyColors.lightdivider,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ],
                                );
                              },
                            );
                          }),
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),

                      Container(
                        // height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyColors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
    "₹"+ ( (productdetailscontroller.selectedvariants?.price??0)*(productdetailscontroller.sizecount??0)).toString(),
                                      // "₹" + widget.itemdetails.price.toString(),
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
                                         "Save${productdetailscontroller.productdetailmodel!.data!.discount.toString()}%",
                                          style: CustomTextStyle
                                              .popinstextsmal2222),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "₹"+
                                    (
                                      (productdetailscontroller.selectedvariants?.price??0)*(productdetailscontroller.sizecount??0)-
                                    (( (productdetailscontroller.selectedvariants?.price??0)*productdetailscontroller.sizecount??0)*(productdetailscontroller.productdetailmodel!.data!.discount!)/100)
                                    ).toString(),
                                  // (widget.itemdetails.price),
                                      style: CustomTextStyle.appbartext),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentUser()));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/image/bagadd.png",
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Buy Now",
                                            style:
                                                CustomTextStyle.mediumtextreem,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                       
                                  Spacer(),

                                 GetBuilder<ProductDetailsController>(
                  init: productdetailscontroller,
                  builder: (_) {   
                            return      InkWell(
                                    onTap: () async {
// mycartController.adddiscount( 
      
//   // (productdetailscontroller.productdetailmodel!.data!.discount??0),(productdetailscontroller.productdetailmodel!.data!.price??0)
  
  
//   );
                                   await productdetailscontroller.addProduct();
                                      Get.to(AddToCardUser());
                                  //     productdetailscontroller.addToCart(
                                                
                                  // productdetailscontroller.productdetailmodel!.data!.name.toString(),
                                  //              productdetailscontroller.sizecount.toString(),
                                  //              productdetailscontroller.selectedVariants.toString()
                                  //               );
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             AddToCardUser()));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                          color: MyColors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            style:
                                                CustomTextStyle.mediumtextreem,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                  })
                               
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
