import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_asyncvalue_details/extensions/async_value_xx.dart';
import 'package:riverpod_asyncvalue_details/models/cities.dart';
import 'package:riverpod_asyncvalue_details/pages/weather_second/weather_second_provider.dart';

int _selectedCityIndex = 1;

class WeatherSecondPage extends ConsumerWidget {
  const WeatherSecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(weatherSecondProvider, (previous, next) {
      if (next.hasError & !next.isLoading) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    final weather = ref.watch(weatherSecondProvider);

    if (weather.retrying) {
      print("Retrying...");
    }

    print(weather.toStr);
    print(weather.props);

    try {
      print("value : ${weather.value}");
    } catch (e) {
      print(e);
    }

    try {
      print("requireValue : ${weather.requireValue}");
    } on StateError catch (e) {
      print("StateError : ${e.message}");
    } catch (e) {
      print(e);
    }

    print("==========================================");

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncValue Details - Second'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _selectedCityIndex = 1;
              ref.invalidate(weatherSecondProvider);
            },
          ),
        ],
      ),
      body: Center(
        child: weather.when(
          skipLoadingOnRefresh: false,
          skipError: true,
          data: (temp) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                temp.toUpperCase(),
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20.0),
              getWeatherButton(ref),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weather.error.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              const SizedBox(height: 20.0),
              getWeatherButton(ref),
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton getWeatherButton(WidgetRef ref) {
    return OutlinedButton(
      onPressed: () async {
        ref
            .read(cityProvider.notifier)
            .changeCity(Cities.values[_selectedCityIndex]);

        _selectedCityIndex = (_selectedCityIndex + 1) % Cities.values.length;
      },
      child: const Text('Get Weather'),
    );
  }
}
