import 'package:flutter/material.dart';

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🙈', style: TextStyle(fontSize: 64)),
          Text(
            'Something went wrong!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
}
