import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spend_wise/core/widgets/my_alert_dialog_widget.dart';
import 'package:spend_wise/repo/global_transaction_repository.dart';

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
      confirmDismiss: (direction) async {
        final result = await showDialog(
          context: context,
          builder: (context) => MyAlertDialogWidget(
            iconData: Icons.delete_outline_outlined,
            title:
                "Are you sure, you want to delete it??\n This action can't be undone!",
            voidCallback: () {
              Navigator.pop(context, true);
            },
          ),
        );
        return result ?? false;
      },
      onDismissed: (direction) => widget.onDismissed(),
      child: widget.child,
    );
  }
}
