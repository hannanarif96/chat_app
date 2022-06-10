import 'package:chat_app/controllers/conversations_controller.dart';
import 'package:chat_app/controllers/messages_controller.dart';
import 'package:get/get.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.replace(MessagesController());
  }
}