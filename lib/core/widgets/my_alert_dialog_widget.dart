import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class MyAlertDialogWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback voidCallback;
  const MyAlertDialogWidget({
    super.key,
    required this.title,
    required this.iconData,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        iconData,
        color: Theme.of(context).colorScheme.error,
        size: AppSpacing.xxl,
      ),
      title: Text(title),
      actions: [TextButton(onPressed: voidCallback, child: Text("Ok"))],
    );
  }
}
