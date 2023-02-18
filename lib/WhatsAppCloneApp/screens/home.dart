// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../widgets/group_list.dart';

import '../models/conversationmodel.dart';
import '../models/usermodel.dart';
import '../widgets/conversation_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Conversation> userConversations = [];

  //add latest conversation
  // List<Conversation> get _recentConversations {
  //   return userConversations.where((element) {
  //     return element.time.isAfter(
  //       DateTime.now().subtract(
  //         const Duration(seconds: 1),
  //       ),
  //     );
  //   }).toList();
  // }

  void _deleteConversation(String id) {
    setState(() {
      userConversations.removeWhere((element) => element.id == id);
    });
  }

  Object getContact() {
    return {};
  }

  void _startConversation(User user) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        animationDuration: const Duration(
          milliseconds: 1500,
        ),
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 8,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(widget.title),
            actions: const [
              Icon(Icons.camera_alt_outlined),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              isScrollable: false,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.groups,
                    size: 30,
                  ),
                ),
                Tab(
                  text: 'Chats',
                ),
                Tab(
                  text: 'Status',
                ),
                Tab(
                  text: 'Calls',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GroupList(deleteConvo: _deleteConversation),
              ConversationList(
                deleteConvo: _deleteConversation,
              ),
              const Text("Status"),
              const Text("Calls"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'New Message',
            child: const Icon(
              Icons.messenger_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
