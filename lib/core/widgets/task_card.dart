import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class Taskcard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String subTitle;
  final Widget? trailing;
  final bool isborderedContainer;
  final EdgeInsets margin;
  const Taskcard({
    super.key,
    required this.title,
    required this.iconData,

    this.trailing,
    required this.isborderedContainer,
    this.margin = const EdgeInsets.all(AppSpacing.sm),
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: isborderedContainer ? Border.all() : null,
        borderRadius: BorderRadius.circular(AppSpacing.curve),
      ),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        subtitle: Text(subTitle),
        subtitleTextStyle: Theme.of(context).textTheme.titleSmall,
        trailing: trailing,
      ),
    );
  }
}
