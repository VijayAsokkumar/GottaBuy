import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../models/inventory_item.dart';

class InventoryScreen extends StatelessWidget {
  final ApiClient api;
  const InventoryScreen({super.key, required this.api});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Current inventory')),
    body: FutureBuilder<List<InventoryItem>>(
      future: api.loadInventory(), builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        if (snapshot.data!.isEmpty) return const Center(child: Text('No purchases yet'));
        return ListView(children: snapshot.data!.map((item) => ListTile(
          title: Text(item.name), trailing: Text('${item.quantity} ${item.unit}'))).toList());
      }),
  );
}
