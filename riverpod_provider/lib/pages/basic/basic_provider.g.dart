// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hello)
final helloProvider = HelloProvider._();

final class HelloProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  HelloProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helloProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helloHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return hello(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$helloHash() => r'5d4d474cc7923e652ecd6712a26c5ab2fcc675d9';

@ProviderFor(world)
final worldProvider = WorldProvider._();

final class WorldProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  WorldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'worldProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$worldHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return world(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$worldHash() => r'8165df16e5a8f9ee28274bb42bb0dba194030785';
