import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/model/categorised_transactions_model.dart';
import 'package:spend_wise/pages/transaction_page/widget/categorised_transaction_card.dart';
import 'package:spend_wise/repo/global_transaction_repository.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final GlobalTransactionRepository repo = GlobalTransactionRepository();
  late CategorisedTransactions categorisedTransactions;

  @override
  void initState() {
    categorisedTransactions = repo.getCategorisedTransaction();
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
                repo.transactions.isEmpty
                    ? Center(child: Text('No transaction yet'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // today
                          if (categorisedTransactions.today.isNotEmpty) ...[
                            Text('Today'),
                            ...List.generate(
                              categorisedTransactions.today.length,
                              (index) {
                                return CategorisedTransactionCard(
                                  index: index,
                                  transactionList:
                                      categorisedTransactions.today,
                                  categorisedTransaction: () {
                                    setState(() {
                                      categorisedTransactions = repo
                                          .getCategorisedTransaction();
                                    });
                                  },
                                );
                              },
                            ),
                          ],

                          //yesterday
                          if (categorisedTransactions.yesterday.isNotEmpty) ...[
                            Text('Yesterday'),
                            ...List.generate(
                              categorisedTransactions.yesterday.length,
                              (index) => CategorisedTransactionCard(
                                index: index,
                                transactionList:
                                    categorisedTransactions.yesterday,
                                categorisedTransaction: () {
                                  setState(() {
                                    categorisedTransactions = repo
                                        .getCategorisedTransaction();
                                  });
                                },
                              ),
                            ),
                          ],

                          //other
                          if (categorisedTransactions.other.isNotEmpty) ...[
                            Text('other'),
                            ...List.generate(
                              categorisedTransactions.other.length,
                              (index) => CategorisedTransactionCard(
                                index: index,
                                transactionList: categorisedTransactions.other,
                                categorisedTransaction: () {
                                  setState(() {
                                    categorisedTransactions = repo
                                        .getCategorisedTransaction();
                                  });
                                },
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
