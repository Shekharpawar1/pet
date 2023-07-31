// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet/utils/colors.dart';
// import 'package:pet/utils/fontstyle.dart';
// import 'package:pet/screens/user/home.dart';

// class color:MyColors.black extends StatefulWidget {
//   const CommonScreen({super.key});

//   @override
//   State<CommonScreen> createState() => _CommonScreenState();
// }

// class _CommonScreenState extends State<CommonScreen> {
//   TextEditingController _searchcontroller = TextEditingController();
//   final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        key: _drawerkey,
//            appBar: AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
//           leading: Padding(
//             padding: const EdgeInsets.only(left:20.0,top: 15,bottom: 15),
//             child: GestureDetector(
//                 onTap: (){
//                   _drawerkey.currentState!.openDrawer();
//                 },child: Image.asset(
//                 "assets/image/menu2.png",
//               ),
//             ),
//           ),
// //           title: Center(
// // //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// // //
// //             child:Text("")
// //           ),
//           actions: [
//             SvgPicture.asset("assets/image/notification.svg"),
//             // Image.asset("assets/image/cartimg.png"),
//             SizedBox(width: 20),
//             Padding(
//               padding:  EdgeInsets.only(right:20.0),
//               child: SvgPicture.asset("assets/image/bag.svg"),
//             ),
           
//           ],
//           // shape: RoundedRectangleBorder(
//           //   borderRadius: BorderRadius.vertical(
//           //     bottom: Radius.circular(20),
//           //   ),
//           // ),
//         ),

//         body: SingleChildScrollView(child: 

