import 'package:flutter/material.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('⛅', style: TextStyle(fontSize: 64)),
          Text(
            'Loading Weather',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ],
      );
}
