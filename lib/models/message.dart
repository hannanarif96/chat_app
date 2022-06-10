class Message {
  String? id;
  String? message;
  int? modifiedAt;
  String? sender;

  Message({this.id, this.message, this.modifiedAt, this.sender});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    modifiedAt = json['modified_at'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['modified_at'] = modifiedAt;
    data['sender'] = sender;
    return data;
  }
}