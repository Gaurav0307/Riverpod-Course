import 'package:flutter_riverpod/flutter_riverpod.dart';

final class Logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    print('''
      {
        "Provider:" "${context.provider.name ?? context.provider.runtimeType} is initialized.",
        "Value Exported:" "$value"
      }
    ''');

    super.didAddProvider(context, value);
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    print('''
      {
        "Provider:" "${context.provider.name ?? context.provider.runtimeType} disposed.",
      }
    ''');

    super.didDisposeProvider(context);
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    print('''
      {
        "Provider:" "${context.provider.name ?? context.provider.runtimeType} updated.",
        "Previous Value:" "$previousValue",
        "New Value:" "$newValue"
      }
    ''');

    super.didUpdateProvider(context, previousValue, newValue);
  }
}
