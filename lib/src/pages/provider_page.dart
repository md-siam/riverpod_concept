import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider is [read only]

final valueProvider = Provider<int>(
  (ref) => 37,
);

class ProviderPage extends StatelessWidget {
  final String appBarTitle;
  final Color color;
  const ProviderPage({
    Key? key,
    required this.appBarTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Text(
              'The value is ${ref.watch(valueProvider)}',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
    );
  }
}
