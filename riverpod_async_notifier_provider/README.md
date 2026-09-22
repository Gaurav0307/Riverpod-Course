# Riverpod AsyncNotifierProvider

`AsyncNotifierProvider` is one of the most important providers in modern Riverpod.

It is the **recommended solution for async business logic** such as:

* Login
* Register
* CRUD APIs
* Pagination
* File Upload
* Fetch User Profile
* Business Listing APIs
* Food Delivery APIs

Think of it as:

```text
FutureProvider
    ↓
Read-only async data

AsyncNotifierProvider
    ↓
Async data + business logic
```

---

# Why Not FutureProvider?

`FutureProvider` is great for fetching data:

```dart
final userProvider = FutureProvider<User>((ref) async {
  return repository.getUser();
});
```

But:

❌ Cannot easily update state

❌ Cannot add methods

❌ Cannot perform CRUD operations

❌ Not ideal for business logic

---

Example:

```text
Fetch Todos
Add Todo
Delete Todo
Update Todo
Refresh Todo
```

Use `AsyncNotifierProvider`.

---

# Basic Structure

```text
Provider
   ↓
AsyncNotifier
   ↓
AsyncValue<T>
```

---

# Simple Example

## Notifier

```dart
class UserNotifier extends AsyncNotifier<User> {
  @override
  Future<User> build() async {
    return repository.getUser();
  }
}
```

## Provider

```dart
final userProvider =
    AsyncNotifierProvider<
      UserNotifier,
      User
    >(UserNotifier.new);
```

Usage:

```dart
final user = ref.watch(userProvider);
```

---

# What Does build() Do?

`build()` is the initial async state.

```dart
@override
Future<User> build() async {
  return repository.getUser();
}
```

Lifecycle:

```text
Loading
↓
Success
↓
Data
```

or

```text
Loading
↓
Failure
↓
Error
```

---

# AsyncValue States

Every AsyncNotifier exposes:

```dart
AsyncValue<T>
```

Possible states:

```text
AsyncLoading

AsyncData

AsyncError
```

---

# UI with when()

```dart
ref.watch(userProvider).when(
  data: (user) => Text(user.name),
  loading: () => CircularProgressIndicator(),
  error: (e, s) => Text(e.toString()),
);
```

---

# UI with Dart 3 switch

```dart
switch (ref.watch(userProvider)) {
  case AsyncData(:final value):
    return Text(value.name);

  case AsyncError(:final error):
    return Text(error.toString());

  case AsyncLoading():
    return CircularProgressIndicator();
}
```

This is increasingly common in Riverpod 3.

---

# CRUD Example

Let's build a Todo feature.

---

## Model

```dart
class Todo {
  final int id;
  final String title;

  Todo({
    required this.id,
    required this.title,
  });
}
```

---

## Notifier

```dart
class TodoNotifier
    extends AsyncNotifier<List<Todo>> {

  @override
  Future<List<Todo>> build() async {
    return repository.getTodos();
  }

  Future<void> refreshTodos() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => repository.getTodos(),
    );
  }
}
```

Provider:

```dart
final todoProvider =
    AsyncNotifierProvider<
      TodoNotifier,
      List<Todo>
    >(TodoNotifier.new);
```

---

# Adding Todo

```dart
Future<void> addTodo(Todo todo) async {
  final currentTodos = state.value ?? [];

  state = await AsyncValue.guard(() async {
    await repository.addTodo(todo);

    return [
      ...currentTodos,
      todo,
    ];
  });
}
```

---

# Deleting Todo

```dart
Future<void> deleteTodo(int id) async {
  final currentTodos = state.value ?? [];

  state = await AsyncValue.guard(() async {
    await repository.deleteTodo(id);

    return currentTodos
        .where((e) => e.id != id)
        .toList();
  });
}
```

---

# Updating Todo

```dart
Future<void> updateTodo(Todo updatedTodo) async {
  final currentTodos = state.value ?? [];

  state = await AsyncValue.guard(() async {
    await repository.updateTodo(updatedTodo);

    return currentTodos.map((todo) {
      return todo.id == updatedTodo.id
          ? updatedTodo
          : todo;
    }).toList();
  });
}
```

---

# AsyncValue.guard()

One of the most useful Riverpod helpers.

Instead of:

```dart
try {
  state = const AsyncLoading();

  final result =
      await repository.getTodos();

  state = AsyncData(result);
} catch (e, st) {
  state = AsyncError(e, st);
}
```

Use:

```dart
state = await AsyncValue.guard(
  () => repository.getTodos(),
);
```

Much cleaner.

---

# Accessing Other Providers

