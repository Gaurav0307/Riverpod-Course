// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider.dart';

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

String _$counterHash() => r'b60baee5aeb90fece8963a0a591a2811f84ab3a5';

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
