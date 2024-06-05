import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  static const buttonKey = Key('searchPage_search_iconButton');
  final VoidCallback _onPressed;

  const SearchButton({required VoidCallback onPressed, super.key})
      : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        key: buttonKey,
        icon: const Icon(Icons.search, semanticLabel: 'Submit'),
        onPressed: _onPressed,
      );
}
