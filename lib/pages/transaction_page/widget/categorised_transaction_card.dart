import 'package:flutter/material.dart';
import 'package:spend_wise/core/repo/global_transaction_repository.dart';
import 'package:spend_wise/core/widgets/transaction_card.dart';
import 'package:spend_wise/pages/transaction_page/widget/my_dismissible_widget.dart';

class CategorisedTransactionCard extends StatefulWidget {
  final int index;
  final List transactionList;
  final VoidCallback categorisedTransaction;
  const CategorisedTransactionCard({
    super.key,
    required this.index,
    required this.transactionList,
    required this.categorisedTransaction,
  });

  @override
  State<CategorisedTransactionCard> createState() =>
      _CategorisedTransactionCardState();
}

class _CategorisedTransactionCardState
    extends State<CategorisedTransactionCard> {
  final repo = GlobalTransactionRepository();
  @override
  Widget build(BuildContext context) {
    return MyDismissibleWidget(
      valuekey: ValueKey(widget.transactionList[widget.index]),

      onDismissed: () {
        repo.deleteTransaction(widget.transactionList[widget.index]);
        () => widget.categorisedTransaction();
      },
      child: TransactionCard(
        isborderedContainer: true,
        title: widget.transactionList[widget.index].title,
        iconData: widget.transactionList[widget.index].iconData,
        dateTime: widget.transactionList[widget.index].dateTime,
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${widget.transactionList[widget.index].amount}",
              style: TextStyle(
                color: widget.transactionList[widget.index].amount < 0
                    ? Theme.of(context).colorScheme.error
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
