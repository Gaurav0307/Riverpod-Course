`StateProvider` variants are used when you need **simple mutable state** (primitive values, filters, toggles, selected items, form fields, etc.).

For complex business logic, Riverpod recommends using **NotifierProvider** or **AsyncNotifierProvider** instead.

---

# 1. StateProvider

Stores mutable state and keeps it alive.

```dart
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
```

Read value:

```dart
final count = ref.watch(counterProvider);
```

Update value:

```dart
ref.read(counterProvider.notifier).state++;
```

### Lifecycle

```text
Created
↓
Stays alive
↓
Destroyed only when ProviderContainer is destroyed
```

### Good For

✅ Counter

✅ Selected Tab Index

✅ Theme Mode

✅ Sort Option

✅ Simple UI State

Example:

```dart
final selectedTabProvider =
    StateProvider<int>((ref) => 0);
```

---

# 2. StateProvider.autoDispose

Automatically disposes when unused.

```dart
final searchTextProvider =
    StateProvider.autoDispose<String>(
  (ref) => '',
);
```

### Lifecycle

```text
Open Screen
↓
Provider Created
↓
Leave Screen
↓
Provider Disposed
```

### Good For

✅ Search Text

✅ Form Fields

✅ Filters

✅ Temporary UI State

Example:

```dart
final selectedCategoryProvider =
    StateProvider.autoDispose<int?>(
  (ref) => null,
);
```

When user leaves the screen, the filter resets automatically.

---

# 3. StateProvider.family

Creates separate state instances based on a parameter.

```dart
final quantityProvider =
    StateProvider.family<int, String>(
  (ref, productId) => 1,
);
```

Usage:

```dart
final quantity =
    ref.watch(quantityProvider("p101"));

ref.read(
  quantityProvider("p101").notifier,
).state++;
```

Riverpod internally creates:

```text
quantityProvider("p101")
quantityProvider("p102")
quantityProvider("p103")
```

Each has its own state.

### Good For

✅ Quantity per Product

✅ Rating per Item

✅ Selection per Card

✅ Dynamic Lists

Example:

```dart
final checkboxProvider =
    StateProvider.family<bool, int>(
  (ref, itemId) => false,
);
```

---

# 4. StateProvider.autoDispose.family

Parameterized state that is automatically cleaned up.

```dart
final quantityProvider =
    StateProvider.autoDispose.family<
        int,
        String>(
  (ref, productId) => 1,
);
```

### Lifecycle

```text
Open Product Screen
↓
Create quantityProvider("p101")
↓
Leave Screen
↓
Dispose quantityProvider("p101")
```

### Good For

✅ Product Details

✅ Temporary Dynamic Forms

✅ Search Result Filters

✅ Dynamic UI State

Example:

```dart
final commentDraftProvider =
    StateProvider.autoDispose.family<
        String,
        int>(
  (ref, postId) => '',
);
```

Each post has its own draft text, which is removed when unused.

---

# Practical Flutter Examples

## Theme Selection

```dart
final themeModeProvider =
    StateProvider<ThemeMode>(
  (ref) => ThemeMode.system,
);
```

---

## Search Query

```dart
final searchProvider =
    StateProvider.autoDispose<String>(
  (ref) => '',
);
```

---

## Quantity Selector

```dart
final quantityProvider =
    StateProvider.family<int, String>(
  (ref, productId) => 1,
);
```

---

## Temporary Quantity Selector

```dart
final quantityProvider =
    StateProvider.autoDispose.family<
        int,
        String>(
  (ref, productId) => 1,
);
```

---

# When NOT to Use StateProvider

Avoid using `StateProvider` for complex state like:

```dart
class CartState {
  final List<CartItem> items;
  final double total;
  final bool isLoading;
}
```

Instead use:

```dart
NotifierProvider
AsyncNotifierProvider
StateNotifierProvider (older style)
```

because business logic quickly becomes difficult to manage inside a `StateProvider`.

---

# Quick Rule

| Provider                           | Use For                       |
| ---------------------------------- | ----------------------------- |
| `StateProvider`                    | Global simple mutable state   |
| `StateProvider.autoDispose`        | Temporary screen state        |
| `StateProvider.family`             | Simple state with parameters  |
| `StateProvider.autoDispose.family` | Temporary parameterized state |

For a typical Flutter app like your Business Listing, Food Delivery, or Chat app:

```dart
StateProvider                 // Selected tab, theme, sort
StateProvider.autoDispose     // Search text, filters
StateProvider.family          // Quantity per product, checkbox per item
StateProvider.autoDispose.family // Detail-page temporary state
NotifierProvider              // Cart, Auth, User, Business logic
AsyncNotifierProvider         // API calls, CRUD operations
```

A useful mental model is:

* **StateProvider = simple mutable variable**
* **family = variable with parameters**
* **autoDispose = variable that cleans itself up**
* **NotifierProvider/AsyncNotifierProvider = state + business logic**
