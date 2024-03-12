import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/productdetails.dart';

class ServicesCategoryPage extends StatefulWidget {
  const ServicesCategoryPage({super.key});

  @override
  State<ServicesCategoryPage> createState() => _ServicesCategoryPageState();
}

class _ServicesCategoryPageState extends State<ServicesCategoryPage> {
  final HomeuserController homeusercontroller = Get.put(HomeuserController());
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
              child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.black,
                size: 20,
              ),
            ),
          ),
          title: Center(
              child: Text(
            "Service Categories",
            style: CustomTextStyle.appbartext,
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height*0.02),

              homeusercontroller.servicesCategoryModel == null
                  ? SizedBox()
                  : Container(
                      // height: 5000,
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 2,
                                  mainAxisExtent: 270,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemCount: homeusercontroller
                              .servicesCategoryModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            var item = homeusercontroller
                                .servicesCategoryModel!.data![index];

                            var imagePath =
                                "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.thumbnail ?? ""}";
                            print(imagePath);
                            return InkWell(
                              onTap: () {
                                
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
                                      blurRadius: 2,
                                      offset:
                                          Offset(0, 3), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 125,

                                      child: CachedNetworkImage(
                                        imageUrl: imagePath,
                                        width: 61,
                                        height: 75,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),

                                    // SizedBox(height: 15,),

                                    Container(
                                      height: 145,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5, top: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(item.name!,
                                                style: CustomTextStyle
                                                    .popinsmedium),
                                            Text(item.description.toString(),
                                                style: CustomTextStyle
                                                    .popinssmall0),
                                            // SizedBox(height: 3),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "price: " + item.price! + "₹",
                                                  style: CustomTextStyle
                                                      .popinsmedium,
                                                ),

                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5.0),
                                                  child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Color(
                                                              0xffffcc00)),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Image.asset(
                                                          "assets/image/bag2.png",
                                                        ),
                                                      )),
                                                )
                                               
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
