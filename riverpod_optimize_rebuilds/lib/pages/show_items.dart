import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_optimize_rebuilds/items/item_list_provider.dart';

class ShowItems extends ConsumerWidget {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemListProvider);

    // return ListView(
    //   children: [for (final item in items) ItemWidget(item: item)],
    // );

    // return ListView(
    //   children: [
    //     for (final item in items)
    //       ProviderScope(
    //         overrides: [currentItemProvider.overrideWithValue(item)],
    //         child: const ItemWidget(),
    //       ),
    //   ],
    // );

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [currentItemProvider.overrideWithValue(items[index])],
          child: const ItemWidget(),
        );
      },
    );
  }
}

// class ItemWidget extends ConsumerWidget {
//   final String item;
//   const ItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print("Building $item");

//     return ListTile(
//       title: Text(item, style: TextStyle(fontSize: 20.0)),
//       trailing: IconButton(
//         onPressed: () {
//           ref.read(itemListProvider.notifier).removeItem(item);
//         },
//         icon: Icon(Icons.delete),
//       ),
//     );
//   }
// }

class ItemWidget extends ConsumerWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItemProvider);

    print("Building $item");

    return ListTile(
      title: Text(item, style: TextStyle(fontSize: 20.0)),
      trailing: IconButton(
        onPressed: () {
          ref.read(itemListProvider.notifier).removeItem(item);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
