// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet/utils/colors.dart';
// import 'package:pet/utils/fontstyle.dart';

// class OurBrandDetails extends StatefulWidget {
//   const OurBrandDetails({super.key});

//   @override
//   State<OurBrandDetails> createState() => _OurBrandDetailsState();
// }

// class _OurBrandDetailsState extends State<OurBrandDetails> {
//      TextEditingController _searchcontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

      
//         appBar: AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
// leading: Padding(
//   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
//   child:   InkWell(onTap: (){
//     Navigator.pop(context);
//   },
//     child: Icon(Icons.arrow_back_ios,color: MyColors. black,size: 20,
    
//     ),
//   ),
// ),
//              actions: [
//             SvgPicture.asset("assets/image/notification.svg"),
//             // Image.asset("assets/image/cartimg.png"),
//             SizedBox(width: 20),
//             Padding(
//               padding:  EdgeInsets.only(right:20.0),
//               child: SvgPicture.asset("assets/image/bag.svg"),
//             ),
           
//           ],
  
//         title:Center(child: Image.asset("assets/image/logofood.png"))
//         // SvgPicture.asset("assets/image/logofood.svg"),
//         ),
//    body:SingleChildScrollView(child: Padding(
//      padding: const EdgeInsets.all(20.0),
//      child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
                          
//         Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,          
//           children: [

//           Container(
//              height:45,
//           width:265,
//                    decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(17),
          
//                         // border: Border.all(color:brandcolor ),
          
//              color:MyColors.white,
       
          
//                     ),
          
           
            
//             child: TextFormField(
//                                   controller: _searchcontroller,
//                                                 style: TextStyle(fontSize: 14,color: MyColors. voliet, fontFamily: "SF-Pro-Display",),
          
//                                decoration: InputDecoration(
                                     
//                                        contentPadding: EdgeInsets.only(left: 15),
//                                       fillColor:MyColors.white,
//                                       focusColor:MyColors.white,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         // borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         //  borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         //  borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       hintText:"Search",
//                                       prefixIcon:Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Image.asset("assets/image/searchnormal.png",width: 10,),
//                                       ),
                                    
//                                       hintStyle:
//                                       TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                      
//                                       ),
//                                 ),
//           ),
     
//     //  SizedBox(width: 10,),
//      Container(width: 45,
// height: 45,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// color: Color(0xffffcc00)),
// child: Padding(
//   padding: const EdgeInsets.all(10.0),
//   child:   Image.asset("assets/image/filter3.png",),
// ))

//          ],),
     
     
//          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

// //      SingleChildScrollView(
// //   scrollDirection: Axis.horizontal,
// //    child: Row(mainAxisAlignment: MainAxisAlignment.start,
// //      children: [
// //   Container(
// //     height: 40,width: 90,
// // decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.circular(10)),
// //     child: Padding(
// //       padding: const EdgeInsets.all(5.0),
// //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //       Image.asset("assets/image/dog1.png"),
// //       SizedBox(width: 10,),
// //       Text("Dog",style:  CustomTextStyle.popinssmall)
       
// //         ],
// //       ),
// //     ),
// //   ), 
// // SizedBox(width:15),
// //  Container(
// //     height: 40,width: 90,
// // decoration: BoxDecoration(color:MyColors. lightblue,borderRadius: BorderRadius.circular(10)),
// //     child: Padding(
// //       padding: const EdgeInsets.all(5.0),
// //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //       Image.asset("assets/image/catimg.png"),
// //       SizedBox(width: 10,),
// //       Text("Cat",style:  CustomTextStyle.popinssmall)
       
// //         ],
// //       ),
// //     ),
// //   ), 

// // SizedBox(width: 15,),

// // Container(
// //     height: 40,width: 90,
// // decoration: BoxDecoration(color:MyColors. pinklight1
// // ,borderRadius: BorderRadius.circular(10)),
// //     child: Padding(
// //       padding: const EdgeInsets.all(5.0),
// //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //       // Image.asset("assets/image/catimg.png"),
// //       SizedBox(width: 10,),
// //       Text("Rabbit",style:  CustomTextStyle.popinssmall)
       
// //         ],
// //       ),
// //     ),
// //   ), 

   
// //        SizedBox(height: MediaQuery.of(context).size.height*0.03),








    
// //    ],),
// //  ),
// //     SizedBox(height: MediaQuery.of(context).size.height*0.03,),


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
//                                                           270),
//                                                       children: [
                                                       
//                 InkWell(onTap: (){
//                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
//                 },
//                   child: Container(
                          
//                             height:MediaQuery.of(context).size.width*0.7,
                          
//                             width: MediaQuery.of(context).size.width*0.46,
                          
