In Riverpod, these are four different provider variants designed for different use cases.

| Provider Type                 | What it does                                                                  | When to use                                                       |
| ----------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `Provider`                    | Creates a value and keeps it alive as long as the `ProviderContainer` exists. | Global services, repositories, API clients, configuration values. |
| `Provider.autoDispose`        | Automatically disposes the value when no widget is listening to it.           | Screen-specific data, temporary objects, one-time calculations.   |
| `Provider.family`             | Creates multiple instances based on a parameter.                              | Fetching data by ID, user-specific data, dynamic filtering.       |
| `Provider.autoDispose.family` | Parameterized provider that is also automatically disposed when unused.       | API calls with IDs, search results, details pages.                |

---

## 1. Provider

Creates a singleton-like value.

```dart
final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});
```

Usage:

```dart
final api = ref.watch(apiProvider);
```

### Lifecycle

- Created on first use.
- Remains in memory.
- Not automatically disposed.

### Good For

✅ Dio Client

✅ Repository

✅ SharedPreferences

✅ Logger

✅ App Config

Example:

```dart
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
```

---

## 2. Provider.autoDispose

Automatically cleans up when nobody is using it.

```dart
final currentTimeProvider = Provider.autoDispose<String>((ref) {
  return DateTime.now().toString();
});
```

When user leaves the screen:

```
Widget removed
↓
No listeners
↓
Provider disposed
```

### Good For

✅ Screen-specific data

✅ Temporary calculations

✅ Detail pages

✅ Search screens

Example:

```dart
final profileProvider = Provider.autoDispose<User>((ref) {
  return getCurrentUser();
});
```

### Avoid For

❌ API Client

❌ Repository

❌ SharedPreferences

because they would be recreated repeatedly.

---

## 3. Provider.family

Allows passing parameters.

Without family:

```dart
final userProvider = Provider<User>((ref) {
  return fetchUser(1);
});
```

Only user 1 can be fetched.

With family:

```dart
final userProvider =
    Provider.family<User, int>((ref, userId) {
  return fetchUser(userId);
});
```

Usage:

```dart
final user = ref.watch(userProvider(5));
```

Riverpod creates separate instances:

```text
userProvider(1)
userProvider(2)
userProvider(3)
```

### Good For

✅ User by ID

✅ Product by ID

✅ Category by ID

✅ Filtering

Example:

```dart
final productProvider =
    Provider.family<Product, String>((ref, id) {
  return getProduct(id);
});
```

---

## 4. Provider.autoDispose.family

Most common for API-driven apps.

```dart
final userProvider =
    FutureProvider.autoDispose.family<User, int>(
  (ref, userId) async {
    return repository.getUser(userId);
  },
);
```

Usage:

```dart
final user = ref.watch(userProvider(5));
```

### Lifecycle

```text
Open User 5 Screen
↓
Create userProvider(5)
↓
Leave Screen
↓
Dispose userProvider(5)
```

Memory is released automatically.

### Good For

✅ User Details Screen

✅ Product Details Screen

✅ Search Results

✅ Dynamic API Requests

✅ Pagination Pages

This is often the recommended choice for detail pages.

---

# Real Flutter Architecture Example

For your Flutter + GetX/Riverpod learning project:

### Keep Alive (`Provider`)

```dart
final dioProvider = Provider<Dio>((ref) => Dio());

final todoRepositoryProvider =
    Provider<TodoRepository>((ref) {
  return TodoRepository(
    ref.watch(dioProvider),
  );
});
```

These should live throughout the app.

---

### Parameterized (`family`)

```dart
final todoProvider =
    FutureProvider.family<Todo, int>(
  (ref, id) async {
    return ref
        .watch(todoRepositoryProvider)
        .getTodo(id);
  },
);
```

Usage:

```dart
ref.watch(todoProvider(10));
```

---

### Parameterized + Auto Dispose (`autoDispose.family`)

```dart
final todoProvider =
    FutureProvider.autoDispose.family<Todo, int>(
  (ref, id) async {
    return ref
        .watch(todoRepositoryProvider)
        .getTodo(id);
  },
);
```

Best choice for:

```text
Todo Details Screen
User Profile Screen
Business Details Screen
Service Details Screen
```

because data is discarded when the screen is closed.

---

## Quick Rule

**Use `Provider` when the object should live for the whole app.**

