import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/pages/home_page/widgets/my_app_bar.dart';
import 'package:spend_wise/pages/home_page/widgets/my_bar_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add),
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
                  'WeeklySpending',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                //Bar Chart
                MyBarChart(
                  xCoordinates: [1, 2, 3, 4, 5, 6, 7],
                  yCoordinates: [45, 60, 30, 80, 50, 70, 40],
                ),
                Divider(),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transactions",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(onPressed: () {}, child: Text("view all")),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(3, (index) {
                    return ListTile(
                      leading: Icon(Icons.coffee_rounded),
                      title: Text('StarBucks Coffee'),
                      titleTextStyle: Theme.of(context).textTheme.titleMedium,
                      subtitle: Text('07/07/2007'),
                      subtitleTextStyle: Theme.of(context).textTheme.titleSmall,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
