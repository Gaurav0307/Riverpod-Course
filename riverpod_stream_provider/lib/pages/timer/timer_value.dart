import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:riverpod_stream_provider/pages/timer/timer_provider.dart';

class TimerValue extends ConsumerWidget {
  const TimerValue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);

    print(timerState);

    return timerState.maybeWhen(
      orElse: SizedBox.shrink,
      data: (data) => Text(
        formatTimer(data.duration),
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
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
