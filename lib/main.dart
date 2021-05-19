import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 99.99,
        date: DateTime.now())
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
                color: Colors.blue,
                child: Container(child: Text('Chart!'), width: double.infinity),
                elevation: 5),
          ),
          Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController
                  ),
                  TextButton(
                    child: Text('Add Transaction'),
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      print(titleController.text)
                      print(amountController.text);
                    },
                  )
                ]),
              )),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Text('\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ]));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
