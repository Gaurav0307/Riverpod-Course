import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_asyncvalue_details/models/cities.dart';

part 'weather_second_provider.g.dart';

@riverpod
class City extends _$City {
  @override
  Cities build() {
    print("[cityProvider] initialized");

    ref.onDispose(() {
      print("[cityProvider] disposed");
    });

    return Cities.seoul;
  }

  void changeCity(Cities city) {
    state = city;
  }
}

// @riverpod
@Riverpod(retry: _noRetry) // Disables automatic retries if exception is thrown.
FutureOr<String> weatherSecond(Ref ref) async {
  print("[weatherSecondProvider] initialized");

  ref.onDispose(() {
    print("[weatherSecondProvider] disposed");
  });

  final city = ref.watch(cityProvider);

  await Future.delayed(const Duration(seconds: 1));
  switch (city) {
    case Cities.seoul:
      return "${city.name} 23°C";
    case Cities.london:
      throw "Failed to fetch temperature of ${city.name.toString().toUpperCase()}";
    case Cities.bangkok:
      throw "Failed to fetch temperature of ${city.name.toString().toUpperCase()}";
    case Cities.tokyo:
      return "${city.name} 25°C";
  }
}

Duration? _noRetry(
  int retryCount,
  Object error,
) {
  return null;
}

/*
Duration? _customRetry(
  int retryCount,
  Object error,
) {
  if (retryCount >= 3) return null;

  return Duration(
    seconds: retryCount + 1,
  );
}
*/