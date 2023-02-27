import 'package:flutter/material.dart';

Widget alertBox(context, IconData icon, String message) {
  return AlertDialog(
    content: Text(message),
    icon: Icon(icon),
    elevation: 8,
    backgroundColor: Theme.of(context).backgroundColor,
    iconColor: Theme.of(context).primaryColor,
    contentTextStyle: TextStyle(
      color: Theme.of(context).primaryColor,
      fontStyle: FontStyle.italic,
    ),
  );
}
