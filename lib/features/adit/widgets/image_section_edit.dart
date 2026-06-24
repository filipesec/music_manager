import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

class ImageSectionEdit extends StatelessWidget {
  final VoidCallback onTapImage;
  final String? coverPath;

  const ImageSectionEdit({super.key, required this.onTapImage, this.coverPath});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTapImage,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(20),
          color: Colors.grey,
          dashPattern: [4, 4],
          strokeWidth: 1,
        ),
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
          ),
          child: coverPath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(coverPath!),
                    fit: BoxFit.cover,
                    width: 180,
                    height: 180,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add_photo_alternate,
                        size: 35,
                        color: colors.onSurface,
                      ),
                    ),
                    Text(
                      'Editar Capa',
                      style: TextStyle(color: colors.onSurface),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
