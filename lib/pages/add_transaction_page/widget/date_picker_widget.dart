import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class DatePickerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final DateTime? selectedDateTime;
  const DatePickerWidget({
    super.key,
    required this.onTap,
    required this.selectedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Date", style: Theme.of(context).textTheme.titleMedium),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(),
                borderRadius: BorderRadius.circular(AppSpacing.curve),
              ),
              padding: EdgeInsets.all(AppSpacing.xs),
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.calendar_month),
                title: selectedDateTime != null
                    ? Text(
                        "${selectedDateTime?.day}/${selectedDateTime?.month}/${selectedDateTime?.year}",
                      )
                    : Text("pick Date"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}