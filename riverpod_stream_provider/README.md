# StreamProvider in Riverpod

`StreamProvider` is used when data changes continuously over time and you want the UI to automatically update whenever new data arrives.

Think of it as:

```text
FutureProvider
    ↓
One Result

StreamProvider
    ↓
Multiple Results Over Time
```

---

# When to Use StreamProvider

Use `StreamProvider` for:

✅ Chat messages

✅ Firestore real-time updates

✅ Socket.io events

✅ WebSocket connections

✅ Device sensors

✅ Location updates

✅ Download/upload progress

✅ Timer/countdown

---

# Basic Example

```dart
final clockProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
});
```

Usage:

```dart
class ClockView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockProvider);

    return clock.when(
      data: (time) => Text(time.toString()),
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text(e.toString()),
    );
  }
}
}
```

Every second:

```text
12:00:01
12:00:02
12:00:03
12:00:04
...
```

UI rebuilds automatically.

---

# StreamProvider Lifecycle

```text
Widget starts watching
        ↓
Subscribe to stream
        ↓
Receive events
        ↓
Update UI
        ↓
Widget removed
        ↓
Cancel subscription
```

Riverpod manages subscriptions automatically.

---

# Firestore Example

```dart
final usersProvider =
    StreamProvider<List<User>>((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(User.fromFirestore)
            .toList(),
      );
});
```

Usage:

```dart
final users = ref.watch(usersProvider);
```

Whenever Firestore data changes:

```text
New Document
↓
Stream emits
↓
Provider updates
↓
UI rebuilds
```

No manual refresh needed.

---

# Socket.io Example

This is particularly relevant to your Chat App.

Repository:

```dart
Stream<Message> getMessages() {
  return socketMessageController.stream;
}
```

Provider:

```dart
final messagesProvider =
    StreamProvider<Message>((ref) {
  return chatRepository.getMessages();
});
```

Usage:

```dart
final message = ref.watch(messagesProvider);
```

When a new message arrives:

```text
Socket Event
↓
Stream Emits
↓
Riverpod Updates
↓
Chat Screen Rebuilds
```

---

# StreamProvider.family

Useful when data depends on a parameter.

Example:

```dart
final chatProvider =
    StreamProvider.family<
        List<Message>,
        String>(
  (ref, chatId) {
    return repository.getChatMessages(chatId);
  },
);
```

Usage:

```dart
ref.watch(chatProvider("chat_101"));
```

Different chat rooms get different streams:

```text
chatProvider("chat_101")
chatProvider("chat_102")
chatProvider("chat_103")
```

---

# StreamProvider.autoDispose

For screen-specific streams.

```dart
final locationProvider =
    StreamProvider.autoDispose<Position>(
  (ref) {
    return Geolocator.getPositionStream();
  },
);
```

When user leaves screen:

```text
Screen Closed
↓
Subscription Cancelled
↓
Memory Released
```

Very useful for:

* GPS tracking
* Sensors
* Camera streams
* WebSocket screens

---

# StreamProvider.autoDispose.family

Most common real-world combination.

```dart
final chatProvider =
    StreamProvider.autoDispose.family<
        List<Message>,
        String>(
  (ref, chatId) {
    return repository.watchMessages(chatId);
  },
);
```

Usage:

```dart
ref.watch(chatProvider(chatId));
```

Lifecycle:

```text
Open Chat A
↓
Subscribe Chat A

Open Chat B
↓
Subscribe Chat B

Leave Chat A
↓
Cancel Chat A Stream
```

---

# StreamProvider vs FutureProvider

| Feature           | FutureProvider | StreamProvider |
| ----------------- | -------------- | -------------- |
| Results           | One            | Many           |
| API Call          | ✅              | ❌ Usually      |
| Firestore         | ❌              | ✅              |
| Socket.io         | ❌              | ✅              |
| Real-time Updates | ❌              | ✅              |
| Timer             | ❌              | ✅              |
| GPS               | ❌              | ✅              |

---

# FutureProvider Example

```dart
final userProvider =
    FutureProvider<User>((ref) async {
  return api.getUser();
});
```

Response:

```text
Loading
↓
User Data
↓
Done
```

Only one value.

---

# StreamProvider Example

```dart
final clockProvider =
    StreamProvider<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
});
```

Response:

```text
Loading
↓
12:00:01
↓
12:00:02
↓
12:00:03
↓
12:00:04
...
```

Infinite updates.

---

# AsyncValue with StreamProvider

Just like `FutureProvider`, `StreamProvider` returns an `AsyncValue<T>`.

Using `when()`:

```dart
final messages = ref.watch(messagesProvider);

return messages.when(
  data: (data) => Text('$data'),
  loading: () => const CircularProgressIndicator(),
  error: (e, s) => Text(e.toString()),
);
```

Using Dart 3 `switch`:

```dart
switch (ref.watch(messagesProvider)) {
  case AsyncData(:final value):
    return Text('$value');

  case AsyncError(:final error):
    return Text(error.toString());

  case AsyncLoading():
    return const CircularProgressIndicator();
}
```

---

# Riverpod 3 Recommendation

For modern Riverpod 3 apps:

```text
Provider              → Services & Repositories

StateProvider         → Simple UI State

NotifierProvider      → Business Logic

AsyncNotifierProvider → Async CRUD Operations

FutureProvider        → One-time async fetch

StreamProvider        → Real-time data
```

### For Your Projects

* **Business Listing App**

  * `FutureProvider` → Business Details API
  * `StreamProvider` → Customer ↔ Business Chat

* **Chat App**

  * `FutureProvider` → Load initial conversations
  * `StreamProvider` → Real-time messages via Socket.io

* **IoT Smart Environment System**

  * `FutureProvider` → Device configuration
  * `StreamProvider` → MQTT sensor data (Temperature, Humidity, Air Quality)

A useful rule is:

```text
Need data once?       → FutureProvider

Need continuous data? → StreamProvider
```