//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(children: [
            
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(width: MediaQuery.of(context).size.width*0.6,
//                   child: Text("Find the pet you love on around you easily",style: CustomTextStyle.popinstext,)),
           
//         Image.asset("assets/image/girl.png")
//           //  SvgPicture.asset("assets/image/girl.svg"),
//                 ],
//               ),
        
//                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        
           
//            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
//             children: [
        
//             Expanded(
//               child: Container(
//                  height: MediaQuery.of(context).size.height*0.07,
//                //      width: MediaQuery.of(context).size.width*0.7,
                      
                
                
//                         decoration: BoxDecoration(
              
//                             borderRadius: BorderRadius.circular(15),
              
//                             // border: Border.all(color:brandcolor ),
              
//                  color:MyColors.white
              
//                         ),
              
               
                
//                 child: TextFormField(
//                                       controller: _searchcontroller,
//                                                     style: TextStyle(fontSize: 14,color: MyColors. voliet, fontFamily: "SF-Pro-Display",),
            
//                                    decoration: InputDecoration(
                                         
//                                           // contentPadding: EdgeInsets.only(left: 15),
//                                           fillColor:MyColors.white,
//                                           focusColor:MyColors.white,
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide.none,
//                                             // borderRadius: BorderRadius.circular(50),
//                                           ),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide.none,
//                                             //  borderRadius: BorderRadius.circular(50),
//                                           ),
//                                           border: OutlineInputBorder(
//                                             borderSide: BorderSide.none,
//                                             //  borderRadius: BorderRadius.circular(50),
//                                           ),
//                                           hintText:"Search",
//                                           prefixIcon:Image.asset("assets/image/search.png",width: 10,),
                                        
//                                           hintStyle:
//                                           TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                          
//                                           ),
//                                     ),
//               ),
//             ),
            
//              SvgPicture.asset("assets/image/filter.svg")
        
//            ],),





           
//      GridView(
//                                                       physics:
//                                                       NeverScrollableScrollPhysics(),
//                                                       scrollDirection:
//                                                       Axis.vertical,
//                                                       gridDelegate:
//                                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                                           crossAxisCount:
//                                                           2,
//                                                           crossAxisSpacing:
//                                                           15,
//                                                           mainAxisSpacing:
//                                                           15,
//                                                           mainAxisExtent:
//                                                           180),
//                                                       children: [
//                                                         InkWell(
//     //                                                       onTap: (){
//     //  Navigator.push(
//     //                           context,
//     //                           MaterialPageRoute(
//     //                               builder: (context) => Home(
          
          
//     //                               )));
//     //                                                       },
//                                                           child:
//                                                             Container(
                                                                
//                                                                   // height:MediaQuery.of(context).size.height*0.5,
                                                                
//                                                                   width: MediaQuery.of(context).size.width*0.46,
                                                                
//                                                                   decoration: BoxDecoration(
                                                                
//                                                                     borderRadius: BorderRadius.circular(30),
//                                                         color:MyColors.white
//                                                                   ),
                                                                
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.all(8.0),
//                                                                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                                                                     children: [
                                                                  
//                                                                                 CircleAvatar(backgroundColor:MyColors. grey ,
//                                                                                   radius: 40,child: Image.asset("assets/image/dogimg7.png",fit: BoxFit.cover)),
                                                                                
                                                                  
                                                                  
//                                                                   SizedBox(height: 15,),
                                                                
                                                                
//                                                                                     InkWell(
                                                                
//                                                                                       onTap: (){
                                                                                      
//      Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Home(
          
          
//                                   )));
                                                          
//                                                                                       },
//                                                                                       child: Container(
//                                                                                       height: MediaQuery.of(context).size.height * 0.04,
//                                                                                       width: MediaQuery.of(context).size.width * 0.4,
//                                                                                       decoration: BoxDecoration(
//                                                                                           borderRadius: BorderRadius.circular(25),
//                                                                                           color:MyColors.yellow
//                                                                                           ),
//                                                                                       child: Padding(
//                                                                                         padding: const EdgeInsets.all(8.0),
//                                                                                         child: Center(
//                                                                                           child: Text(
//                                                                                            "wholeseller",
//                                                                                             style: TextStyle(
//                                                                                                 fontSize: 12,
//                                                                                                 color:MyColors.  black,
//                                                                                                 fontWeight: FontWeight.w500),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                             ),
//                                                                                     ),
                                                                
                                                                
                                                                              
                                                                  
                                                                        
//                                                                   ],),
//                                                                 ),
                                                                
//                                                                 ),
//                                                         ),   
                                                              
//                                                             Container(
                                                                
//                                                                   // height:MediaQuery.of(context).size.height*0.5,
                                                                
//                                                                   width: MediaQuery.of(context).size.width*0.46,
                                                                
//                                                                   decoration: BoxDecoration(
                                                                
//                                                                     borderRadius: BorderRadius.circular(30),
//                                                         color:MyColors.white
//                                                                   ),
                                                                
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.all(8.0),
//                                                                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                                                                     children: [
                                                                  
//                                                                                 CircleAvatar(backgroundColor:MyColors. grey ,
//                                                                                   radius: 40,child: Image.asset("assets/image/dogimg7.png",fit: BoxFit.cover)),
                                                                                
                                                                  
                                                                  
//                                                                   SizedBox(height: 15,),
                                                                
                                                                
//                                                                                     InkWell(
                                                                
//                                                                                       onTap: (){
//                                                                                     //     Navigator.push(
//                                                                                     // context,
//                                                                                     // MaterialPageRoute(
//                                                                                     //     builder: (context) => CountJeweller(
                                                                
                                                                
//                                                                                     //     )));
//                                                                                       },
//                                                                                       child: Container(
//                                                                                       height: MediaQuery.of(context).size.height * 0.04,
//                                                                                       width: MediaQuery.of(context).size.width * 0.4,
//                                                                                       decoration: BoxDecoration(
//                                                                                           borderRadius: BorderRadius.circular(25),
//                                                                                           color:MyColors.yellow
//                                                                                           ),
//                                                                                       child: Padding(
//                                                                                         padding: const EdgeInsets.all(8.0),
//                                                                                         child: Center(
//                                                                                           child: Text(
//                                                                                            "login as a sales man",
//                                                                                             style: TextStyle(
//                                                                                                 fontSize: 12,
//                                                                                                 color: MyColors. black,
//                                                                                                 fontWeight: FontWeight.w500),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                             ),
//                                                                                     ),
                                                                
                                                                
                                                                              
                                                                  
                                                                        
//                                                                   ],),
//                                                                 ),
                                                                
//                                                                 ),
                                                            
                                                               
//                                                             Container(
                                                                
//                                                                   // height:MediaQuery.of(context).size.height*0.5,
                                                                
//                                                                   width: MediaQuery.of(context).size.width*0.46,
                                                                
//                                                                   decoration: BoxDecoration(
                                                                
//                                                                     borderRadius: BorderRadius.circular(30),
//                                                         color:MyColors.white
//                                                                   ),
                                                                
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.all(8.0),
//                                                                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                                                                     children: [
                                                                  
//                                                                                 CircleAvatar(backgroundColor:MyColors. grey ,
//                                                                                   radius: 40,child: Image.asset("assets/image/dogimg7.png",fit: BoxFit.cover)),
                                                                                
                                                                  
                                                                  
//                                                                   SizedBox(height: 15,),
                                                                
                                                                
//                                                                                     InkWell(
                                                                
//                                                                                       onTap: (){
//                                                                                     //     Navigator.push(
//                                                                                     // context,
//                                                                                     // MaterialPageRoute(
//                                                                                     //     builder: (context) => CountJeweller(
                                                                
                                                                
//                                                                                     //     )));
//                                                                                       },
//                                                                                       child: Container(
//                                                                                       height: MediaQuery.of(context).size.height * 0.04,
//                                                                                       width: MediaQuery.of(context).size.width * 0.4,
//                                                                                       decoration: BoxDecoration(
//                                                                                           borderRadius: BorderRadius.circular(25),
//                                                                                           color:MyColors.yellow
//                                                                                           ),
//                                                                                       child: Padding(
//                                                                                         padding: const EdgeInsets.all(8.0),
//                                                                                         child: Center(
//                                                                                           child: Text(
//                                                                                            "login as a wholeseller",
//                                                                                             style: TextStyle(
//                                                                                                 fontSize: 12,
//                                                                                                 color: MyColors. black,
//                                                                                                 fontWeight: FontWeight.w500),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                             ),
//                                                                                     ),
                                                                
                                                                
                                                                              
                                                                  
                                                                        
//                                                                   ],),
//                                                                 ),
                                                                
//                                                                 ),
                                                            
                                                              
                                                                   
                                                                   
                                                          
                                                        
//                                                       ],
//                                                       padding:
//                                                       EdgeInsets.all(
//                                                           5),
//                                                       shrinkWrap: true,
//                                                     ),
           
//        SizedBox(height: MediaQuery.of(context).size.height*0.03),
    
        
//           ],),
//         )
//         ),
//     );
//   }
// }