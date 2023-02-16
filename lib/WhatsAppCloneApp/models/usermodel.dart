import './messagemodel.dart';

class User {
  int id;
  String userName;
  int phoneNumber;
  String imageUrl;
  String about;
  String status;
  List<Message> messages;
  User({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.imageUrl,
    required this.about,
    required this.status,
    required this.messages,
  });

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['username'];
    phoneNumber = json['phonenumber'];
    imageUrl = json['imageUrl'];
    about = json['about'];
    status = json['status'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = userName;
    data['phonenumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['about'] = about;
    data['status'] = status;
    data['messages'] = messages;
    return data;
  }
}
