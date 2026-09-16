// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(autoDisposeHello)
final autoDisposeHelloProvider = AutoDisposeHelloProvider._();

final class AutoDisposeHelloProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AutoDisposeHelloProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDisposeHelloProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeHelloHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return autoDisposeHello(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$autoDisposeHelloHash() => r'217915a50fec13ec3a19f80f38fb226377563853';

@ProviderFor(autoDisposeWorld)
final autoDisposeWorldProvider = AutoDisposeWorldProvider._();

final class AutoDisposeWorldProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AutoDisposeWorldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDisposeWorldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeWorldHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return autoDisposeWorld(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$autoDisposeWorldHash() => r'552ea3d388ab0d792f99fc5742ca5b03fc48350a';
