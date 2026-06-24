import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  final Function(String) onChanged;
  final VoidCallback onClear;
  final String? initialText;

  const SearchSection({
    super.key,
    required this.onChanged,
    required this.onClear,
    this.initialText,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  //controller para o campo de busca
  late TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? '');
    _query = _controller.text;
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final text = _controller.text;
    setState(() {
      _query = text;
    });
    widget.onChanged(text);
  }

  void _clear() {
    _controller.clear();
    setState(() {
      _query = '';
    });
    widget.onClear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    //campo de texto
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Buscar música ou artista...',
        hintStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.6)),
        prefixIcon: Icon(Icons.search, color: colors.primary),
        suffixIcon: _query.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, color: colors.primary),
                onPressed: _clear,
              )
            : null,
        filled: true,
        fillColor: colors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      style: TextStyle(color: colors.onSurface),
    );
  }
}
