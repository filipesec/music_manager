import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  final List<String> generos = ['Rock', 'Pop', 'MPB', 'Samba', 'Eletrônica'];
  final TextEditingController _controller = TextEditingController();
  int? _editingIndex;

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
                style: TextStyle(color: ColorsKeys.textPrimary),
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
                    setState(() {
                      if (_editingIndex != null) {
                        generos[_editingIndex!] = _controller.text;
                        _editingIndex = null;
                      } else {
                        generos.add(_controller.text);
                      }
                      _controller.clear();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _editingIndex != null ? 'SALVAR' : 'ADICIONAR',
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
                        genero,
                        style: TextStyle(color: colors.onSurface, fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: colors.onSurface),
                            onPressed: () {
                              setState(() {
                                _editingIndex = index;
                                _controller.text = genero;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                generos.removeAt(index);
                              });
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
