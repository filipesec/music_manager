import 'package:flutter/material.dart';
import 'package:music_manager/features/home/widgets/filter_section.dart';
import 'package:music_manager/features/home/widgets/cards_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_event.dart';
import 'package:music_manager/core/data/database.dart';
import 'package:music_manager/core/data/dao/music_dao.dart';
import 'package:music_manager/core/data/dao/genre_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppDatabase _db;
  late MusicDao _musicDao;
  late GenreDao _genreDao;
  List<MusicTableData> _musicas = [];
  List<GenreTableData> _genres = [];
  String selectedCategory = 'Todos';
  bool _isLoading = true;

  List<String> get _categories {
    final List<String> cats = ['Todos'];
    cats.addAll(_genres.map((g) => g.name).toList());
    return cats;
  }

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _musicDao = MusicDao(_db);
    _genreDao = GenreDao(_db);
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadGenres();
    await _loadMusicas();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadGenres() async {
    _genres = await _genreDao.getAll();
  }

  Future<void> _loadMusicas() async {
    if (selectedCategory == 'Todos') {
      _musicas = await _musicDao.getAll();
    } else {
      final genre = _genres.firstWhere(
        (g) => g.name == selectedCategory,
        orElse: () => const GenreTableData(id: 0, name: ''),
      );
      if (genre.id > 0) {
        _musicas = await _musicDao.getByGenre(genre.id);
      } else {
        _musicas = await _musicDao.getAll();
      }
    }
    setState(() {});
  }

  String _getGenreName(int? genreId) {
    if (genreId == null) return 'Sem gênero';
    final genre = _genres.firstWhere(
      (g) => g.id == genreId,
      orElse: () => const GenreTableData(id: 0, name: 'Sem gênero'),
    );
    return genre.name;
  }

  Future<void> _onCategorySelected(String category) async {
    setState(() {
      selectedCategory = category;
    });
    await _loadMusicas();
  }

  Future<void> _refreshMusicas() async {
    await _loadMusicas();
  }

  Future<void> _deleteMusic(int id) async {
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
      await _musicDao.delete(id);
      await _loadMusicas();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Música excluída com sucesso!')),
        );
      }
    }
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: colors.primary.withValues(alpha: 0.2),
                  child: Icon(Icons.person, color: colors.primary),
                ),
              ),
              Text(
                'FILIPE',
                style: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Minhas Músicas',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Filter(
              selectedCategory: selectedCategory,
              onCategorySelected: _onCategorySelected,
              categories: _categories,
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(color: colors.primary),
                  )
                : _musicas.isEmpty
                ? Center(
                    child: Text(
                      'Nenhuma música adicionada',
                      style: TextStyle(color: colors.onSurface),
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.63,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                    itemCount: _musicas.length,
                    itemBuilder: (context, index) {
                      final musica = _musicas[index];
                      return CardSection(
                        id: musica.id,
                        cover: musica.coverPath,
                        name: musica.name,
                        artist: musica.artist,
                        genreId: musica.genreId,
                        musicPath: musica.musicPath,
                        genreName: _getGenreName(musica.genreId),
                        onDelete: () => _deleteMusic(musica.id),
                        onRefresh: _refreshMusicas,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }
}
