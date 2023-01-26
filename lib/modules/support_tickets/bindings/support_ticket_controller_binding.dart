import 'package:cpo_assists/modules/support_tickets/controllers/support_ticket_controller.dart';
import 'package:get/get.dart';

class SupportTicketControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportTicketController>(() => SupportTicketController());
  }
}
