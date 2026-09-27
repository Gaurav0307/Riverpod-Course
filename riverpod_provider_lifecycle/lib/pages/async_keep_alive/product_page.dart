import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_lifecycle/pages/async_keep_alive/providers.dart';

class ProductPage extends ConsumerWidget {
  final int productId;

  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetails = ref.watch(getProductProvider(id: productId));

    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: productDetails.when(
        data: (product) {
          final discountedPrice =
              product.price * (1 - (product.discountPercentage / 100));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Thumbnail
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),

                  /// Discount Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '-${product.discountPercentage.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Brand
                    Text(
                      product.brand.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// Title
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Category Chip
                    Chip(
                      label: Text(product.category.toUpperCase()),
                      visualDensity: VisualDensity.compact,
                    ),

                    const SizedBox(height: 12),

                    /// Description
                    Text(
                      product.description,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),

                    const SizedBox(height: 50),

                    /// Rating + Stock
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: product.stock > 0
                                ? Colors.green.withValues(alpha: 0.15)
                                : Colors.red.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.stock > 0
                                ? '${product.stock} in stock'
                                : 'Out of stock',
                            style: TextStyle(
                              color: product.stock > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Price Section
                    Row(
                      children: [
                        Text(
                          '\$${discountedPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
