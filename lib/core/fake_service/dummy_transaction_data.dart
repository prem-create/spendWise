import 'package:flutter/material.dart';
import 'package:spend_wise/core/model/transaction_model.dart';

class DummyTransactionData {
final transactions = [
  {
    "title": "Grocery Shopping",
    "time": "10:30 AM",
    "iconData": Icons.shopping_cart,
    "amount": -450.0,
    "when": "today",
  },
  {
    "title": "Coffee",
    "time": "09:15 AM",
    "iconData": Icons.coffee,
    "amount": -120.0,
    "when": "today",
  },
  {
    "title": "Salary",
    "time": "08:00 AM",
    "iconData": Icons.account_balance_wallet,
    "amount": 25000.0,
    "when": "today",
  },
  {
    "title": "Movie Ticket",
    "time": "Yesterday",
    "iconData": Icons.movie,
    "amount": -300.0,
    "when": "yesterday",
  },
  {
    "title": "Electricity Bill",
    "time": "Yesterday",
    "iconData": Icons.flash_on,
    "amount": -1200.0,
    "when": "yesterday",
  },
  {
    "title": "Dinner",
    "time": "Yesterday",
    "iconData": Icons.restaurant,
    "amount": -800.0,
    "when": "yesterday",
  },
  {
    "title": "Freelance Work",
    "time": "2 Apr",
    "iconData": Icons.work,
    "amount": 5000.0,
    "when": "other",
  },
  {
    "title": "Petrol",
    "time": "1 Apr",
    "iconData": Icons.local_gas_station,
    "amount": -1000.0,
    "when": "other",
  },
  {
    "title": "Gym Membership",
    "time": "28 Mar",
    "iconData": Icons.fitness_center,
    "amount": -1500.0,
    "when": "other",
  },
  {
    "title": "Gift Received",
    "time": "25 Mar",
    "iconData": Icons.card_giftcard,
    "amount": 2000.0,
    "when": "other",
  },
];
  List<TransactionModel> getTransactionModel() {
    return transactions.map((dummyData) {
      return TransactionModel.fromJson(dummyData);
    }).toList();
  }
}
