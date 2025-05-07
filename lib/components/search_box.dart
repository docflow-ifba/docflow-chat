// components/search_box.dart
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBox({super.key, required this.onSearch});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Pesquisar editais...',
        filled: true,
        fillColor: Colors.grey[900],
        prefixIcon: const Icon(Feather.search, size: 18, color: Colors.grey),
        suffixIcon:
            _controller.text.isNotEmpty
                ? IconButton(
                  icon: const Icon(Feather.x, size: 18, color: Colors.grey),
                  onPressed: () {
                    _controller.clear();
                    widget.onSearch('');
                  },
                )
                : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
      onChanged: widget.onSearch,
      onSubmitted: widget.onSearch,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
