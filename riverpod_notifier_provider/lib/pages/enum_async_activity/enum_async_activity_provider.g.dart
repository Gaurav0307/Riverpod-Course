// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_async_activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EnumAsyncActivity)
final enumAsyncActivityProvider = EnumAsyncActivityProvider._();

final class EnumAsyncActivityProvider
    extends $NotifierProvider<EnumAsyncActivity, EnumAsyncActivityState> {
  EnumAsyncActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enumAsyncActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enumAsyncActivityHash();

  @$internal
  @override
  EnumAsyncActivity create() => EnumAsyncActivity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EnumAsyncActivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EnumAsyncActivityState>(value),
    );
  }
}

String _$enumAsyncActivityHash() => r'6692802cb7056f6a27f9fad7c3684f12113f8c64';

abstract class _$EnumAsyncActivity extends $Notifier<EnumAsyncActivityState> {
  EnumAsyncActivityState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<EnumAsyncActivityState, EnumAsyncActivityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EnumAsyncActivityState, EnumAsyncActivityState>,
              EnumAsyncActivityState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
