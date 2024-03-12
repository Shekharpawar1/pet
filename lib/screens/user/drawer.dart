import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/allveterinary_controller.dart';
import 'package:pet/controllers/user_controller/myOrder_controller.dart';
import 'package:pet/controllers/user_controller/myPetListController.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/controllers/user_controller/profile_controller.dart';
import 'package:pet/controllers/user_controller/transaction_controller.dart';
import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/user/Mypetdetails.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/addPet.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/screens/user/UserMyPet.dart';
import 'package:pet/screens/user/allveterniary.dart';
import 'package:pet/screens/user/myOrderPage.dart';
import 'package:pet/screens/user/myservices.dart';
import 'package:pet/screens/user/UserMyPet.dart';
import 'package:pet/screens/user/allveterniary.dart';
import 'package:pet/screens/user/myservices.dart';
import 'package:pet/screens/user/UserAddMyPet.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/orderDetails.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/userprofile.dart';
import 'package:pet/screens/user/service.dart';
import 'package:pet/screens/user/userfavourite.dart';
import 'package:pet/screens/user/usertranscation.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class drawer extends StatefulWidget {
  const drawer({
    super.key,
  });

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  MyOrderController myordercontroller = Get.put(MyOrderController());
 TransactionUserController transactionuserController = Get.put(TransactionUserController());
 UserMyPetListController userMyPetListController =
      Get.put(UserMyPetListController());
  ProfileController profilecontroller = Get.put(ProfileController());
AllVeterinaryController allveterniarycontroller = Get.put(AllVeterinaryController());
  NotificationController notificationcontroller =
      Get.put(NotificationController());
 @override
  void initState() {
    super.initState();
    

profilecontroller.myprofile();

  }


  static final List<String> _listViewData = [
    "Profile",
    "My Order",
    "Notifications",
    "Favourite",
    "My Pet",
    "My Services",
    "Veterniary",
  "Transaction",
   "Logout"
  ];

  static final List<IconData> _listViewIcons = [
    Icons.person,
    Icons.shopping_bag_outlined,
    Icons.notifications,
    Icons.favorite,
    Icons.pets,
    Icons.cleaning_services,
    Icons.medication_liquid_outlined,
    Icons.payment_outlined,
    Icons.logout,
  ];

  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {

    profilecontroller. myprofile() ;
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
           Container(height:MediaQuery.of(context).size.height*0.2,

                child: DrawerHeader(

                  child:  GetBuilder<ProfileController>(
                  init: profilecontroller,
                  builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(Profile());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: CircleAvatar(
                                                        radius: 35,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child:
                                                        profilecontroller
                              .myprofilemodel == null || profilecontroller
                              .myprofilemodel!.data == null || profilecontroller
                              .myprofilemodel!.data!.isEmpty ?   Image.asset("assets/image/boyprofile3.png") :
                
                                                          ClipOval (
                                                              child: CachedNetworkImage(
                                                                                                                      imageUrl: "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                                                                                                        profilecontroller
                                                                                          .myprofilemodel!.data![0].image.toString(),
                                                            
                                                                                                                      fit: BoxFit.cover,
                                                                              
                                                                                      width: 75,
                                                                                      height: 75,
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
                                                        //  Image.asset("assets/image/boyprofile3.png"),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      child: InkWell(
                                                        onTap:(){
                                                          Get.to(UserProfile());
                                                        },
                                                        child: Image.asset(
                                                          "assets/image/drawer2.png",
                                                          height: 25,
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            SizedBox(
                                                width: Get
                                                        .width *
                                                    0.03),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  
                                                        profilecontroller
                              .myprofilemodel == null || profilecontroller
                              .myprofilemodel!.data == null || profilecontroller
                              .myprofilemodel!.data!.isEmpty ?  Text("Username",style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                    "${profilecontroller.myprofilemodel!.data![0].fName.toString()} ${profilecontroller.myprofilemodel!.data![0].lName.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  
                                                        profilecontroller
                              .myprofilemodel == null || profilecontroller
                              .myprofilemodel!.data == null || profilecontroller
                              .myprofilemodel!.data!.isEmpty ? Text("Email",style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyColors.white),) :
                                                  Text(
                                                    profilecontroller
                                                        .myprofilemodel!
                                                        .data![0]
                                                        .email
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: MyColors.white,
                                                        fontSize: 14),
                                                  ),
                                                ]),
                                        
                                        
                                          ],
                                        ),
                                   
                                   
                                      ]),
                                ]),
                          ),
                        ),
                      ],
                    );
                  }),
              ),

              ),
            // ),
          // ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _listViewData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the corresponding screen
                  _navigateToScreen(context, index);
                },
                child: Container(
                  
                  child: ListTile(
                    title: Text(
                      _listViewData[index],
                      style: CustomTextStyle.reemStyle,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: MyColors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        _listViewIcons[index],
                        color: MyColors.yellow,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToScreen(BuildContext context, int index) async {
    switch (index) {
      case 0:
        Get.to(UserProfile());
        break;
      case 1:
      myordercontroller.init();
      Get.to(MyOrderUser());
        break;
      case 2:
notificationcontroller.notifyinit();
        Get.to(const NotificationUser());
        break;
      case 3:
        Get.to(Userfavourite());
        break;
      case 4:
        userMyPetListController.init();
        Get.to(AddPet());
        break;
      case 5:
        Get.to(Myservices());
        break;
      case 6:
      allveterniarycontroller.init();
        Get.to(AllVeterniary());
        break;
     case 7:
      transactionuserController.init();
      Get.to(Usertranscation());
        break;
      case 8:
        await GetStorage().erase();
        Get.offAll(LoginUser());
        break;
    }
  }
}
