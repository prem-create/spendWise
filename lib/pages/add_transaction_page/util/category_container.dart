import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class CategoryContainer extends StatelessWidget {
  final IconData iconData;
  final String category;

  const CategoryContainer({
    super.key,
    required this.iconData,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xs),
      height: AppSpacing.xl,
      width: AppSpacing.xl,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppSpacing.curve),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Theme.of(context).colorScheme.primary),
            SizedBox(height: AppSpacing.xs),
            FittedBox(
              child: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
