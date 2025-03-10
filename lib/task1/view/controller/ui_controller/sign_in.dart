import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/task1/view/controller/api_controller/sign_in.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  signInFun() async {
    isLoading.value = true;
    bool status = await SignInService.signInService(
        email: emailController.text, password: passwordController.text);
    isLoading.value = false;

    if (status) {
      //Get.to(() => const ProductPageShow());
      return;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
