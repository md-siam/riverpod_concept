import 'package:flutter/material.dart';

import 'pages/change_notifier_provider_page.dart';
import 'pages/future_provider_page.dart';
import 'pages/provider_page.dart';
import 'pages/state_notifier_provider_page.dart';
import 'pages/state_provider_page.dart';
import 'pages/stream_provider_page.dart';
import 'widget/simple_button.dart';

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
            SimpleButton(
              buttonTitle: 'Provider',
              buttonColor: Theme.of(context).colorScheme.primary,
              pageWidget: ProviderPage(
                appBarTitle: 'Provider',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'State Provider',
              buttonColor: Theme.of(context).colorScheme.secondary,
              pageWidget: StateProviderPage(
                appBarTitle: 'State Provider',
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Future Provider',
              buttonColor: Theme.of(context).colorScheme.tertiary,
              pageWidget: FutureProviderPage(
                appBarTitle: 'Future Provider',
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Stream Provider',
              buttonColor: Theme.of(context).colorScheme.error,
              pageWidget: StreamProviderPage(
                appBarTitle: 'Stream Provider',
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Change Notifier Provider',
              buttonColor: Theme.of(context).colorScheme.onPrimaryContainer,
              pageWidget: ChangeNotifierProviderPage(
                appBarTitle: 'Change Notifier Provider',
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'State Notifier Provider',
              buttonColor: Theme.of(context).colorScheme.onErrorContainer,
              pageWidget: StateNotifierProviderPage(
                appBarTitle: 'State Notifier Provider',
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
