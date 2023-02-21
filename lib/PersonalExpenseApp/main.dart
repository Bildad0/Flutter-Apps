// ignore_for_file: avoid_print, unused_element, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './Widgets/chart.dart';
import './Widgets/new_transaction.dart';
import './Widgets/transaction_list.dart';
import 'Models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final List<Transaction> userTransactions = [
    Transaction(
      id: DateFormat.yMd().format(DateTime.now()),
      tittle: 'New Shoes',
      amount: 12.999,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTittle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        tittle: txTittle,
        amount: txAmount,
        date: choosenDate);
    setState(() {
      userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).backgroundColor,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  List<Widget> _buildLandscapeContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    Widget txListWidget,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Show Chart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).primaryColor,
            value: _showChart,
            onChanged: (value) => {
              setState(() {
                _showChart = value;
              }),
            },
          )
        ],
      ),
      _showChart
          ? SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransactions),
            )
          : txListWidget
    ];
  }

  List<Widget> _buildPotratitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      SizedBox(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      txListWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
      title: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

    final txListWidget = SizedBox(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.8,
      child: TransactionList(userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isLandScape)
              ..._buildLandscapeContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),
            if (!isLandScape)
              ..._buildPotratitContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _startAddNewTransaction(context),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
    );
  }
}
