import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_lifecycle/pages/async_keep_alive/product_page.dart';
import 'package:riverpod_provider_lifecycle/pages/async_keep_alive/providers.dart';
import 'package:riverpod_provider_lifecycle/widgets/product_card.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: productList.when(
        data: (products) => ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: products.length,
          itemBuilder: (_, index) {
            final product = products[index];

            return ProductCard(
              product: product,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProductPage(productId: product.id),
                  ),
                );
              },
            );
          },
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        ),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
