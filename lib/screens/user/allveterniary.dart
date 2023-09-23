import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/allveterinary_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/veterniaryDetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class AllVeterniary extends StatelessWidget {
   AllVeterniary({super.key});
AllVeterinaryController allveterniarycontroller = Get.put(AllVeterinaryController());
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
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
              child: Text(
            "Veterniary",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
         actions: [
        

                  
          Stack(
            children: [
              InkWell(
                  onTap: () {
                     Get.to(const NotificationUser());
                  },
                  child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
                SizedBox(width: 20),
 Stack(
            children: [
              InkWell(
                  onTap: () {
                      Get.to(const AddToCardUser());
                   
                  },
                  child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// (getCardModel!.data!.isEmpty)?
// SizedBox():
 Positioned(
 top: 10.0,right: 0,
                    child:  Stack(
                      children: <Widget>[
                         Icon(
                            Icons.brightness_1,
                            size: 15.0, color: MyColors.red),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(('5').toString(),
                                // list.length.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

                  
                      ],
                    )),


            ],
          ),
    
    SizedBox(width: 20,)
    
        ], 
        ),

        body:Padding(
  padding: const EdgeInsets.all(15.0),
  child:   GetBuilder<AllVeterinaryController>(
           init: allveterniarycontroller,
           builder: (_) {
             return
   !allveterniarycontroller.allveterniaryLoaded
                            ? SizedBox()
   :
  ListView.builder(
  shrinkWrap: true,
  primary: false,
  itemCount: allveterniarycontroller.allveterniarymodel!.data!.length,
  itemBuilder: (context, index) {
    var item = allveterniarycontroller.allveterniarymodel!.data![index];

    return GestureDetector(
      onTap: (){
        Get.to(VeterniaryDetails(
       id:item.id,
       petId: item.petId,
       petProblem: item.petProblem,
       phone: item.phone,
       email: item.email,
       name:item.userName,
       date: item.date,
       city: item.city,
       state: item.state,
       address: item.address,

        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
           boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // Offset of the shadow
                                        ),
                                      ],
       
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${item.date.toString()}",
                  style: CustomTextStyle.popinsmedium,
                ),
               
              ],
            ),
            Text(
              "User Name: ${item.userName.toString()}",
              style: CustomTextStyle.popinsmedium,
            ),
            Text(
              "Pet ID: ${item.petId.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
             Text(
              "Pet Problem: ${item.petProblem.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
             Text(
              "Email: ${item.email.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
            Text(
              "Mobile Number: ${item.phone.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
              Text(
                "state: ${item.state.toString()}"+ ", "+"city: ${item.city.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
             Text(
              "Address: ${item.address.toString()}",
              style: CustomTextStyle.popinssmallnormal,
            ),
          ],
        ),
      ),
    );
  },
);
      }),
)
    
      
    );
  }
}