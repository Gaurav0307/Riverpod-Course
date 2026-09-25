// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_second_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(City)
final cityProvider = CityProvider._();

final class CityProvider extends $NotifierProvider<City, Cities> {
  CityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cityHash();

  @$internal
  @override
  City create() => City();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Cities value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Cities>(value),
    );
  }
}

String _$cityHash() => r'9b8a151a8d99c6c187c9fc3cb7f69500a531e8e3';

abstract class _$City extends $Notifier<Cities> {
  Cities build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Cities, Cities>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Cities, Cities>,
              Cities,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(weatherSecond)
final weatherSecondProvider = WeatherSecondProvider._();

final class WeatherSecondProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  WeatherSecondProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'weatherSecondProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherSecondHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return weatherSecond(ref);
  }
}

String _$weatherSecondHash() => r'c597490e0507e424a5a3b0a6d3db10dde383a3e6';
