import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dio/dio.dart';
import 'package:riverpod_provider_lifecycle/models/product.dart';

part 'providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  print("[DioProvider] initialized");

  ref.onDispose(() {
    print("[DioProvider] disposed");
  });

  /// URL - https://dummyjson.com/products/1

  return Dio(BaseOptions(baseUrl: "https://dummyjson.com"));
}

@riverpod
FutureOr<List<Product>> getProducts(Ref ref) async {
  print("[getProductsProvider] initialized");

  ref.onDispose(() {
    print("[getProductsProvider] disposed");
  });

  ref.onCancel(() {
    print("[getProductsProvider] canceled");
  });

  ref.onResume(() {
    print("[getProductsProvider] resumed");
  });

  ref.onAddListener(() {
    print("[getProductsProvider] added listener");
  });

  ref.onRemoveListener(() {
    print("[getProductsProvider] removed listener");
  });

  final dio = ref.watch(dioProvider);

  final response = await dio.get("/products");

  final products = List<Product>.from(
    response.data["products"].map((e) => Product.fromJson(e)),
  );

  return products;
}

@riverpod
FutureOr<Product> getProduct(Ref ref, {required int id}) async {
  final cancelToken = CancelToken();
  var timer = Timer(const Duration(minutes: 1), () {});

  print("[getProductProvider($id)] initialized");

  ref.onDispose(() {
    print("[getProductProvider($id)] disposed and token & timer canceled");

    cancelToken.cancel();

    timer.cancel();
  });

  ref.onCancel(() {
    print("[getProductProvider($id)] canceled");
  });

  ref.onResume(() {
    print("[getProductProvider($id)] resumed and timer canceled");

    timer.cancel();
  });

  ref.onAddListener(() {
    print("[getProductProvider($id)] added listener");
  });

  ref.onRemoveListener(() {
    print("[getProductProvider($id)] removed listener");
  });

  await Future.delayed(const Duration(seconds: 5));

  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() {
    print("[getProductProvider($id)] canceled & timer starts");

    timer = Timer(const Duration(seconds: 20), () {
      keepAliveLink.close();
    });
  });

  final dio = ref.watch(dioProvider);

  final response = await dio.get("/products/$id", cancelToken: cancelToken);

  final product = Product.fromJson(response.data);

  return product;
}
