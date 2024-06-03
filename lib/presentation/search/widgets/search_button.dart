import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const SearchButton({required VoidCallback onPressed, super.key})
      : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        key: const Key('searchPage_search_iconButton'),
        icon: const Icon(Icons.search, semanticLabel: 'Submit'),
        onPressed: _onPressed,
      );
}
