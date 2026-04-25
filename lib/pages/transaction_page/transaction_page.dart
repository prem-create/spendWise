import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/model/transaction_model.dart';
import 'package:spend_wise/core/repo/global_transaction_repository.dart';
import 'package:spend_wise/pages/transaction_page/widget/categorised_transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final GlobalTransactionRepository repo = GlobalTransactionRepository();

  late List<TransactionModel> todayTx;
  late List<TransactionModel> yesterdayTx;
  late List<TransactionModel> otherTx;

  void categoriseTransaction() {
    setState(() {
      todayTx = repo.transactions.where((tx) {
        return tx.when == "today";
      }).toList();

      yesterdayTx = repo.transactions.where((tx) {
        return tx.when == "yesterday";
      }).toList();

      otherTx = repo.transactions.where((tx) {
        return tx.when == "other";
      }).toList();
    });
  }

  @override
  void initState() {
    categoriseTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
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
                        return CategorisedTransactionCard(
                          index: index,
                          transactionList: todayTx,
                          categorisedTransaction: (categoriseTransaction),
                        );
                      }),
                    ],

                    //yesterday
                    if (yesterdayTx.isNotEmpty) ...[
                      Text('Yesterday'),
                      ...List.generate(
                        yesterdayTx.length,
                        (index) => CategorisedTransactionCard(
                          index: index,
                          transactionList: yesterdayTx,
                          categorisedTransaction: (categoriseTransaction),
                        ),
                      ),
                    ],

                    //other
                    if (otherTx.isNotEmpty) ...[
                      Text('other'),
                      ...List.generate(
                        otherTx.length,
                        (index) => CategorisedTransactionCard(
                          index: index,
                          transactionList: otherTx,
                          categorisedTransaction: (categoriseTransaction),
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
