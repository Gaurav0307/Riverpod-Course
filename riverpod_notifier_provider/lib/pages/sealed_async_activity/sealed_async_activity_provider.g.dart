// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sealed_async_activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SealedAsyncActivity)
final sealedAsyncActivityProvider = SealedAsyncActivityProvider._();

final class SealedAsyncActivityProvider
    extends $NotifierProvider<SealedAsyncActivity, SealedAsyncActivityState> {
  SealedAsyncActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sealedAsyncActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sealedAsyncActivityHash();

  @$internal
  @override
  SealedAsyncActivity create() => SealedAsyncActivity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SealedAsyncActivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SealedAsyncActivityState>(value),
    );
  }
}

String _$sealedAsyncActivityHash() =>
    r'65e7513f1c9b955db80ea60e7daf530df271eaf9';

abstract class _$SealedAsyncActivity
    extends $Notifier<SealedAsyncActivityState> {
  SealedAsyncActivityState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<SealedAsyncActivityState, SealedAsyncActivityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SealedAsyncActivityState, SealedAsyncActivityState>,
              SealedAsyncActivityState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
