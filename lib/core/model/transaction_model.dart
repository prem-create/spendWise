
import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final String time;
  final IconData iconData;
  final double amount;
  final String when;

  TransactionModel({
    required this.title,
    required this.time,
    required this.iconData,
    required this.amount, required this.when,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json["title"],
      time: json["time"],
      iconData: json["iconData"],
      amount: json["amount"],
      when: json["when"]
    );
  }
}
