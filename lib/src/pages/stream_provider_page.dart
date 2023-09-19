import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose<int>((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  final String appBarTitle;
  final Color color;
  const StreamProviderPage({
    Key? key,
    required this.appBarTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);
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
        child: streamValue.when(
          data: (int data) {
            return Text(
              data.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
          error: (error, _) {
            return Text(error.toString());
          },
          loading: () {
            return CircularProgressIndicator(
              color: color,
            );
          },
        ),
      ),
    );
  }
}
