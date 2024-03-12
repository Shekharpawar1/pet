import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/productdetails.dart';

class ProductAlllistPagewhole extends StatefulWidget {
  const ProductAlllistPagewhole({super.key});

  @override
  State<ProductAlllistPagewhole> createState() => _ProductAlllistPagewholeState();
}

class _ProductAlllistPagewholeState extends State<ProductAlllistPagewhole> {
   WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
 MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: CustomAppBarWholeback(
       title: "All Products",
      ),
     
      
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height*0.02),

              !wholehomecontroller.propertyLoaded
                  ? SizedBox()
                  : Container(
                      // height: 5000,
                      child: GridView.builder(
                           primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 285),
                          itemCount: wholehomecontroller
                              .userPropertiesModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            var item = wholehomecontroller
                                .userPropertiesModel!.data![index];

                           String imagePath =
                                                Constants.PRODUCT_HOME_IMAGE_PATH +
                                                    "/${item.image!}";
                            // print(imagePath);
                            return InkWell(
                              onTap: () async{
 wholeproductdetailsController.dispose() ;
                                 wholeproductdetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print("productid${item.id ?? 0}");
                                                await wholeproductdetailsController
                                                    .init();
                                                Get.to(ProductDetailswhole(
                                                  id: item.id??0,
                                                ));
                                },
                              child:
                                   Container(
                                                width: 140,
                                                // height: 700,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // MyColors.white
                                                      //     .withOpacity(0.1),
                                                      MyColors.white,
                                                      MyColors.white,
                                                      // MyColors.white,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  // color: MyColors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // Offset of the shadow
                                                    ),
                                                  ],
                                                  // color: MyColors.white
                                                ),
                                                child: Column(
                                                  children: [


        GetBuilder<WholeHomeController>(
                  init: wholehomecontroller,
                  builder: (_) {
           return InkWell(
                                                          onTap: () {
                                                            wholehomecontroller
                                                                .addItemToWishList(
                                                                    item.id!);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Icon(wholehomecontroller
                                                                        .wishListItemsId
                                                                        .contains(
                                                                            item.id!)
                                                                    ? Icons.favorite
                                                                    : Icons
                                                                        .favorite_border,color:Colors.red)),
                                                          ),
                                                        );
         }
       ),
                  
                                                
                                                


                                                    Container(
                                                      height: 125,
                                                      
                                                      
                                                      child: CachedNetworkImage(
                                                        imageUrl: imagePath,
                                                       placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ), // Replace with your own placeholder widget
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons
                                                                .error), // Replace with your own error widget
                                                      ),
                                                    ),

                                                    
                                                    Container(
                                                     
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 5,
                                                                top: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(item.name!,
                                                               maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium),
                                                            Text(
                                                                item.description
                                                                            .toString()
                                                                            .length <
                                                                        30
                                                                    ? item
                                                                        .description!
                                                                    : item
                                                                        .description!
                                                                        .substring(
                                                                            0,
                                                                            19),
                                                                style: CustomTextStyle
                                                                    .popinssmall0),
                                                            SizedBox(height: 5),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                     (item.discount !="0.00" && item.discount !="0"&&item.discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.wholePrice.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                       
                                                                        Text(
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        
                                                                      ],
                                                                    ): const  SizedBox(),
                                                               
                                                                    
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              Get.width * 0.23,
                                                                          child:
                                                                              Text(
                                                                            "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
  style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                               onTap: () async{
                                                                             wholeproductdetailsController.viewproductHome(
                                                                                   item.id??0,item.name??'',"1kg",1 ,double.parse(item.wholePrice ?? ''),item.image??'',"yes");
                                                                              await wholeproductdetailsController.addProductHome();
                                                            mycartwholeController.init();
                                                                            },
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 5.0),
                                                                            child: Container(
                                                                                width: 35,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(5.0),
                                                                                  child: Image.asset(
                                                                                    "assets/image/bag2.png",
                                                                                    height: 25,
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),

                                                              
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                         
                                      

);
                          }),
                    ),
            ],
          ),
        ));
  }
}
