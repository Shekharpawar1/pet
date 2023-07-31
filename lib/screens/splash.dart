import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/screens/bottomnavbar.dart';

import 'package:pet/screens/intro2.dart';
import 'package:pet/screens/user/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        final storage = GetStorage();
        var id = storage.read("login");
        print(id);
        id != true
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyIntroductionScreen(),
                ),
              )
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBar(),
                ),
              );
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
