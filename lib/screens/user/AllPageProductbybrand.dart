import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/screens/user/productbypartnerdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/ourbrand.dart';

import '../../models/usersModel/ourBrandModel.dart';
class AllProdctbybrandPage extends StatefulWidget {
   const AllProdctbybrandPage({super.key});
  
  @override
  State<AllProdctbybrandPage> createState() => _AllProdctbybrandPageState();
}

class _AllProdctbybrandPageState extends State<AllProdctbybrandPage> {
   final HomeuserController homeusercontroller = Get.put(HomeuserController());
  //  UserOurBrandModel? bb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
leading: Padding(
  padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
  child:   InkWell(onTap: (){
    Navigator.pop(context);
  },
    child: Icon(Icons.arrow_back_ios,color:MyColors. black,size: 20,
    
    ),
  ),
),
    centerTitle: true,     
        title: Center(child: Text("All Products By Brands",style: CustomTextStyle.appbartext,)),
        ),

        body:
        
        ListView(  primary: false,
        shrinkWrap: true,
          children: [
          



        Padding(
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
                                  mainAxisExtent: 230),
                    itemCount: homeusercontroller
                                          .userProductPartnerModel!.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = homeusercontroller
                                            .userProductPartnerModel!
                                            .data![index];
          
                                        // print(item.name!);
                                        var imagePath =
                                            "${Constants.BASE_URL}/storage/app/public/store/cover/${item.coverPhoto ?? ""}";
                                        var imageLogoPath =
                                            "${Constants.BASE_URL}/storage/app/public/store/${item.logo ?? ""}";
                        return
                        InkWell(
                          onTap: () async {
                                                homeusercontroller
                                                    .viewpartner(item.id ?? 0);
                                                await homeusercontroller
                                                    .partnerIteminit();
                                                Get.to(ProductByPartnerDetails());
                          },
                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.46,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    // color: MyColors.white
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      // SizedBox(height: 140,),
                                                      Container(
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.46,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(30),
                                                            color:
                                                                Colors.transparent),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 25.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFFF0BA),
                                                                      Color
                                                                          .fromRGBO(
                                                                              252,
                                                                              233,
                                                                              166,
                                                                              0.00),
                                                                    ],
                                                                  ),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      imagePath,
                                                                  // width: 50,
                                                                  height: 135,
                                                                  placeholder:
                                                                      (context,
                                                                              url) =>
                                                                          Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ), // Replace with your own placeholder widget
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error), // Replace with your own error widget
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(item.name!,
                                                                style: CustomTextStyle
                                                                    .popinssmall0)
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 3,
                                                        child: Container(
                                                          height: 50,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white
                                                                  .withOpacity(0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child:
                                                              // Image.asset(
                                                              //   item["logo"],
                                                              //   height: 50,
                                                              // ),
                                                              CachedNetworkImage(
                                                            imageUrl: imageLogoPath,
                                                            // width: 50,
                                                            height: 50,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                       
                                          ),
                        );
                                      
            
                                  }),
          ),
        )
           
       
        ]));
  }
}