import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_concept/src/widget/simple_button.dart';

final valueStateProvider = StateProvider<int>(
  (ref) => 50,
);

class StateProviderPage extends ConsumerWidget {
  final String appBarTitle;
  final Color color;
  const StateProviderPage({
    Key? key,
    required this.appBarTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (prev, curr) {
      // print('StateProviderPage: $prev -> $curr');
      //
      if (curr == 65) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Value is 65')),
        );
      }
    });
    //
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
            Text(
              'The value is $value',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            SimpleButton(
              buttonTitle: 'Increment',
              buttonColor: color,
              onTapEvent: () {
                ref.read(valueStateProvider.notifier).state++;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SimpleButton(
              buttonTitle: 'Invalidate',
              buttonColor: color,
              onTapEvent: () {
                ref.invalidate(valueStateProvider);
              },
            ),
          ],
        ),
      ),
    );
  }
}
