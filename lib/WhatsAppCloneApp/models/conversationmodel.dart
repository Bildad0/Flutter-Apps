import './usermodel.dart';
import 'messagemodel.dart';

class Conversation {
  int id;
  DateTime time;
  User sender;
  Message messages;
  String status;
  Conversation({
    required this.id,
    required this.time,
    required this.sender,
    required this.messages,
    required this.status,
  });

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    time = json['time'];
    messages = json['messages'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['sender'] = sender;
    data['messages'] = messages;
    data['status'] = status;
    return data;
  }
}
