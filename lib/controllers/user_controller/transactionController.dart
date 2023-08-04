import 'package:get/get.dart';

class TransactionHistoryController extends GetxController{

List _transactionList = [
    {
      "image": "assets/image/girlimg1.png",
      "name": "Johan Sharma",
      "datetime": "1 May 10:20AM",
      "invoicenumber":"12345",
      "amount":"500",
    },
    {
      "image": "assets/image/girlimg1.png",
      "name": "Johan Sharma",
      "datetime": "1 May 10:20AM",
      "invoicenumber":"12345",
      "amount":"500",
    },
    {
    "image": "assets/image/girlimg1.png",
      "name": "Johan Sharma",
      "datetime": "1 May 10:20AM",
      "invoicenumber":"12345",
      "amount":"500",
    },
  ].obs;

   get gettranscationList => _transactionList;
}