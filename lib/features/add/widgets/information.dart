import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:music_manager/core/data/database.dart';

class Information extends StatefulWidget {
  final List<GenreTableData> genres;
  final Function(String) onMusicaSelected;
  final Function(int?) onGeneroChanged;
  final TextEditingController nomeController;
  final TextEditingController artistaController;
  final int? selectedGenreId;

  const Information({
    super.key,
    required this.genres,
    required this.onMusicaSelected,
    required this.onGeneroChanged,
    required this.nomeController,
    required this.artistaController,
    required this.selectedGenreId,
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String? _selectedFileName;

  Future<void> _pickMusica(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
      widget.onMusicaSelected(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Arquivo de música:',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _pickMusica(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(10),
              color: Colors.grey,
              dashPattern: [4, 4],
              strokeWidth: 1,
            ),
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.music_note_outlined,
                      size: 20,
                      color: colors.onSurface,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _selectedFileName ?? 'Selecionar Arquivo de Música',
                      style: TextStyle(color: colors.onSurface, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Nome:',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 325,
          child: TextField(
            controller: widget.nomeController,
            decoration: InputDecoration(
              hintText: 'Digite o nome da música',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: colors.surface,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Artista:',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 325,
          child: TextField(
            controller: widget.artistaController,
            decoration: InputDecoration(
              hintText: 'Digite o nome do artista ou banda',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: colors.surface,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Gênero:',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 325,
          height: 70,
          child: DropdownButtonFormField<int?>(
            initialValue: widget.selectedGenreId,
            decoration: InputDecoration(
              hintText: 'Selecione o gênero musical',
              hintStyle: TextStyle(color: colors.onSurface),
              filled: true,
              fillColor: colors.surface,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            items: widget.genres.map((genre) {
              return DropdownMenuItem<int?>(
                value: genre.id,
                child: Text(genre.name),
              );
            }).toList(),
            onChanged: (value) {
              widget.onGeneroChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
