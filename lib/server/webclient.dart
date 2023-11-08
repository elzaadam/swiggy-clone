import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:myproject/prefManager/prefmanager.dart';

class WebClient {
  static const baseUrl = "http://apicerp.leopardtechlabs.in";

  static const imageUrl = "https://parishprojects.herokuapp.com/file/get/";

  static Future<dynamic> post(url, data) async {
    var token;
    // await PrefManager.getToken();
    // print(token + "ddd");
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);
    var response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json", "token": token ?? ""},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };

      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var token = await PrefManager.getToken();
    print(token);
    var response = await http.get(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}
