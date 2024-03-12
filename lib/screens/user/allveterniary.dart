import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/allveterinary_controller.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/veterniaryDetails.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class AllVeterniary extends StatelessWidget {
   AllVeterniary({super.key});
AllVeterinaryController allveterniarycontroller = Get.put(AllVeterinaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarback(title:"Veterniary"),
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
                                            borderRadius: BorderRadius.circular(15),
                                            gradient: LinearGradient(

                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFEEEEFF),
                                                Color.fromRGBO(238, 238, 255, 0.00),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
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