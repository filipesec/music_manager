import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final List<String> categories;

  const Filter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              backgroundColor: colors.surfaceContainerHighest,
              selectedColor: colors.primary,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              side: BorderSide(color: Colors.grey, width: 0.2),
              label: Text(category),
              labelStyle: TextStyle(
                color: selectedCategory == category
                    ? Colors.white
                    : colors.onSurface,
              ),
              selected: selectedCategory == category,
              onSelected: (_) => onCategorySelected(category),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          );
        }).toList(),
      ),
    );
  }
}
