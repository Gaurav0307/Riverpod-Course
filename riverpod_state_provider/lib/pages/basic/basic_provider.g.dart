// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(count)
final countProvider = CountProvider._();

final class CountProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  CountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return count(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$countHash() => r'5df9ae83535e5f5c8f7348a6733782e8e0dbce89';
