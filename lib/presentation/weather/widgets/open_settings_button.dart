import 'package:flutter/material.dart';

class OpenSettingsButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const OpenSettingsButton({
    required VoidCallback onPressed,
    super.key,
  }) : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: _onPressed,
        icon: const Icon(Icons.settings),
      );
}
