import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
//   @override
//   _TransactionListState createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
  // final List<TransactionList

  // final List<Transaction> _usertransactions = [
  //   Transaction(id: 'Z1', title: 'CatFood', amount: 500, date: DateTime.now()),
  //   Transaction(
  //       id: 'Z2', title: 'DryCatFood', amount: 100, date: DateTime.now())
  // ];
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: transactions.map((tx) {
    //         return Card(
    //             child: Row(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.symmetric(
    //                 vertical: 10,
    //                 horizontal: 15,
    //               ),
    //               decoration: BoxDecoration(
    //                   border: Border.all(
    //                 color: Colors.black,
    //                 width: 2,
    //               )),
    //               padding: EdgeInsets.all(10),
    //               child: Text(
    //                 '\$${tx.amount}',
    //                 // tx.amount.toString(),
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20,
    //                   color: Colors.purple,
    //                 ),
    //               ),
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   tx.title,
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 16,
    //                   ),
    //                 ),
    //                 Text(
    //                   DateFormat.yMMMd().format(tx.date),
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ));
    //       }).toList(),
    //     ),
    //   ),
    // );
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transaction Added Yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(transactions[index].title,
              //               style: Theme.of(context).textTheme.headline6
              //               // TextStyle(
              //               //   fontSize: 16,
              //               //   fontWeight: FontWeight.bold,
              //               // ),
              //               ),
              //           Text(
              //             DateFormat.yMMMd().format(transactions[index].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );

              itemCount: transactions.length,
            ),
    );
  }
}
