import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/service_controller.dart';
import 'package:pet/screens/user/services2.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/notification.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  //  
  
  // ServiceController servicecontroller = Get.put(ServiceController());
   final HomeuserController homeusercontroller = Get.put(HomeuserController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
             appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:20.0,top: 15,bottom: 15),
            child: Image.asset(
              "assets/image/menu2.png",
            ),
          ),
          title: Center(
              child:Text("Services",style:  CustomTextStyle.appbartext,)
          ),
          actions: [
            InkWell(
              onTap: (){
 Get.to (NotificationUser());
},
              child: SvgPicture.asset("assets/image/notification.svg")),
    
            SizedBox(width: 20),
            Padding(
              padding:  EdgeInsets.only(right:20.0),
              child: SvgPicture.asset("assets/image/bag.svg"),
            ),
           
          ],
        ),

        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          //  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            
            Image.asset("assets/image/bgimg1.png"),
           SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          

          
            GetBuilder<HomeuserController>(
                init: homeusercontroller,
                builder: (_) {
                  return homeusercontroller.userServicesModel == null
                      ? SizedBox()
                      : Container(
                          // height: 600,
                          child: GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      //  childAspectRatio: 4 / 4,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      mainAxisExtent: 100),
                              itemCount: homeusercontroller
                                  .userServicesModel!.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                var item = homeusercontroller
                                    .userServicesModel!.data![index];
                                var imagePath =
                                    "${Constants.BASE_URL}${Constants.SERVICES_IMAGE_PATH}${item.image ?? ""}";

                                return GestureDetector(
                                  onTap: () async {
                                    String url =
                                        Constants.GET_SERVICES_CATEGORIES +
                                            "/" +
                                            item.id.toString();
                                    homeusercontroller
                                        .getServicesCategories(url);

                                    Get.to(() => services2());
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black26,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: MyColors.white),
                                        child: CachedNetworkImage(
                                          imageUrl: imagePath,
                                          fit: BoxFit.cover,
                                          // width: 61,
                                          // height: 75,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ), // Replace with your own placeholder widget
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons
                                                  .error), // Replace with your own error widget
                                        ),
                                      ),
                                      Text(
                                        item.name!,
                                        style: CustomTextStyle.popinssmall0,
                                      )
                                    ],
                                  ),
                                );
                                //
                              }));

                  // // GridView(
                  //             physics: NeverScrollableScrollPhysics(),
                  //             scrollDirection: Axis.vertical,
                  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //                 crossAxisCount: 4,
                  //                 crossAxisSpacing: 15,
                  //                 mainAxisSpacing: 15,
                  //                 mainAxisExtent: 100),
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.black26, width: 1),
                  //                         borderRadius: BorderRadius.circular(25),
                  //                         color: MyColors.white),
                  //                   ),
                  //                   Text(
                  //                     "Brush",
                  //                     style: CustomTextStyle.popinssmall0,
                  //                   )
                  //                 ],
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.black26, width: 1),
                  //                         borderRadius: BorderRadius.circular(25),
                  //                         color: MyColors.white),
                  //                   ),
                  //                   Text(
                  //                     "Nail Cutter",
                  //                     style: CustomTextStyle.popinssmall0,
                  //                   )
                  //                 ],
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.black26, width: 1),
                  //                         borderRadius: BorderRadius.circular(25),
                  //                         color: MyColors.white),
                  //                   ),
                  //                   Text(
                  //                     "Comb",
                  //                     style: CustomTextStyle.popinssmall0,
                  //                   )
                  //                 ],
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(color: Colors.black26, width: 1),
                  //                         borderRadius: BorderRadius.circular(25),
                  //                         color: MyColors.white),
                  //                   ),
                  //                   Text(
                  //                     "Slicker",
                  //                     style: CustomTextStyle.popinssmall0,
                  //                   )
                  //                 ],
                  //               ),
                  //             ],
                  //             padding: EdgeInsets.all(5),
                  //             shrinkWrap: true,
                  //           );
                })
        
