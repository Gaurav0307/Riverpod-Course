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

- GPS tracking
- Sensors
- Camera streams
- WebSocket screens

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
| API Call          | ✅             | ❌ Usually     |
| Firestore         | ❌             | ✅             |
| Socket.io         | ❌             | ✅             |
| Real-time Updates | ❌             | ✅             |
| Timer             | ❌             | ✅             |
| GPS               | ❌             | ✅             |

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

- **Business Listing App**
  - `FutureProvider` → Business Details API
  - `StreamProvider` → Customer ↔ Business Chat

- **Chat App**
  - `FutureProvider` → Load initial conversations
  - `StreamProvider` → Real-time messages via Socket.io

- **IoT Smart Environment System**
  - `FutureProvider` → Device configuration
  - `StreamProvider` → MQTT sensor data (Temperature, Humidity, Air Quality)

A useful rule is:

```text
Need data once?       → FutureProvider

Need continuous data? → StreamProvider
```
#
# Riverpod StreamNotifierProvider

`StreamNotifierProvider` is the **stream equivalent of `AsyncNotifierProvider`**.

Think of the relationship like this:

```text
FutureProvider
    ↓
Read-only async fetch

AsyncNotifierProvider
    ↓
Async fetch + business logic
```

```text
StreamProvider
    ↓
Read-only stream

StreamNotifierProvider
    ↓
Stream + business logic
```

---

# Why Not Just Use StreamProvider?

`StreamProvider` is perfect for simple streams:

```dart
final clockProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
});
```

But what if you need:

```text
Connect Socket
Disconnect Socket
Reconnect Socket
Send Message
Mark Message Read
Join Room
Leave Room
```

That's business logic.

Use **StreamNotifierProvider**.

---

# Basic Structure

```text
Provider
   ↓
StreamNotifier
   ↓
Stream<T>
   ↓
AsyncValue<T>
```

---

# Simple Example

```dart
class ClockNotifier extends StreamNotifier<DateTime> {
  @override
  Stream<DateTime> build() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }
}
```

Provider:

```dart
final clockProvider =
    StreamNotifierProvider<
      ClockNotifier,
      DateTime
    >(ClockNotifier.new);
```

Usage:

```dart
final clock = ref.watch(clockProvider);
```

---

# What Does build() Return?

Unlike:

```dart
Notifier<T>
```

which returns:

```dart
T
```

and:

```dart
AsyncNotifier<T>
```

which returns:

```dart
Future<T>
```

a `StreamNotifier<T>` returns:

```dart
Stream<T>
```

Example:

```dart
@override
Stream<User> build() {
  return repository.watchCurrentUser();
}
```

---

# AsyncValue States

Just like `StreamProvider`, watching a `StreamNotifierProvider` gives:

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
ref.watch(chatProvider).when(
  data: (messages) => MessageList(messages),
  loading: () => const CircularProgressIndicator(),
  error: (e, s) => Text(e.toString()),
);
```

---

# UI with switch()

```dart
switch (ref.watch(chatProvider)) {
  case AsyncData(:final value):
    return MessageList(value);

  case AsyncError(:final error):
    return Text(error.toString());

  case AsyncLoading():
    return const CircularProgressIndicator();
}
```

---

# Real Chat App Example

This is very close to your Socket.io chat project.

---

Repository:

```dart
class ChatRepository {
  Stream<List<Message>> watchMessages(
    String chatId,
  ) {
    return socketController.stream;
  }

  Future<void> sendMessage(
    Message message,
  ) async {
    socket.emit('message', message);
  }
}
```

---

Notifier:

```dart
class ChatNotifier
    extends StreamNotifier<List<Message>> {

  late final ChatRepository _repository;

  @override
  Stream<List<Message>> build() {
    _repository =
        ref.read(chatRepositoryProvider);

    return _repository.watchMessages(
      "chat_101",
    );
  }

  Future<void> sendMessage(
    Message message,
  ) async {
    await _repository.sendMessage(
      message,
    );
  }
}
```

Provider:

```dart
final chatProvider =
    StreamNotifierProvider<
      ChatNotifier,
      List<Message>
    >(ChatNotifier.new);
```

Now the notifier can:

```text
Listen for messages
Send messages
Reconnect
Join room
Leave room
```

all in one place.

---

# Firestore Example

```dart
class UsersNotifier
    extends StreamNotifier<List<User>> {

  @override
  Stream<List<User>> build() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(User.fromFirestore)
              .toList(),
        );
  }
}
```

Provider:

```dart
final usersProvider =
    StreamNotifierProvider<
      UsersNotifier,
      List<User>
    >(UsersNotifier.new);