```dart
Dio
Repository
SharedPreferences
Logger
```

**Use `Provider.autoDispose` when the value is temporary and screen-specific.**

```dart
Search
Filters
Forms
```

**Use `Provider.family` when you need parameters.**

```dart
userProvider(id)
productProvider(id)
todoProvider(id)
```

**Use `Provider.autoDispose.family` when you need parameters and the data should be cleaned up automatically.**

```dart
userProvider(id)
productProvider(id)
businessProvider(id)
serviceProvider(id)
```

For most real-world REST API apps, you'll commonly see:

```dart
Provider          // Services & Repositories
FutureProvider    // API calls
Provider.family   // Parameterized values
FutureProvider.autoDispose.family // Detail screens
```

This combination covers the majority of Riverpod use cases in production Flutter applications.

---
# What is riverpod_generator ?

`riverpod_generator` is a code-generation package for Riverpod that automatically creates providers for you using annotations.

Instead of manually writing providers like this:

```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

you write:

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
int counter(Ref ref) {
  return 0;
}
```

Then run:

```bash
dart run build_runner build
```

or

```bash
dart run build_runner watch
```

and Riverpod generates:

```dart
final counterProvider = AutoDisposeProvider<int>(...);
```

in `counter_provider.g.dart`.

---

## Benefits of riverpod_generator

### 1. Less Boilerplate

Without generator:

```dart
final userRepositoryProvider =
    Provider<UserRepository>((ref) {
  return UserRepository();
});
```

With generator:

```dart
@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository();
}
```

---

### 2. Compile-Time Safety

Provider names, types, and dependencies are generated automatically.

Refactoring becomes safer because the generator updates references correctly.

---

### 3. Supports Parameters Easily

Without generator:

```dart
final userProvider =
    FutureProvider.family<User, int>((ref, id) async {
  return api.getUser(id);
});
```

With generator:

```dart
@riverpod
Future<User> user(Ref ref, int id) async {
  return api.getUser(id);
}
```

Generated:

```dart
userProvider(id);
```

---

### 4. Easier Async State Management

Without generator:

```dart
final todosProvider =
    AsyncNotifierProvider<TodosNotifier, List<Todo>>(
      TodosNotifier.new,
    );
```

With generator:

```dart
@riverpod
class Todos extends _$Todos {
  @override
  Future<List<Todo>> build() async {
    return repository.getTodos();
  }
}
```

Much less code.

---

### 5. Automatic Provider Types

Generator determines the correct provider type based on your return type.

| Return Type     | Generated Provider      |
| --------------- | ----------------------- |
| `String`        | `Provider<String>`      |
| `Future<User>`  | `FutureProvider<User>`  |
| `Stream<User>`  | `StreamProvider<User>`  |
| `Notifier`      | `NotifierProvider`      |
| `AsyncNotifier` | `AsyncNotifierProvider` |

You don't need to remember which provider class to use.

---

### 6. Better IDE Support

Generated providers are strongly typed and easier to navigate, rename, and refactor.

---

## Common Annotations

### Simple Provider

```dart
@riverpod
String appName(Ref ref) {
  return 'Todo App';
}
```

---

### Future Provider

```dart
@riverpod
Future<List<Todo>> todos(Ref ref) async {
  return repository.getTodos();
}
```

---

### Family Provider

```dart
@riverpod
Future<User> user(Ref ref, int id) async {
  return api.getUser(id);
}
```

Usage:

```dart
ref.watch(userProvider(1));
```

---

### Notifier Provider

```dart
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
```

Usage:

```dart
ref.watch(counterProvider);
ref.read(counterProvider.notifier).increment();
```

---

## Packages Needed

```yaml
dependencies:
  flutter_riverpod: ^3.0.3
  riverpod_annotation: ^4.0.7

dev_dependencies:
  build_runner: ^2.16.1
  riverpod_generator: ^4.0.9
```

---

## Should you use it?

For new Riverpod projects, **yes**. The Riverpod team generally recommends the generator approach because it reduces boilerplate, improves type safety, and makes complex providers (especially `AsyncNotifier` and `family`) much cleaner.

Since you're learning Riverpod and coming from GetX, I'd recommend learning the **generator-based approach first**, because most modern Riverpod examples and production projects use `@riverpod` and `riverpod_generator`.
