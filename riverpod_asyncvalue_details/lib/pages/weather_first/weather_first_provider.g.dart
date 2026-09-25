// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_first_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeatherFirst)
final weatherFirstProvider = WeatherFirstProvider._();

final class WeatherFirstProvider
    extends $AsyncNotifierProvider<WeatherFirst, String> {
  WeatherFirstProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherFirstProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherFirstHash();

  @$internal
  @override
  WeatherFirst create() => WeatherFirst();
}

String _$weatherFirstHash() => r'd7de8b930fb9c0380412d02addd86d90b9b801db';

abstract class _$WeatherFirst extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
