import 'package:chat_app/controllers/messages_controller.dart';
import 'package:chat_app/helpers/custom_colors.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.colorMain,
          elevation: 0.0,
          title: const Text("Messages"),
          titleTextStyle: const TextStyle(fontSize: 15.0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      itemCount: controller.messagesList.length,
                      itemBuilder: (context, index) {
                        return _buildMessagesSingleItem(
                            controller.messagesList.elementAt(index));
                      },
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 8,
                    child: TextFormField(
                      controller: controller.newMessageController,
                      keyboardType: TextInputType.text,
                      cursorColor: CustomColors.colorSecondary,
                      style: const TextStyle(letterSpacing: 1.5),
                      maxLines: 5,
                      minLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Type Message",
                        // contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomColors.colorMain, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomColors.colorSecondary, width: 2.0),
                        ),
                        focusColor: CustomColors.colorSecondary,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.newMessageController.text.trim().isNotEmpty) {
                          controller.pressSubmitMessageBtn(controller.newMessageController.text.trim());
                          controller.newMessageController.text = "";
                        } else {
                          Get.defaultDialog(
                              title: "Alert",
                              middleText: "Please Enter some text first");
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesSingleItem(Message message) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(height: 12),
                Text("${message.sender}"),
                Text(DateFormat('hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(message.modifiedAt!))),
                Text(DateFormat('dd/MM/yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(message.modifiedAt!))),
              ],
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Text("${message.message}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
