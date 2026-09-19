
# 1. FutureProvider

`FutureProvider` is used to handle asynchronous operations such as:

* API calls
* Database queries
* File reading
* SharedPreferences loading

```dart
final userProvider = FutureProvider<User>((ref) async {
  return api.getUser();
});
```

Usage:

```dart
final userAsync = ref.watch(userProvider);
```

The result is an `AsyncValue<User>`.

---

## States of FutureProvider

```text
Loading
 ↓
Success
 ↓
Data

OR

Loading
 ↓
Failure
 ↓
Error
```

---

# 2. when()

Used to handle `AsyncValue`.

```dart
ref.watch(userProvider).when(
  data: (user) => Text(user.name),
  loading: () => CircularProgressIndicator(),
  error: (err, stack) => Text(err.toString()),
);
```

### Benefits

✅ Easy to read

✅ Explicit loading/error handling

✅ Most commonly used

---

# 3. switch()

Dart 3 pattern matching alternative to `when()`.

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

---

## when() vs switch()

### when()

```dart
user.when(
  data: ...
  loading: ...
  error: ...
)
```

Pros:

- Shorter
- Easier for beginners
- Riverpod-specific

---

### switch()

```dart
switch (user) {
  ...
}
```

Pros:

- Native Dart 3
- Powerful pattern matching
- Better for complex states

Many Riverpod 3 examples now favor `switch`.

---

# 4. ref.keepAlive()

Used inside an `autoDispose` provider.

Normally:

```dart
final userProvider =
    FutureProvider.autoDispose<User>(
  (ref) async {
    return api.getUser();
  },
);
```

Leaving the screen:

```text
Screen removed
↓
Provider disposed
↓
Data lost
```

---

To keep it alive:

```dart
final userProvider =
    FutureProvider.autoDispose<User>(
  (ref) async {
    ref.keepAlive();

    return api.getUser();
  },
);
```

Now:

```text
Screen removed
↓
Provider survives
↓
Data cached
```

---

## Use Cases

### Cache API response

```dart
ref.keepAlive();
```

### Keep authenticated user

```dart
ref.keepAlive();
```

### Expensive API call

```dart
ref.keepAlive();
```

---

# 5. ref.invalidate()

Destroys provider state.

```dart
ref.invalidate(userProvider);
```

Riverpod:

```text
Dispose old state
↓
Mark provider dirty
↓
Rebuild when next accessed
```

Important:

`invalidate()` does **not necessarily rebuild immediately**.

---

Example:

```dart
ElevatedButton(
  onPressed: () {
    ref.invalidate(userProvider);
  },
  child: Text('Clear Cache'),
)
```

---

# 6. ref.refresh()

Refreshes immediately.

```dart
ref.refresh(userProvider);
```

Riverpod:

```text
Dispose old state
↓
Recreate provider NOW
↓
Fetch again immediately
```

---

Example:

```dart
RefreshIndicator(
  onRefresh: () async {
    ref.refresh(userProvider.future);
  },
  child: ...
)
```

---

# refresh() vs invalidate()

## refresh()

```dart
ref.refresh(userProvider);
```

Equivalent to:

```dart
ref.invalidate(userProvider);
ref.read(userProvider);
```

Meaning:

```text
Destroy
↓
Recreate immediately
```

---

## invalidate()

```dart
ref.invalidate(userProvider);
```

Meaning:

```text
Destroy
↓
Wait
↓
Recreate only when needed
```

---

# Practical Example

```dart
final todosProvider =
    FutureProvider.autoDispose<List<Todo>>(
  (ref) async {
    ref.keepAlive();

    return repository.getTodos();
  },
);
```

UI:

```dart
class TodoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return todos.when(
      data: (items) => ListView(...),
      loading: () => CircularProgressIndicator(),
      error: (e, s) => Text(e.toString()),
    );
  }
}
```

Pull to refresh:

```dart
onRefresh: () async {
  ref.refresh(todosProvider.future);
}
```

Logout:

```dart
ref.invalidate(todosProvider);
```

---

# Interview Summary

| Feature            | Purpose                                         |
| ------------------ | ----------------------------------------------- |
| `FutureProvider`   | Perform async work                              |
| `when()`           | Handle loading/data/error states                |
| `switch()`         | Dart 3 pattern matching for AsyncValue          |
| `ref.keepAlive()`  | Prevent autoDispose from disposing              |
| `ref.invalidate()` | Clear provider state, rebuild later when needed |
| `ref.refresh()`    | Clear provider state and rebuild immediately    |

### Rule of Thumb

```text
FutureProvider  -> Fetch async data

when()          -> Simple AsyncValue UI

switch()        -> Advanced Dart 3 pattern matching

keepAlive()     -> Cache autoDispose provider

invalidate()    -> Clear cache

refresh()       -> Reload data now
```

For modern Riverpod 3 projects, a common pattern is:

```dart
final usersProvider =
    FutureProvider.autoDispose<List<User>>((ref) async {
  ref.keepAlive();
  return repository.getUsers();
});
```

and in UI:

```dart
switch (ref.watch(usersProvider)) {
  case AsyncData(:final value):
    return UserList(value);

  case AsyncError(:final error):
    return ErrorView(error);

  case AsyncLoading():
    return const Loader();
}
```
