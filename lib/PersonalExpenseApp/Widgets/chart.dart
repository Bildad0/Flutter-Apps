// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';
import '../Widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransactions;

  const Chart(this.resentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].date.day == weekDays.day &&
            resentTransactions[i].date.month == weekDays.month &&
            resentTransactions[i].date.year == weekDays.year) {
          totalSum += resentTransactions[i].amount;
        }
      }
      print("From chart: ${DateFormat.E().format(weekDays)} : $totalSum");
      return {
        'day': DateFormat.E().format(weekDays),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(
        0,
        (previousValue, element) =>
            previousValue += (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            // return Flexible(
            //   fit: FlexFit.tight,
            //   child: ChartBar(
            //       data['day'] as String,
            //       data['amount'] as double,
            //       maxSpending == 0.0
            //           ? 0.0
            //           : (data['amount'] as double) / maxSpending),
            // );
            return Flexible(
              fit: FlexFit.tight,
              child: Text(
                "${data['day']}:Ksh ${data['amount']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
