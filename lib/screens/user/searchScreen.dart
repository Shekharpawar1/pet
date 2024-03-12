import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:share_plus/share_plus.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
    
 MyCartController mycartController = Get.put(MyCartController());
  TextEditingController textController = TextEditingController();
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Search",
         style: CustomTextStyle.appbartext,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),

      ),
      body: GetBuilder<HomeuserController>(
        init: homeusercontroller,
        builder: (_) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            shrinkWrap: false,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20, top: 15.0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // Offset of the shadow
                      ),
                    ],
                    // border: Border.all(color:brandcolor ),

                    color: MyColors.white,
                  ),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (value) {
                      homeusercontroller.searchDataFilter(
                          homeusercontroller.userPropertiesModel,
                          value.trim().toString());
                    },
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
              ),
              SizedBox(height: Get.height * 0.01),
              
              homeusercontroller.searchScreenData.isEmpty
                  ?    Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width)):
                    
                   Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          gridDelegate:
                                 const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15.0,
                                                  mainAxisSpacing: 15.0,
                                                  mainAxisExtent: 285),
                          itemCount: homeusercontroller.searchScreenData
                              .length, // Set the number of cards you want to display.
                          itemBuilder: (context, index) {
                           

                            var item =
                                homeusercontroller.searchScreenData![index];
                            String imagePath =
                                Constants.PRODUCT_HOME_IMAGE_PATH +
                                    "/${item.image!}";

                            print(imagePath);
                            return InkWell(
                              onTap: () async {
                                
                                ProductDetailsController
                                    productdeatilscontroller =
                                    Get.put(ProductDetailsController());
                                   productdeatilscontroller.dispose();
                                productdeatilscontroller.viewproduct(
                                  item.id ?? 0,
                                );
                               
                                await productdeatilscontroller.init();
                                Get.to(ProductDetails());
                               
                              },
                              child: Container(
                                             width: 140,
                                             
                                             decoration: BoxDecoration(
                                               gradient: LinearGradient(
                                                 colors: [
                                                   
                                                   MyColors.white,
                                                   MyColors.white,
                                                   
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
                                            ),
                                             child: Column(
                                               children: [


                                                

                                             
                                             
                                               
                                                Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item.image.toString(), item.name.toString(),  item.price.toString());

  
  },
),


Spacer(),

      GetBuilder<HomeuserController>(
                      init: homeusercontroller,
                      builder: (_) {
                                                        return
                                                 InkWell(
                                                   onTap: () {
                                                     homeusercontroller
                                                         .addItemToWishList(
                                                             item.id!);

                                                         homeusercontroller.init();
                                                   },
                                                   child: Padding(
                                                     padding:
                                                         const EdgeInsets
                                                             .all(8.0),
                                                     child: Align(
                                                       alignment: Alignment
                                                           .centerRight,
                                                       child: Icon(
                                                           homeusercontroller
                                                                   .wishListItemsId
                                                                   .contains(
                                                                       item
                                                                           .id!)
                                                               ? Icons
                                                                   .favorite
                                                               : Icons
                                                                   .favorite_border,
                                                           color:
                                                               Colors.red),
                                                     ),
                                                   ),
                                                 );

                                             
                                              }
                                                    ),
                                                      
]),



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
                                                   // height: 140,
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
  item.description!.length < 20
      ? item.description!
      : item.description!.substring(0, item.description!.length),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: CustomTextStyle.popinssmall0,
),  SizedBox(height: 5),
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
                                                                 (item.discount !="0.00"&& item.discount !="0"&&item.discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.price.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                      
                                                                         SizedBox(width:3),
                                                                        Text(
                                                                             "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                       
                                                                      ],
                                                                    ):const  SizedBox(),
                                                                
                                                                 
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
                                                                         "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                                                         
                                                                         style:
                                                                             CustomTextStyle.popinsmedium,
                                                                       ),
                                                                     ),
                                                                     SizedBox(
                                                                         width:
                                                                             Get.width * 0.054),
                                                                     InkWell(
                                                                            onTap: () async{
                                                                     productdeatilscontroller.viewproductHome(
                                                                              item.id??0,item.name??'',"1kg",1 ,double.parse(item.price ?? ''),item.image??'','yes');
                                                                              await productdeatilscontroller.addProductHome();
                                                            mycartController.init();
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
          );
        },
      ),
    );
  }
}
void shareContent(String image , String name, String detials) {
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}