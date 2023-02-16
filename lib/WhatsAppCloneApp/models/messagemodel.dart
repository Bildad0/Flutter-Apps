import './usermodel.dart';

class Message {
  int id;
  User sender;
  User receiver;
  DateTime timeSent;
  DateTime timeReceived;
  String status;
  String text;
  Message({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.timeSent,
    required this.timeReceived,
    required this.status,
    required this.text,
  });
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    timeSent = json['timeSent'];
    timeReceived = json['timeReceived'];
    status = json['status'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['timeSent'] = timeSent;
    data['timeReceived'] = timeReceived;
    data['status'] = status;
    data['text'] = text;
    return data;
  }
}
