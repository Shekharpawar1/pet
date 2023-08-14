import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class MyPetDetails extends StatefulWidget {
  const MyPetDetails({super.key});

  @override
  State<MyPetDetails> createState() => _MyPetDetailsState();
}

class _MyPetDetailsState extends State<MyPetDetails> {
  String dropdownvalue = 'Jarman safed';

  // List of items in our dropdown menu
  TextEditingController _firstcontroller = TextEditingController();
  var items = [
    'Jarman safed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //         appBar: AppBar(
      //             elevation: 0,
      //           backgroundColor:green,
      // // leading: Padding(
      // //   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
      // //   child:   InkWell(onTap: (){
      // //     Navigator.pop(context);
      // //   },
      // //     child: Icon(Icons.arrow_back_ios,color: black,size: 20,

      // //     ),
      // //   ),
      // // ),

      //             actions: [
      //             SvgPicture.asset("assets/image/notification.svg",color:MyColors.white,),
      //             // Image.asset("assets/image/cartimg.png"),
      //             SizedBox(width: 20),
      //             Padding(
      //               padding:  EdgeInsets.only(right:20.0),
      //               child: SvgPicture.asset("assets/image/bag.svg",color:MyColors.white,),
      //             ),

      //           ],

      //         title: Text("My Pet",style: CustomTextStyle.appbartextwhite,),
      //         ),

      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/image/girlwithdog.png",
                fit: BoxFit.cover,
              )),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: MyColors.white,
                        size: 20,
                      ),
                      Text(
                        "My Pet",
                        style: CustomTextStyle.appbartextwhite,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/notification.svg",
                            color: MyColors.white,
                          ),
                          // Image.asset("assets/image/cartimg.png"),
                          SizedBox(width: 20),
                          Padding(
                            padding: EdgeInsets.only(right: 0.0),
                            child: SvgPicture.asset(
                              "assets/image/bag.svg",
                              color: MyColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Padding(
                padding: EdgeInsets.only(top: 190.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                        Text(
                          "Avatar",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/image/dogavatar.svg"),
                                SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset(
                                    "assets/image/avatardogyellow.svg"),
                                // SizedBox(width: 15,),
                                //                       SvgPicture.asset("assets/image/avatardoggreen.svg"),
                              ]),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),

                        Text(
                          "Pet Type",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: MyColors.greenlight,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Dog",
                                        style: CustomTextStyle.popinssmall)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cat",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Gender",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: MyColors.greenlight,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Female",
                                        style: CustomTextStyle.popinssmall)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Male",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Breed",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black26, width: 0.5),
                              color: MyColors.white),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black26,
                                ),
                                value: dropdownvalue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontFamily: "SF-Pro-Display",
                                          fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "DOB",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black26, width: 0.5),
                              color: MyColors.white),
                          child: TextFormField(
                            controller: _firstcontroller,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black26,
                                fontFamily: "SF-Pro-Display"),
                            decoration: InputDecoration(

                                // contentPadding: EdgeInsets.only(left: 15),
                                fillColor: MyColors.white,
                                focusColor: MyColors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,

                                  // borderRadius: BorderRadius.circular(50),
                                ),
                                // contentPadding: EdgeInsets.all(10),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  //  borderRadius: BorderRadius.circular(50),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  //  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: "DD/MM/YYYY",
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black26,
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: "SF-Pro-Display",
                                    fontSize: 14)),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Age",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("3 Month",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: MyColors.greenlight,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("2 Year",
                                        style: CustomTextStyle.popinssmall)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Pet Name",
                          style: CustomTextStyle.popinstext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black26, width: 0.5),
                              color: MyColors.white),
                          child: TextFormField(
                            controller: _firstcontroller,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black26,
                                fontFamily: "SF-Pro-Display"),
                            decoration: InputDecoration(

                                // contentPadding: EdgeInsets.only(left: 15),
                                fillColor: MyColors.white,
                                focusColor: MyColors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,

                                  // borderRadius: BorderRadius.circular(50),
                                ),
                                // contentPadding: EdgeInsets.all(10),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  //  borderRadius: BorderRadius.circular(50),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  //  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: "Jumba",
                                // suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.black26,),
                                hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: "SF-Pro-Display",
                                    fontSize: 14)),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPet()));
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: MyColors.yellow,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Text(
                                "Add Pet",
                                style: CustomTextStyle.mediumtextreem,
                              )),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
