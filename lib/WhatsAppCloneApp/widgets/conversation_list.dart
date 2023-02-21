import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/conversationmodel.dart';

class ConversationList extends StatefulWidget {
  final Function deleteConvo;
  final List<Conversation> latestConversation;
  const ConversationList({
    Key? key,
    required this.deleteConvo,
    required this.latestConversation,
  }) : super(key: key);

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  //remember to add gesture detector on the card allow longpress function
  @override
  Widget build(BuildContext context) {
    void onConversationClick() => {
          print("${widget.latestConversation[0].sender}"),
        };
    return widget.latestConversation.isEmpty
        ? const Center(
            child: Text(
              "No conversation yet",
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
                  child: TextButton(
                    onPressed: (() => onConversationClick()),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: FittedBox(
                          child: Image.network(
                              widget.latestConversation[index].sender.imageUrl),
                        ),
                      ),
                      title: SizedBox(
                        child: widget
                                .latestConversation[index].sender.name.isEmpty
                            ? Text(
                                widget.latestConversation[index].sender
                                    .phoneNumber
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              )
                            : Text(
                                widget.latestConversation[index].sender.name,
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
                            widget.latestConversation[index].messages
                                .toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            DateFormat.yMd()
                                .format(widget.latestConversation[index].time),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      //will add trailing which appears on long press
                    ),
                  ));
            },
            itemCount: widget.latestConversation.length,
          );
  }
}
