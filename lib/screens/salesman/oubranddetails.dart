import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/ourbranddetailscontroller.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class SalesOurBrandDetails extends StatelessWidget {
   SalesOurBrandDetails({super.key});

  

     OurBrandDetailsController ourbranddeatilscontrroller = Get.put(OurBrandDetailsController());

  @override
  Widget build(BuildContext context) {
      var imageLogoPath =
                                              "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${ourbranddeatilscontrroller.brandlogo ?? ""}";
                                        
    var imagePath = "${Constants.BASE_URL}/storage/app/public/product/${ourbranddeatilscontrroller.brandlogo??''}";
    return Scaffold(

      
        appBar: CustomAppBarSalesWholeback(title : "Products"),
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



Container(
   height: MediaQuery.of(context).size.height * 0.08,
  child:   GetBuilder<OurBrandDetailsController>(
  
                        init: ourbranddeatilscontrroller,
  
                        builder: (_) {
  
                          return
  
  
  
                       ListView.builder(
  
                                  primary: false,
  
                                  scrollDirection: Axis.horizontal,
  
                                  shrinkWrap: true,
  
                                  itemCount: ourbranddeatilscontrroller
  
                                      .usersubmodel!.data!.length,
  
                                  itemBuilder: (context, index) {
                                    
  //  final isSelected = subcategorycontroller.selectedIndex == index;

                                    var item = ourbranddeatilscontrroller
  
                                        .usersubmodel!.data![index];
  
                                    // print(item.name!);
  
                                    var imagePath =
  
                                        "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
  
                                    // print(imagePath);
  
  
  
                                    return
                                    
                                     !ourbranddeatilscontrroller.propertysubloaded
                            ? SizedBox():
                                     Padding(
  
                                      padding: const EdgeInsets.all(8.0),
  
                                      child: InkWell(
  
                                        onTap: () {
    //  subcategorycontroller.addproduct(item.id??0);
  ourbranddeatilscontrroller.updateSelectedIndex(item.id??0); 
  print("===>${item.id}") ; 
ourbranddeatilscontrroller.productinit();
                                     
                                        },
  
                                        child: Container(
  
                      //   height: 40,
  
                      //  width: 180,
  
                        decoration: BoxDecoration(
  
                            color: (ourbranddeatilscontrroller.selectedIndex == item.id
                             ) 
                                                      ? MyColors.yellow
                                                      : Colors.white, 
  
                            borderRadius: BorderRadius.circular(10)),
  
                        child: Padding(
  
                          padding: const EdgeInsets.all(5.0),
  
                          child: Row(
  
                            mainAxisAlignment: MainAxisAlignment.start,
  
                            children: [
  
                              // Image.asset("assets/image/dog1.png"),
  
  
  
                               CachedNetworkImage(
  
                                              imageUrl: imagePath,
  
                                              // width: 61,
  
                                              // height: 75,
  
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
  
                              SizedBox(
  
                                width: 5,
  
                              ),
  
                              Text(item.name.toString(), style: CustomTextStyle.popinssmall)
  
                            ],
  
                          ),
  
                        ),
  
                      ),
  
                                      ),
  
  
  
                                    
  
                                    );
  
                                  },
  
                                );
  
                          
  
            
  
                        }),
),
          

   
   
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
                                      , // Set the number of cards you want to display.
                                    itemBuilder: (context, index) {
                                 
                                      var item = ourbranddeatilscontrroller
                                        .userourbrandProductModel!.data![index];
           print(item);
                                  var imagePath =
                                     "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                  print(imagePath);
                                  return
                    
           ourbranddeatilscontrroller.userourbrandProductModel!.data == null
                              ? SizedBox(child:Center(child: Image.asset("assets/image/nodataimg.png",height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width))):
                                   InkWell(
                                    onTap: () async {
                                   var url = '${ item.productUrl.toString()}';  // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
           
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                                alignment: Alignment.centerRight,
                                                child:
                                                    Icon(Icons.favorite_border,color:Colors.red)),
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
           
                                            
                                              Container(
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