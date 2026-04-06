import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountFieldWidget extends StatelessWidget {
  final TextEditingController _amountController;
  const AmountFieldWidget({
    super.key,
    required TextEditingController amountController,
  }) : _amountController = amountController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _amountController,
      style: Theme.of(context).textTheme.titleLarge,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(prefixIcon: Icon(Icons.currency_rupee)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter the Transaction Amount';
        }
        return null;
      },
    );
  }
}
