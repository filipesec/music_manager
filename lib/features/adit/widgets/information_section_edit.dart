import 'package:flutter/material.dart';
import 'package:music_manager/features/adit/widgets/information_edit.dart';
import 'package:music_manager/core/data/database.dart';

class InformationSectionEdit extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController artistaController;
  final List<GenreTableData> genres;
  final int? selectedGenreId;
  final Function(int?) onGenreChanged;
  final VoidCallback onMusicaSelected;
  final String? musicaPath;

  const InformationSectionEdit({
    super.key,
    required this.nomeController,
    required this.artistaController,
    required this.genres,
    required this.selectedGenreId,
    required this.onGenreChanged,
    required this.onMusicaSelected,
    required this.musicaPath,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InformationEdit(
            nomeController: nomeController,
            artistaController: artistaController,
            genres: genres,
            selectedGenreId: selectedGenreId,
            onGenreChanged: onGenreChanged,
            onMusicaSelected: onMusicaSelected,
            musicaPath: musicaPath,
          ),
        ],
      ),
    );
  }
}
