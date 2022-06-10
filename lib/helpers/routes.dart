import 'package:chat_app/bindings/conversations_binding.dart';
import 'package:chat_app/bindings/messages_binding.dart';
import 'package:chat_app/screens/conversations_screen.dart';
import 'package:chat_app/screens/messages_screen.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => const ConversationsScreen(), binding: ConversationsBinding()),
  GetPage(name: '/messages/:conversationId/:answerFrom', page: () => MessagesScreen(), binding: MessagesBinding()),
];
