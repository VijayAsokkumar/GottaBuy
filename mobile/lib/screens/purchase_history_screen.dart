import 'package:flutter/material.dart';
import '../services/api_client.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  final ApiClient api;
  const PurchaseHistoryScreen({super.key, required this.api});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Purchase history')),
    body: FutureBuilder<List<Map<String, dynamic>>>(
      future: api.loadPurchases(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        if (snapshot.data!.isEmpty) return const Center(child: Text('No purchases yet'));
        return ListView(children: snapshot.data!.map((row) => ListTile(
          title: Text('${row['store_name'] ?? 'Unknown store'}'),
          subtitle: Text('${row['purchased_at'] ?? ''}'),
          trailing: Text('${(row['items'] as List?)?.length ?? 0} items'))).toList());
      }));
}
