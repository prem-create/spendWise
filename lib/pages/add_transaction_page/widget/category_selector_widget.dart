import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';
import 'package:spend_wise/pages/add_transaction_page/util/category_container.dart';

class CategorySelectorWidget extends StatelessWidget {
  final List categories;
  final Function onSelected;
  const CategorySelectorWidget({
    super.key,
    required this.categories,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Category", style: Theme.of(context).textTheme.titleMedium),
            TextButton(onPressed: () {}, child: Text("Manage")),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of columns
            crossAxisSpacing: AppSpacing.sm, // horizontal spacing
            mainAxisSpacing: AppSpacing.sm, // vertical spacing
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                final newCategory = categories[index];
                onSelected(newCategory);
              },
              child: CategoryContainer(
                iconData: categories[index]["icon"],
                category: categories[index]["name"],
              ),
            );
          },
        ),
      ],
    );
  }
}
