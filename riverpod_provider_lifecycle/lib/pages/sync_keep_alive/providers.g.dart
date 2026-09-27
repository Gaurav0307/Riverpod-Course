// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SyncKeepAliveCounter)
final syncKeepAliveCounterProvider = SyncKeepAliveCounterProvider._();

final class SyncKeepAliveCounterProvider
    extends $NotifierProvider<SyncKeepAliveCounter, int> {
  SyncKeepAliveCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncKeepAliveCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncKeepAliveCounterHash();

  @$internal
  @override
  SyncKeepAliveCounter create() => SyncKeepAliveCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$syncKeepAliveCounterHash() =>
    r'ebd953903c4d16e7a22133e7edc6aa4e5099ba1d';

abstract class _$SyncKeepAliveCounter extends $Notifier<int> {
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
