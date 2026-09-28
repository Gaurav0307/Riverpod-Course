# Riverpod Provider Lifecycle

Understanding the provider lifecycle is important because it affects:

* Memory usage
* API calls
* Caching
* Rebuilds
* Auto-disposal
* Performance

Every provider goes through some or all of these stages:

```text
Uninitialized
      ↓
Created
      ↓
Active
      ↓
Paused (optional)
      ↓
Disposed
```

---

# 1. Uninitialized

When the app starts, providers are **not created immediately**.

```dart
final counterProvider = Provider<int>((ref) {
  print('Created');
  return 0;
});
```

At app startup:

```text
counterProvider
↓
Exists only as a definition
↓
Not created yet
```

No memory is used.

---

# 2. Created

A provider is created the first time it is accessed.

```dart
ref.watch(counterProvider);
```

Lifecycle:

```text
First watch/read
↓
Provider created
↓
build() executed
↓
State stored
```

Example:

```dart
final nameProvider = Provider<String>((ref) {
  print('Provider Created');
  return 'Gaurav';
});
```

Output:

```text
Provider Created
```

Only on first access.

---

# 3. Active

After creation, the provider becomes active.

```text
Provider Created
↓
Listening Widgets Exist
↓
Active
```

Example:

```dart
final user = ref.watch(userProvider);
```

While widgets are watching:

```text
Widget A
Widget B
Widget C
     ↓
Provider Active
```

The provider stays alive.

---

# 4. Dependency Changes

A provider may rebuild when one of its dependencies changes.

Example:

```dart
final filterProvider =
    StateProvider<String>((ref) => '');

final productsProvider =
    Provider<List<Product>>((ref) {
  final filter = ref.watch(filterProvider);

  return filterProducts(filter);
});
```

Lifecycle:

```text
filterProvider changes
↓
productsProvider rebuilds
↓
New value generated
```

---

# 5. Paused State

For normal providers (not autoDispose):

```text
No listeners
↓
Provider becomes paused
```

Example:

```dart
final userProvider =
    FutureProvider<User>((ref) async {
  return repository.getUser();
});
```

Screen removed:

```text
No listeners
↓
Paused
```

State is still cached.

---

# 6. Disposed State

Provider resources are released.

Triggers:

### autoDispose

```dart
final userProvider =
    FutureProvider.autoDispose<User>((ref) async {
  return repository.getUser();
});
```

Lifecycle:

```text
No listeners
↓
Dispose
↓
Memory released
```

---

### invalidate()

```dart
ref.invalidate(userProvider);
```

Lifecycle:

```text
Current state destroyed
↓
Provider disposed
```

---

### ProviderContainer Destroyed

```text
Application Closed
↓
Container Destroyed
↓
Providers Disposed
```

---

# AutoDispose Lifecycle

Without autoDispose:

```text
Create
↓
Active
↓
Paused
↓
Active Again
```

State remains cached.

---

With autoDispose:

```text
Create
↓
Active
↓
No listeners
↓
Dispose
```

No caching.

---

# Example: Provider Lifecycle

```dart
final counterProvider =
    Provider.autoDispose<int>((ref) {
  print('Created');

  ref.onDispose(() {
    print('Disposed');
  });

  return 0;
});
```

Open screen:

```text
Created
```

Leave screen:

```text
Disposed
```

---

# Lifecycle Hooks

Riverpod provides lifecycle callbacks.

---

## ref.onDispose()

Called when provider is destroyed.

```dart
ref.onDispose(() {
  print('Provider Disposed');
});
```

Useful for:

* Closing streams
* Closing sockets
* Disposing controllers

Example:

```dart
ref.onDispose(() {
  socket.disconnect();
});
```

---

## ref.onCancel()

Called when the last listener is removed.

```dart
ref.onCancel(() {
  print('No listeners');
});
```

Example:

```text
User leaves page
↓
No listeners
↓
onCancel
```

---

## ref.onResume()

Called when a listener returns.

```dart
ref.onResume(() {
  print('Listener returned');
});
```

Lifecycle:

```text
Active
↓
onCancel
↓
Paused
↓
onResume
↓
Active
```

---

# keepAlive()

Normally:

```dart
final userProvider =
    FutureProvider.autoDispose<User>(
  (ref) async {
    return repository.getUser();
  },
);
```

Leaving screen:

```text
Disposed
```

---

Keep alive:

```dart
final userProvider =
    FutureProvider.autoDispose<User>(
  (ref) async {
    ref.keepAlive();

    return repository.getUser();
  },
);
```

Lifecycle:

```text
Create
↓
Active
↓
No listeners
↓
Still Alive
```

Useful for caching expensive API calls.

---

# Lifecycle of Different Provider Types

## Provider

```text
Uninitialized
↓
Created
↓
Active
↓
Paused
```

---

## StateProvider

```text
Uninitialized
↓
Created
↓
Active
↓
State Changes
↓
Paused
```

---

## FutureProvider

```text
Uninitialized
↓
Loading
↓
Data/Error
↓
Paused
```

---

## StreamProvider

```text
Uninitialized
↓
Subscribe
↓
Receive Events
↓
Cancel Subscription
```

---

## NotifierProvider

```text
Uninitialized
↓
build()
↓
State Changes
↓
Disposed
```

---

## AsyncNotifierProvider

```text
Uninitialized
↓
build()
↓
Loading
↓
Data/Error
↓
State Updates
↓
Disposed
```

---

## StreamNotifierProvider

```text
Uninitialized
↓
build()
↓
Subscribe Stream
↓
Receive Events
↓
Cancel Stream
↓
Disposed
```

---

# Real Flutter App Example

For your Business Listing App:

```text
Provider
↓
Dio
Repository

NotifierProvider
↓
Filters
Theme
Cart

AsyncNotifierProvider
↓
Businesses API
Login API
Services API

StreamNotifierProvider
↓
Realtime Chat
Notifications
```

Lifecycle:

```text
Open Business Screen
↓
BusinessProvider Created
↓
Fetch Businesses
↓
Show Data

Leave Screen
↓
autoDispose
↓
Provider Disposed
```

---

# Interview Summary

```text
Provider Lifecycle

Uninitialized
      ↓
Created
      ↓
Active
      ↓
Paused (normal providers)
      ↓
Disposed
```

Important lifecycle APIs:

| API                | Purpose                         |
| ------------------ | ------------------------------- |
| `ref.onDispose()`  | Cleanup resources               |
| `ref.onCancel()`   | Last listener removed           |
| `ref.onResume()`   | Listener added again            |
| `ref.keepAlive()`  | Prevent autoDispose             |
| `ref.invalidate()` | Destroy provider state          |
| `ref.refresh()`    | Destroy and rebuild immediately |

### Rule of Thumb

```text
Normal Provider
→ Active → Paused

autoDispose Provider
→ Active → Disposed

keepAlive()
→ Prevent Disposal

invalidate()
→ Destroy State

refresh()
→ Destroy + Recreate
```

If you're preparing for **modern Riverpod interviews**, the most important lifecycle concepts to know are:

* `autoDispose`
* `keepAlive`
* `onDispose`
* `invalidate`
* `refresh`
* dependency-driven rebuilds (`ref.watch`)
