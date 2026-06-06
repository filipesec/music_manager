import 'package:flutter/material.dart';
import 'dart:io';
import 'package:music_manager/features/adit/edit_page.dart';

class CardSection extends StatelessWidget {
  final String? cover;
  final String name;
  final String artist;
  final String gender;

  const CardSection({
    super.key,
    required this.cover,
    required this.name,
    required this.artist,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      color: colors.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: cover != null && cover!.isNotEmpty
                  ? Image.file(File(cover!), fit: BoxFit.cover, height: 150)
                  : const Center(
                      child: Icon(
                        Icons.music_note,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5),
              child: Text(
                name,
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Text(
                artist,
                style: TextStyle(color: colors.onSurface, fontSize: 15),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      gender,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.edit, size: 20, color: colors.onSurface),
                  ),
                ),
                Icon(Icons.delete_outline, size: 20, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
