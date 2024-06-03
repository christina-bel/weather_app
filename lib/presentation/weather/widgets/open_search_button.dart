import 'package:flutter/material.dart';

class OpenSearchButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const OpenSearchButton({required VoidCallback onPressed, super.key})
      : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: _onPressed,
        child: const Icon(Icons.search, semanticLabel: 'Search'),
      );
}
