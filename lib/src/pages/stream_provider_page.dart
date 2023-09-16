import 'package:flutter/material.dart';

class StreamProviderPage extends StatelessWidget {
  final String appBarTitle;
  final Color color;
  const StreamProviderPage({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appBarTitle),
          ],
        ),
      ),
    );
  }
}
