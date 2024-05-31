import 'package:flutter/material.dart';

class EmptyWeather extends StatelessWidget {
  const EmptyWeather({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🏙️', style: TextStyle(fontSize: 64)),
          Text(
            'Please Select a City!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
}
