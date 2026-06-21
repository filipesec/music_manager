import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_bloc.dart';
import 'package:music_manager/core/theme/bloc/theme_event.dart';
import 'package:music_manager/core/data/database.dart';
import 'package:music_manager/core/data/dao/genre_dao.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  late AppDatabase _db;
  late GenreDao _genreDao;
  List<GenreTableData> generos = [];
  final TextEditingController _controller = TextEditingController();
  int? _editingId;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _genreDao = GenreDao(_db);
    _loadGeneros();
  }

  Future<void> _loadGeneros() async {
    final data = await _genreDao.getAll();
    setState(() {
      generos = data;
    });
  }

  Future<void> _addGenero(String name) async {
    await _genreDao.insert(name);
    await _loadGeneros();
  }

  Future<void> _updateGenero(int id, String name) async {
    await _genreDao.update(id, name);
    await _loadGeneros();
  }

  Future<void> _deleteGenero(int id) async {
    await _genreDao.delete(id);
    await _loadGeneros();
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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Gerênciar Gêneros',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: 325,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Digite o nome do gênero',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: colors.surfaceContainerHighest,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                style: TextStyle(color: colors.surface),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 325,
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    if (_editingId != null) {
                      _updateGenero(_editingId!, _controller.text);
                      _editingId = null;
                    } else {
                      _addGenero(_controller.text);
                    }
                    _controller.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _editingId != null ? 'SALVAR' : 'ADICIONAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: generos.length,
              itemBuilder: (context, index) {
                final genero = generos[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: 1,
                    color: colors.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.label, color: colors.onSurface),
                      title: Text(
                        genero.name,
                        style: TextStyle(color: colors.onSurface, fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: colors.onSurface),
                            onPressed: () {
                              setState(() {
                                _editingId = genero.id;
                                _controller.text = genero.name;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteGenero(genero.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
