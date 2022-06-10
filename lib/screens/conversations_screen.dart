import 'package:chat_app/controllers/conversations_controller.dart';
import 'package:chat_app/helpers/custom_colors.dart';
import 'package:chat_app/models/conversation.dart';
import 'package:chat_app/widgets/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConversationsScreen extends GetView<ConversationsController> {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorMain,
        elevation: 0.0,
        title: const Text("Conversations"),
        titleTextStyle: const TextStyle(fontSize: 15.0),
      ),
      drawer: const DrawerNavigation(),
      body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.conversationsList.length,
            itemBuilder: (context, index) {
              return _buildConversationsSingleItem(
                  controller.conversationsList.elementAt(index));
            },
          )),
    );
  }

  Widget _buildConversationsSingleItem(Conversation conversation) {
    return GestureDetector(
      onTap: () => controller.jumpToMessagesScreen(conversation),
      child: Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 10.0,
        child: Container(
          height: 220.0,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Topic: ${conversation.topic}",
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text("${conversation.lastMessage}"),
              Text(DateFormat('hh:mm a - dd/MM/yyyy').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      conversation.modifiedAt!))),
              SizedBox(
                height: 50.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var member in conversation.members!)
                      Container(
                        margin: const EdgeInsets.all(3),
                        child: OutlinedButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.person),
                            label: Text(member),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            )),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
