import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/screens/user/profile.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class drawer extends StatefulWidget {
  const drawer({super.key,});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  static final List<String> _listViewData = [
    "Profile",
    "Notifications",
    "Messages",
    "Favourite",
    "My Pet",
   
  ];

  int _currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
backgroundColor:MyColors.bgcolor,

      
        child: ListView(
          // padding: EdgeInsets.zero,
            children: [
              Container(height:MediaQuery.of(context).size.height*0.2,

                child: DrawerHeader(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap:(){
                        // Get.to(Profile());
                      },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
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
            alignment: Alignment.topCenter,
                children:[
                    Padding(
                  padding: EdgeInsets.only(bottom: 20),
               child:CircleAvatar(
                radius:35,
                backgroundColor: Colors.transparent,
                  child: Image.asset("assets/image/boyprofile3.png"),
                ),),
               
                Positioned(
                 
                  bottom: 10,
                  child: Image.asset("assets/image/drawer2.png",height: 25,),
              
                ) 
              ]),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text(
                                                  "User",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                                          color:MyColors.white),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "user123@gmail.com",
                                                  style: TextStyle(
                                            color:MyColors.white,fontSize: 16),
                                                ),
                                              ]),
                                        ],
                                      ),

                                    ]),

                              ]),
                        ),
                      ),
                    ],
                  ),
                ),

              ),

         
              Container(
height:MediaQuery.of(context).size.height*0.8,
                child: ListView.builder(
                //padding: EdgeInsets.all(10.0),
                itemCount: _listViewData!.length,
                  itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: _currentSelected == index ? MyColors.gradient:MyColors.bgcolor,
                      // gradient: LinearGradient(colors: [

                      // ])
                    ),
                
                    child: ListTile(onTap: (){
                       setState(() {
                          _currentSelected = index;
                        });
                    },
                        title:Text(_listViewData[index],style: CustomTextStyle.reemStyle,),
                        leading: Container(
                        
                          height: 40,width: 40,
                        decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(15)),
                        ),
                    ));
                          
                      // ListTile(
                      // title:Text("Notifications",style: CustomTextStyle.reemStyle,),
                      // leading: Container(
                      
                      //   height: 40,width: 40,
                      //             decoration: BoxDecoration(
                      //   color: blue,
                      //   borderRadius: BorderRadius.circular(15)),
                      // ),
                      // )
                      //              ,
                      // ListTile(
                      // title:Text("Messages",style: CustomTextStyle.reemStyle,),
                      // leading: Container(
                      
                      //   height: 40,width: 40,
                      //             decoration: BoxDecoration(
                      //   color: blue,
                      //   borderRadius: BorderRadius.circular(15)),
                      // ),
                      // )
                           
                      //                         ,
                      // ListTile(
                      // title:Text("Favourite",style: CustomTextStyle.reemStyle,),
                      // leading: Container(
                      
                      //   height: 40,width: 40,
                      //             decoration: BoxDecoration(
                      //   color: blue,
                      //   borderRadius: BorderRadius.circular(15)),
                      // ),
                      // )
                      //                                 ,
                      // ListTile(
                      // title:Text("My Pet",style: CustomTextStyle.reemStyle,),
                      // leading: Container(
                      
                      //   height: 40,width: 40,
                      //             decoration: BoxDecoration(
                      //   color: blue,
                      //   borderRadius: BorderRadius.circular(15)),
                      // ),
                      // )
                      
              
              
              
              
              
              
              
              
                 } ),
              )]));
  
  }
}