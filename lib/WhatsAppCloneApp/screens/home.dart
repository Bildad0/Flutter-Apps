import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(widget.title),
        actions: const [
          Icon(Icons.camera_alt_outlined),
          Icon(Icons.search),
        ],
        flexibleSpace: Column(
          children: [
            Row(
              children: const [
                Text("Chats"),
                Text('Status'),
                Text("Calls"),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: const [
          Center(
            child: Text("Hi this a Chat app"),
          ),
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
    );
  }
}
