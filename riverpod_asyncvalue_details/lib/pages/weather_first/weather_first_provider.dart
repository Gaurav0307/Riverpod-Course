import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_asyncvalue_details/models/cities.dart';

part 'weather_first_provider.g.dart';

@riverpod
class WeatherFirst extends _$WeatherFirst {
  @override
  FutureOr<String> build() {
    return _getTemp(Cities.seoul);
  }

  Future<String> _getTemp(Cities city) async {
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

  Future<void> getTemperature(Cities city) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _getTemp(city));
  }
}
