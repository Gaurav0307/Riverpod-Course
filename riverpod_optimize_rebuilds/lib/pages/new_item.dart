import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_optimize_rebuilds/items/item_list_provider.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewItemState();
}

class _NewItemState extends ConsumerState<NewItem> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: "New Item"),
      onSubmitted: (String? item) {
        if (item != null && item.trim().isNotEmpty) {
          ref.read(itemListProvider.notifier).addItem(item);
          controller.clear();
        }
      },
    );
  }
}
