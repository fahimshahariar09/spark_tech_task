import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spark_tech_task/task1/view/controller/api_controller/apis.dart';

class SignInService {
  static Future<bool> signInService(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      Uri url = Uri.parse(Apis.login);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var body = {"email": email, "password": password};

      var response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Get.snackbar("message", "Signin Success");
        return true;
      } else if (response.statusCode == 401) {
        Get.snackbar("message", "Signin Failed");
        return false;
      }
    } catch (e) {
      log("error:$e");
    }
    Get.snackbar("message", "somethings went wrong");
    return false;
  }
}
