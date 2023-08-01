import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/screens/welcomehome.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgcolor,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        GridView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 150),
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(radius: 35)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Container(
                    width: 140,
                    height: 35,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: DecoratedBox(
                        child: Center(
                          child: Text(
                            'login as a user',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: MyColors.yellow,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeHome()));
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 300,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      margin: EdgeInsets.all(
                        16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          CircleAvatar(radius: 35)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 35,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: DecoratedBox(
                        child: Center(
                          child: Text(
                            'login as a sales man',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: MyColors.yellow,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(radius: 35)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 35,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: DecoratedBox(
                      child: Center(
                        child: Text(
                          'login as a wholeseller',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: MyColors.yellow,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
          padding: EdgeInsets.all(5),
          shrinkWrap: true,
        ),
      ]),
    );
  }
}
