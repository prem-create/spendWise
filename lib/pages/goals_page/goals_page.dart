import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/widgets/transaction_card.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final double _circularProgress = .76;
  final double _linearProgress = 0;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: IconButton(
              icon: Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Center(
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: CircularProgressIndicator(
                                value: _circularProgress,
                                strokeWidth: 10,
                              ),
                            ),
                          ),
                        ),

                        Center(
                          child: Text(
                            "${_circularProgress * 100}%\nSaved",
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      r"$1,300 / $2,000",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Vacation Fund 2024",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weekly Challenge",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(AppSpacing.curve),
                      ),
                      child: Text("Ends in 2d"),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(AppSpacing.curve),
                  ),
                  child: Column(
                    children: [
                      TransactionCard(
                        // margin: EdgeInsets.all(0),
                        isborderedContainer: false,
                        title: "Skip Takeout Coffee",
                        iconData: Icons.coffee,
                        time: "Make your coffee at home all week to save more.",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Progress",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "0/1",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        child: LinearProgressIndicator(
                          value: _linearProgress,
                          minHeight: 8,
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.bolt),
                              Text(
                                "+50 Points",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Details",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.all(),
                    borderRadius: BorderRadius.circular(AppSpacing.curve),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(),
                    title: Text(
                      'Enable Auto-Save',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      'Automatically round up transactions and save the spare change.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
