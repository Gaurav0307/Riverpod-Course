// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Counter)
final counterProvider = CounterProvider._();

final class CounterProvider extends $NotifierProvider<Counter, int> {
  CounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$counterHash();

  @$internal
  @override
  Counter create() => Counter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$counterHash() => r'69bb44a9a464320f80c39bc01ddaec488a6a8dca';

abstract class _$Counter extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(adjustedCounter)
final adjustedCounterProvider = AdjustedCounterProvider._();

final class AdjustedCounterProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  AdjustedCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adjustedCounterProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[counterProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AdjustedCounterProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = counterProvider;

  @override
  String debugGetCreateSourceHash() => _$adjustedCounterHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return adjustedCounter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$adjustedCounterHash() => r'3c5ef21883e693694826a3e604edf2f841410958';
