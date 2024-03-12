
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/controllers/user_controller/subcateogries_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/user/filterScreen.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/searchScreen.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:share_plus/share_plus.dart';

class AlltoyPage extends StatefulWidget {
  const AlltoyPage( {super.key});

  @override
  State<AlltoyPage> createState() => _AlltoyPageState();
}

class _AlltoyPageState extends State<AlltoyPage> {
    SubCategoryController subcategorycontroller = Get.put(SubCategoryController());
  TextEditingController _searchcontroller = TextEditingController();
    final HomeuserController homeusercontroller = Get.put(HomeuserController());
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
         UserReviewController userreviewController = Get.put(UserReviewController());
 MyCartController mycartController = Get.put(MyCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:CustomAppBarback(title:"All Toys"),

        body:ListView(
          primary: true,
          shrinkWrap: true,
          children: [

            
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 265,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(17),
                
                
                          color: MyColors.white,
                        ),
                        child: TextFormField(
                          onTap: () {
                            homeusercontroller.clearSearchData();
                            Get.to(SearchScreen());
                          },
                          readOnly: true,
                          controller: homeusercontroller.searchcontroller,
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
                
                      GestureDetector(
                        onTap: () {
                          FilterController filtercontroller =
                              Get.put(FilterController());
                         filtercontroller.loadDefaultData();
                          filtercontroller.clearFields();
                          
                          filtercontroller.init();
                          Get.to(FilterScreenUI());
                          Get.to(FilterScreen());
                        },
                        child: Container(
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
                            )),
                      )
                
                     
                    ],
                  ),
                ),

     
    
     
     
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            !subcategorycontroller.toyloaded
                ? SizedBox()
                : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
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
                                      mainAxisExtent: 290),
                              
                                   itemCount:subcategorycontroller. combinedList!.length
                                          ,
                                      itemBuilder: (BuildContext ctx, index) {
                                           var item = subcategorycontroller
                                      .combinedList[index];
                                      print("nndjdjnj${subcategorycontroller
                                      .combinedList.length}");
                                
                                 
                                var imagePath =
                                       "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                print(imagePath);
                                return InkWell(
                                 
                                    onTap: () async{
                                             productdeatilscontroller.dispose();
                                                productdeatilscontroller
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                await productdeatilscontroller
                                                    .init();
                                                userreviewController.reviewAdd(
                                                    item.id ?? 0, 0);
                                                await userreviewController
                                                    .init();
                                                Get.to(ProductDetails(id:item.id??0));
                                            },
                                  child:  Container(
                                                width: 140,
                                                // height: 700,
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
                  
                  
                  
                                              
                                                
                                                Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item.image.toString(), item.name.toString(),  item.price.toString());

    // Share.share(itemAll.toString());
  
  },
),


Spacer(),

      GetBuilder<HomeuserController>(
                      init: homeusercontroller,
                      builder: (_) {
                                                        return InkWell(
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
                  
                                                                            // "₹" +
                                                                            //     item.price!,
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                          onTap: () async{
                                                                         productdeatilscontroller.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.price ?? ''),(item.image).toString(),"yes");

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
                                              )
                                            );
                              }),
                        ),
                )
               ],
        )
 
    
    );
  }
}
void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}