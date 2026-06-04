import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';
import 'package:music_manager/features/add/add_page.dart';
import 'package:music_manager/features/home/widgets/filter_section.dart';
import 'package:music_manager/features/home/widgets/cards_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      backgroundColor: ColorsKeys.bgDefault,
      appBar: AppBar(
        backgroundColor: ColorsKeys.bgDefault,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Image.asset('assets/images/theme.png', scale: 25),
        ),
        title: Text(
          'SHii',
          style: TextStyle(
            color: ColorsKeys.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPage()),
              );
            },
            child: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color: ColorsKeys.textPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Minhas Músicas',
              style: TextStyle(
                color: ColorsKeys.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //filtro
          Padding(
            padding: EdgeInsets.all(8),
            child: Filter(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          ),
          //cards
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return CardSection(
                  cover: null,
                  name: 'Aerials',
                  artist: 'System Of a Down',
                  gender: 'Rock',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
