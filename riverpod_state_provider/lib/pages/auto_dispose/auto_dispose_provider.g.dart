// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(autoDisposeCount)
final autoDisposeCountProvider = AutoDisposeCountProvider._();

final class AutoDisposeCountProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AutoDisposeCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDisposeCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeCountHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return autoDisposeCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$autoDisposeCountHash() => r'd2d2b2c047148a58d0d1fccff9ffe1ae310296a0';
