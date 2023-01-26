import 'package:cpo_assists/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}