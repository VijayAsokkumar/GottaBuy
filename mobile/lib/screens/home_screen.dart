import 'package:flutter/material.dart';
import 'receipt_screen.dart';
import 'inventory_screen.dart';
import 'prices_screen.dart';
import '../services/api_client.dart';

class HomeScreen extends StatelessWidget {
  final ApiClient api;
  const HomeScreen({super.key, required this.api});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('GottaBuy')),
    body: ListView(children: [
      ListTile(leading: const Icon(Icons.receipt), title: const Text('Receipts'),
        subtitle: const Text('Start with demo; OCR is a stub'),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReceiptScreen(api:api)))),
      ListTile(leading: const Icon(Icons.inventory), title: const Text('Inventory'),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InventoryScreen(api:api)))),
      ListTile(leading: const Icon(Icons.sell), title: const Text('Price history'),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PricesScreen(api:api)))),
    ]),
  );
}