//                             decoration: BoxDecoration(
                          
//                               borderRadius: BorderRadius.circular(25),
//                   color:MyColors.white
//                             ),
                          
//                           child: Column(children: [
                          
//                           Container(
                         
//                             decoration: BoxDecoration(
                          
//                               borderRadius: BorderRadius.circular(30),
//                     color:MyColors.white
                          
                          
                          
//                             ),
//                             child:
//                             Image.asset("assets/image/food.png",fit: BoxFit.cover,height: 135),
//                           ),
                          
                          
                          
//                           // SizedBox(height: 15,),
                          
                          
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Column( mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                                Text(
//                         'Mars Petcare Inc',
//                         style:  CustomTextStyle.  popinsmedium
                      
//                       ),
//                           Text(
//                         'Lorem Ipsum is simply dummy',
//                         style:  CustomTextStyle.  popinssmall0
                      
//                       ),
//                   // SizedBox(height: 3),
                
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
//                     children: [
                
//                     Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),
                
//                     Image.asset("assets/image/yellowbag.png",height: 55,)
                
                  
//                   ],)
//                   ],
//                               ),
//                             )
                          
//                           ],),
                          
//                           ),
//                 ),
//         Container(
          
//             height:MediaQuery.of(context).size.width*0.7,
          
//             width: MediaQuery.of(context).size.width*0.46,
          
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(30),
//   color:MyColors.white
//             ),
          
//           child: Column(children: [
          
//                         Container(
         
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(30),
//     color:MyColors.white
          
          
          
//             ),
//                           child:
//                           Image.asset("assets/image/dog2.png",fit: BoxFit.cover,height: 135),
//                         ),
                        
          
          
//           // SizedBox(height: 15,),
          
          
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column( mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                Text(
//                       'Mars Petcare Inc',
//                       style:  CustomTextStyle.  popinsmedium
                    
//                     ),
//                         Text(
//                       'Lorem Ipsum is simply dummy',
//                       style:  CustomTextStyle.  popinssmall0
                    
//                     ),
//                 // SizedBox(height: 3),

//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
//                   children: [

//                   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

//                   Image.asset("assets/image/yellowbag.png",height: 55,)

                
//                 ],)
//                 ],
//               ),
//             )
          
//           ],),
          
//           ),
      
                    
                                                              
//                 Container(
          
//             height:MediaQuery.of(context).size.width*0.7,
          
//             width: MediaQuery.of(context).size.width*0.46,
          
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(25),
//   color:MyColors.white
//             ),
          
//           child: Column(children: [
          
//                         Container(
         
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(30),
//     color:MyColors.white
          
          
          
//             ),
//                           child:
//                           Image.asset("assets/image/food3.png",fit: BoxFit.cover,height: 135),
//                         ),
                        
          
          
//           // SizedBox(height: 15,),
          
          
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column( mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                Text(
//                       'Mars Petcare Inc',
//                       style:  CustomTextStyle.  popinsmedium
                    
//                     ),
//                         Text(
//                       'Lorem Ipsum is simply dummy',
//                       style:  CustomTextStyle.  popinssmall0
                    
//                     ),
//                 // SizedBox(height: 3),

//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
//                   children: [

//                   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

//                   Image.asset("assets/image/yellowbag.png",height: 55,)

                
//                 ],)
//                 ],
//               ),
//             )
          
//           ],),
          
//           ),
//         Container(
          
//             height:MediaQuery.of(context).size.width*0.7,
          
//             width: MediaQuery.of(context).size.width*0.46,
          
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(30),
//   color:MyColors.white
//             ),
          
//           child: Column(children: [
          
//                         Container(
         
//             decoration: BoxDecoration(
          
//               borderRadius: BorderRadius.circular(30),
//     color:MyColors.white
          
          
          
//             ),
//                           child:
//                           Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
//                         ),
                        
          
          
//           // SizedBox(height: 15,),
          
          
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column( mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                Text(
//                       'Mars Petcare Inc',
//                       style:  CustomTextStyle.  popinsmedium
                    
//                     ),
//                         Text(
//                       'Lorem Ipsum is simply dummy',
//                       style:  CustomTextStyle.  popinssmall0
                    
//                     ),
//                 // SizedBox(height: 3),

//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
//                   children: [

//                   Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

//                   Image.asset("assets/image/yellowbag.png",height: 55,)

                
//                 ],)
//                 ],
//               ),
//             )
          
//           ],),
          
//           ),
      
                    
                    
             
             
//                                                       ],
//                                                       padding:
//                                                       EdgeInsets.all(
//                                                           5),
//                                                       shrinkWrap: true,
//                                                     ),
        
//      ],),
//    ),)
//     );
//   }
// }