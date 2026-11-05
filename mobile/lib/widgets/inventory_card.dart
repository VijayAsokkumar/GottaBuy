import 'package:flutter/material.dart';
import '../models/inventory_item.dart';

class InventoryCard extends StatelessWidget {
  final InventoryItem item;
  const InventoryCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) => Card(child: ListTile(
    title: Text(item.name), trailing: Text('${item.quantity} ${item.unit}')));
}
