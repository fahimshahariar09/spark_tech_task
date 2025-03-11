import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:spark_tech_task/local_storage.dart';
import 'package:spark_tech_task/task2/view/model/profile.dart';

class ProfileService {
  final String baseUrl = "https://api.pentagoncare.online/api/v1";

  Future<Profile?> getProfile() async {
    String? token = await SecureStorage.getToken();
    if (token == null) return null;

    try {
      final response = await http.get(
        Uri.parse("$baseUrl/user/profile"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Profile.fromJson(data);
      } else {
        log("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }
}
