import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/controllers/user_controller/service_controller.dart';
import 'package:pet/screens/user/drawer.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/screens/wholesaler/wholesalerdrawer.dart';
import 'package:pet/screens/user/ordersummary.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pet/controllers/user_controller/userServicesAddAppointmentController.dart';
import 'package:pet/controllers/user_controller/userServicesAddVeterinaryController.dart';
import 'package:pet/screens/user/userServicesAddAppointment.dart';
import 'package:pet/screens/user/userServicesAddVeterinary.dart';

import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  //
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  // ServiceController servicecontroller = Get.put(ServiceController());
  final HomeuserController homeusercontroller = Get.put(HomeuserController());

  final UserServicesAddAppointmentController
      userServicesAddUserServicesAddAppointmentController =
      Get.put(UserServicesAddAppointmentController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: drawer(),
       appBar:CustomAppBar(drawerKey: _drawerkey, context: context,),
      
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Image.asset("assets/image/bgimg1.png"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          GetBuilder<HomeuserController>(
              init: homeusercontroller,
              builder: (_) {
                return homeusercontroller.userServicesModel == null
                    ? SizedBox()
                    : Container(
                        child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    //  childAspectRatio: 4 / 4,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    mainAxisExtent: 100),
                            itemCount: homeusercontroller
                                .userServicesModel!.data!.length,
                            itemBuilder: (BuildContext ctx, index) {
                             
                              var item = homeusercontroller
                                  .userServicesModel!.data![ homeusercontroller
                                .userServicesModel!.data!.length-1-index];
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.image ?? ""}";

                              return GestureDetector(
                                onTap: () async {
                                  // String url =
                                  //     Constants.GET_SERVICES_CATEGORIES +
                                  //         "/" +
                                  //         item.id.toString();
                                  // homeusercontroller.getServicesCategories(url);



                                  userServicesAddUserServicesAddAppointmentController
                                      .clearFields();
                                  userServicesAddUserServicesAddAppointmentController
                                      .updateServiceId(item.id!);
                                  userServicesAddUserServicesAddAppointmentController
                                      .init();
                                  await userServicesAddUserServicesAddAppointmentController
                                      .fetchAppointmentSlots(item.id!);
                                  print(item);
                                  
                                  Get.to(
                                      () => UserServicesAddAppointmentState());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: MyColors.white),
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath,
                                        fit: BoxFit.cover,
                                        // width: 61,
                                        // height: 75,
                                        placeholder: (context, url) => Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ),
                                        // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                    Text(
                                      item.name!,textAlign: TextAlign.center
                                      ,
                                      style: CustomTextStyle.popinssmall0,
                                    )
                                  ],
                                ),
                              );
                              //
                            }));

              
              })

         
          ,

          Text(
            "Doctor",
            style: CustomTextStyle.popinstext,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 0.3),
                  borderRadius: BorderRadius.circular(25),
                  color: MyColors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/image/vetneryimg.jpg",width: Get.width*0.3 ,
                            fit: BoxFit.fitHeight,
                         ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You can book an \nappointment for your pet",
                              style: CustomTextStyle.popinsbold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                           
                            SizedBox(
                              height: 5,
                            ),
                            
                          
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () async{
                        UserServicesAddVeterinaryController
                            userServicesAddVeterinaryController =
                            Get.put(UserServicesAddVeterinaryController());
                        userServicesAddVeterinaryController.clearFields();
                        
                     await  userServicesAddVeterinaryController.init();
                        Get.to(UserServicesAddVeterinary());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: MyColors.yellow,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "Appointment",
                          style: CustomTextStyle.mediumtextreem,
                        )),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
      )),
    );
  }
}
