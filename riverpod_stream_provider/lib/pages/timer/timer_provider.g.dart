// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Timer)
final timerProvider = TimerProvider._();

final class TimerProvider extends $StreamNotifierProvider<Timer, TimerState> {
  TimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timerHash();

  @$internal
  @override
  Timer create() => Timer();
}

String _$timerHash() => r'c342c7d0d64b1501a794451999c13b3cb9bb01db';

abstract class _$Timer extends $StreamNotifier<TimerState> {
  Stream<TimerState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TimerState>, TimerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TimerState>, TimerState>,
              AsyncValue<TimerState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
