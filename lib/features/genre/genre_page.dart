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
    return Scaffold(
      backgroundColor: ColorsKeys.bgDefault,
      appBar: AppBar(
        backgroundColor: ColorsKeys.bgDefault,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorsKeys.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Gerenciar Gêneros',
          style: TextStyle(
            color: ColorsKeys.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
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
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorsKeys.textPrimary.withValues(alpha: 0.8),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorsKeys.textPrimary.withValues(alpha: 0.8),
                      width: 1,
                    ),
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
                  backgroundColor: ColorsKeys.textPrimary,
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
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.label, color: ColorsKeys.textPrimary),
                      title: Text(
                        genero,
                        style: TextStyle(
                          color: ColorsKeys.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: ColorsKeys.textPrimary,
                            ),
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
