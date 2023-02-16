import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerc;

  const ChartBar(this.label, this.spendingAmount, this.spendingPerc,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('Ksh ${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue.withOpacity(0.1),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPerc,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).errorColor),
                  ),
                )
              ],
            ),
          ),
          Text(label),
        ],
      );
    });
  }
}
