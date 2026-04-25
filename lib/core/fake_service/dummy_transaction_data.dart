import 'package:flutter/material.dart';
import 'package:spend_wise/core/model/transaction_model.dart';

class DummyTransactionData {
  final transactions = [
    {
      "title": "Grocery Shopping",
      "dateTime": DateTime.now().toIso8601String(),
      "iconData": Icons.shopping_cart,
      "amount": -450.0,
    },
    {
      "title": "Coffee",
      "dateTime": DateTime.now()
          .subtract(const Duration(hours: 1))
          .toIso8601String(),
      "iconData": Icons.coffee,
      "amount": -120.0,
    },
    {
      "title": "Salary",
      "dateTime": DateTime.now()
          .subtract(const Duration(hours: 2))
          .toIso8601String(),
      "iconData": Icons.account_balance_wallet,
      "amount": 25000.0,
    },
    {
      "title": "Movie Ticket",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 1))
          .toIso8601String(),
      "iconData": Icons.movie,
      "amount": -300.0,
    },
    {
      "title": "Electricity Bill",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 1, hours: 2))
          .toIso8601String(),
      "iconData": Icons.flash_on,
      "amount": -1200.0,
    },
    {
      "title": "Dinner",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 1, hours: 4))
          .toIso8601String(),
      "iconData": Icons.restaurant,
      "amount": -800.0,
    },
    {
      "title": "Freelance Work",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 3))
          .toIso8601String(),
      "iconData": Icons.work,
      "amount": 5000.0,
    },
    {
      "title": "Petrol",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 4))
          .toIso8601String(),
      "iconData": Icons.local_gas_station,
      "amount": -1000.0,
    },
    {
      "title": "Gym Membership",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 10))
          .toIso8601String(),
      "iconData": Icons.fitness_center,
      "amount": -1500.0,
    },
    {
      "title": "Gift Received",
      "dateTime": DateTime.now()
          .subtract(const Duration(days: 12))
          .toIso8601String(),
      "iconData": Icons.card_giftcard,
      "amount": 2000.0,
    },
  ];

  List<TransactionModel> getTransactionModel() {
    return transactions.map((dummyData) {
      return TransactionModel.fromJson(dummyData);
    }).toList();
  }
}
