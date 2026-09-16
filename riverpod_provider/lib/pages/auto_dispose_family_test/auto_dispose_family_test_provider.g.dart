// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_family_test_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(autoDisposeFamilyCounter)
final autoDisposeFamilyCounterProvider = AutoDisposeFamilyCounterFamily._();

final class AutoDisposeFamilyCounterProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  AutoDisposeFamilyCounterProvider._({
    required AutoDisposeFamilyCounterFamily super.from,
    required Counter super.argument,
  }) : super(
         retry: null,
         name: r'autoDisposeFamilyCounterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeFamilyCounterHash();

  @override
  String toString() {
    return r'autoDisposeFamilyCounterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as Counter;
    return autoDisposeFamilyCounter(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyCounterProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$autoDisposeFamilyCounterHash() =>
    r'f803277f6ceded127c1e0668186289026bea167b';

final class AutoDisposeFamilyCounterFamily extends $Family
    with $FunctionalFamilyOverride<int, Counter> {
  AutoDisposeFamilyCounterFamily._()
    : super(
        retry: null,
        name: r'autoDisposeFamilyCounterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AutoDisposeFamilyCounterProvider call(Counter c) =>
      AutoDisposeFamilyCounterProvider._(argument: c, from: this);

  @override
  String toString() => r'autoDisposeFamilyCounterProvider';
}

@ProviderFor(autoDisposeFamilyTestHello)
final autoDisposeFamilyTestHelloProvider = AutoDisposeFamilyTestHelloFamily._();

final class AutoDisposeFamilyTestHelloProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AutoDisposeFamilyTestHelloProvider._({
    required AutoDisposeFamilyTestHelloFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'autoDisposeFamilyTestHelloProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$autoDisposeFamilyTestHelloHash();

  @override
  String toString() {
    return r'autoDisposeFamilyTestHelloProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as String;
    return autoDisposeFamilyTestHello(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyTestHelloProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$autoDisposeFamilyTestHelloHash() =>
    r'691e2846c781a4054ec3815d09a0608fd23b89fa';

final class AutoDisposeFamilyTestHelloFamily extends $Family
    with $FunctionalFamilyOverride<String, String> {
  AutoDisposeFamilyTestHelloFamily._()
    : super(
        retry: null,
        name: r'autoDisposeFamilyTestHelloProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AutoDisposeFamilyTestHelloProvider call(String there) =>
      AutoDisposeFamilyTestHelloProvider._(argument: there, from: this);

  @override
  String toString() => r'autoDisposeFamilyTestHelloProvider';
}
