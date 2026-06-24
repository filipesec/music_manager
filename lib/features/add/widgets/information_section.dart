import 'package:flutter/material.dart';
import 'package:music_manager/features/add/widgets/information.dart';
import 'package:music_manager/core/data/database.dart';

class InformationSection extends StatelessWidget {
  final List<GenreTableData> genres;
  final Function(String) onMusicSelected;
  final Function(int?) onGenreChanged;
  final TextEditingController nomeController;
  final TextEditingController artistaController;
  final int? selectedGenreId;

  const InformationSection({
    super.key,
    required this.genres,
    required this.onMusicSelected,
    required this.onGenreChanged,
    required this.nomeController,
    required this.artistaController,
    required this.selectedGenreId,
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
          Information(
            genres: genres,
            onMusicSelected: onMusicSelected,
            onGenreChanged: onGenreChanged,
            nameController: nomeController,
            artistController: artistaController,
            selectedGenreId: selectedGenreId,
          ),
        ],
      ),
    );
  }
}
