These four packages are commonly used together to reduce boilerplate, improve code safety, and make model classes easier to maintain.

## 1. freezed

### What it is

A code generation package that creates immutable (or mutable via `@unfreezed`) data classes, union/sealed classes, `copyWith`, equality, pattern matching, and more.

### Common Use Cases

#### Data Models

```dart
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
  }) = _User;
}
```

#### State Management

```dart
@freezed
sealed class TodoState with _$TodoState {
  const factory TodoState.loading() = Loading;
  const factory TodoState.success(List<Todo> todos) = Success;
  const factory TodoState.error(String message) = Error;
}
```

#### API Response Models

```dart
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T data) = Success;
  const factory ApiResponse.failure(String error) = Failure;
}
```

---

### Major Benefits

#### 1. Automatic `copyWith()`

```dart
final updatedUser = user.copyWith(name: 'John');
```

Without Freezed:

```dart
User copyWith({
  int? id,
  String? name,
}) {
  return User(
    id: id ?? this.id,
    name: name ?? this.name,
  );
}
```

---

#### 2. Value Equality

```dart
user1 == user2 // true
```

No need to manually override:

```dart
@override
bool operator ==(...)
```

---

#### 3. Immutable Models

Prevents accidental modification:

```dart
user.name = "John"; // Error
```

---

#### 4. Sealed/Union Classes

Excellent for Riverpod, BLoC, and Clean Architecture.

```dart
switch(state) {
  case Loading():
  case Success():
  case Error():
}
```

---

#### 5. Less Boilerplate

Freezed generates:

* constructor
* copyWith
* toString
* hashCode
* ==
* pattern matching helpers

---

### Drawbacks If You Don't Use It

You must manually write:

* copyWith
* equality operators
* hashCode
* toString
* sealed state classes
* immutable model logic

As projects grow, maintenance becomes painful and error-prone.

---

## 2. freezed_annotation

### What it is

Contains annotations used by Freezed.

```dart
@freezed
@unfreezed
```

### Use Cases

Used only to decorate classes.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
```

---

### Benefits

Provides:

* `@freezed`
* `@unfreezed`
* JSON-related annotations integration
* Union/sealed class annotations

---

### Drawbacks If You Don't Use It

You simply cannot use Freezed because the annotations come from this package.

Think of it as the "API" package while `freezed` does the actual code generation.

---

## 3. json_serializable

### What it is

Generates JSON serialization code automatically.

### Common Use Cases

Convert API JSON into Dart objects.

```dart
@JsonSerializable()
class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json)
      => _$UserFromJson(json);

  Map<String, dynamic> toJson()
      => _$UserToJson(this);
}
```

Generated automatically:

```dart
User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}
```

---

### Major Benefits

#### 1. Eliminates Manual Parsing

Without it:

```dart
factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'],
    name: json['name'],
  );
}
```

Every model needs manual parsing.

---

#### 2. Handles Large Models Easily

A 50-field API model can be generated in seconds.

---

#### 3. Supports Advanced Features

* nested models
* custom converters
* enum serialization
* default values
* field renaming

Example:

```dart
@JsonKey(name: "full_name")
final String fullName;
```

---

#### 4. Compile-Time Safety

Errors are caught during generation instead of at runtime.

---

### Drawbacks If You Don't Use It

You must manually maintain:

```dart
fromJson()
toJson()
```

for every model.

Problems:

* more bugs
* typo mistakes
* forgotten fields
* difficult maintenance

---

## 4. json_annotation

### What it is

Contains annotations used by `json_serializable`.

Examples:

```dart
@JsonSerializable()
@JsonKey()
```

---

### Common Use Cases

#### Rename API Fields

```dart
@JsonKey(name: "user_name")
final String userName;
```

---

#### Default Values

```dart
@JsonKey(defaultValue: [])
final List<String> tags;
```

---

#### Ignore Fields

```dart
@JsonKey(includeToJson: false)
final String temporaryData;
```

---

### Benefits

Provides metadata that guides generated serialization code.

Without it, customization becomes difficult.

---

### Drawbacks If You Don't Use It

You lose annotation-based control over:

* field names
* default values
* ignored fields
* custom conversions

and must handle everything manually.

---

# Why Flutter Developers Usually Use All Four Together

```yaml
dependencies:
  freezed_annotation: ^latest
  json_annotation: ^latest

dev_dependencies:
  freezed: ^latest
  json_serializable: ^latest
  build_runner: ^latest
