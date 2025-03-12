import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark_tech_task/task2/view/model/profile.dart';

class ProfileService {
  static const String baseUrl = 'https://api.pentagoncare.online/api/v1/user/profile';

  Future<UserProfile> fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    if (token == null) {
      throw Exception("No access token found. Please login again.");
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user profile: ${response.statusCode}');
    }
  }
}
