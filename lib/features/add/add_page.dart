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

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _artistaController = TextEditingController();
  int? _selectedGenreId;
  String? _capaPath;
  String? _musicaPath;

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

  void _onCapaSelected(String path) {
    setState(() {
      _capaPath = path;
    });
  }

  void _onMusicaSelected(String path) {
    setState(() {
      _musicaPath = path;
    });
  }

  void _onGeneroChanged(int? value) {
    setState(() {
      _selectedGenreId = value;
    });
  }

  Future<void> _save() async {
    if (_nomeController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Digite o nome da música')));
      return;
    }

    if (_artistaController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Digite o nome do artista')));
      return;
    }

    if (_musicaPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione o arquivo de música')),
      );
      return;
    }

    await _musicDao.insert(
      name: _nomeController.text,
      artist: _artistaController.text,
      musicPath: _musicaPath!,
      genreId: _selectedGenreId,
      coverPath: _capaPath,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Música adicionada com sucesso!')),
    );

    // Limpa o formulário em vez de fechar a tela
    _nomeController.clear();
    _artistaController.clear();
    setState(() {
      _selectedGenreId = null;
      _capaPath = null;
      _musicaPath = null;
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _artistaController.dispose();
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
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: ImageSection(onImageSelected: _onCapaSelected),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: InformationSection(
                genres: _genres,
                onMusicaSelected: _onMusicaSelected,
                onGeneroChanged: _onGeneroChanged,
                nomeController: _nomeController,
                artistaController: _artistaController,
                selectedGenreId: _selectedGenreId,
              ),
            ),
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
