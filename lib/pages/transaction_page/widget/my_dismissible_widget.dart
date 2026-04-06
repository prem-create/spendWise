import 'package:flutter/material.dart';
import 'package:spend_wise/core/repo/global_transaction_repository.dart';
import 'package:lottie/lottie.dart';

class MyDismissibleWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Key valuekey;
  const MyDismissibleWidget({
    super.key,
    required this.child,
    required this.onDismissed,
    required this.valuekey,
  });

  @override
  State<MyDismissibleWidget> createState() => _MyDismissibleWidgetState();
}

class _MyDismissibleWidgetState extends State<MyDismissibleWidget> {
  final repo = GlobalTransactionRepository();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.valuekey,
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        // alignment: Alignment.centerRight,
        child: Transform.flip(
          flipX: true,
          child: Lottie.asset(
            'assets/animations/delete_animation.json',
            fit: BoxFit.fill,
          ),
        ),
      ),
      onDismissed: (direction) {
        widget.onDismissed();
      },
      child: widget.child,
    );
  }
}
