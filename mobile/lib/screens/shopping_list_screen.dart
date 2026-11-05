import 'package:flutter/material.dart';
import '../services/shopping_list_service.dart';
import '../widgets/empty_state.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});
  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}
class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final service = ShoppingListService();
  final controller = TextEditingController();
  @override
  void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Shopping list')),
    body: Column(children: [
      Padding(padding: const EdgeInsets.all(12), child: Row(children: [
        Expanded(child: TextField(controller: controller,
          decoration: const InputDecoration(labelText: 'Add product'))),
        IconButton(icon: const Icon(Icons.add), onPressed: () {
          if (controller.text.trim().isEmpty) return;
          setState(() => service.add(controller.text)); controller.clear();
        }),
      ])),
      Expanded(child: service.items.isEmpty
        ? const EmptyState(message: 'Your local shopping list is empty.')
        : ListView.builder(itemCount: service.items.length,
          itemBuilder: (context, index) {
            final item = service.items[index];
            return CheckboxListTile(title: Text(item.productName),
              value: item.purchased, onChanged: (v) => setState(() =>
                service.markPurchased(index, v ?? false)));
          })),
      const Text('Demo only: this list is not saved between launches.'),
    ]),
  );
}
