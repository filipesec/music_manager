import 'package:flutter/material.dart';
import 'dart:io';
import 'package:music_manager/features/adit/edit_page.dart';
import 'package:music_manager/features/player/player_page.dart';

class CardSection extends StatelessWidget {
  final int id;
  final String? cover;
  final String name;
  final String artist;
  final int? genreId;
  final String? musicPath;
  final String genreName;
  final VoidCallback onDelete;
  final VoidCallback onRefresh;

  const CardSection({
    super.key,
    required this.id,
    required this.cover,
    required this.name,
    required this.artist,
    required this.genreId,
    required this.musicPath,
    required this.genreName,
    required this.onDelete,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerPage(
              musicPath: musicPath!,
              name: name,
              artist: artist,
              coverPath: cover,
            ),
          ),
        );
      },
      child: Card(
        elevation: 1,
        color: colors.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: cover != null && cover!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(cover!),
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.music_note,
                            size: 50,
                            color: Colors.grey,
                          ),
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
                      width: 90,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        genreName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            id: id,
                            name: name,
                            artist: artist,
                            genreId: genreId,
                            coverPath: cover,
                            musicPath: musicPath,
                          ),
                        ),
                      ).then((_) {
                        onRefresh();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: const Icon(Icons.edit, size: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: onDelete,
                    child: const Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
