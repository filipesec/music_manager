import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Information extends StatelessWidget {
  const Information({super.key});

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
        DottedBorder(
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
                Text(
                  'Selecionar Arquivo de Música',
                  style: TextStyle(color: colors.onSurface, fontSize: 16),
                ),
              ],
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
          child: DropdownButtonFormField<String>(
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

            items: const [
              DropdownMenuItem(value: 'Rock', child: Text('Rock')),
              DropdownMenuItem(value: 'Pop', child: Text('Pop')),
              DropdownMenuItem(value: 'Eletronica', child: Text('Eletrónica')),
              DropdownMenuItem(value: 'MPB', child: Text('MPB')),
              DropdownMenuItem(value: 'Clássica', child: Text('Clássica')),
            ],
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
