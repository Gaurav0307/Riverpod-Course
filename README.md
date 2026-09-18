# Riverpod 3.x – Complete Concise Cheat Sheet

Riverpod is a **state management + dependency injection + caching** solution for Flutter/Dart. Think of providers as **memoized functions** that cache values, manage lifecycle, handle async states, and allow dependency injection. ([Riverpod][1])

---

# 1. Core Concepts

### ProviderScope

Root of your app.

```dart
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
```

Every Riverpod app must have it. ([Riverpod][1])

---

### Provider

A provider stores or computes state.

```dart
final nameProvider = Provider((ref) => "Gaurav");
```

---

### Ref / WidgetRef

Used to interact with providers.

```dart
ref.watch(provider);
ref.read(provider);
ref.listen(provider, ...);
ref.invalidate(provider);
```

([Dart packages][2])

---

# 2. Modern Provider Types (Riverpod 3)

Riverpod 3 recommends mainly these six provider types: ([Riverpod][1])

| Sync             | Future                | Stream                 |
| ---------------- | --------------------- | ---------------------- |
| Provider         | FutureProvider        | StreamProvider         |
| NotifierProvider | AsyncNotifierProvider | StreamNotifierProvider |

---

## A. Provider

Read-only data.

```dart
final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);
```

Use for:

- Repository
- API Service
- Dio Client
- Configuration
- Computed values

---

## B. FutureProvider

Async data fetching.

```dart
final usersProvider = FutureProvider<List<User>>(
  (ref) async => api.getUsers(),
);
```

Use for:

- API calls
- Local DB reads
- Initial loading

---

## C. StreamProvider

Stream data.

```dart
final messagesProvider = StreamProvider<List<Message>>(
  (ref) => chatRepository.messages(),
);
```

Use for:

- Chat
- Firebase streams
- Live updates
- WebSocket streams

---

## D. NotifierProvider

Mutable synchronous state.

```dart
class Counter extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}

final counterProvider =
    NotifierProvider<Counter, int>(Counter.new);
```

Use for:

- Counter
- Form state
- Filters
- UI state

---

## E. AsyncNotifierProvider

Mutable async state.

```dart
class Todos extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    return repository.getTodos();
  }

  Future<void> addTodo() async {}
}
```

Use for:

- CRUD
- Backend operations
- Business logic

This is the provider you'll use most often for real apps.

---

## F. StreamNotifierProvider

Mutable stream state.

```dart
class ChatNotifier extends StreamNotifier<Message> {
  @override
  Stream<Message> build() {
    return repository.chatStream();
  }
}
```

Use for:

- Realtime chat
- WebSockets
- Live events

---

# 3. Legacy Providers (Avoid in New Projects)

Riverpod 3 discourages these: ([Riverpod][3])

- StateProvider
- StateNotifierProvider
- ChangeNotifierProvider

Use:

```dart
NotifierProvider
AsyncNotifierProvider
```

instead.

---

# 4. Provider Modifiers

## autoDispose

Dispose provider when unused.

```dart
final userProvider =
    FutureProvider.autoDispose(...);
```

Good for:

- Screens
- Temporary data
- Search results

---

## family

Pass parameters.

```dart
final userProvider =
    FutureProvider.family<User, String>(
      (ref, id) => api.getUser(id),
    );
```

Usage:

```dart
ref.watch(userProvider("123"));
```

([Riverpod][4])

---

## autoDispose + family

Very common.

```dart
FutureProvider.autoDispose.family(...)
```

---

# 5. Consumers

Consumers connect widgets to providers.

---

## ConsumerWidget

Most common.

```dart
class HomePage extends ConsumerWidget {
  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
  ) {
    final count = ref.watch(counterProvider);

    return Text('$count');
  }
}
```

---

## ConsumerStatefulWidget

Need lifecycle methods?

```dart
class HomePage
    extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState()
      => _HomePageState();
}
```

Use when:

- AnimationController
- TabController
- ScrollController

---

## Consumer

Used inside normal widgets.

```dart
Consumer(
  builder: (context, ref, child) {
    final data = ref.watch(provider);
    return Text(data);
  },
)
```

([Dart packages][2])

---

# 6. ref.watch vs ref.read vs ref.listen

## watch()

Rebuilds when state changes.

```dart
final todos = ref.watch(todoProvider);
```

Use in UI.

---

## read()

Reads once.

```dart
ref.read(todoProvider.notifier)
   .addTodo();
```

No rebuild.

Use for:

- Button clicks
- Methods
- Commands

---

## listen()

Listen to changes.

