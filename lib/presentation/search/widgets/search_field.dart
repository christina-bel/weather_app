import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';

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
            decoration: InputDecoration(
              labelText: LocaleKeys.citySearchLabel.tr(),
              hintText: LocaleKeys.citySearchHint.tr(),
            ),
          ),
        ),
      );
}
