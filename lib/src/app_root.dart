import 'package:flutter/material.dart';

import 'pages/change_notifier_provider_page.dart';
import 'pages/future_provider_page.dart';
import 'pages/provider_page.dart';
import 'pages/state_notifier_provider_page.dart';
import 'pages/state_provider_page.dart';
import 'pages/stream_provider_page.dart';

class AppRoot extends StatelessWidget {
  final String appBarTitle;
  const AppRoot({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                '- Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderPage(
                        appBarTitle: 'Provider',
                        color: Theme.of(context).colorScheme.primary),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text(
                '- State Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateProviderPage(
                        appBarTitle: 'State Provider',
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
              child: const Text(
                '- Future Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureProviderPage(
                        appBarTitle: 'Future Provider',
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text(
                '- Stream Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamProviderPage(
                        appBarTitle: 'Stream Provider',
                        color: Theme.of(context).colorScheme.error),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: const Text(
                '- Change Notifier Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProviderPage(
                        appBarTitle: 'Change Notifier Provider',
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
              child: const Text(
                '- State Notifier Provider -',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateNotifierProviderPage(
                        appBarTitle: 'State Notifier Provider',
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
