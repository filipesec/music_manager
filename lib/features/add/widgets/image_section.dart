import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageSection extends StatefulWidget {
  final Function(String) onImageSelected;

  const ImageSection({super.key, required this.onImageSelected});

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _selectedImagePath = file.path;
      });
      widget.onImageSelected(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: _pickImage,
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
          child: _selectedImagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(_selectedImagePath!),
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
                      'Adicionar Capa',
                      style: TextStyle(color: colors.onSurface),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
