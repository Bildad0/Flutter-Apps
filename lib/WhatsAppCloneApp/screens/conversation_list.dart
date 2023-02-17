import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/conversationmodel.dart';

class ConversationList extends StatefulWidget {
  final Function deleteConvo;
  const ConversationList({
    Key? key,
    required this.deleteConvo,
  }) : super(key: key);

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  //remember to add gesture detector on the card allow longpress function
  @override
  Widget build(BuildContext context) {
    final List<Conversation> conversations = [];
    return conversations.isEmpty
        ? const Center(
            child: Text(
              "No conversation,\nStart one by clicking \nThe message icon",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: FittedBox(
                      child:
                          Image.network(conversations[index].sender.imageUrl),
                    ),
                  ),
                  title: SizedBox(
                    child: conversations[index].sender.name.isEmpty
                        ? Text(
                            conversations[index].sender.phoneNumber.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )
                        : Text(
                            conversations[index].sender.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        conversations[index].messages.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        DateFormat.yMd().format(conversations[index].time),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  //will add trailing which appears on long press
                ),
              );
            },
            itemCount: conversations.length,
          );
  }
}
