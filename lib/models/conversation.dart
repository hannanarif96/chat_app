class Conversation {
  String? id;
  String? lastMessage;
  List<String>? members;
  String? topic;
  int? modifiedAt;

  Conversation(
      {this.id, this.lastMessage, this.members, this.topic, this.modifiedAt});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastMessage = json['last_message'];
    members = json['members'].cast<String>();
    topic = json['topic'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['last_message'] = lastMessage;
    data['members'] = members;
    data['topic'] = topic;
    data['modified_at'] = modifiedAt;
    return data;
  }
}
