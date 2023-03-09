// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../main.dart';
import '../widgets/main_drawer.dart';
import 'main_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.saveFilters,
    required this.currentFilters,
  }) : super(key: key);
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text("Filters"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust your meal selection",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  title: const Text(
                    "Gluten Free",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Only include gluten free meals",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  title: const Text(
                    "Vegetarian",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Only include vegetarian meals",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: const Text(
                    "Vegan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Only include vegan meals",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: const Text(
                    "Lactose Free",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Only include lactose free meals",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 5, 20, 350),
                child: TextButton(
                  onPressed: () {
                    //TODO work on the alertBox widget.
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: const Text(
                          "Do you want to continue with the changes made ?",
                          style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        elevation: 8,
                        backgroundColor: Theme.of(context).backgroundColor,
                        iconColor: Theme.of(context).primaryColor,
                        contentTextStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('NO'),
                          ),
                          TextButton(
                            onPressed: () {
                              final selectedFilters = {
                                'gluten': _glutenFree,
                                'lactose': _lactoseFree,
                                'vegan': _vegan,
                                'vegetarian': _vegetarian
                              };

                              widget.saveFilters(selectedFilters);
                              Navigator.of(context)
                                  .pushReplacementNamed(TabsScreen.routeName);
                            },
                            child: const Text('YES'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
