import 'dart:convert';

import 'package:chat_app/models/message.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  RxList<Message> messagesList = <Message>[].obs;
  String? conversationId;
  String? answerFrom;

  final ScrollController scrollController = ScrollController();
  final TextEditingController newMessageController = TextEditingController();

  @override
  void onInit() {
    conversationId = Get.parameters['conversationId']!;
    answerFrom = Get.parameters['answerFrom']!;

    _getMessages(conversationId!);

    super.onInit();
  }

  void _getMessages(String conversationId) {
    rootBundle
        .loadString('lib/assets/json/$conversationId.json')
        .then((jsonResult) {
      messagesList.value = (jsonDecode(jsonResult) as List)
          .map((x) => Message.fromJson(x))
          .toList();

      messagesList.sort((a, b) => a.modifiedAt!.compareTo(b.modifiedAt!));
    });
  }

  void scrollToEndOfList() async {
    await Future.delayed(const Duration(milliseconds: 400));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  void pressSubmitMessageBtn(String msg) async {
    FocusManager.instance.primaryFocus?.unfocus();

    messagesList.add(Message(
        id: (int.parse(messagesList.last.id!) + 1).toString(),
        message: msg,
        sender: "Me",
        modifiedAt: DateTime.now().millisecondsSinceEpoch));

    scrollToEndOfList();

    await Future.delayed(const Duration(seconds: 2));

    messagesList.add(Message(
        id: (int.parse(messagesList.last.id!) + 1).toString(),
        message: "Random Message",
        sender: answerFrom,
        modifiedAt: DateTime.now().millisecondsSinceEpoch));

    scrollToEndOfList();
  }
}
