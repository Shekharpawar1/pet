import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/screens/partner/login.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

import 'package:pet/screens/salesman/login.dart';
import 'package:pet/screens/user/login.dart';
import 'package:pet/screens/wholesaler/login.dart';

class Common extends StatefulWidget {
  const Common({super.key});

  @override
  State<Common> createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 180),
                    children: [
                      // InkWell(onTap: (){
                      //   Get.to(LoginUser());
                      // },
                      //   child: Container(

                      //               width: 160,
                      // height: 188,
                      //               decoration: BoxDecoration(
                      //             gradient: LinearGradient(
                      //               begin: Alignment.topCenter,
                      //               end: Alignment.bottomCenter,
                      //               colors: [
                      //   const Color(0xFFFFD8DC),
                      //   const Color(0x00FFE0E3),
                      //               ],
                      //               stops: [0.0, 1.0],),
                      //   borderRadius: BorderRadius.circular(37),
                      //               // color:MyColors.white
                      //               ),

                      //             child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

                      //             Image.asset("assets/image/user.png",width: 80,
                      // height: 80,),

                      //               Padding(
                      //   padding: const EdgeInsets.all(5.0),
                      //   child: Text(
                      //          'Login as a \n User',textAlign: TextAlign.center,
                      //          style:  CustomTextStyle.  popinsmedium

                      //        ),
                      //               )

                      //             ],),

                      //             ),
                      // ),

                      InkWell(
                        onTap: () {
                          Get.to(LoginWhole());
                        },
                        child: Container(
                          width: 160,
                          height: 188,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFDFFFC6),
                                Color.fromRGBO(223, 255, 198, 0.00),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(37),
                            // color:MyColors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/image/wholesale.png",
                                width: 80,
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Login as a \n Wholesaler',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.popinsmedium),
                              )
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Get.to(LoginSales());
                        },
                        child: Container(
                          width: 160,
                          height: 188,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFC5E7FC),
                                Color.fromRGBO(197, 231, 252, 0.00),
                              ],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(37),
                            // color:MyColors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/image/saleman.png",
                                width: 80,
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Login as a \n Sales Man',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.popinsmedium),
                              )
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Get.to(LoginPartner());
                        },
                        child: Container(
                          width: 160,
                          height: 188,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFEDDFFF),
                                Color.fromRGBO(237, 223, 255, 0.00),
                              ],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(37),
                            // color:MyColors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/image/partner.png",
                                width: 80,
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Login as a \n Become A Partner',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.popinsmedium),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    padding: EdgeInsets.all(5),
                    shrinkWrap: true,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/image/catdogimg.png"))
            ],
          ),
        ));
  }
}
