// ignore_for_file: avoid_print, unused_element, unused_import

import 'dart:io';

import 'package:flutter/material.dart';

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> userTransactions = [];
  bool _showChart = false;

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

  @override
  Widget build(BuildContext context) {
    final mediaQeury = MediaQuery.of(context);
    final isLandScape = mediaQeury.orientation == Orientation.landscape;

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
      height: (mediaQeury.size.height -
              appBar.preferredSize.height -
              mediaQeury.padding.top) *
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
            if (!isLandScape)
              SizedBox(
                height: (mediaQeury.size.height -
                        appBar.preferredSize.height -
                        mediaQeury.padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),
            if (!isLandScape) txListWidget,
            if (isLandScape)
              _showChart
                  ? SizedBox(
                      height: (mediaQeury.size.height -
                              appBar.preferredSize.height -
                              mediaQeury.padding.top) *
                          0.7,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget,
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
