import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import 'package:pet/screens/selectscreen.dart';

import '../screens/common/common.dart';

class MyIntroductionScreen extends StatefulWidget {
  @override
  State<MyIntroductionScreen> createState() => _MyIntroductionScreenState();
}

class _MyIntroductionScreenState extends State<MyIntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionSlider(
      showStatusBar: true,
      items: [
        IntroductionSliderItem(
          logo: Image.asset("assets/image/login.png"),
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Find The Pet You Love On\n Around You Easily",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and Lorem I",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          backgroundColor: MyColors.bgcolor,
        ),
        IntroductionSliderItem(
          logo: Image.asset("assets/image/login.png"),
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Find The Pet You Love On\n Around You Easily",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and Lorem I",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          backgroundColor: MyColors.bgcolor,
        ),
        IntroductionSliderItem(
          logo: Image.asset("assets/image/login.png"),
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Find The Pet You Love On\n Around You Easily",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and Lorem I",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: MyColors.white,
                  fontFamily: "ReemKufi-Regular"),
            ),
          ),
          backgroundColor: MyColors.bgcolor,
        ),
      ],
      done: Done(
        child: Row(children: [
          Text(
            "NEXT",
            style: CustomTextStyle.mediumtext,
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset("assets/image/next.png")
        ]),
        home: LoginUser(),
      ),
      next: Next(
        child: Row(children: [
          Text(
            "NEXT",
            style: CustomTextStyle.mediumtext,
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset("assets/image/next.png")
        ]),
      ),
      back: Back(child: Icon(Icons.arrow_back)),
      dotIndicator: DotIndicator(
        selectedColor: MyColors.white,
      ),
    ));
  }
}
