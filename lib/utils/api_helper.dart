import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/utils/constants.dart';

class ApiHelper {
  static Future<dynamic?> getApi(String url) async {
    print("===>>> url $url");
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response $res");


    if (response.statusCode == 200) {
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }

  static Future<dynamic?> postFormData({required request}) async {
    print("====>>> body fields ${request.fields}");
    print("====>>> body files ${request.files}");

    print(request.fields);
    print(request.files);
    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response $res");
    if (response.statusCode == 200) {
  
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else if (response.statusCode == 409) {
      print('Error: Already in List');
      // throw "Error: Already in List";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }


  static Future<dynamic?> deleteApi(String url) async {
    print("===>>> url $url");
    var request = http.Request('DELETE', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response $res");

    if (response.statusCode == 200) {
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }

  static Future<dynamic?> postApi(
      {required String url, required dynamic body}) async {
    print("===>>> url $url");
    print("===>>> body $body");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response $res");
//  GetStorage().write('login', res[{"message"}]);

// var errorResponse = json.decode(res);

      // Check if the error response contains a specific error code or message
      // if (errorResponse['errors'] != null &&
      //     errorResponse['errors'][0]['code'] == 'auth-001') {
      //   print('Handle Unauthorized Error: ${errorResponse['errors'][0]['message']}');
      //   GetStorage().write('errormsg',{errorResponse['errors'][0]['message']});
      //   print( GetStorage().read('errormsg'));
      //   // Perform custom handling for the "auth-001" error, such as showing a snackbar
      //   // or preventing navigation to the login screen.
      // } else {
      //   print("2000000000");
      //   // Handle other 401 errors (if needed)
      //   // You can choose to navigate to the login screen here if it's a different kind of 401 error.
      // }
    if (response.statusCode == 200) {
// print("2000");
      
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print("2000***");
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 401) {
      print("4000");
      print('Error: Unauthorized');
      var errorResponse = json.decode(res);

      // Check if the error response contains a specific error code or message
      if (errorResponse['errors'] != null &&
          errorResponse['errors'][0]['code'] == 'auth-001') {
        print('Handle Unauthorized Error: ${errorResponse['errors'][0]['message']}');
        // Perform custom handling for the "auth-001" error, such as showing a snackbar
        // or preventing navigation to the login screen.
      } else {
        print("42000");
        // Handle other 401 errors (if needed)
        // You can choose to navigate to the login screen here if it's a different kind of 401 error.
      }
    }
     else if (response.statusCode == 500) {

      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }

  static Future<dynamic?> deleteByUrl({required url}) async {
    // print("====>>> body fields ${request.fields}");
    // print("====>>> body files ${request.files}");

    // print(request.fields);
    // print(request.files);
    var request = http.Request('DELETE', Uri.parse('$url'));

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response $res");
    if (response.statusCode == 200) {
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else if (response.statusCode == 409) {
      print('Error: Already in List');
      throw "Error: Already in List";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }
}
