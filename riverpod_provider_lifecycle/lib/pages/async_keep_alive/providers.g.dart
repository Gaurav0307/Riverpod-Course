// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'624f9a3d788aafae162ce0a0a206b1f36b22ab5d';

@ProviderFor(getProducts)
final getProductsProvider = GetProductsProvider._();

final class GetProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  GetProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return getProducts(ref);
  }
}

String _$getProductsHash() => r'71bc756770a7746f7dbf3ba4c6200ef562433370';

@ProviderFor(getProduct)
final getProductProvider = GetProductFamily._();

final class GetProductProvider
    extends $FunctionalProvider<AsyncValue<Product>, Product, FutureOr<Product>>
    with $FutureModifier<Product>, $FutureProvider<Product> {
  GetProductProvider._({
    required GetProductFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getProductProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getProductHash();

  @override
  String toString() {
    return r'getProductProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Product> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Product> create(Ref ref) {
    final argument = this.argument as int;
    return getProduct(ref, id: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getProductHash() => r'ad3c93b4ee613d7c8806bea8d8f7a01b7f3ca852';

final class GetProductFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Product>, int> {
  GetProductFamily._()
    : super(
        retry: null,
        name: r'getProductProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetProductProvider call({required int id}) =>
      GetProductProvider._(argument: id, from: this);

  @override
  String toString() => r'getProductProvider';
}
