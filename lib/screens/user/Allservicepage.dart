// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:pet/controllers/user_controller/home_controller.dart';
// import 'package:pet/utils/colors.dart';
// import 'package:pet/utils/fontstyle.dart';

// class Allservicepage extends StatefulWidget {
//   const Allservicepage({super.key});

//   @override
//   State<Allservicepage> createState() => _AllservicepageState();
// }

// class _AllservicepageState extends State<Allservicepage> {
//    final HomeuserController homeusercontroller = Get.put(HomeuserController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
// leading: Padding(
//   padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
//   child:   InkWell(onTap: (){
//     Navigator.pop(context);
//   },
//     child: Icon(Icons.arrow_back_ios,color:MyColors.black,size: 20,
    
//     ),
//   ),
// ),
         
//         title: Center(child: Text("All Services",style: CustomTextStyle.appbartext,)),
//         ),

//         body:
//        Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: ListView(
//             shrinkWrap: true,
//             primary: true,
//             children: [
//             // SizedBox(height: MediaQuery.of(context).size.height*0.01),
        
   

//  GetBuilder<HomeuserController>(
//                       init: homeusercontroller,
//                       builder: (_) {
// return  Container(
//                         // height: 600,
//                         child: GridView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 4,
//                                 //  childAspectRatio: 4 / 4,
//                                 crossAxisSpacing: 15,
                                
//                   mainAxisSpacing: 15,
//                   mainAxisExtent: 100),
//                             itemCount: homeusercontroller
//                                 .getServiceList!.length
                               
//                                 ,
//                             itemBuilder: (BuildContext ctx, index) {
//       var item = homeusercontroller.
//                                    getServiceList[index];
//                               return
//                                 Column(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black26, width: 1),
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyColors.white),
//                     ),
//                     Text(
//                      item["title"],
//                       style: CustomTextStyle.popinssmall0,
//                     )
//                   ],
//                 );
//   //             
//                             }));

//   // // GridView(
//   //             physics: NeverScrollableScrollPhysics(),
//   //             scrollDirection: Axis.vertical,
//   //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //                 crossAxisCount: 4,
//   //                 crossAxisSpacing: 15,
//   //                 mainAxisSpacing: 15,
//   //                 mainAxisExtent: 100),
//   //             children: [
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Brush",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Nail Cutter",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Comb",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //               Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 60,
//   //                     width: 60,
//   //                     decoration: BoxDecoration(
//   //                         border: Border.all(color: Colors.black26, width: 1),
//   //                         borderRadius: BorderRadius.circular(25),
//   //                         color: MyColors.white),
//   //                   ),
//   //                   Text(
//   //                     "Slicker",
//   //                     style: CustomTextStyle.popinssmall0,
//   //                   )
//   //                 ],
//   //               ),
//   //             ],
//   //             padding: EdgeInsets.all(5),
//   //             shrinkWrap: true,
//   //           );
         
//                       })
         
    
      
//           ],),
//         )
   
         
//     );
//   }
// }