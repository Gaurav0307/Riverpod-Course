// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Counter)
final counterProvider = CounterFamily._();

final class CounterProvider extends $AsyncNotifierProvider<Counter, int> {
  CounterProvider._({
    required CounterFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'counterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$counterHash();

  @override
  String toString() {
    return r'counterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Counter create() => Counter();

  @override
  bool operator ==(Object other) {
    return other is CounterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$counterHash() => r'1f0758b7d8bcf5f54e1453a5d69e1081e4e9cc63';

final class CounterFamily extends $Family
    with
        $ClassFamilyOverride<
          Counter,
          AsyncValue<int>,
          int,
          FutureOr<int>,
          int
        > {
  CounterFamily._()
    : super(
        retry: null,
        name: r'counterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CounterProvider call(int initialValue) =>
      CounterProvider._(argument: initialValue, from: this);

  @override
  String toString() => r'counterProvider';
}

abstract class _$Counter extends $AsyncNotifier<int> {
  late final _$args = ref.$arg as int;
  int get initialValue => _$args;

  FutureOr<int> build(int initialValue);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(Counter1)
final counter1Provider = Counter1Family._();

final class Counter1Provider extends $AsyncNotifierProvider<Counter1, int> {
  Counter1Provider._({
    required Counter1Family super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'counter1Provider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$counter1Hash();

  @override
  String toString() {
    return r'counter1Provider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Counter1 create() => Counter1();

  @override
  bool operator ==(Object other) {
    return other is Counter1Provider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$counter1Hash() => r'86469de53c2bc18ab1faf0dbe35a77735c6b986c';

final class Counter1Family extends $Family
    with
        $ClassFamilyOverride<
          Counter1,
          AsyncValue<int>,
          int,
          FutureOr<int>,
          int
        > {
  Counter1Family._()
    : super(
        retry: null,
        name: r'counter1Provider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  Counter1Provider call(int initialValue) =>
      Counter1Provider._(argument: initialValue, from: this);

  @override
  String toString() => r'counter1Provider';
}

abstract class _$Counter1 extends $AsyncNotifier<int> {
  late final _$args = ref.$arg as int;
  int get initialValue => _$args;

  FutureOr<int> build(int initialValue);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}
