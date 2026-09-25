import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueXX on AsyncValue {
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (isRefreshing && this is! AsyncLoading) 'isRefreshing: $isRefreshing',
      if (isReloading && this is! AsyncLoading) 'isReloading: $isReloading',
      if (hasValue) 'value: $value',
      if (hasError) ...[
        'error: $error',
      ]
    ].join(', ');

    return '$runtimeType($content)';
  }

  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\nhasValue: $hasValue, hasError: $hasError';
  }
}
