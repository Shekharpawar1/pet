import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import '../../controllers/wholesaler_controller/notification_controller.dart';

class NotificationWhole extends StatefulWidget {
  const NotificationWhole({super.key});

  @override
  State<NotificationWhole> createState() => _NotificationWholeState();
}

class _NotificationWholeState extends State<NotificationWhole> {
  WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Center(
              child: Text('Notification',
                  style: TextStyle(color: Colors.black, fontSize: 18))),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Public',
              ),
              Tab(text: 'for you'),
              //       ExpansionPanelList(
              //   elevation: 1,
              //   expandedHeaderPadding: EdgeInsets.all(0),
              //   expansionCallback: (int index, bool isExpanded) {
              //     toggleBrandExpansion();
              //   },
              //   children: [
              //     ExpansionPanel(
              //       headerBuilder: (BuildContext context, bool isExpanded) {
              //         return ListTile(
              //           title: Text("Brand"),
              //         );
              //       },
              //       body: ListView.builder(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount: filterOptions.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           final filterOption = filterOptions[index];
              //           return CheckboxListTile(
              //             value: selectedBrandOptions.contains(filterOption),
              //             onChanged: (isChecked) {
              //               if (isChecked!) {
              //                 print("Adding brand");
              //                 selectedBrandOptions.add(filterOption);
              //               } else {
              //                 print("Removing brand");
              //                 selectedBrandOptions.remove(filterOption);
              //               }
              //               // Perform any filtering logic here
              //               // filter();
              //               setState(() {});
              //             },
              //             title: Text(filterOption),
              //           );
              //         },
              //       ),
              //       isExpanded: isBrandExpanded,
              //     ),
              //   ],
              // ),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBarView(
            children: [
              // Content for Tab 1
              GetBuilder<WholeNotificationController>(
                  init: wholenotificationcontroller,
                  builder: (_) {
                    return wholenotificationcontroller.wholeNotificationModel ==
                            null
                        ? const SizedBox()
                        : ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: wholenotificationcontroller
                                .wholeNotificationModel!.state!.length,
                            itemBuilder: (context, index) {
                              var item = wholenotificationcontroller
                                  .wholeNotificationModel!.state![index];
                              // print(item.name!);
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return Column(
                                children: [
                                  Container(
                                      width: 335,
                                      height: 71,
                                      decoration: BoxDecoration(
                                          color: MyColors.lightpurple,
                                          borderRadius:
                                              BorderRadius.circular(16.567)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                // Image.asset(item["image"],
                                                //     height: 30),
                                                CachedNetworkImage(
                                                  imageUrl: imagePath,
                                                  width: 50,
                                                  height: 50,
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
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width *
                                                      //         0.58,
                                                      child: Text(
                                                        item.title!,
                                                        style: CustomTextStyle
                                                            .popinssmall014,
                                                      ),
                                                    ),
                                                    Text(
                                                      item.description!.length >
                                                              36
                                                          ? item.description!
                                                              .substring(0, 35)
                                                          : item.description!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: CustomTextStyle
                                                          .popinssmall01,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Column(
                                            //   // mainAxisAlignment:
                                            //   // MainAxisAlignment.end,
                                            //   children: [
                                            //     Text(
                                            //       item.description!,
                                            //       textAlign: TextAlign.center,
                                            //       style:
                                            //           CustomTextStyle.popinssmall01,
                                            //     )
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                              //  ,SizedBox(height:15 ,),
                            },
                          );
                  })
              // ExpansionPanelList(
              //     elevation: 1,
              //     expandedHeaderPadding: EdgeInsets.all(0),
              //     expansionCallback: (int index, bool isExpanded) {
              //       toggleBrandExpansion();
              //     },
              //     children: [
              //       ExpansionPanel(
              //         headerBuilder: (BuildContext context, bool isExpanded) {
              //           return ListTile(
              //             title: Text("Brand"),
              //           );
              //         },
              //         body: ListView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: filterOptions.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             final filterOption = filterOptions[index];
              //             return CheckboxListTile(
              //               value: selectedBrandOptions.contains(filterOption),
              //               onChanged: (isChecked) {
              //                 if (isChecked!) {
              //                   print("Adding brand");
              //                   selectedBrandOptions.add(filterOption);
              //                 } else {
              //                   print("Removing brand");
              //                   selectedBrandOptions.remove(filterOption);
              //                 }
              //                 // Perform any filtering logic here
              //                 // filter();
              //                 setState(() {});
              //               },
              //               title: Text(filterOption),
              //             );
              //           },
              //         ),
              //         isExpanded: isBrandExpanded,
              //       ),
              //     ],
              //   ),

              // Content for Tab 2
              ,
              GetBuilder<WholeNotificationController>(
                init: wholenotificationcontroller,
                builder: (_) {
                  return wholenotificationcontroller.notifiyLoaded ||
                          wholenotificationcontroller.wholeNotifyListModel ==
                              null
                      ? const SizedBox()
                      : ListView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: wholenotificationcontroller
                              .wholeNotifyListModel!.data!.length,
                          itemBuilder: (context, index) {
                            var item = wholenotificationcontroller
                                .wholeNotifyListModel!.data![index];
                            // print(item.name!);
                            // var imagePath =
                            //     "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                            return wholenotificationcontroller
                                        .wholeNotifyListModel!.data ==
                                    null
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          wholenotificationcontroller
                                              .itemView(item.id ?? 0);
                                          Get.to(ProductDetailswhole(
                                            id: item.id ?? 0,
                                          ));
                                          print(item.id);
                                          await wholenotificationcontroller
                                              .notifydeleteinit();

                                          //                          showDialog(
                                          // context: context,
                                          // builder: (BuildContext context) {
                                          //   return GetBuilder<NotificationController>(
                                          //           init: notificationcontroller,
                                          //           builder: (_) {
                                          //             return notificationcontroller.userNotifyListModel == null
                                          //                 ? SizedBox()
                                          //                 : AlertDialog(
                                          //         // title: Text("Simple Popup"),
                                          //         content: Text(''),
                                          //         actions: <Widget>[
                                          //           ElevatedButton(
                                          //             child: Text("Close"),
                                          //             onPressed: () {
                                          //               Navigator.of(context).pop(); // Close the popup
                                          //             },
                                          //           ),
                                          //         ],
                                          //       );
                                          //     }
                                          //   );
                                          //                             });
                                        },
                                        child: Container(
                                          width: 335,
                                          height: 71,
                                          decoration: BoxDecoration(
                                              color: MyColors.lightpurple,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      16.567)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    // Image.asset(item["image"],
                                                    //     height: 30),
                                                    // CachedNetworkImage(
                                                    //   imageUrl: imagePath,
                                                    //   width: 50,
                                                    //   height: 50,
                                                    //   placeholder: (context, url) =>
                                                    //       Center(
                                                    //     child:
                                                    //         CircularProgressIndicator(),
                                                    //   ), // Replace with your own placeholder widget
                                                    //   errorWidget: (context, url,
                                                    //           error) =>
                                                    //       Icon(Icons
                                                    //           .error), // Replace with your own error widget
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 10,
                                                    // ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Order Id : ${item.orderId ??
                                                                      0}",
                                                          style: CustomTextStyle
                                                              .popinssmall014,
                                                        ),
                                                        Text(
                                                          "Order status : ${item.orderStatus ??
                                                                      ''}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyle
                                                              .popinssmall01,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Stock : ${item.stock ??
                                                                          0}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: CustomTextStyle
                                                                  .popinssmall01,
                                                            ),
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              "Variation : ${item.variation ??
                                                                          ""}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: CustomTextStyle
                                                                  .popinssmall01,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // Column(
                                                //   // mainAxisAlignment:
                                                //   // MainAxisAlignment.end,
                                                //   children: [
                                                //     Text(
                                                //       item.description!,
                                                //       textAlign: TextAlign.center,
                                                //       style:
                                                //           CustomTextStyle.popinssmall01,
                                                //     )
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                            //  ,SizedBox(height:15 ,),
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );

    //  Scaffold(
    //     appBar: CustomAppBarWholeback(title: "Notification",),
    //     body: Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: ListView(
    //         primary: true,
    //         shrinkWrap: true,
    //         // scrollDirection: Axis.vertical,
    //         children: [
    //           GetBuilder<WholeNotificationController>(
    //               init: wholenotificationcontroller,
    //               builder: (_) {
    //                 return wholenotificationcontroller.wholeNotificationModel ==
    //                         null
    //                     ? SizedBox()
    //                     : ListView.builder(
    //                         primary: false,
    //                         scrollDirection: Axis.vertical,
    //                         shrinkWrap: true,
    //                         itemCount: wholenotificationcontroller
    //                             .wholeNotificationModel!.state!.length,
    //                         itemBuilder: (context, index) {
    //                           var item = wholenotificationcontroller
    //                               .wholeNotificationModel!.state![index];
    //                           // print(item.name!);
    //                           var imagePath =
    //                               "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
    //                           return Column(
    //                             children: [
    //                               Container(
    //                                   width: 335,
    //                                   height: 71,
    //                                   decoration: BoxDecoration(
    //                                       color: MyColors.lightpurple,
    //                                       borderRadius:
    //                                           BorderRadius.circular(16.567)),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.all(10.0),
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Row(
    //                                           children: [
    //                                             // Image.asset(item["image"],
    //                                             //     height: 30),
    //                                             CachedNetworkImage(
    //                                               imageUrl: imagePath,
    //                                               width: 50,
    //                                               height: 50,
    //                                               placeholder: (context, url) =>
    //                                                   Center(
    //                                                 child:
    //                                                     CircularProgressIndicator(),
    //                                               ), // Replace with your own placeholder widget
    //                                               errorWidget: (context, url,
    //                                                       error) =>
    //                                                   Icon(Icons
    //                                                       .error), // Replace with your own error widget
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10,
    //                                             ),
    //                                             Column(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment.start,
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                               children: [
    //                                                 SizedBox(
    //                                                   // width:
    //                                                   //     MediaQuery.of(context)
    //                                                   //             .size
    //                                                   //             .width *
    //                                                   //         0.58,
    //                                                   child: Text(
    //                                                     item.title!,
    //                                                     style: CustomTextStyle
    //                                                         .popinssmall014,
    //                                                   ),
    //                                                 ),
    //                                                 Text(
    //                                                   item.description!.length >
    //                                                           36
    //                                                       ? item.description!
    //                                                           .substring(0, 35)
    //                                                       : item.description!,
    //                                                   textAlign:
    //                                                       TextAlign.center,
    //                                                   style: CustomTextStyle
    //                                                       .popinssmall01,
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         // Column(
    //                                         //   // mainAxisAlignment:
    //                                         //   // MainAxisAlignment.end,
    //                                         //   children: [
    //                                         //     Text(
    //                                         //       item.description!,
    //                                         //       textAlign: TextAlign.center,
    //                                         //       style:
    //                                         //           CustomTextStyle.popinssmall01,
    //                                         //     )
    //                                         //   ],
    //                                         // ),
    //                                       ],
    //                                     ),
    //                                   )),
    //                               SizedBox(
    //                                 height: 15,
    //                               ),
    //                             ],
    //                           );
    //                           //  ,SizedBox(height:15 ,),
    //                         },
    //                       );
    //               }),
    //         ],
    //       ),
    //     ));
  }
}
