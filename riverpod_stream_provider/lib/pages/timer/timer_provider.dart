import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_stream_provider/pages/timer/ticker.dart';
import 'package:riverpod_stream_provider/pages/timer/timer_state.dart';

part 'timer_provider.g.dart';

@riverpod
class Timer extends _$Timer {
  final int _duration = 10;
  final Ticker _ticker = const Ticker();
  StreamSubscription<int>? _tickerSubscription;

  @override
  Stream<TimerState> build() {
    print("[TimerProvider] created");

    ref.onDispose(() {
      print("[TimerProvider] disposed");

      _tickerSubscription?.cancel();
    });

    return Stream.value(TimerInitial(_duration));
  }

  void startTimer() {
    state = AsyncData(TimerRunning(_duration));

    _tickerSubscription?.cancel();

    _tickerSubscription = _ticker
        .ticks(ticks: _duration)
        .listen(
          (duration) => duration == 0
              ? state = const AsyncData(TimerFinished())
              : state = AsyncData(TimerRunning(duration)),
        );
  }

  void pauseTimer() {
    switch (state.value!) {
      case TimerRunning(:int duration):
        _tickerSubscription?.pause();
        state = AsyncData(TimerPaused(duration));

      case _:
    }
  }

  void resumeTimer() {
    switch (state.value!) {
      case TimerPaused(:int duration):
        _tickerSubscription?.resume();
        state = AsyncData(TimerRunning(duration));
      case _:
    }
  }

  void resetTimer() {
    _tickerSubscription?.cancel();
    state = AsyncData(TimerInitial(_duration));
  }
}
