import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  const MyCard({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Pull down to refresh',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_downward_sharp,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
