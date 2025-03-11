import 'package:get/get.dart';
import 'package:spark_tech_task/task2/view/controller/api_controller/profile.dart';
import 'package:spark_tech_task/task2/view/model/profile.dart';

class ProfileController extends GetxController {
  final ProfileService service = ProfileService();
  var profile = Rx<Profile?>(null);
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;
    profile.value = await service.getProfile();
    isLoading.value = false;
  }
}
