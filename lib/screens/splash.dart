import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/screens/bottomnavbar.dart';

import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/partner/subsciption.dart';
import 'package:pet/screens/salesman/Dashboard.dart';
import 'package:pet/screens/user/userHome.dart';
import 'package:pet/screens/wholesaler/Dashboard.dart';
import 'package:pet/screens/wholesaler/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    callTimer();
  }

  Future<void> callTimer() async {
    Timer(
      Duration(seconds: 3),
      () async {
        // final storage = GetStorage();
        await GetStorage.init();
        var id = await GetStorage().read("id");
        var data = await GetStorage().read("userData");

        var wholesalerid = await GetStorage().read("wholesalerid");
        var wholesalerroleid = await GetStorage().read("wholesalerroleid");

        var wholesalerData = await GetStorage().read("wholesalerData");

        var sellerid = await GetStorage().read("sellerid");
        var sellerdata = await GetStorage().read("sellerData");

 var partnerid = await GetStorage().read("partnerid");
        var partnerdata = await GetStorage().read("partnerData");


        print("WholesalerroleID: ==> ${wholesalerroleid.toString()}");
        print("user Id : ===>>> ${id.toString()}");
        print("user Data : ===>>> ${data.toString()}");
        print("wholesaler Id : ===>>> ${wholesalerid.toString()}");
        print("wholesaler Data : ===>>> ${wholesalerData.toString()}");

        print("sellerid  : ===>>> ${sellerid.toString()}");
        print("sellerdata  : ===>>> ${sellerdata.toString()}");

         print("partnerid  : ===>>> ${partnerid.toString()}");
        print("partnerData  : ===>>> ${partnerdata.toString()}");

        print(partnerid);
        id == null && wholesalerid == null && sellerid == null && partnerid == null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyIntroductionScreen(),
                ),
              )
            : (wholesalerroleid != null)
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardWhole(),
                    ),
                  )
                : (partnerid != null)
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Subscription(),
                        ),
                      )
                       : (sellerid != null)
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardSales(),
                        ),
                      )
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                      );

        //  if(wholesalerdata["role"] == 1);
        //     wholesalerid == null
// print("WholesalerID${wholesalerdata["role"]}" );

//        if(wholesalerdata["role"] == 1);

//         ? Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MyIntroductionScreen(),
//                 ),
//               )
//             :Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomeWhole(),
//                 ),
//               );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/image/splashpet.png",
            fit: BoxFit.cover,
          )),
    ));
  }
}
