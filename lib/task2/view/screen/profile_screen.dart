import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/local_storage.dart';
import 'package:spark_tech_task/task2/view/controller/ui_controller/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(title: Text("Profile"),
      centerTitle: true,),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.profile.value == null) {
          return Center(child: Text("Failed to load profile"));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(controller.profile.value!.avatar),
            ),
            SizedBox(height: 10),
            Text(controller.profile.value!.name,
                style: TextStyle(fontSize: 20)),
            Text(controller.profile.value!.email,
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text(controller.profile.value!.phone,
                style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SecureStorage.removeToken();
                Get.snackbar("Logout", "You have been logged out");
              },
              child: Text("Logout"),
            ),
          ],
        );
      }),
    );
  }
}
