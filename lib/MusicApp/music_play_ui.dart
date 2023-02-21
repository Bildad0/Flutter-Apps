import 'package:flutter/material.dart';

class MusicPlayUI extends StatefulWidget {
  const MusicPlayUI({super.key});

  @override
  State<MusicPlayUI> createState() => _MusicPlayUIState();
}

class _MusicPlayUIState extends State<MusicPlayUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        animationDuration: const Duration(
          milliseconds: 1500,
        ),
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            scrolledUnderElevation: 8,
            automaticallyImplyLeading: false,
            elevation: 0,
            bottom: TabBar(
              indicatorWeight: 0.1,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Theme.of(context).primaryColor,
              //indicatorColor: Theme.of(context).primaryColor,
              isScrollable: true,
              tabs: [
                Tab(
                  child: TextButton(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(8),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.purple.withOpacity(0.1))),
                    onPressed: () {},
                    child: const Text("Songs"),
                  ),
                ),
                Tab(
                  child: TextButton(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(8),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.purple.withOpacity(0.1))),
                    onPressed: () {},
                    child: const Text("lysrics"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
              color: Theme.of(context).primaryColor,
            ),
            Container(
              color: Theme.of(context).primaryColor,
            ),
          ]),
        ),
      ),
    );
  }
}
