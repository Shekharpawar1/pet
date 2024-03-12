import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/wholesalerFilterController.dart';
import 'package:pet/controllers/wholesaler_controller/wholesaler_ourbrand_filter_controller.dart';


import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class FilterScreenWhole extends StatefulWidget {
  @override
  _FilterScreenWholeState createState() => _FilterScreenWholeState();
}

class _FilterScreenWholeState extends State<FilterScreenWhole> {
  WholeSalerOurBrandFilterController filtercontroller = Get.put(WholeSalerOurBrandFilterController());
  bool isBrandExpanded = false;
  bool isCatExpanded = false;
   bool isProducttypeExpanded = false;
  bool isBreedExpanded = false;
  bool isLifeStageExpanded = false;
  bool isHealthExpanded = false;
  bool isVegExpanded = false;
  // String expanded = "brand";

  @override
  void onInit() {
    //  filtercontroller.init();
    //  super.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Filter Screen'),
        // ),
        body: GetBuilder<WholeSalerOurBrandFilterController>(
            init: filtercontroller,
            builder: (_) {
              return ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filter",
                          style: CustomTextStyle.popinstext,
                        ),
                        Spacer(),
                        // InkWell(
                        //     onTap: () {
                        //       Get.to(FilterScreenUI());
                        //     },
                        //     child: Icon(Icons.check)),
                        SizedBox(width: 20),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.cancel_presentation_outlined)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee),
                        hintText: "Minimum Price",
                        counterText: ""
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      controller: filtercontroller.minPriceController,
                      onChanged: (value) {
                        filtercontroller.filter();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(decoration: InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee),
                        hintText: "Max Price",
                        counterText: ""
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      controller: filtercontroller.maxPriceController,
                      onChanged: (value) {
                        filtercontroller.filter();
                      },
                    ),
                  ),
                  ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (int index, bool isExpanded) {
                        print("====>>>> ${index}");
                        setState(() {
                          switch (index) {
                            case 0:
                              isBrandExpanded = !isExpanded;
                              break;
                            case 1:
                              isCatExpanded = !isExpanded;
                              break;
                               case 2:
                              isProducttypeExpanded = !isExpanded;
                              break;
                            case 3:
                              isBreedExpanded = !isExpanded;
                              break;
                            case 4:
                              isLifeStageExpanded = !isExpanded;
                              break;
                            case 5:
                              isHealthExpanded = !isExpanded;
                              break;
                            case 5:
                              isVegExpanded = !isExpanded;
                              break;

                            default:
                              isVegExpanded = !isExpanded;
                          }
                        });
                      },
                      children: [
                        // filtercontroller.branditems
                        //     .map<ExpansionPanel>((String item) {
                        //   return
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Brand"),
                            );
                          },
                          body: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filtercontroller.branditems.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.branditems[index];
                                  print("Brandvv  ${filteroption}");
                              return CheckboxListTile(
                                value: filtercontroller.selectBrandFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller.selectBrandFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionBrandList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller.selectBrandFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionBrandList(
                                              filteroption);
                                    }
                                  }
                                  filtercontroller.filter();

                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isBrandExpanded,
                        ),

                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Category"),
                            );
                          },
                          body: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filtercontroller.categoryitems.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.categoryitems[index];
                                    print("cattttt  ${filteroption}");
                              return CheckboxListTile(
                                value: filtercontroller.selectCategoryFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller
                                        .selectCategoryFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionCategoryList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller
                                        .selectCategoryFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionCategoryList(
                                              filteroption);
                                    }
                                  }

                                  filtercontroller.filter();
                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isCatExpanded,
                        ),

                          ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Product Type"),
                            );
                          },
                          body: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filtercontroller.producttypeitems.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.producttypeitems[index];
                              return CheckboxListTile(
                                value: filtercontroller.selectProductTypeFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller
                                        .selectProductTypeFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionProducttypeList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller
                                        .selectProductTypeFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionProducttypeList(
                                              filteroption);
                                    }
                                  }

                                  filtercontroller.filter();
                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isProducttypeExpanded,
                        ),

                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Breed"),
                            );
                          },
                          body: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filtercontroller.breeditem.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.breeditem[index];
                              return CheckboxListTile(
                                value: filtercontroller.selectBreedFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller.selectBreedFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionBreedList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller.selectBreedFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionBreedList(
                                              filteroption);
                                    }
                                  }
                                  filtercontroller.filter();

                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isBreedExpanded,
                        ),



                        

                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("LifeStage"),
                            );
                          },
                          body: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filtercontroller.lifestageitem.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.lifestageitem[index];
                                    print("Filtertt  ${filteroption}");
                              return CheckboxListTile(
                                value: filtercontroller
                                    .selectLifeStageFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller
                                        .selectLifeStageFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionLifeStageList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller
                                        .selectLifeStageFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionLifeStageList(
                                              filteroption);
                                    }
                                  }

                                  filtercontroller.filter();
                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isLifeStageExpanded,
                        ),

                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Health Condition"),
                            );
                          },
                          body: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                filtercontroller.healthconditionitem.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.healthconditionitem[index];
                              return CheckboxListTile(
                                value: filtercontroller
                                    .selectHealthConditionFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller
                                        .selectHealthConditionFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller
                                          .addSelectedOptionHealthList(
                                              filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller
                                        .selectHealthConditionFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionHealthList(
                                              filteroption);
                                    }
                                  }

                                  filtercontroller.filter();
                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isHealthExpanded,
                        ),

                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text("Veg/NonVeg"),
                            );
                          },
                          body: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filtercontroller.vegitem.length,
                            itemBuilder: (BuildContext context, int index) {
                              final filteroption =
                                  filtercontroller.vegitem[index];
                              return CheckboxListTile(
                                value: filtercontroller.selectVegFilterList
                                    .contains(filteroption),
                                onChanged: (isChecked) {
// filtercontroller.updateChecked()
                                  if (isChecked!) {
                                    print("adding brand");
                                    if (!filtercontroller.selectVegFilterList
                                        .contains(filteroption)) {
                                      print("Added");

                                      filtercontroller.addSelectedOptionVegList(
                                          filteroption);
                                    }
                                  } else {
                                    print("removing brand");
                                    if (filtercontroller.selectVegFilterList
                                        .contains(filteroption)) {
                                      print("removed");
                                      filtercontroller
                                          .removeSelectedOptionVegList(
                                              filteroption);
                                    }
                                  }
                                  filtercontroller.filter();

                                  // filtercontroller.updateChecked();
                                  // setState(() {
                                  //   item.isChecked = value!;
                                  // });
                                },
                                title: Text(filteroption),
                              );
                            },
                          ),
                          isExpanded: isVegExpanded,
                        ),
                      ] // }).toList(),
                      ),

