import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/core/constants/categories.dart';
import 'package:spend_wise/core/model/transaction_model.dart';
import 'package:spend_wise/core/widgets/my_alert_dialog_widget.dart';
import 'package:spend_wise/pages/add_transaction_page/util/transaction_action.dart';
import 'package:spend_wise/pages/add_transaction_page/widget/amount_field_widget.dart';
import 'package:spend_wise/pages/add_transaction_page/widget/category_selector_widget.dart';
import 'package:spend_wise/pages/add_transaction_page/widget/date_picker_widget.dart';
import 'package:spend_wise/pages/add_transaction_page/widget/expense_income_toggle_widget.dart';
import 'package:spend_wise/repo/global_transaction_repository.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  DateTime? selected;
  GlobalTransactionRepository repo = GlobalTransactionRepository();
  Map<String, dynamic>? selectedCategory;
  bool isCategorySelected = false;

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selected = pickedDate;
      });
    }
  }

  void onSaveChangesPressed() async {
    final DateTime currentDateTime = DateTime.now();

    if (selectedCategory == null ||
        _amountController.text.isEmpty ||
        _amountController.text == '') {
      await showDialog(
        context: context,
        builder: (context) => MyAlertDialogWidget(
          title: "OOPS!😅 You missed filing some details",
          iconData: Icons.question_mark_rounded,
          onOk: () => Navigator.pop(context),
        ),
      );
    } else {
      repo.addTransaction(
        TransactionModel(
          title: selectedCategory?["name"] ?? '',
          dateTime: selected ?? currentDateTime,
          iconData: selectedCategory?["icon"],
          amount: double.parse(_amountController.text),
        ),
      );
      Navigator.pop(context);
    }
  }

  final List expenseCategories = categories.where((e) {
    return e["type"] == "expense";
  }).toList();
  final List incomeCategories = categories.where((e) {
    return e["type"] == "income";
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Add Record"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: TextButton(
              onPressed: onSaveChangesPressed,
              child: Text('Save'),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Enter Amount",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          AmountFieldWidget(
                            amountController: _amountController,
                          ),

                          ExpenseIncomeToggleWidget(),

                          CategorySelectorWidget(
                            categories: expenseCategories,
                            onSelected: (category) {
                              selectedCategory = category;
                            },
                          ),
                        ],
                      ),
                    ),
                    DatePickerWidget(
                      selectedDateTime: selected,
                      onTap: () async {
                        await pickDate(context);
                      },
                    ),
                  ],
                ),
                TransactionAction(
                  onSaveChangesPressed: onSaveChangesPressed,
                  onDeleteTransactionPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
