// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(completedCount)
final completedCountProvider = CompletedCountProvider._();

final class CompletedCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CompletedCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completedCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completedCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return completedCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$completedCountHash() => r'22eb2a73be5ecdb573743eaca5069ffe39db2f12';
