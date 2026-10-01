// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_provider_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterStream)
final counterStreamProvider = CounterStreamProvider._();

final class CounterStreamProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  CounterStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterStreamHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return counterStream(ref);
  }
}

String _$counterStreamHash() => r'3308887f40428d5d33402f2c25c789b3985410fe';
