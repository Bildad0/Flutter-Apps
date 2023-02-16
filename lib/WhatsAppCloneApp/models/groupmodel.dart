import 'messagemodel.dart';
import 'usermodel.dart';

class Group {
  int id;
  String groupTitle;
  String groupIcon;
  String groupDescription;
  DateTime dateCreated;
  List<User> members;
  List<Message> messages;
  Group({
    required this.id,
    required this.groupTitle,
    required this.groupIcon,
    required this.groupDescription,
    required this.dateCreated,
    required this.members,
    required this.messages,
  });
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupTitle = json['groupTitle'];
    groupIcon = json['groupIcon'];
    groupDescription = json['groupDescription'];
    dateCreated = json['dateCreated'];
    members = json['members'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groupTitle'] = groupTitle;
    data['groupIcon'] = groupIcon;
    data['groupDescription'] = groupDescription;
    data['dateCreated'] = dateCreated;
    data['members'] = members;
    data['messages'] = messages;
    return data;
  }
}
