import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/ourbranddetailscontroller.dart';
import 'package:pet/models/wholesalerModel/ourBrandModel.dart' as OurBrandModel;
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/screens/wholesaler/wholeoubranddetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';

import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class WholeAllbrandPage extends StatefulWidget {
  WholeAllbrandPage({super.key, this.data});
  List<OurBrandModel.Datum>? data;
  @override
  State<WholeAllbrandPage> createState() => _WholeAllbrandPageState();
}

class _WholeAllbrandPageState extends State<WholeAllbrandPage> {
  WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  //  WholeOurBrandModel? wholeBrandModel;
  OurBrandDetailsWholeController oubranddetailswholeController =
      Get.put(OurBrandDetailsWholeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWholeback(
          title: "All Our Brands",
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  mainAxisExtent: 250),
              itemCount: widget.data!.length,
              itemBuilder: (context, index) {
                var item = widget.data![index];
                // print(item.name!);
                var imagePath =
                    "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                var imageLogoPath =
                    "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                return InkWell(
                    onTap: () async {

                      oubranddetailswholeController.addproduct(
                          item.id ?? 0, item.title ?? '', item.logo ?? '');
                      //  subcategorycontroller.addproduct(item.id??0) ;
                      await oubranddetailswholeController.ourproductinit();

                      oubranddetailswholeController.disposeController();
                      Get.to(WholeOurBrandDetails());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.63,
                            width: MediaQuery.of(context).size.width * 0.46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              // color: MyColors.white
                            ),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                // SizedBox(height: 140,),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.6,
                                  width: MediaQuery.of(context).size.width *
                                      0.46,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.transparent),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFFFF0BA),
                                                Color.fromRGBO(
                                                    252, 233, 166, 0.00),
                                              ],
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath,
                                            // width: 50,
                                            height: 135,
                                            placeholder: (context, url) =>
                                                const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ), // Replace with your own placeholder widget
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Icon(Icons
                                                    .error), // Replace with your own error widget
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(item.title!,
                                          style: CustomTextStyle.popinssmall0)
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 3,
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child:
                                        // Image.asset(
                                        //   item["logo"],
                                        //   height: 50,
                                        // ),
                                        CachedNetworkImage(
                                      imageUrl: imageLogoPath,
                                      // width: 50,
                                      height: 50,
                                      placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(),
                                      ), // Replace with your own placeholder widget
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons
                                              .error), // Replace with your own error widget
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  Stack(
                      //   children: [
                      //     Container(
                      //       width: 69,
                      //       height: 75,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(23),
                      //         color: item,
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.grey.withOpacity(0.3),
                      //             spreadRadius: 2,
                      //             blurRadius: 5,
                      //             offset: Offset(
                      //                 0, 3), // Offset of the shadow
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ));
              }),
        ));
  }
}
