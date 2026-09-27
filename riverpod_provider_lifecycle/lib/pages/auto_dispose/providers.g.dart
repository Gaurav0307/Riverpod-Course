// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AutoDisposeCounter)
final autoDisposeCounterProvider = AutoDisposeCounterProvider._();

final class AutoDisposeCounterProvider
    extends $NotifierProvider<AutoDisposeCounter, int> {
  AutoDisposeCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDisposeCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeCounterHash();

  @$internal
  @override
  AutoDisposeCounter create() => AutoDisposeCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$autoDisposeCounterHash() =>
    r'7debefcfefe7831e2cb768fe17c38dc855ac1020';

abstract class _$AutoDisposeCounter extends $Notifier<int> {
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

@ProviderFor(AutoDisposeCounter1)
final autoDisposeCounter1Provider = AutoDisposeCounter1Provider._();

final class AutoDisposeCounter1Provider
    extends $NotifierProvider<AutoDisposeCounter1, int> {
  AutoDisposeCounter1Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDisposeCounter1Provider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeCounter1Hash();

  @$internal
  @override
  AutoDisposeCounter1 create() => AutoDisposeCounter1();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$autoDisposeCounter1Hash() =>
    r'071dfd4824e9c34d25deefe6bab3a093c7236951';

abstract class _$AutoDisposeCounter1 extends $Notifier<int> {
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
