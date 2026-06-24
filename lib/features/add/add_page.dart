import 'package:flutter/material.dart';
import 'package:music_manager/features/add/widgets/image_section.dart';
import 'package:music_manager/features/add/widgets/information_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_event.dart';
import 'package:music_manager/core/data/database.dart';
import 'package:music_manager/core/data/dao/genre_dao.dart';
import 'package:music_manager/core/data/dao/music_dao.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late AppDatabase _db;
  late GenreDao _genreDao;
  late MusicDao _musicDao;
  List<GenreTableData> _genres = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  int? _selectedGenreId;
  String? _coverPath;
  String? _musicPath;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _genreDao = GenreDao(_db);
    _musicDao = MusicDao(_db);
    _loadGenres();
  }

  Future<void> _loadGenres() async {
    try {
      final data = await _genreDao.getAll();
      setState(() {
        _genres = data;
      });
    } catch (e) {
      debugPrint('Erro ao carregar gêneros: $e');
    }
  }

  void _onCoverSelected(String path) {
    setState(() {
      _coverPath = path;
    });
  }

  void _onMusicSelected(String path) {
    setState(() {
      _musicPath = path;
    });
  }

  void _onGenreChanged(int? value) {
    setState(() {
      _selectedGenreId = value;
    });
  }

  //adicionar no banco
  Future<void> _save() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Digite o nome da música')));
      return;
    }

    if (_artistController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Digite o nome do artista')));
      return;
    }

    if (_musicPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione o arquivo de música')),
      );
      return;
    }

    await _musicDao.insert(
      name: _nameController.text,
      artist: _artistController.text,
      musicPath: _musicPath!,
      genreId: _selectedGenreId,
      coverPath: _coverPath,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Música adicionada com sucesso!')),
    );
    _nameController.clear();
    _artistController.clear();
    setState(() {
      _selectedGenreId = null;
      _coverPath = null;
      _musicPath = null;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _artistController.dispose();
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 120,
        title: Text(
          'SHii',
          style: TextStyle(
            color: colors.primary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              child: Image.asset(
                'assets/images/the.png',
                scale: 15,
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Adicionar Música',
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
                'Faça o upload das suas músicas favoritas',
                style: TextStyle(color: colors.onSurface, fontSize: 16),
              ),
            ),

            //imagem
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: ImageSection(onImageSelected: _onCoverSelected),
              ),
            ),

            //informações
            Padding(
              padding: EdgeInsets.all(15),
              child: InformationSection(
                genres: _genres,
                onMusicSelected: _onMusicSelected,
                onGenreChanged: _onGenreChanged,
                nomeController: _nameController,
                artistaController: _artistController,
                selectedGenreId: _selectedGenreId,
              ),
            ),

            //botão para salvar
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(
                '+ Adicionar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
