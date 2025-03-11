import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spark_tech_task/local_storage.dart';
import 'package:spark_tech_task/apis.dart';
import 'package:spark_tech_task/task2/view/model/profile.dart';

class ProfileService {
  Future<Profile?> getProfile() async {
    String? token = await SecureStorage.getToken();
    if (token == null) return null;

    try {
      Uri url = Uri.parse(Apis.login);
      Map<String, String> headers = {
        "Authorization": "Bearer <access_token>"
        // "Authorization": "Bearer $token",
        // "Content-Type": "application/json",
      };
      var response =
      await http.get(url,headers: headers);
      // final response = await http.get(
      //   Uri.parse(Apis.profile),
      //   headers: {
      //     "Authorization": "Bearer $token",
      //     "Content-Type": "application/json",
      //   },
      // );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Profile.fromJson(data);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
