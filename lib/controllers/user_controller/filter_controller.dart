

import 'package:get/get.dart';
import 'package:pet/others/Filter.dart';

class FilterController  extends GetxController {


 List<ItemModel> _items = [
    ItemModel(
      headerValue: 'Category 1',
      expandedValue: ['Option 1', 'Option 2', 'Option 3'],
      isExpanded: false,
      isChecked: false,
    ),
    ItemModel(
      headerValue: 'Category 2',
      expandedValue: ['Option 4', 'Option 5', 'Option 6'],
      isExpanded: false,
      isChecked: false,
    ),

     ItemModel(
      headerValue: 'Category 1',
      expandedValue: ['Option 1', 'Option 2', 'Option 3'],
      isExpanded: false,
      isChecked: false,
    ),
    ItemModel(
      headerValue: 'Category 2',
      expandedValue: ['Option 4', 'Option 5', 'Option 6'],
      isExpanded: false,
      isChecked: false,
    ),
    // Add more categories as needed
  ].obs;


    get getAfilterList => _items;
}