//                  ExpansionPanelList(
//                     elevation: 1,
//                     expandedHeaderPadding: EdgeInsets.zero,
//                     expansionCallback: (int index, bool isExpanded) {
//                       setState(() {
//                         filtercontroller.items[index].isExpanded = !isExpanded;
//                       });
//                     },
//                     children: filtercontroller.items
//                         .map<ExpansionPanel>((ItemModel item) {
//                       return ExpansionPanel(
//                         headerBuilder: (BuildContext context, bool isExpanded) {
//                           return ListTile(
//                             title: Text(item.headerValue),
//                           );
//                         },
//                         body: Column(
//                           children: [
//                             ListView.builder(
//                               shrinkWrap: true,
//                               itemCount:  filtercontroller.items.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 final  filteroption =
//                                     filtercontroller.items[index];
//                                 return CheckboxListTile(
//                                   value: filtercontroller.selectfilterList
//                                       .contains(filteroption),
//                                   onChanged: (isChecked) {
// // filtercontroller.updateChecked()
//                                     if (isChecked!) {
//                                       print("adding brand");
//                                       if (!filtercontroller.selectfilterList
//                                           .contains(filteroption)) {
//                                         print("Added");

//                                         filtercontroller
//                                             .addSelectedOptionBrandList(
//                                                 filteroption);
//                                       }
//                                     } else {
//                                       print("removing brand");
//                                       if (filtercontroller.selectfilterList
//                                           .contains(filteroption)) {
//                                         print("removed");
//                                         filtercontroller
//                                             .removeSelectedOptionBrandList(
//                                                 filteroption);
//                                       }
//                                     }

//                                     // filtercontroller.updateChecked();
//                                     // setState(() {
//                                     //   item.isChecked = value!;
//                                     // });
//                                   },
//                                   title: Text(item.expandedValue[index]),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                         isExpanded: item.isExpanded,
//                       );
//                     }).toList(),
//                   ),
                ],
              );
            }));
  }
}

// class ItemModel {
//   String headerValue;
//   List<String> expandedValue;
//   bool isExpanded;
//   List<bool> isChecked;

//   ItemModel({
//     required this.headerValue,
//     required this.expandedValue,
//     this.isExpanded = false,
//     required this.isChecked,
//   });
// }

// void main() {
//   runApp(MaterialApp(
//     home: FilterScreen(),
//   ));
// }
