import 'package:flutter/material.dart';

class MyAlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget? content;
  final IconData? iconData;
  final VoidCallback onOk;

  const MyAlertDialogWidget({
    super.key,
    required this.title,
    required this.onOk,
    this.iconData,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: iconData != null
          ? Icon(iconData, size: 32)
          : null,
      title: Text(title),
      content: content,
      actions: [
        TextButton(onPressed: onOk, child: const Text("Ok")),
      ],
    );
  }
}