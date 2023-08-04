import 'package:get/get.dart';

class AddToCartController extends GetxController {

var sizecount = 0;
void  incrementSize(){
sizecount++;
    update(); 
  }

decrementSize(){
  if (sizecount > 0) {
      sizecount--;
      update(); 
    }

}
}
