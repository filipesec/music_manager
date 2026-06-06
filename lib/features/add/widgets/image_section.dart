import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DottedBorder(
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
        child: Column(
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
            Text('Adicionar Capa', style: TextStyle(color: colors.onSurface)),
          ],
        ),
      ),
    );
  }
}
