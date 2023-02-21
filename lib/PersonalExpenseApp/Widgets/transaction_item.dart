import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "Ksh ${transaction.amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.tittle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 720
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  "Delete",
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
