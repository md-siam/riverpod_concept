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
              onTapEvent: () => _pushPage(
                context,
                ProviderPage(
                  appBarTitle: 'Provider',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'State Provider',
              buttonColor: Theme.of(context).colorScheme.secondary,
              onTapEvent: () => _pushPage(
                context,
                StateProviderPage(
                  appBarTitle: 'State Provider',
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Future Provider',
              buttonColor: Theme.of(context).colorScheme.tertiary,
              onTapEvent: () => _pushPage(
                context,
                FutureProviderPage(
                  appBarTitle: 'Future Provider',
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Stream Provider',
              buttonColor: Theme.of(context).colorScheme.error,
              onTapEvent: () => _pushPage(
                context,
                StreamProviderPage(
                  appBarTitle: 'Stream Provider',
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'Change Notifier Provider',
              buttonColor: Theme.of(context).colorScheme.onPrimaryContainer,
              onTapEvent: () => _pushPage(
                context,
                ChangeNotifierProviderPage(
                  appBarTitle: 'Change Notifier Provider',
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SimpleButton(
              buttonTitle: 'State Notifier Provider',
              buttonColor: Theme.of(context).colorScheme.onErrorContainer,
              onTapEvent: () => _pushPage(
                context,
                StateNotifierProviderPage(
                  appBarTitle: 'State Notifier Provider',
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _pushPage(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
