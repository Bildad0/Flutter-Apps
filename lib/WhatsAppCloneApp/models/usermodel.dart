import 'package:whatsappclone/WhatsAppCloneApp/models/status_model.dart';

import './messagemodel.dart';

class User {
  int id;
  String name;
  String userName;
  int phoneNumber;
  String imageUrl;
  String about;
  String status; //this is status for wether the user is online or not
  List<Message> messages;
  List<Status> statuses;
  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.phoneNumber,
    required this.imageUrl,
    required this.about,
    required this.status,
    required this.messages,
    required this.statuses,
  });

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['username'];
    phoneNumber = json['phonenumber'];
    imageUrl = json['imageUrl'];
    about = json['about'];
    status = json['status'];
    messages = json['messages'];
    statuses = json['statuses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = userName;
    data['phonenumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['about'] = about;
    data['status'] = status;
    data['messages'] = messages;
    data['statuses'] = statuses;
    return data;
  }
}
