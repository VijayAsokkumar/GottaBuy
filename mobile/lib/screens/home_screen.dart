import 'package:flutter/material.dart';
import 'receipt_screen.dart';
import 'inventory_screen.dart';
import 'prices_screen.dart';
import 'shopping_list_screen.dart';
import 'purchase_history_screen.dart';
import 'restock_screen.dart';
import 'barcode_screen.dart';
import '../widgets/feature_tile.dart';
import '../services/api_client.dart';

class HomeScreen extends StatelessWidget {
  final ApiClient api;
  const HomeScreen({super.key, required this.api});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('GottaBuy')),
    body: ListView(children: [
      FeatureTile(icon: Icons.receipt, title: 'Receipts',
        subtitle: 'Start with demo; OCR is a stub',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReceiptScreen(api:api)))),
      FeatureTile(icon: Icons.inventory, title: 'Inventory', subtitle: 'Current quantities',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InventoryScreen(api:api)))),
      FeatureTile(icon: Icons.sell, title: 'Price history', subtitle: 'Historical receipt prices',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PricesScreen(api:api)))),
      FeatureTile(icon: Icons.shopping_cart, title: 'Shopping list', subtitle: 'Local demo list',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ShoppingListScreen()))),
      FeatureTile(icon: Icons.history, title: 'Purchases', subtitle: 'Saved receipt history',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PurchaseHistoryScreen(api: api)))),
      FeatureTile(icon: Icons.notifications, title: 'Restock', subtitle: 'Reminder demo',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RestockScreen()))),
      FeatureTile(icon: Icons.qr_code_scanner, title: 'Barcode', subtitle: 'Lookup stub',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BarcodeScreen()))),
    ]),
  );
}
