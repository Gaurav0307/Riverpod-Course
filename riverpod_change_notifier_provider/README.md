# ChangeNotifierProvider in Riverpod

`ChangeNotifierProvider` allows Riverpod to work with Flutter's built-in **ChangeNotifier**.

It was primarily created for:

* Migrating existing Provider projects
* Reusing old `ChangeNotifier` code
* Integrating packages that expose `ChangeNotifier`

For new Riverpod projects, the Riverpod team generally recommends:

```text
StateProvider          → Simple state

NotifierProvider       → Complex synchronous state

AsyncNotifierProvider  → Async state

ChangeNotifierProvider → Mostly for compatibility/migration
```

---

# What is ChangeNotifier?

Flutter's traditional state management class:

```dart
class CounterNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
```

Whenever:

```dart
notifyListeners();
```

is called, listeners rebuild.

---

# Using ChangeNotifierProvider

## Step 1: Create ChangeNotifier

```dart
class CounterNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
```

---

## Step 2: Create Provider

```dart
final counterProvider =
    ChangeNotifierProvider<CounterNotifier>((ref) {
  return CounterNotifier();
});
```

---

## Step 3: Use in UI

Watch notifier:

```dart
final counter = ref.watch(counterProvider);
```

Display:

```dart
Text('${counter.count}')
```

Update:

```dart
ref.read(counterProvider).increment();
```

---

# Real Example: Theme Manager

```dart
class ThemeNotifier extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
```

Provider:

```dart
final themeProvider =
    ChangeNotifierProvider<ThemeNotifier>(
  (ref) => ThemeNotifier(),
);
```

Usage:

```dart
final theme = ref.watch(themeProvider);

Switch(
  value: theme.isDark,
  onChanged: (_) => theme.toggleTheme(),
);
```

---

# ChangeNotifierProvider.family

Parameterized ChangeNotifier.

```dart
final productProvider =
    ChangeNotifierProvider.family<
      ProductNotifier,
      String
    >((ref, productId) {
  return ProductNotifier(productId);
});
```

Usage:

```dart
ref.watch(productProvider("p101"));
```

---

# ChangeNotifierProvider.autoDispose

Automatically disposes when unused.

```dart
final searchProvider =
    ChangeNotifierProvider.autoDispose<
      SearchNotifier
    >((ref) {
  return SearchNotifier();
});
```

Useful for:

* Search screens
* Forms
* Temporary workflows

---

# ChangeNotifierProvider.autoDispose.family

```dart
final chatProvider =
    ChangeNotifierProvider.autoDispose.family<
      ChatNotifier,
      String
    >((ref, chatId) {
  return ChatNotifier(chatId);
});
```

---

# Why Riverpod Doesn't Prefer ChangeNotifier

Consider:

```dart
class CartNotifier extends ChangeNotifier {
  final List<Item> items = [];

  void add(Item item) {
    items.add(item);
    notifyListeners();
  }
}
```

Problems:

### Mutable State

```dart
items.add(item);
```

State changes in-place.

Riverpod prefers:

```dart
state = [...state, item];
```

Immutable updates are easier to debug and reason about.

---

### Manual Notifications

You must remember:

```dart
notifyListeners();
```

Forget it:

```dart
void add(Item item) {
  items.add(item);
}
```

UI won't update.

---

### Less Predictable

Riverpod's `NotifierProvider` updates state automatically:

```dart
state = state + 1;
```

No extra notification call needed.

---

# ChangeNotifierProvider vs StateNotifierProvider

| Feature                 | ChangeNotifierProvider | StateNotifierProvider |
| ----------------------- | ---------------------- | --------------------- |
| Mutable State           | ✅                      | ❌                     |
| Immutable State         | Possible               | Preferred             |
| notifyListeners()       | Required               | Not Required          |
| Riverpod Recommendation | ❌                      | Older Preferred       |
| Boilerplate             | Medium                 | Medium                |

---

# ChangeNotifierProvider vs NotifierProvider

## ChangeNotifier

```dart
class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
```

---

## NotifierProvider

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
```

Advantages:

✅ Immutable-friendly

✅ No `notifyListeners()`

✅ Less error-prone

✅ Better Riverpod integration

---

# Migration Example

### Existing Provider Package Code

```dart
class AuthProvider extends ChangeNotifier {
  User? user;

  Future<void> login() async {
    user = await api.login();
    notifyListeners();
  }
}
```

Instead of rewriting everything immediately, you can wrap it:

```dart
final authProvider =
    ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider(),
);
```

This is one of the best use cases for `ChangeNotifierProvider`.

---

# When Should You Use It?

### Use It When

✅ Migrating from Provider package

✅ Reusing existing ChangeNotifier code

✅ Third-party package exposes ChangeNotifier

✅ Legacy Flutter project

---

### Avoid It When

❌ Starting a new Riverpod project

❌ Building complex business logic from scratch

❌ Wanting immutable state management

---

# Modern Riverpod Recommendation

For a new Flutter application:

```text
Provider              → Services, Repositories

StateProvider         → Simple UI State

NotifierProvider      → Business Logic

AsyncNotifierProvider → Async CRUD / API

FutureProvider        → Read-only async fetch

StreamProvider        → Realtime data

ChangeNotifierProvider → Legacy compatibility
```

### For Your Flutter Apps

* **Business Listing App**

  * `NotifierProvider` → Filters, Favorites
  * `AsyncNotifierProvider` → Businesses CRUD
  * `StreamProvider` → Chat

* **Chat App**

  * `AsyncNotifierProvider` → Conversations
  * `StreamProvider` → Live messages

* **IoT App**

  * `AsyncNotifierProvider` → Device management
  * `StreamProvider` → MQTT sensor updates

In modern Riverpod (v3), **`ChangeNotifierProvider` is mainly a migration/compatibility tool**, while **`NotifierProvider` and `AsyncNotifierProvider` are the preferred choices for new development.**
