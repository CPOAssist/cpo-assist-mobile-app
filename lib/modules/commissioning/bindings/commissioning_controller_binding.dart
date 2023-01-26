import 'package:cpo_assists/modules/commissioning/controllers/commissioning_controller.dart';
import 'package:get/instance_manager.dart';

class CommissioningControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommissioningController>(() => CommissioningController());
  }
}
