import 'package:get/get.dart';
import 'package:pet/utils/colors.dart';

class WholeReviewController extends GetxController {
  double value = 3.5;

  List reviewlist = [
    {
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
    {
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
    {
      "image": "assets/image/menimg.png",
      "name": "Wade Warren",
      "title":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "count": "1234"
    },
  ].obs;
  get getreviewList => reviewlist;
}
