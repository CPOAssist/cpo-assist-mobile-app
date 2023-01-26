import 'package:cpo_assists/modules/installation/controllers/installation_controller.dart';
import 'package:get/get.dart';

class InstallationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstallationController>(() => InstallationController());
  }
}
