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
