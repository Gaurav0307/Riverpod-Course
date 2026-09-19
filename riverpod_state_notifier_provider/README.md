# StateNotifierProvider in Riverpod

`StateNotifierProvider` is the **older Riverpod state-management approach** for managing complex state and business logic.

Today, in **Riverpod 3**, the recommended replacement is:

```text
StateNotifierProvider
        ↓
NotifierProvider

StateNotifier<AsyncValue<T>>
        ↓
AsyncNotifierProvider
```

However, you'll still see `StateNotifierProvider` in many existing projects and interviews.

---

# Why Not StateProvider?

`StateProvider` is good for simple values:

```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

But once business logic grows:

```dart
Increment
Decrement
Reset
Validation
API Calls
Caching
```

`StateProvider` becomes messy.

That's where `StateNotifierProvider` comes in.

---

# Basic Structure

A `StateNotifierProvider` consists of:

1. State class
2. StateNotifier class
3. Provider

```text
UI
 ↓
Provider
 ↓
StateNotifier
 ↓
State
```

---

# Example: Counter

## Step 1: Create Notifier

```dart
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}
```

---

## Step 2: Create Provider

```dart
final counterProvider =
    StateNotifierProvider<
      CounterNotifier,
      int
    >((ref) {
  return CounterNotifier();
});
```

---

## Step 3: Use in UI

Read state:

```dart
final count = ref.watch(counterProvider);
```

Call methods:

```dart
ref.read(counterProvider.notifier)
   .increment();
```

---

# Real-World Example

Instead of:

```dart
final cartProvider =
    StateProvider<List<CartItem>>([]);
```

Use:

```dart
class CartNotifier
    extends StateNotifier<List<CartItem>> {

  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(String id) {
    state = state
        .where((e) => e.id != id)
        .toList();
  }

  void clear() {
    state = [];
  }
}
```

Provider:

```dart
final cartProvider =
    StateNotifierProvider<
      CartNotifier,
      List<CartItem>
    >((ref) {
  return CartNotifier();
});
```

---

# Immutable State Example

This is the preferred approach.

State:

```dart
class TodoState {
  final List<Todo> todos;
  final bool isLoading;

  const TodoState({
    required this.todos,
    required this.isLoading,
  });

  TodoState copyWith({
    List<Todo>? todos,
    bool? isLoading,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
```

Notifier:

```dart
class TodoNotifier
    extends StateNotifier<TodoState> {

  TodoNotifier()
      : super(
          const TodoState(
            todos: [],
            isLoading: false,
          ),
        );

  void addTodo(Todo todo) {
    state = state.copyWith(
      todos: [...state.todos, todo],
    );
  }
}
```

---

# Using Freezed

This is how many production apps were built before `NotifierProvider`.

```dart
@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default([]) List<Todo> todos,
    @Default(false) bool isLoading,
  }) = _TodoState;
}
```

Notifier:

```dart
class TodoNotifier
    extends StateNotifier<TodoState> {

  TodoNotifier()
      : super(const TodoState());

  void addTodo(Todo todo) {
    state = state.copyWith(
      todos: [...state.todos, todo],
    );
  }
}
```

---

# StateNotifierProvider.family

Parameterized notifier.

```dart
final productProvider =
    StateNotifierProvider.family<
      ProductNotifier,
      ProductState,
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

# StateNotifierProvider.autoDispose

Automatically disposes when unused.

```dart
final searchProvider =
    StateNotifierProvider.autoDispose<
      SearchNotifier,
      SearchState
    >((ref) {
  return SearchNotifier();
});
```

Good for:

* Search screens
* Forms
* Temporary workflows

---

# StateNotifierProvider.autoDispose.family

```dart
final chatProvider =
    StateNotifierProvider.autoDispose.family<
      ChatNotifier,
      ChatState,
      String
    >((ref, chatId) {
  return ChatNotifier(chatId);
});
```

Very common in older Riverpod apps.

---

# StateNotifierProvider vs NotifierProvider

## Old Style

```dart
class CounterNotifier
    extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
}
```

```dart
final counterProvider =
    StateNotifierProvider<
      CounterNotifier,
      int
    >((ref) {
  return CounterNotifier();
});
```

---

## New Style (Riverpod 3)

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
```

```dart
final counterProvider =
    NotifierProvider<
      CounterNotifier,
      int
    >(CounterNotifier.new);
```

Cleaner and less boilerplate.

---

# StateNotifierProvider vs NotifierProvider

| Feature                | StateNotifierProvider | NotifierProvider |
| ---------------------- | --------------------- | ---------------- |
| Riverpod 3 Recommended | ❌                     | ✅                |
| Boilerplate            | More                  | Less             |
| Access ref             | Indirect              | Direct           |
| New Projects           | ❌                     | ✅                |
| Legacy Projects        | ✅                     | ✅                |

---

# StateNotifierProvider vs StateProvider

| Feature         | StateProvider | StateNotifierProvider |
| --------------- | ------------- | --------------------- |
| Counter         | ✅             | ✅                     |
| Theme Toggle    | ✅             | ✅                     |
| Complex State   | ❌             | ✅                     |
| Business Logic  | ❌             | ✅                     |
| CRUD Operations | ❌             | ✅                     |
| Shopping Cart   | ❌             | ✅                     |

---

# What Should You Use Today?

For a new Flutter + Riverpod 3 project:

```text
Simple UI State
    ↓
StateProvider

Complex Business Logic
    ↓
NotifierProvider

Async CRUD Operations
    ↓
AsyncNotifierProvider

Realtime Data
    ↓
StreamProvider

One-time API Fetch
    ↓
FutureProvider
```

### For Your Business Listing / Chat / Food Delivery Apps

A modern Riverpod setup would typically be:

```text
Provider              → Dio, Repositories

StateProvider         → Selected Tab, Filters

NotifierProvider      → Cart, Auth, Theme, UI Logic

AsyncNotifierProvider → Login, CRUD, API Calls

FutureProvider        → Fetch Details Screen Data

StreamProvider        → Socket.io Chat, Firestore, MQTT
```

So, **learn `StateNotifierProvider` because many existing codebases still use it**, but for new Riverpod 3 projects, prefer **`NotifierProvider` and `AsyncNotifierProvider`**.
