import 'package:flutter/material.dart';

class TransactionAction extends StatelessWidget {
  final VoidCallback onSaveChangesPressed;
  final VoidCallback onDeleteTransactionPressed;
  const TransactionAction({super.key, required this.onSaveChangesPressed, required this.onDeleteTransactionPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:onSaveChangesPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Text(
              "Save Changes",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: onDeleteTransactionPressed,
            child: Text(
              "Delete Transaction",
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      ],
    );
  }
}
