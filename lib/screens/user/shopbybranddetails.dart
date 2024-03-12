import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';
class ShopBrandDetails extends StatelessWidget {
   ShopBrandDetails({super.key});

  
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
     OurBrandDetailsController ourbranddeatilscontrroller = Get.put(OurBrandDetailsController());

  @override
  Widget build(BuildContext context) {
ourbranddeatilscontrroller.productinit();
    var imagePath = "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${ourbranddeatilscontrroller.brandlogo??''}";
    return Scaffold(

      
        appBar:CustomAppBarback(title:"Shop by Brand Details"),
         body:Padding(
     padding: const EdgeInsets.all(20.0),
     child: ListView(
      shrinkWrap: true,
      primary: true,
      children: [
                          
        Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,          
          children: [

          Container(
             height:45,
          width:265,
                   decoration: BoxDecoration(
          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(17),
          
                        // border: Border.all(color:brandcolor ),
          
             color:MyColors.white,
       
          
                    ),
          
           
            
            child: TextFormField(
                                  controller: ourbranddeatilscontrroller.searchcontroller,
                                                style: TextStyle(fontSize: 14,color: MyColors.voliet, fontFamily: "SF-Pro-Display",),
          
                               decoration: InputDecoration(
                                     
                                       contentPadding: EdgeInsets.only(left: 15),
                                      fillColor:MyColors.white,
                                      focusColor:MyColors.white,
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
                                      hintText:"Search",
                                      prefixIcon:Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset("assets/image/searchnormal.png",width: 10,),
                                      ),
                                    
                                      hintStyle:
                                      TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                      
                                      ),
                                ),
          ),
     
    //  SizedBox(width: 10,),
     Container(width: 45,
height: 45,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
color: Color(0xffffcc00)),
child: Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Image.asset("assets/image/filter3.png",),
))

         ],),
     
     
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),


//
// Container(
//    height: MediaQuery.of(context).size.height * 0.08,
//   child:   GetBuilder<OurBrandDetailsController>(
//
//                         init: ourbranddeatilscontrroller,
//
//                         builder: (_) {
//
//                           return
//
//    ourbranddeatilscontrroller
//
//                                         .usersubmodel! == null
//                             ? const SizedBox():
//                        ListView.builder(
//
//                                   primary: false,
//
//                                   scrollDirection: Axis.horizontal,
//
//                                   shrinkWrap: true,
//
//                                   itemCount: ourbranddeatilscontrroller
//
//                                       .usersubmodel!.data!.length,
//
//                                   itemBuilder: (context, index) {
//
//   //  final isSelected = subcategorycontroller.selectedIndex == index;
//
//                                     var item = ourbranddeatilscontrroller
//
//                                         .usersubmodel!.data![index];
//
//                                     // print(item.name!);
//
//                                     var imagePath =
//
//                                         "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
//
//                                     print(imagePath);
//
//
//
//                                     return
//
//                                      !ourbranddeatilscontrroller.propertysubloaded
//                             ? SizedBox(): SizedBox();
// //                                      Padding(
// //
// //                                       padding: const EdgeInsets.all(8.0),
// //
// //                                       child: InkWell(
// //
// //                                         onTap: () {
// //     //  subcategorycontroller.addproduct(item.id??0);
// //   ourbranddeatilscontrroller.updateSelectedIndex(item.id??0);
// //   print("===>${item.id}") ;
// // ourbranddeatilscontrroller.productinit();
// //
// //                                         },
// //
// //                                         child: Container(
// //
// //                       //   height: 40,
// //
// //                       //  width: 180,
// //
// //                         decoration: BoxDecoration(
// //
// //                             color: (ourbranddeatilscontrroller.selectedIndex == item.id
// //                              )
// //                                                       ? MyColors.yellow
// //                                                       : Colors.white,
// //
// //                             borderRadius: BorderRadius.circular(10)),
// //
// //                         child: Padding(
// //
// //                           padding: const EdgeInsets.all(5.0),
// //
// //                           child: Row(
// //
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //
// //                             children: [
// //
// //
// //
// //                                CachedNetworkImage(
// //
// //                                               imageUrl: imagePath,
// //
// //
// //                                               placeholder: (context, url) =>
// //
// //                                                   Center(
// //
// //                                                 child:
// //
// //                                                     CircularProgressIndicator(),
// //
// //                                               ), // Replace with your own placeholder widget
// //
// //                                               errorWidget: (context, url,
// //
// //                                                       error) =>
// //
// //                                                   Icon(Icons
// //
// //                                                       .error), // Replace with your own error widget
// //
// //                                             ),
// //
// //                               SizedBox(
// //
// //                                 width: 5,
// //
// //                               ),
// //
// //                               Text(item.name.toString(), style: CustomTextStyle.popinssmall)
// //
// //                             ],
// //
// //                           ),
// //
// //                         ),
// //
// //                       ),
// //
// //                                       ),
// //
// //
// //
// //
// //
// //                                     );
// //
//
//                                   },
//
//                                 );
//
//
//
//
//
//                         }),
// ),


   
   
    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
  Container(
             height: MediaQuery.of(context).size.height * 0.9,
             child: GetBuilder<OurBrandDetailsController>(
             
                          init: ourbranddeatilscontrroller,
     
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
                                    itemCount: ourbranddeatilscontrroller
                                        .userourbrandProductModel!.data!.length
                                      , 
                                    itemBuilder: (context, index) {
                                     
                                      var item = ourbranddeatilscontrroller
                                        .userourbrandProductModel!.data![index];
           print(item);
                                   
   String imagePath =  "${Constants.BASE_URL}${Constants.BRAND_PRODUCT_IMAGE_PATH}${item.image ?? ""}";
  
                                 
                                  print(imagePath);
                                  return
                      
           ourbranddeatilscontrroller.userourbrandProductModel!.data == null
                              ? SizedBox(child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))):
                                   InkWell(
                                    onTap: () async {
                                     final Uri url = Uri.parse('${ item.productUrl.toString()}');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
  },
                                    child: Container(
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: MyColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(
                                                0, 3), // Offset of the shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
           
                                          
                                        
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
                                          
                                                  
                                                  
                                         
                                              Container(
                                                height: 125,
           
                                                
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
           
                                              // SizedBox(height: 15,),
           
                                              Container(
                                                // height: 140,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 5,
                                                      top: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(item.title!,
                                                          style: CustomTextStyle
                                                              .popinsmedium),
                                                     
                                                      SizedBox(height: 5),
                                                     
                                                   
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                 
                                      )
                            );});
                            
                     }),
           ),   
             

        
     ],),
   )
    );
  }
}