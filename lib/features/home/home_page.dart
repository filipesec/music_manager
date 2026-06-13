import 'package:flutter/material.dart';
import 'package:music_manager/features/home/widgets/filter_section.dart';
import 'package:music_manager/features/home/widgets/cards_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext build) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 120,

        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: colors.primary.withValues(alpha: 0.2),
                  child: Icon(Icons.person, color: colors.primary),
                ),
              ),

              Text(
                'FILIPE',
                style: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          'SHii',
          style: TextStyle(
            color: colors.primary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              child: Image.asset(
                'assets/images/the.png',
                scale: 15,
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Minhas Músicas',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Spacer(),
            ],
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
