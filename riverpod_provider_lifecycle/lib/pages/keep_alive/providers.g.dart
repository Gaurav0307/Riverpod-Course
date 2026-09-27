// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KeepAliveCounter)
final keepAliveCounterProvider = KeepAliveCounterProvider._();

final class KeepAliveCounterProvider
    extends $NotifierProvider<KeepAliveCounter, int> {
  KeepAliveCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keepAliveCounterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keepAliveCounterHash();

  @$internal
  @override
  KeepAliveCounter create() => KeepAliveCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$keepAliveCounterHash() => r'664325bcaaa88e98e5b7b20aa1084ad0de18d7ea';

abstract class _$KeepAliveCounter extends $Notifier<int> {
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
