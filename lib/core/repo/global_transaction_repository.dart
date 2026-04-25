import 'package:spend_wise/core/fake_service/dummy_transaction_data.dart';
import 'package:spend_wise/core/model/grouped_model.dart';
import 'package:spend_wise/core/model/transaction_model.dart';

class GlobalTransactionRepository {
  static final GlobalTransactionRepository _instance =
      GlobalTransactionRepository._internal();

  factory GlobalTransactionRepository() => _instance;

  GlobalTransactionRepository._internal();

  List<TransactionModel> transactions = DummyTransactionData()
      .getTransactionModel();

  //add Transaction
  void addTransaction(TransactionModel newTransactionModel) {
    transactions.add(newTransactionModel);
  }

  //delete Transaction
  void deleteTransaction(TransactionModel txToDelete) {
    transactions.remove(txToDelete);
  }

  CategorisedTransactions getCategorisedTransaction() {
    List<TransactionModel> todayTx = <TransactionModel>[];
    List<TransactionModel> yesterdayTx = <TransactionModel>[];
    List<TransactionModel> otherTx = <TransactionModel>[];

    final now = DateTime.now();
    final yesterday = DateTime.now().subtract(Duration(days: 1));

    //b.compareTo(a) -> increasing order  and a.compareTo(b) -> decreasing order
    transactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    // sorting as per today, yesterday and other
    for (var tx in transactions) {
      if (tx.dateTime.year == now.year &&
          tx.dateTime.month == now.month &&
          tx.dateTime.day == now.day) {
        todayTx.add(tx);
      } else if (tx.dateTime.year == yesterday.year &&
          tx.dateTime.month == yesterday.month &&
          tx.dateTime.day == yesterday.day) {
        yesterdayTx.add(tx);
      } else {
        otherTx.add(tx);
      }
    }

    return CategorisedTransactions(
      today: todayTx,
      yesterday: yesterdayTx,
      other: otherTx,
    );
  }
}