```dart
ref.listen(
  authProvider,
  (previous, next) {},
);
```

Use for:

- Snackbar
- Dialog
- Navigation

---

# 7. AsyncValue

Returned by:

- FutureProvider
- AsyncNotifierProvider
- StreamProvider

```dart
final users = ref.watch(usersProvider);
```

Handle states:

```dart
users.when(
  data: (data) {},
  loading: () {},
  error: (e, s) {},
);
```

or

```dart
switch(users) {
  AsyncData(:final value) => ...
  AsyncError(:final error) => ...
  _ => ...
}
```

([Riverpod][5])

---

# 8. Code Generation (Recommended)

Packages:

```yaml
riverpod_generator
riverpod_annotation
build_runner
```

Provider:

```dart
@riverpod
String userName(Ref ref) {
  return "Gaurav";
}
```

Generated:

```dart
userNameProvider
```

Benefits:

- Less boilerplate
- Safer ref types
- Better autocomplete
- Lint support
- Easier families

([Riverpod][1])

---

# 9. Architecture for Real Apps

A structure that works very well:

```text
lib/
│
├── core/
│   ├── network/
│   ├── constants/
│   └── utils/
│
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasource/
│
├── features/
│   └── todo/
│       ├── providers/
│       ├── screens/
│       ├── widgets/
│       └── viewmodels/
│
└── main.dart
```

For your Flutter + Node.js apps:

```text
DioClient
    ↓
Repository
    ↓
AsyncNotifier
    ↓
UI
```

---

# 10. Best Practices

### ✅ Use AsyncNotifier for CRUD

```dart
TodoViewModel extends AsyncNotifier
```

---

### ✅ Keep API calls in Repository

Bad:

```dart
Notifier -> Dio
```

Good:

```dart
Notifier -> Repository -> Dio
```

---

### ✅ Keep Providers Global

```dart
final userProvider = ...
```

Not inside widgets. ([Riverpod][1])

---

### ✅ Use family for parameters

```dart
userProvider(userId)
```

---

### ✅ Use autoDispose for screen-specific state

```dart
searchProvider
```

---

### ✅ Use ref.watch in UI

---

### ✅ Use ref.read for button actions

---

### ✅ Use ref.listen for side effects

Navigation, Snackbar, Dialog.

---

### ✅ Prefer Immutable Models

Use:

```dart
freezed
```

---

### ✅ Use ProviderObserver for debugging

```dart
ProviderScope(
  observers: [LoggerObserver()],
)
```

---

# 11. Common Mistakes

❌ Using `read()` in UI rendering

❌ API calls directly inside widgets

❌ Business logic inside UI

❌ Huge Notifiers (1000+ lines)

❌ Using ChangeNotifierProvider in new apps

❌ Creating providers inside widgets

❌ Forgetting AsyncValue loading/error handling

---

# 12. Provider Selection Guide

| Situation       | Use                    |
| --------------- | ---------------------- |
| Constant value  | Provider               |
| Repository      | Provider               |
| Dio Client      | Provider               |
| API GET         | FutureProvider         |
| Firebase Stream | StreamProvider         |
| Counter         | NotifierProvider       |
| Theme Mode      | NotifierProvider       |
| Todo CRUD       | AsyncNotifierProvider  |
| Authentication  | AsyncNotifierProvider  |
| Chat Messages   | StreamNotifierProvider |
| User By ID      | family                 |
| Search Screen   | autoDispose            |

---

# 13. What You Should Learn First

Since you're already a Flutter developer and currently learning Riverpod:

1. Provider
2. ConsumerWidget
3. ref.watch / read / listen
4. AsyncValue
5. NotifierProvider
6. AsyncNotifierProvider
7. family
8. autoDispose
9. riverpod_generator
10. Testing & Provider Overrides

After mastering these 10 topics, you'll be able to build production-level apps such as your Chat App, Business Listing App, Food Delivery App, and OTT App using Riverpod confidently.

[1]: https://riverpod.dev/docs/concepts2/providers?utm_source=chatgpt.com "Providers | Riverpod"
[2]: https://pub.dev/documentation/riverpod/latest/topics/Core-topic.html?utm_source=chatgpt.com "Core topic - Dart API"
[3]: https://riverpod.dev/docs/whats_new?utm_source=chatgpt.com "What's new in Riverpod 3.0 | Riverpod"
[4]: https://riverpod.dev/docs/concepts2/family?utm_source=chatgpt.com "Family | Riverpod"
[5]: https://riverpod.dev/?utm_source=chatgpt.com "Riverpod"
