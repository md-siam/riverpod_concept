<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>

# Riverpod Concept

<img align="right" src="screenshots/app_icon/app_icon_for_android_iOS.png" height="190"></img>
A new Flutter project.

## Six Types of Providers

### 1. Provider

**Provider** is the most basic of all providers. It creates a value... And that's about it.

Provider is typically used for:

- caching computations
- exposing a value to other providers (such as a Repository/HttpClient).
- offering a way for tests or widgets to override a value.
- reducing rebuilds of providers/widgets without having to use select.

```dart
final valueProvider = Provider<int>(
  (ref) => 42,
);
```

For accessing the **valueProvider**:

```dart
Consumer(
    builder: (context, ref, child) {
        return Text(
            'The value is ${ref.watch(valueProvider)}',
            style: Theme.of(context).textTheme.headlineMedium,
        );
    },
)
```

### 2. State Provider

**StateProvider** is a provider that exposes a way to modify its state. It is a simplification of **StateNotifierProvider**, designed to avoid having to write a StateNotifier class for very simple use-cases.

StateProvider exists primarily to allow the modification of simple variables by the User Interface.
The state of a StateProvider is typically one of:

- an enum, such as a filter type
- a String, typically the raw content of a text field
- a boolean, for checkboxes
- a number, for pagination or age form fields

You should not use StateProvider if:

- your state needs validation logic
- your state is a complex object (such as a custom class, a list/map, ...)
- the logic for modifying your state is more advanced than a simple count++.

```dart
final valueStateProvider = StateProvider<int>(
  (ref) => 37,
);
```

For accessing the **valueStateProvider**:

```dart
final value = ref.watch(valueStateProvider);


Text(
  'The value is $value',
  style: Theme.of(context).textTheme.headlineMedium,
),

SimpleButton(
  buttonTitle: 'Increment',
  buttonColor: color,
  onTapEvent: () {
    ref.read(valueStateProvider.notifier).state++;
  },
),

SimpleButton(
  buttonTitle: 'Invalidate',
  buttonColor: color,
  onTapEvent: () {
    ref.invalidate(valueStateProvider);
  },
),
```

### 3. Future Provider

**FutureProvider** is the equivalent of Provider but for asynchronous code.

FutureProvider is typically used for:

- performing and caching asynchronous operations (such as network requests)
- nicely handling error/loading states of asynchronous operations
- combining multiple asynchronous values into another value

**FutureProvider** gains a lot when combined with ref.watch. This combination allows automatic re-fetching of some data when some variables change, ensuring that we always have the most up-to-date value.

```dart
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<SuggestionModel> getSuggestion() async {
    try {
      final response = await Dio().get('https://www.boredapi.com/api/activity');

      return SuggestionModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting suggestion: $e');
    }
  }
}
```

For accessing **FutureProvider**

```dart
final suggestionFutureProvider =
    FutureProvider.autoDispose<SuggestionModel>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});


final suggestionRef = ref.watch(suggestionFutureProvider);

suggestionRef.when(
  data: (data) {
    return Text(
      data.activity,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  },
  error: (error, _) {
    return Text(error.toString());
  },
  loading: () {
    return CircularProgressIndicator(color: color);
  },
),
```

### 4. Stream Provider

**StreamProvider** is similar to FutureProvider but for Streams instead of Futures.

StreamProvider is usually used for:

- listening to Firebase or web-sockets
- rebuilding another provider every few seconds

Since Streams naturally expose a way for listening to updates, some may think that using StreamProvider has a low value. In particular, you may believe that Flutter's StreamBuilder would work just as well for listening to a Stream, but this is a mistake.

Using StreamProvider over StreamBuilder has numerous benefits:

- it allows other providers to listen to the stream using ref.watch.
- it ensures that loading and error cases are properly handled, thanks to AsyncValue.
- it removes the need for having to differentiate broadcast streams vs normal streams.
- it caches the latest value emitted by the stream, ensuring that if a listener is added after an event is emitted, the listener will still have immediate access to the most up-to-date event.
- it allows easily mocking the stream during tests by overriding the StreamProvider.

```dart
final streamServiceProvider = Provider<StreamService>((ref) {
  return StreamService();
});

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  }
}
```

For accessing **StreamProvider**

```dart
final streamValueProvider = StreamProvider.autoDispose<int>((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});


final streamValue = ref.watch(streamValueProvider);

streamValue.when(
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
```