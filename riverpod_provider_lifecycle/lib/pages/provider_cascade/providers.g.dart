// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CascadeCounter)
final cascadeCounterProvider = CascadeCounterProvider._();

final class CascadeCounterProvider
    extends $NotifierProvider<CascadeCounter, int> {
  CascadeCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cascadeCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cascadeCounterHash();

  @$internal
  @override
  CascadeCounter create() => CascadeCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cascadeCounterHash() => r'b548c2bb7a397c71e8f6f0cdc73b795b99b46118';

abstract class _$CascadeCounter extends $Notifier<int> {
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

@ProviderFor(age)
final ageProvider = AgeProvider._();

final class AgeProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AgeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ageHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return age(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$ageHash() => r'0cf186409bdca212742390c25bae5d45375da267';