//  GetBuilder<ServiceController>(
//                       init: servicecontroller,
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
//                             itemCount: servicecontroller
//                                 .getServiceList!.length
                               
//                                 ,
//                             itemBuilder: (BuildContext ctx, index) {
//       var item = servicecontroller.
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
//                     SizedBox(height: 5,),
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
           

      //       Container(  
      //         height: MediaQuery.of(context).size.height*0.3,
      //  width: MediaQuery.of(context).size.height*0.5 ,

      //       padding: EdgeInsets.all(12.0),  
      //       child: GridView.builder(  
      //         itemCount: 6,  
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
      //             crossAxisCount: 4,  
      //             // mainAxisExtent: 5,
      //             crossAxisSpacing: 15.0,  
      //             mainAxisSpacing: 10.0  ,
      //             mainAxisExtent: 100
      //         ),  
      //         itemBuilder: (BuildContext context, int index){  
      //           return  Column(
      //             children: [
      //               Container(
      //                 height: 60,width:60,
      //                 decoration:BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 border: Border.all(color: Colors.black26)
      //               )
      //                              ,),

      //                              SizedBox(height: 3,),
      //            Text("Brush")
                 
      //             ],
      //           );  
      //         },  
      //       )),  
   ,
   
       Text(
       "Doctor",
       style:
      CustomTextStyle.popinstext,
     ),
       SizedBox(height: MediaQuery.of(context).size.height*0.02,),
   Container(
    height: MediaQuery.of(context).size.height*0.26,
    width: MediaQuery.of(context).size.width,
     decoration: BoxDecoration(
              border: Border.all(color:Colors.black26,width:0.3),
                  borderRadius: BorderRadius.circular(25),
      color:MyColors.white
                ),

child:
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right:15,top: 15),
                  child: Column(
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                
                            Image.asset("assets/image/doctorgirl.png"),
                            
                
                          ],),
                   SizedBox(width: 15,),
                   
                   Column(crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Cameron Williamson",style: CustomTextStyle.popinsbold,),
                         SizedBox(height: 5 ,),
                              Row(children: [
                                Image.asset("assets/image/footprint.png"),
                                SizedBox(width: 5 ,),
                                Text("Pharmacology",style: CustomTextStyle.popinssmall0,),
                              ],),
                              SizedBox(height: 2 ,),
                            
                                Text("Pharmacology",style: CustomTextStyle.popinssmall0,),
                       SizedBox(height:5 ,),
                     Row(children: [
                     SvgPicture.asset("assets/image/yellowstar.svg"),
                       SizedBox(width: 5,),
                      SvgPicture.asset("assets/image/yellowstar.svg"),
                        SizedBox(width: 5 ,),
                           SvgPicture.asset("assets/image/yellowstar.svg"),
                         SizedBox(width: 5 ,),
                
                      SvgPicture.asset("assets/image/yellowstar.svg"),
                              SizedBox(width: 5 ,),
                
                           SvgPicture.asset("assets/image/whitestar.svg"),
                     ],)
                     
                     
                     ],
                   ),
                        
                       ],
                      ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),   
                   InkWell(
                    onTap: (){
                      Get.to(services2());
                    },
                     child: Container(
                            
                      width: MediaQuery.of(context).size.width*0.6,
                            
                            height: MediaQuery.of(context).size.height*0.06,
                            
                            decoration: BoxDecoration(
                            
                              color:MyColors.yellow,
                            
                              borderRadius: BorderRadius.circular(15)
                            
                            ),
                            
                            
                            
                            child: 
                            
                              Center(child: Text("Appointment",style: CustomTextStyle.mediumtextreem,))
                            
                         ,
                            
                          ),
                   ),
                      
                
                    ],
                  ),
                )
   )
   
   
      ]),  



    )          ),
        
    );
  }
}