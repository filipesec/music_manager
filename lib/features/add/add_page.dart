import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';
import 'package:music_manager/features/add/widgets/image_section.dart';
import 'package:music_manager/features/add/widgets/information_section.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsKeys.bgDefault,
      appBar: AppBar(
        backgroundColor: ColorsKeys.bgDefault,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: ColorsKeys.textPrimary),
        ),
        title: Text(
          'SHii',
          style: TextStyle(
            color: ColorsKeys.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                    color: ColorsKeys.textPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Faça o upload das suas músicas favoritas',
                style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 16),
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
                backgroundColor: ColorsKeys.textPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                '+ Adicionar Música',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
