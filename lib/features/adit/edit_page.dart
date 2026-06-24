import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_manager/core/data/database.dart';
import 'package:music_manager/core/data/dao/genre_dao.dart';
import 'package:music_manager/core/data/dao/music_dao.dart';
import 'package:music_manager/features/adit/widgets/image_section_edit.dart';
import 'package:music_manager/features/adit/widgets/information_section_edit.dart';

class EditPage extends StatefulWidget {
  final int id;
  final String name;
  final String artist;
  final int? genreId;
  final String? coverPath;
  final String? musicPath;

  const EditPage({
    super.key,
    required this.id,
    required this.name,
    required this.artist,
    required this.genreId,
    required this.coverPath,
    required this.musicPath,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late AppDatabase _db;
  late GenreDao _genreDao;
  late MusicDao _musicDao;
  List<GenreTableData> _genres = [];

  late TextEditingController _nomeController;
  late TextEditingController _artistaController;
  int? _selectedGenreId;
  String? _coverPath;
  String? _musicPath;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _genreDao = GenreDao(_db);
    _musicDao = MusicDao(_db);
    _nomeController = TextEditingController(text: widget.name);
    _artistaController = TextEditingController(text: widget.artist);
    _selectedGenreId = widget.genreId;
    _coverPath = widget.coverPath;
    _musicPath = widget.musicPath;
    _loadGenres();
  }

  Future<void> _loadGenres() async {
    final data = await _genreDao.getAll();
    setState(() {
      _genres = data;
    });
  }

  //selecionar nova capa
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _coverPath = file.path;
      });
    }
  }

  //selecionar nova música
  Future<void> _pickMusic() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _musicPath = result.files.single.path;
      });
    }
  }

  //atualizar
  Future<void> _update() async {
    if (_nomeController.text.isEmpty ||
        _artistaController.text.isEmpty ||
        _musicPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha nome, artista e selecione o arquivo de música',
          ),
        ),
      );
      return;
    }

    await _musicDao.update(
      id: widget.id,
      name: _nomeController.text,
      artist: _artistaController.text,
      musicPath: _musicPath!,
      genreId: _selectedGenreId,
      coverPath: _coverPath,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Música atualizada com sucesso!')),
    );

    Navigator.pop(context, true);
  }

  //deletar do banco
  Future<void> _delete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir música'),
        content: const Text('Tem certeza que deseja excluir esta música?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _musicDao.delete(widget.id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Música excluída com sucesso!')),
      );
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: colors.primary),
        ),
        title: Text(
          'SHii',
          style: TextStyle(
            color: colors.primary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Editar Música',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Edite sua música já enviada',
                style: TextStyle(color: colors.onSurface, fontSize: 16),
              ),
            ),

            //imagem
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: ImageSectionEdit(
                  onTapImage: _pickImage,
                  coverPath: _coverPath,
                ),
              ),
            ),

            //informações
            Padding(
              padding: EdgeInsets.all(15),
              child: InformationSectionEdit(
                nomeController: _nomeController,
                artistaController: _artistaController,
                genres: _genres,
                selectedGenreId: _selectedGenreId,
                onGenreChanged: (value) {
                  setState(() {
                    _selectedGenreId = value;
                  });
                },
                onTapMusic: _pickMusic,
                musicPath: _musicPath,
              ),
            ),

            //botão para salvar as alterações
            Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: ElevatedButton(
                onPressed: _update,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Icon(Icons.save, color: Colors.white),
                    ),
                    Text(
                      'Salvar Alterações',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),

            //botão para deletar
            Padding(
              padding: EdgeInsets.only(left: 125, right: 125, top: 15),
              child: ElevatedButton(
                onPressed: _delete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Icon(Icons.delete_outline, color: Colors.white),
                    ),
                    Text(
                      'Excluir',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _artistaController.dispose();
    _db.close();
    super.dispose();
  }
}
