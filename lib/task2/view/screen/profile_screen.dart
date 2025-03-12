import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/task2/view/controller/ui_controller/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        if (controller.userProfile.value == null) {
          return Center(child: Text('No user data found.'));
        }

        final user = controller.userProfile.value!;
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.avatar),
              ),
              SizedBox(height: 10),
              Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(user.email, style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        );
      }),
    );
  }
}
