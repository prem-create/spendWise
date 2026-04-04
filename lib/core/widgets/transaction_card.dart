import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String time;
  final Widget? trailing;
  const TransactionCard({
    super.key,
    required this.title,
    required this.iconData,
    required this.time,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppSpacing.curve)
      ),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        subtitle: Text(time),
        subtitleTextStyle: Theme.of(context).textTheme.titleSmall,
        trailing: trailing,
      ),
    );
  }
}
