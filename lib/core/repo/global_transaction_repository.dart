import 'package:spend_wise/core/fake_service/dummy_transaction_data.dart';
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
}
