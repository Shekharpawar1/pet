import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/partner_controller/wholesaler_controller.dart';
import 'package:pet/screens/partner/notification.dart';
import 'package:pet/screens/partner/partnerpayment.dart';
import 'package:pet/screens/partner/payment.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/utils/fontstyle.dart';

class PartnerAddress extends StatefulWidget {
  const PartnerAddress({super.key});

  @override
  State<PartnerAddress> createState() => _PartnerAddressState();
}

class _PartnerAddressState extends State<PartnerAddress> {
  final PartnerController partnerController = Get.put(PartnerController());

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
            "Address",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          )),
          actions: [
            //  SvgPicture.asset("assets/image/girl.svg"),

            // SizedBox(width: 20),
            InkWell(
              onTap: () {
                Get.to(NotificationPartner());
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset("assets/image/notification.svg"),
                //  Image.asset("assets/image/girl.png"),
              ),
            ),
          ],
        ),
        body: GetBuilder<PartnerController>(
            init: partnerController,
            builder: (_) {
              return ListView(
                shrinkWrap: true,
                primary: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  partnerController.showLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.shade200,
                                  ),
                                  child:
                                      DropdownButtonFormField<statesFile.State>(
                                    validator: (value) {
                                      if (value == null ||
                                          value.stateName!.isEmpty) {
                                        return 'Please select a state';
                                      }
                                      return null;
                                    },
                                    value: partnerController.selectedState,
                                    decoration: InputDecoration(
                                      hintText: "State",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    items: partnerController
                                        .stateListModel!.state!
                                        .map((state) {
                                      return DropdownMenuItem<statesFile.State>(
                                        value: state,
                                        child: Text(state.stateName!),
                                      );
                                    }).toList(),
                                    onChanged: (statesFile.State? value) async {
                                      await partnerController
                                          .updateState(value!);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            !partnerController.cityLoaded
                                ? SizedBox()
                                : Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: DropdownButtonFormField<
                                            cityFile.State>(
                                          validator: (value) {
                                            if (value == null ||
                                                value.cityName!.isEmpty) {
                                              return 'Please select a city';
                                            }
                                            return null;
                                          },
                                          value: partnerController.selectedCity,
                                          decoration: InputDecoration(
                                            hintText: "City",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 5),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                          items: partnerController
                                              .cityListModel!.state!
                                              .map((state) {
                                            return DropdownMenuItem<
                                                cityFile.State>(
                                              value: state,
                                              child: Text(state.cityName!),
                                            );
                                          }).toList(),
                                          onChanged: (cityFile.State? value) {
                                            partnerController
                                                .updateCity(value!);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Paymentpartner());
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: MyColors.yellow,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          "Continue",
                          style: CustomTextStyle.mediumtextreem,
                        )),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
