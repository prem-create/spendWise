import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/repo/global_transaction_repository.dart';
import 'package:spend_wise/core/widgets/transaction_card.dart';
import 'package:spend_wise/pages/home_page/widgets/my_app_bar.dart';
import 'package:spend_wise/pages/home_page/widgets/my_bar_chart.dart';

class HomePage extends StatefulWidget {
  final Function(int) onChangePage;
  const HomePage({super.key, required this.onChangePage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalTransactionRepository repo = GlobalTransactionRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () {},
        child: CircleAvatar(radius: 25, child: Icon(Icons.add)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hii, Prem 👋',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(width: AppSpacing.sm),
                Text(
                  "keep up the great work saving!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '\$4,250.60',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Weekly Spending',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                //Bar Chart
                MyBarChart(
                  xCoordinates: [1, 2, 3, 4, 5, 6, 7],
                  yCoordinates: [45, 60, 30, 80, 50, 70, 40],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        widget.onChangePage(1);
                      },
                      child: Text("view all"),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(4, (index) {
                    final tx = repo.transactions[index];
                    return TransactionCard(
                      isborderedContainer: true,
                      title: tx.title,
                      iconData: tx.iconData,
                      time: tx.time,
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${tx.amount}",
                            style: TextStyle(
                              color: tx.amount < 0
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
