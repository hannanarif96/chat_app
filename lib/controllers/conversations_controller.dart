import 'dart:convert';

import 'package:chat_app/models/conversation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConversationsController extends GetxController {
  RxList<Conversation> conversationsList = <Conversation>[].obs;

  @override
  void onInit() {
    _getConversations();

    super.onInit();
  }

  void _getConversations() {
    rootBundle.loadString('lib/assets/json/inbox.json').then((jsonResult) {
      conversationsList.value = (jsonDecode(jsonResult) as List)
          .map((x) => Conversation.fromJson(x))
          .toList();
    });
  }

  void jumpToMessagesScreen(Conversation conversation){
    Get.toNamed(
        "/messages/${conversation.id}/${conversation.members!.first}");
  }
}
