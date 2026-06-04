import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';
import 'package:dotted_border/dotted_border.dart';

class ImageSectionEdit extends StatelessWidget {
  const ImageSectionEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(20),
        color: ColorsKeys.textPrimary,
        dashPattern: [4, 4],
        strokeWidth: 1,
      ),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.add_photo_alternate,
                size: 35,
                color: ColorsKeys.textPrimary,
              ),
            ),
            Text(
              'Editar Capa',
              style: TextStyle(color: ColorsKeys.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
