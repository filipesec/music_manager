import 'package:flutter/material.dart';
import 'package:music_manager/features/add/widgets/image_section.dart';
import 'package:music_manager/features/add/widgets/information_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_event.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Adicionar Música',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Faça o upload das suas músicas favoritas',
                style: TextStyle(color: colors.onSurface, fontSize: 16),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: ImageSection(),
              ),
            ),
            Padding(padding: EdgeInsets.all(15), child: InformationSection()),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(
                '+ Adicionar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
