import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController _controller;

  const SearchField({required TextEditingController controller, super.key})
      : _controller = controller;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'City',
              hintText: 'Chicago',
            ),
          ),
        ),
      );
}
