import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/utils/fontstyle.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  

 List<ItemModel> _items = [
    ItemModel(
      headerValue: 'Sort by',
      expandedValue: ['Relevance', 'Title:A-Z', 'Title:Z-A','Date: New to Old','Date: Old to New','Price: Low to High','Price: Hight to Low','Discount: High to Low','Rating: Low to High','Rating: High to Low','Total reviews: Low to High','Total reviews: High to Low'],
      isExpanded: false,
      isChecked: false,
    ),
    ItemModel(
      headerValue: 'Brand',
      expandedValue: ['Acana', 'Aeolus', 'Andis','Bayer','Drools','Glandex'],
      isExpanded: false,
      isChecked: false,
    ),

     ItemModel(
      headerValue: 'Product type',
      expandedValue: ['Cat Toys', 'Cat Grooming', 'Dog Clothing','Dog Toys','Health Care'],
      isExpanded: false,
      isChecked: false,
    ),
    ItemModel(
      headerValue: 'Price,₹',
      expandedValue: ['75', '100'],
      isExpanded: false,
      isChecked: false,
    ),
     ItemModel(
      headerValue: 'Lifestage',
      expandedValue: ['Adult', 'All','Puppy','Senior'],
      isExpanded: false,
      isChecked: false,
    ),
    ItemModel(
      headerValue: 'Breed Type',
      expandedValue: ['Boxer', 'Beagle','All','Large','Medium','Small'],
      isExpanded: false,
      isChecked: false,
    ),

     ItemModel(
      headerValue: 'Health Condition',
      expandedValue: ['Anemia', 'Eye Care','Live Care','Weaning',],
      isExpanded: false,
      isChecked: false,
    ),

      ItemModel(
      headerValue: 'Special Diet',
      expandedValue: ['Low Grain', 'Vegan',],
      isExpanded: false,
      isChecked: false,
    ),

      ItemModel(
      headerValue: 'Veg/Non-Veg',
      expandedValue: ['Non-Veg', 'Veg',],
      isExpanded: false,
      isChecked: false,
    ),
    // Add more categories as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Filter Screen'),
      // ),
      body:ListView(
        children: [
  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text("Filter", style: CustomTextStyle.popinstext,),
                InkWell(onTap: (){
                  Get.back();
                },
                  child: Icon(Icons.cancel_presentation_outlined)),
              ],
            ),
          ),
           SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded = !isExpanded;
              });
            },
            children: _items.map<ExpansionPanel>((ItemModel item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: item.expandedValue.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                          value: item.isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              item.isChecked = value!;
                            });
                          },
                          title: Text(item.expandedValue[index]),
                        );
                      },
                    ),
                  ],
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ItemModel {
  String headerValue;
  List<String> expandedValue;
  bool isExpanded;
  bool isChecked;

  ItemModel({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
    this.isChecked = false,
  });
}

// void main() {
//   runApp(MaterialApp(
//     home: FilterScreen(),
//   ));
// }
