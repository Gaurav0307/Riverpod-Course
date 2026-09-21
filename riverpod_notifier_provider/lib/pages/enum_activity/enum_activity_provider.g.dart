// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EnumActivity)
final enumActivityProvider = EnumActivityProvider._();

final class EnumActivityProvider
    extends $NotifierProvider<EnumActivity, EnumActivityState> {
  EnumActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enumActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enumActivityHash();

  @$internal
  @override
  EnumActivity create() => EnumActivity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EnumActivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EnumActivityState>(value),
    );
  }
}

String _$enumActivityHash() => r'3dd39f80840f7d75afcbd5a5b468fa35b8f4010b';

abstract class _$EnumActivity extends $Notifier<EnumActivityState> {
  EnumActivityState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EnumActivityState, EnumActivityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EnumActivityState, EnumActivityState>,
              EnumActivityState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
