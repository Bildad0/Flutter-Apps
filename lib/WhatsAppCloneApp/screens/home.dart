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
    return MaterialApp(
      home: DefaultTabController(
        animationDuration: const Duration(
          milliseconds: 1500,
        ),
        initialIndex: 0,
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
                  icon: Icon(Icons.groups),
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
          body: const TabBarView(
            children: [
              Text("Community"),
              Text("Chats"),
              Text("Status"),
              Text("Calls"),
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

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Hi"));
  }
}
