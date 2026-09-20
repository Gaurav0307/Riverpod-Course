// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Counter)
final counterProvider = CounterFamily._();

final class CounterProvider extends $NotifierProvider<Counter, int> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CounterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$counterHash() => r'31b61d0e408844eb119b00f6db23632f61a1d490';

final class CounterFamily extends $Family
    with $ClassFamilyOverride<Counter, int, int, int, int> {
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

abstract class _$Counter extends $Notifier<int> {
  late final _$args = ref.$arg as int;
  int get initialValue => _$args;

  int build(int initialValue);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(Counter1)
final counter1Provider = Counter1Family._();

final class Counter1Provider extends $NotifierProvider<Counter1, int> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Counter1Provider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$counter1Hash() => r'002b0debba26db0c7c1359782d6e9ca0102090a7';

final class Counter1Family extends $Family
    with $ClassFamilyOverride<Counter1, int, int, int, int> {
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

abstract class _$Counter1 extends $Notifier<int> {
  late final _$args = ref.$arg as int;
  int get initialValue => _$args;

  int build(int initialValue);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
