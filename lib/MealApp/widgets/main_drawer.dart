import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  // Widget builListTile(String title, IconData icon, Function tapHandler) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 26,
  //       color: Colors.purple,
  //     ),
  //     title: Text(
  //       title,
  //       style: const TextStyle(
  //         color: Colors.purple,
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     onTap: () {
  //       tapHandler;
  //     },
  //   );
  // }

  Widget buildTop(context, IconData icon, String text) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.4),
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomCenter,
      child: Column(children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 26,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ]),
    );
  }

  Widget buildBottomContainer(context, IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 5, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          buildTop(context, Icons.hotel_class_outlined, "The Cafe"),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Meals",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Filters",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
          Expanded(
            child: Column(),
          ),
          buildBottomContainer(
            context,
            Icons.info_outline_rounded,
            "Made in Africa",
          ),
        ],
      ),
    );
  }
}