```

---

# MQTT Example (Your IoT Project)

```dart
class SensorNotifier
    extends StreamNotifier<SensorData> {

  @override
  Stream<SensorData> build() {
    final mqtt =
        ref.read(mqttServiceProvider);

    return mqtt.sensorStream;
  }

  Future<void> toggleRelay(
    int relay,
  ) async {
    await mqtt.publish(
      'relay/$relay',
      'toggle',
    );
  }
}
```

Provider:

```dart
final sensorProvider =
    StreamNotifierProvider<
      SensorNotifier,
      SensorData
    >(SensorNotifier.new);
```

Benefits:

```text
Realtime sensor updates
Relay control
MQTT subscription management
Reconnect logic
```

all in one notifier.

---

# Family

Parameterized streams.

```dart
final chatProvider =
    StreamNotifierProvider.family<
      ChatNotifier,
      List<Message>,
      String
    >(ChatNotifier.new);
```

Notifier:

```dart
class ChatNotifier
    extends FamilyStreamNotifier<
      List<Message>,
      String> {

  @override
  Stream<List<Message>> build(
    String chatId,
  ) {
    return repository.watchMessages(
      chatId,
    );
  }
}
```

Usage:

```dart
ref.watch(chatProvider("chat_101"));
```

---

# Auto Dispose

```dart
final chatProvider =
    StreamNotifierProvider.autoDispose<
      ChatNotifier,
      List<Message>
    >(ChatNotifier.new);
```

Lifecycle:

```text
Open Chat
↓
Subscribe

Leave Chat
↓
Dispose

Cancel Stream
```

Perfect for:

- Chat screens
- GPS screens
- Device monitoring
- Temporary streams

---

# AutoDispose + Family

Very common:

```dart
final chatProvider =
    StreamNotifierProvider
        .autoDispose
        .family<
          ChatNotifier,
          List<Message>,
          String>(
  ChatNotifier.new,
);
```

Each chat room gets its own stream.

---

# StreamProvider vs StreamNotifierProvider

## StreamProvider

```dart
final chatProvider =
    StreamProvider<List<Message>>(
  (ref) {
    return repository.watchMessages();
  },
);
```

Read-only.

---

## StreamNotifierProvider

```dart
class ChatNotifier
    extends StreamNotifier<
      List<Message>> {

  @override
  Stream<List<Message>> build() {
    return repository.watchMessages();
  }

  Future<void> sendMessage() async {}

  Future<void> reconnect() async {}

  Future<void> joinRoom() async {}
}
```

State + business logic.

---

| Feature                         | StreamProvider | StreamNotifierProvider |
| ------------------------------- | -------------- | ---------------------- |
| Listen Stream                   | ✅             | ✅                     |
| Send Commands                   | ❌             | ✅                     |
| Business Logic                  | ❌             | ✅                     |
| Reconnect Logic                 | ❌             | ✅                     |
| Recommended for Complex Streams | ❌             | ✅                     |

---

# AsyncNotifierProvider vs StreamNotifierProvider

## AsyncNotifierProvider

Returns:

```dart
Future<T>
```

Use for:

```text
Login
Register
CRUD APIs
Pagination
```

---

## StreamNotifierProvider

Returns:

```dart
Stream<T>
```

Use for:

```text
Chat
Firestore
MQTT
GPS
WebSocket
Live Dashboard
```

---

| Provider                 | Returns     |
| ------------------------ | ----------- |
| `NotifierProvider`       | `T`         |
| `AsyncNotifierProvider`  | `Future<T>` |
| `StreamNotifierProvider` | `Stream<T>` |

---

# Riverpod Generator Version

Modern Riverpod projects often use:

```dart
@riverpod
class Chat extends _$Chat {
  @override
  Stream<List<Message>> build(
    String chatId,
  ) {
    return repository.watchMessages(
      chatId,
    );
  }

  Future<void> sendMessage(
    Message message,
  ) async {
    await repository.sendMessage(
      message,
    );
  }
}
```

Generated provider:

```dart
chatProvider(chatId)
```

No manual provider declaration needed.

---

# When Should You Use StreamNotifierProvider?

Use it when you need:

✅ Realtime updates

✅ Business logic around a stream

✅ WebSocket / Socket.io

✅ MQTT

✅ Firestore

✅ Live dashboards

✅ GPS tracking

✅ Sensor monitoring

For your projects:

- **Chat App** → `StreamNotifierProvider`
- **Socket.io Messaging** → `StreamNotifierProvider`
- **IoT MQTT Sensor Updates** → `StreamNotifierProvider`
- **Firestore Realtime Data** → `StreamNotifierProvider`

A practical rule:

```text
Need realtime data only?
→ StreamProvider

Need realtime data + actions/business logic?
→ StreamNotifierProvider
```
