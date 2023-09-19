import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/suggestion_model.dart';
import '../services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<SuggestionModel>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  final String appBarTitle;
  final Color color;
  const FutureProviderPage({
    Key? key,
    required this.appBarTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
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
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              const SizedBox(height: 100),
              suggestionRef.when(
                data: (data) {
                  return Column(
                    children: [
                      Card(
                        elevation: 8.0,
                        child: ListTile(
                          title: Text(
                            data.activity,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            'Type: ${data.type}',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Pull down to refresh.',
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
                      ),
                    ],
                  );
                },
                error: (error, _) {
                  return Text(error.toString());
                },
                loading: () {
                  return LinearProgressIndicator(color: color);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
