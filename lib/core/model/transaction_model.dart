import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final DateTime dateTime;
  final IconData iconData;
  final double amount;

  TransactionModel({
    required this.title,
    required this.iconData,
    required this.amount,
    required this.dateTime,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json["title"],
      dateTime: DateTime.parse(json["dateTime"]),
      iconData: json["iconData"],
      amount: json["amount"],
    );
  }
}
