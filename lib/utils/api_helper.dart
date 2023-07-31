import 'dart:convert';

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
      throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      throw "Error: ${response.statusCode}";
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
      throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      throw "Error: ${response.statusCode}";
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

    if (response.statusCode == 200) {
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }
}