A huge advantage.

```dart
class UserNotifier
    extends AsyncNotifier<User> {

  @override
  Future<User> build() async {
    final repository =
        ref.read(userRepositoryProvider);

    return repository.getUser();
  }
}
```

No constructor injection needed.

---

# Auto Dispose

```dart
final userProvider =
    AsyncNotifierProvider.autoDispose<
      UserNotifier,
      User
    >(UserNotifier.new);
```

Lifecycle:

```text
Screen Removed
↓
Provider Disposed
↓
Memory Freed
```

Good for:

* Detail Screens
* Search Screens
* Temporary Workflows

---

# Family

```dart
final productProvider =
    AsyncNotifierProvider.family<
      ProductNotifier,
      Product,
      String
    >(ProductNotifier.new);
```

Notifier:

```dart
class ProductNotifier
    extends FamilyAsyncNotifier<
      Product,
      String> {

  @override
  Future<Product> build(
    String productId,
  ) async {
    return repository.getProduct(productId);
  }
}
```

Usage:

```dart
ref.watch(productProvider("p101"));
```

---

# AutoDispose + Family

Very common.

```dart
final businessProvider =
    AsyncNotifierProvider.autoDispose.family<
      BusinessNotifier,
      Business,
      String
    >(BusinessNotifier.new);
```

Perfect for:

```text
Business Details

Product Details

Service Details

User Profile
```

---

# AsyncNotifierProvider vs FutureProvider

## FutureProvider

```dart
final userProvider =
    FutureProvider<User>((ref) async {
  return repository.getUser();
});
```

Read-only fetch.

---

## AsyncNotifierProvider

```dart
class UserNotifier
    extends AsyncNotifier<User> {

  @override
  Future<User> build() async {
    return repository.getUser();
  }

  Future<void> refreshUser() async {}

  Future<void> updateUser() async {}
}
```

Supports business logic.

---

| Feature              | FutureProvider | AsyncNotifierProvider |
| -------------------- | -------------- | --------------------- |
| Fetch Data           | ✅              | ✅                     |
| CRUD                 | ❌              | ✅                     |
| Refresh              | Limited        | ✅                     |
| Business Logic       | ❌              | ✅                     |
| Methods              | ❌              | ✅                     |
| Recommended for APIs | ❌              | ✅                     |

---

# AsyncNotifierProvider vs NotifierProvider

### NotifierProvider

Synchronous:

```dart
Counter
Theme
Cart
Selected Filters
```

```dart
class CounterNotifier
    extends Notifier<int> {}
```

---

### AsyncNotifierProvider

Asynchronous:

```dart
Login
Register
Todos API
Business API
Upload Image
```

```dart
class UserNotifier
    extends AsyncNotifier<User> {}
```

---

# Riverpod Generator Version

Most modern Riverpod projects use this.

```dart
@riverpod
class Todos extends _$Todos {
  @override
  Future<List<Todo>> build() async {
    return repository.getTodos();
  }

  Future<void> addTodo(
    Todo todo,
  ) async {
    final current = state.value ?? [];

    state = await AsyncValue.guard(() async {
      await repository.addTodo(todo);

      return [...current, todo];
    });
  }
}
```

Generated provider:

```dart
todosProvider
```

No manual provider declaration required.

---

# Recommended Architecture for Your Apps

For your **Flutter + Node.js** projects:

```text
Provider
↓
Dio
Repositories
Services

StateProvider
↓
Search Text
Selected Tab

NotifierProvider
↓
Theme
Cart
Filters

AsyncNotifierProvider
↓
Login
Register
CRUD
Pagination
Business Listing APIs
Food Delivery APIs

FutureProvider
↓
Read-only fetch

StreamProvider
↓
Socket.io Chat
MQTT
Firestore
```

---

# Interview Summary

| Provider                | Purpose               |
| ----------------------- | --------------------- |
| `Provider`              | Dependency Injection  |
| `StateProvider`         | Simple mutable state  |
| `NotifierProvider`      | Complex sync state    |
| `AsyncNotifierProvider` | Complex async state   |
| `FutureProvider`        | Read-only async fetch |
| `StreamProvider`        | Realtime updates      |

### Rule of Thumb

```text
Simple value?
→ StateProvider

State + business logic?
→ NotifierProvider

State + API calls / CRUD?
→ AsyncNotifierProvider

One-time async fetch?
→ FutureProvider

Realtime updates?
→ StreamProvider
```

For most production Flutter apps today, **`AsyncNotifierProvider` is the primary provider you'll use for API-driven features**, while `NotifierProvider` handles local business logic and UI state.
