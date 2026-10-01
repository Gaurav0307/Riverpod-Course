// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterFuture)
final counterFutureProvider = CounterFutureProvider._();

final class CounterFutureProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  CounterFutureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterFutureProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterFutureHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return counterFuture(ref);
  }
}

String _$counterFutureHash() => r'88483ab2b4279ca30c9abf881d09414985f7e0fc';
