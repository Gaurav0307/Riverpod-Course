# Riverpod NotifierProvider

`NotifierProvider` is the **modern replacement for `StateNotifierProvider`** in Riverpod 3.

Use it when:

* State is synchronous (no async loading)
* You have business logic
* State changes over time
* State is more complex than a simple variable

Think of it as:

```text
StateProvider
    ↓
Simple mutable state

NotifierProvider
    ↓
State + Business Logic
```

---

# Why Not StateProvider?

Simple state:

```dart
final counterProvider =
    StateProvider<int>((ref) => 0);
```

Increment:

```dart
ref.read(counterProvider.notifier).state++;
```

Works fine.

But imagine:

```text
Add Item
Remove Item
Update Item
Calculate Total
Apply Coupon
Clear Cart
```

Putting all of that inside widgets becomes messy.

Use `NotifierProvider`.

---

# Basic Structure

A `NotifierProvider` has:

```text
Provider
   ↓
Notifier
   ↓
State
```

---

## Counter Example

### Step 1: Create Notifier

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

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

### Step 2: Create Provider

```dart
final counterProvider =
    NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
```

---

### Step 3: Use in UI

Watch state:

```dart
final count = ref.watch(counterProvider);
```

Call methods:

```dart
ref.read(counterProvider.notifier).increment();
```

---

# What is build()?

Every `Notifier` must implement:

```dart
@override
State build()
```

Example:

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }
}
```

This is the initial state.

Equivalent old Riverpod code:

```dart
CounterNotifier() : super(0);
```

---

# Accessing Other Providers

One major advantage over `StateNotifierProvider`:

```dart
class AuthNotifier extends Notifier<User?> {
  @override
  User? build() {
    final repository = ref.read(authRepositoryProvider);

    return repository.currentUser;
  }
}
```

Notice:

```dart
ref
```

is available directly inside the notifier.

No constructor injection required.

---

# Real-World Cart Example

State:

```dart
class CartItem {
  final String id;
  final double price;

  CartItem({
    required this.id,
    required this.price,
  });
}
```

Notifier:

```dart
class CartNotifier extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() {
    return [];
  }

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

  double get total {
    return state.fold(
      0,
      (sum, item) => sum + item.price,
    );
  }
}
```

Provider:

```dart
final cartProvider =
    NotifierProvider<CartNotifier,
        List<CartItem>>(
  CartNotifier.new,
);
```

---

# Using Freezed State

Very common in production.

```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoggedIn,
  }) = _AuthState;
}
```

Notifier:

```dart
class AuthNotifier
    extends Notifier<AuthState> {

  @override
  AuthState build() {
    return const AuthState();
  }

  void login(User user) {
    state = state.copyWith(
      user: user,
      isLoggedIn: true,
    );
  }

  void logout() {
    state = const AuthState();
  }
}
```

---

# NotifierProvider.family

Parameterized state.

```dart
final quantityProvider =
    NotifierProvider.family<
        QuantityNotifier,
        int,
        String>(
  QuantityNotifier.new,
);
```

Notifier:

```dart
class QuantityNotifier
    extends FamilyNotifier<int, String> {

  @override
  int build(String productId) {
    return 1;
  }

  void increment() {
    state++;
  }
}
```

Usage:

```dart
ref.watch(quantityProvider("p101"));
```

---

# Auto Dispose

```dart
final searchProvider =
    NotifierProvider.autoDispose<
        SearchNotifier,
        SearchState>(
  SearchNotifier.new,
);
```

When screen is removed:

```text
No listeners
↓
Dispose notifier
↓
Free memory
```

---

# AutoDispose Family

```dart
final chatProvider =
    NotifierProvider.autoDispose.family<
        ChatNotifier,
        ChatState,
        String>(
  ChatNotifier.new,
);
```

Good for:

* Chat Rooms
* Product Details
* Business Details
* Temporary Workflows

---

# NotifierProvider vs StateNotifierProvider

### Old Style

```dart
class CounterNotifier
    extends StateNotifier<int> {

  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}
```

```dart
final counterProvider =
    StateNotifierProvider<
      CounterNotifier,
      int>(
  (ref) => CounterNotifier(),
);
```

---

### New Style

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
      int>(
  CounterNotifier.new,
);
```

Less boilerplate.

---

# NotifierProvider vs StateProvider

| Feature        | StateProvider | NotifierProvider |
| -------------- | ------------- | ---------------- |
| Simple Counter | ✅             | ✅                |
| Theme Toggle   | ✅             | ✅                |
| Cart Logic     | ❌             | ✅                |
| Validation     | ❌             | ✅                |
| Business Logic | ❌             | ✅                |
| CRUD Logic     | ❌             | ✅                |

---

# NotifierProvider vs AsyncNotifierProvider

### NotifierProvider

Synchronous state:

```dart
Counter
Theme
Cart
Selected Filters
UI Logic
```

---

### AsyncNotifierProvider

Asynchronous state:

```dart
Login
Register
Fetch Data
CRUD Operations
Upload Image
```

Example:

```dart
class UserNotifier
    extends AsyncNotifier<User> {

  @override
  Future<User> build() async {
    return repository.getUser();
  }
}
```

---

# Riverpod Generator Version

With `riverpod_generator`:

```dart
@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
```

Generated provider:

```dart
counterProvider
```

No manual provider declaration needed.

---

# Recommended Usage in Your Flutter Apps

For apps like your Business Listing, Chat, Food Delivery, or IoT projects:

```text
Provider
    ↓
Dio, Repositories, Services

StateProvider
    ↓
Selected Tab, Search Text

NotifierProvider
    ↓
Cart
Theme
Filters
Auth State
Business Logic

AsyncNotifierProvider
    ↓
Login
Register
CRUD APIs
Pagination

FutureProvider
    ↓
Read-only Fetch

StreamProvider
    ↓
Socket.io
MQTT
Firestore
Realtime Updates
```

## Rule of Thumb

```text
Simple variable?
    → StateProvider

State + business logic?
    → NotifierProvider

State + async operations?
    → AsyncNotifierProvider

Realtime updates?
    → StreamProvider

Read-only async fetch?
    → FutureProvider
```

For **new Riverpod 3 projects**, `NotifierProvider` should be your default choice whenever state has behavior (methods, validation, calculations, business rules) rather than being just a simple value.
