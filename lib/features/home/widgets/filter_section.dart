import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';

class Filter extends StatelessWidget{
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const Filter({super.key, required this.selectedCategory, required this.onCategorySelected});

  @override
  Widget build(BuildContext context){
    final categories = ['Todos', 'Rock', 'Pop', 'Eletrónica', 'MPB', 'Clássica'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              backgroundColor: Colors.white,
              selectedColor: ColorsKeys.textPrimary,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              side: BorderSide(
                color: Colors.grey,
                width: 0.2
              ),
              label: Text(category),
              labelStyle: TextStyle(
                color: selectedCategory == category ? Colors.white : ColorsKeys.textPrimary,
              ),
              selected: selectedCategory == category,
              onSelected: (_) => onCategorySelected(category),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
            ),
          );
        }).toList(),
      ),
    );
  }
}