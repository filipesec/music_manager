import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';
import 'package:music_manager/features/adit/widgets/image_section_edit.dart';
import 'package:music_manager/features/adit/widgets/information_section_edit.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

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
                  'Editar Música',
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
                'Edite sua música já enviada',
                style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 16),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: ImageSectionEdit(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: InformationSectionEdit(),
            ),

            Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsKeys.textPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Icon(Icons.save, color: Colors.white),
                    ),
                    Text(
                      'Salvar Alterações',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 125, right: 125, top: 15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Icon(Icons.delete_outline, color: Colors.white),
                    ),
                    Text(
                      'Excluir',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
