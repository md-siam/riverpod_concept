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

Provider is the most basic of all providers. It creates a value... And that's about it.

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

For accessing the valueProvider:

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