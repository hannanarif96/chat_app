import 'package:chat_app/controllers/conversations_controller.dart';
import 'package:get/get.dart';

class ConversationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.replace(ConversationsController());
  }
}