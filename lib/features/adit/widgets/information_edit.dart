import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:music_manager/core/data/database.dart';

class InformationEdit extends StatefulWidget {
  final TextEditingController nomeController;
  final TextEditingController artistaController;
  final List<GenreTableData> genres;
  final int? selectedGenreId;
  final Function(int?) onGenreChanged;
  final VoidCallback onMusicaSelected;
  final String? musicaPath;

  const InformationEdit({
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
  State<InformationEdit> createState() => _InformationEditState();
}

class _InformationEditState extends State<InformationEdit> {
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    if (widget.musicaPath != null) {
      _selectedFileName = widget.musicaPath!.split('/').last;
    }
  }

  Future<void> _pickMusica(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
      widget.onMusicaSelected();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 5),
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
                      _selectedFileName != null
                          ? _selectedFileName!
                          : (widget.musicaPath != null
                                ? widget.musicaPath!.split('/').last
                                : 'Selecionar Novo Arquivo'),
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
            onChanged: widget.onGenreChanged,
          ),
        ),
      ],
    );
  }
}
