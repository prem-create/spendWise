import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/model/dummy_transaction_data.dart';
import 'package:spend_wise/core/model/transaction_model.dart';
import 'package:spend_wise/core/widgets/transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final DummyTransactionData dummyTransactionData = DummyTransactionData();
  late final List<TransactionModel> transactions;
  late final List<TransactionModel> todayTx;
  late final List<TransactionModel> yesterdayTx;
  late final List<TransactionModel> otherTx;

  void categoriseTransaction() {
    todayTx = transactions.where((tx) {
      return tx.when == "today";
    }).toList();

    yesterdayTx = transactions.where((tx) {
      return tx.when == "yesterday";
    }).toList();

    otherTx = transactions.where((tx) {
      return tx.when == "other";
    }).toList();
  }

  @override
  void initState() {
    transactions = dummyTransactionData.getTransactionModel();
    categoriseTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: [Padding(
          padding: const EdgeInsets.only(right: AppSpacing.sm),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        )],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this month button
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Text(
                        "This Month",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    //Last Month Button
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Last Month", style: TextStyle()),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Divider(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // today
                    if (todayTx.isNotEmpty) ...[
                      Text('Today'),
                      ...List.generate(todayTx.length, (index) {
                        return TransactionCard(
                          isborderedContainer: true,
                          title: todayTx[index].title,
                          iconData: todayTx[index].iconData,
                          time: todayTx[index].time,
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${todayTx[index].amount}",
                                style: TextStyle(
                                  color: todayTx[index].amount < 0
                                      ? Theme.of(context).colorScheme.error
                                      : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],

                    //yesterday
                    if (yesterdayTx.isNotEmpty) ...[
                      Text('Yesterday'),
                      ...List.generate(
                        yesterdayTx.length,
                        (index) => TransactionCard(
                          isborderedContainer: true,
                          title: yesterdayTx[index].title,
                          iconData: yesterdayTx[index].iconData,
                          time: yesterdayTx[index].time,
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${yesterdayTx[index].amount}",
                                style: TextStyle(
                                  color: yesterdayTx[index].amount < 0
                                      ? Theme.of(context).colorScheme.error
                                      : Colors.green,
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],

                    if (otherTx.isNotEmpty) ...[
                      Text('other'),
                      ...List.generate(
                        otherTx.length,
                        (index) => TransactionCard(
                          isborderedContainer: true,  
                          title: otherTx[index].title,
                          iconData: otherTx[index].iconData,
                          time: otherTx[index].time,
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${otherTx[index].amount}",
                                style: TextStyle(
                                  color: otherTx[index].amount < 0
                                      ? Theme.of(context).colorScheme.error
                                      : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
