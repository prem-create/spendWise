import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class ExpenseIncomeToggleWidget extends StatelessWidget {
  const ExpenseIncomeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppSpacing.curve),
      ),
      padding: EdgeInsets.all(AppSpacing.xs),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Text(
                "Expense",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          //Last Month Button
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: ElevatedButton(onPressed: () {}, child: Text("Income")),
          ),
        ],
      ),
    );
  }
}
