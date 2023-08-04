
import 'package:get/get.dart';

class OrderDetailsController extends GetxController{


 var orderdetailslist =  {
      "subtotal": "₹200",
      "movingcart": "₹20",
      "discount": "10%",
      "total": "₹220",
      "ordernumber":"6778898277",
      "payment":"upi",
      "services":"Additional Services",
      "promocode":"554ffdd",
      "date":"10 May 2022",
      "phonenumber":"9878679867",
      "deliverydate":"10 July 2022 10:20AM",
      "address":"Mumbai",
      "shippingaddress":"Khopoli,Mumbai"

    
    
    // {
    //   "image": "assets/image/menimg.png",
    //   "name": "Wade Warren",
    //   "title":
    //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    //   "count": "1234"
    // },
 }.obs;

 get getorderdetailsList => orderdetailslist;
}