// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_notifier_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterAsyncNotifier)
final counterAsyncProvider = CounterAsyncNotifierProvider._();

final class CounterAsyncNotifierProvider
    extends $AsyncNotifierProvider<CounterAsyncNotifier, int> {
  CounterAsyncNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterAsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterAsyncNotifierHash();

  @$internal
  @override
  CounterAsyncNotifier create() => CounterAsyncNotifier();
}

String _$counterAsyncNotifierHash() =>
    r'72149511850340768e25a5593a76704772363bbb';

abstract class _$CounterAsyncNotifier extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
