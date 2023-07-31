import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class WelcomeHome extends StatefulWidget {
  const WelcomeHome({super.key});

  @override
  State<WelcomeHome> createState() => _WelcomeHomeState();
}

class _WelcomeHomeState extends State<WelcomeHome> {
  TextEditingController _searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              _drawerkey.currentState!.openDrawer();
            },
            child: Image.asset(
              "assets/image/menu2.png",
            ),
          ),
        ),
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),
        actions: [
          SvgPicture.asset("assets/image/notification.svg"),
          // Image.asset("assets/image/cartimg.png"),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/image/bag.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "Find the pet you love on around you easily",
                      style: CustomTextStyle.popinstext,
                    )),

                Image.asset("assets/image/girl.png")
                //  SvgPicture.asset("assets/image/girl.svg"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 190),
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffCEE8FC)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CircleAvatar(
                          radius: 45,
                          child: Image.asset("assets/image/firstimg.png"),
                        ),

                        // SizedBox(height: 15,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total order',
                                  style: CustomTextStyle.popinsmedium),
                              //         Text(
                              //       'Lorem Ipsum is simply dummy',
                              //       style:  CustomTextStyle.  popinssmall0

                              //     ),
                              // // SizedBox(height: 3),

                              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              //   children: [

                              //   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                              //   Image.asset("assets/image/yellowbag.png",height: 55,)

                              // ],)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffFBF1C8)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: MyColors.yellow,
                          child: Image.asset("assets/image/dogimg56.png"),
                        ),

                        // SizedBox(height: 15,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(' Total pending order',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.popinsmedium),
                              ),
                              //         Text(
                              //       'Lorem Ipsum is simply dummy',
                              //       style:  CustomTextStyle.  popinssmall0

                              //     ),
                              // // SizedBox(height: 3),

                              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              //   children: [

                              //   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                              //   Image.asset("assets/image/yellowbag.png",height: 55,)

                              // ],)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffE2FDA6C).withOpacity(0.3)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.green,
                          child: Image.asset("assets/image/bookimg.png"),
                        ),

                        // SizedBox(height: 15,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total up coming order',
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.popinsmedium),
                              //         Text(
                              //       'Lorem Ipsum is simply dummy',
                              //       style:  CustomTextStyle.  popinssmall0

                              //     ),
                              // // SizedBox(height: 3),

                              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              //   children: [

                              //   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                              //   Image.asset("assets/image/yellowbag.png",height: 55,)

                              // ],)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffFFD4FD)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.pink,
                          child: Image.asset("assets/image/earnimg.png"),
                        ),

                        // SizedBox(height: 15,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('Total earning',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.popinsmedium),
                              ),
                              //         Text(
                              //       'Lorem Ipsum is simply dummy',
                              //       style:  CustomTextStyle.  popinssmall0

                              //     ),
                              // // SizedBox(height: 3),

                              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              //   children: [

                              //   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                              //   Image.asset("assets/image/yellowbag.png",height: 55,)

                              // ],)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              padding: EdgeInsets.all(5),
              shrinkWrap: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ]),
        ),
      ),
    );
  }
}
