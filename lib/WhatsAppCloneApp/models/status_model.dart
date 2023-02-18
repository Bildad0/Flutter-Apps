import 'usermodel.dart';

class Status {
  User user;
  DateTime timeposted;
  String state; //this show wether the status is viewed or not
  Status({
    required this.user,
    required this.timeposted,
    required this.state,
  });
}
