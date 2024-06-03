import 'package:flutter/material.dart';
import 'package:weather_app/presentation/search/widgets/search_button.dart';
import 'package:weather_app/presentation/search/widgets/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage._());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('City Search')),
        body: Row(
          children: [
            SearchField(controller: _textController),
            SearchButton(
              onPressed: () => Navigator.of(context).pop(_textController.text),
            ),
          ],
        ),
      );
}
