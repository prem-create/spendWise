import 'package:spend_wise/core/model/transaction_model.dart';

class CategorisedTransactions {
  final List<TransactionModel> today;
  final List<TransactionModel> yesterday;
  final List<TransactionModel> other;

  CategorisedTransactions({
    required this.today,
    required this.yesterday,
    required this.other,
  });
}
