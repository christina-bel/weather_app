import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class EasyLocalizationHelper {
  static EasyLocalization wrap(Widget child) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/l10n',
        fallbackLocale: const Locale('en'),
        child: child,
      );
}
