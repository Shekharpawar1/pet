import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/review_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class UserAllReview extends StatefulWidget {
  const UserAllReview({super.key});

  @override
  State<UserAllReview> createState() => _UserAllReviewState();
}

class _UserAllReviewState extends State<UserAllReview> {
  final UserReviewController userreviewcontroller =
      Get.put(UserReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left, color: MyColors.black)),
          ),
          title: Center(
//
              child: Text(
            "All Review",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
          actions: [
          
            InkWell(
                onTap: () {
                  Get.to(const NotificationUser());
                },
                child: SvgPicture.asset("assets/image/notification.svg")),
            SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              GetBuilder<UserReviewController>(
                  init: userreviewcontroller,
                  builder: (_) {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: userreviewcontroller.getreviewList.length,
                      itemBuilder: (context, index) {
                        var item = userreviewcontroller.getreviewList[index];

                        return ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: [
                            Text(
                              item["title"],
                              style: CustomTextStyle.popinssmall0,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                RatingStars(
                                  value: userreviewcontroller.value!,
                                  // onValueChanged: (v) {
                                  //   //
                                  //   setState(() {
                                  //     value = v;
                                  //   });
                                  // },
                                  starBuilder: (index, color) => Icon(
                                    Icons.star,
                                    color: color,
                                    size: 15,
                                  ),
                                  starCount: 5,
                                  starSize: 20,
                                  
                                  maxValue: 5,
                                  starSpacing: 0.5,
                                  maxValueVisibility: true,
                                  valueLabelVisibility: false,
                                  animationDuration:
                                      Duration(milliseconds: 5000),
                                  starOffColor: const Color(0xffe7e8ea),
                                  starColor: MyColors.yellow,
                                ),
                                SizedBox(width: 10),
                                Image.asset(item["image"], height: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: CustomTextStyle.popinstext,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_2_outlined,
                                          size: 13,
                                        ),
                                        Text(
                                          item["count"],
                                          style: CustomTextStyle.popinssmall0,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Divider(
                              color: MyColors.lightdivider,
                              thickness: 1,
                              height: 1,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ));
  }
}
