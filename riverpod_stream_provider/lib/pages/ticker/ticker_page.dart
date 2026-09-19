import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stream_provider/pages/ticker/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProvider);

    print(ticker);

    return Scaffold(
      appBar: AppBar(title: const Text('Ticker')),
      body: Center(
        child: ticker.when(
          data: (data) => Text(
            formatTimer(data),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          error: (error, stackTrace) => Text(
            '$error',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }

  String zeroPaddedTwoDigits(int ticks) {
    return ticks.toString().padLeft(2, '0');
  }

  String formatTimer(int ticker) {
    final minutes = zeroPaddedTwoDigits(ticker ~/ 60);
    final seconds = zeroPaddedTwoDigits(ticker % 60);
    return '$minutes:$seconds';
  }
}
