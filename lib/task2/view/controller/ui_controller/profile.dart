import 'package:get/get.dart';
import 'package:spark_tech_task/task2/view/controller/api_controller/profile.dart';
import 'package:spark_tech_task/task2/view/model/profile.dart';

class ProfileController extends GetxController {
  final ProfileService _apiService = ProfileService();
  var userProfile = Rxn<UserProfile>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  void fetchProfile() async {
    try {
      isLoading(true);
      errorMessage('');
      userProfile.value = await _apiService.fetchUserProfile();
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