```

Example:

```dart
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)
      => _$UserFromJson(json);
}
```

From this single class, Freezed + json_serializable generate:

✅ Immutable model
✅ copyWith()
✅ Equality (==)
✅ hashCode
✅ toString()
✅ fromJson()
✅ toJson()
✅ Deep collection equality
✅ Pattern matching support (for unions/sealed classes)

---

## My recommendation for your Flutter projects

Since you're learning **Riverpod**, I would strongly recommend using:

```yaml
freezed
freezed_annotation
json_serializable
json_annotation
build_runner
```

for all API models, Riverpod states, DTOs, and request/response objects.

For medium-to-large projects, these packages significantly reduce boilerplate, improve maintainability, and make refactoring much safer.

## What is `build_runner`?

`build_runner` is Dart's code generation tool. It scans your project, finds annotations (such as `@freezed`, `@JsonSerializable`, `@riverpod`), and generates Dart files automatically.

Think of it as:

> **A build engine that runs code generators.**

It doesn't generate code by itself. Instead, it works with packages like:

* `freezed`
* `json_serializable`
* `riverpod_generator`
* `retrofit_generator`
* `injectable_generator`
* `mockito`

---

## Why is it needed?

Consider this Freezed model:

```dart
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
  }) = _User;
}
```

The class references:

```dart
_$User
```

But you never created `_$User`.

`build_runner` generates it automatically in:

```dart
user.freezed.dart
```

Without running `build_runner`, your project will not compile.

---

## Common Flutter Packages That Need build_runner

| Package            | Generated File   |
| ------------------ | ---------------- |
| Freezed            | `*.freezed.dart` |
| Json Serializable  | `*.g.dart`       |
| Riverpod Generator | `*.g.dart`       |
| Retrofit           | `*.g.dart`       |
| Injectable         | `*.config.dart`  |
| Hive Generator     | `*.g.dart`       |

---

## Installation

```yaml
dependencies:
  freezed_annotation: ^latest
  json_annotation: ^latest

dev_dependencies:
  build_runner: ^latest
  freezed: ^latest
  json_serializable: ^latest
```

Notice:

### Runtime packages

```yaml
dependencies:
```

These are used by your app.

### Development packages

```yaml
dev_dependencies:
```

Used only during development.

`build_runner` belongs here because it generates code and isn't needed in the final app.

---

## How to use it?

### Step 1

Create model:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
  }) = _User;
}
```

---

### Step 2

Run:

```bash
dart run build_runner build
```

or

```bash
flutter pub run build_runner build
```

(Older syntax, still works)

---

### Step 3

Generated file appears:

```text
user.freezed.dart
```

---

## Useful Commands

### Generate Once

```bash
dart run build_runner build
```

Runs one time and exits.

---

### Auto Regenerate on Changes

```bash
dart run build_runner watch
```

Keeps watching files.

Whenever you save:

```dart
User
Todo
Product
```

it automatically regenerates code.

Many developers keep this running in a separate terminal.

---

### Delete Conflicting Generated Files

Sometimes you get:

```text
Conflicting outputs were detected.
```

Fix:

```bash
dart run build_runner build --delete-conflicting-outputs
```

This is probably the command you'll use most often.

---

### Clean Generated Cache

If generation behaves strangely:

```bash
dart run build_runner clean
```

Then:

```bash
flutter pub get
dart run build_runner build
```

---

## Example with Freezed + JSON

### Model

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)
      => _$UserFromJson(json);
}
```

---

### Run Generator

```bash
dart run build_runner build
```

Generated:

```text
user.freezed.dart
user.g.dart
```

---

### You get automatically

```dart
user.copyWith(...)
user.toJson()
User.fromJson(...)
user == otherUser
user.hashCode
user.toString()
```

without writing them manually.

---

## How build_runner works internally

```text
Your Code
     │
     ▼
Annotations
(@freezed)
(@JsonSerializable)
(@riverpod)
     │
     ▼
build_runner
     │
     ▼
Generator Package
(freezed)
(json_serializable)
(riverpod_generator)
     │
     ▼
Generated .g.dart / .freezed.dart files
```

---

## For Your Current Riverpod Learning

You'll frequently use:

```yaml
dependencies:
  flutter_riverpod:
  riverpod_annotation:

dev_dependencies:
  build_runner:
  riverpod_generator:
```

Then:

```dart
@riverpod
Future<List<Todo>> todos(Ref ref) async {
  ...
}
```

Run:

```bash
dart run build_runner build
```

and Riverpod generates the provider code automatically.

### Rule to remember

If you see any of these annotations:

```dart
@freezed
@JsonSerializable
@riverpod
@RestApi
@Injectable
```

you almost certainly need to run:

```bash
dart run build_runner build
```

because those annotations rely on code generation.



