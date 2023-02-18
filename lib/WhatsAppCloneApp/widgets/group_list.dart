import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/groupmodel.dart';

class GroupList extends StatefulWidget {
  final Function deleteConvo;
  const GroupList({
    Key? key,
    required this.deleteConvo,
  }) : super(key: key);

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    final List<Group> groupConversation = [];
    return groupConversation.isEmpty
        ? const Center(
            child: Text(
              "You are not in any group create one",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: FittedBox(
                      child: Image.network(groupConversation[index].groupIcon),
                    ),
                  ),
                  title: Text(
                    groupConversation[index].groupTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        groupConversation[index].groupDescription,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        DateFormat.yMd()
                            .format(groupConversation[index].dateCreated),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: groupConversation.length,
          );
  }
}
