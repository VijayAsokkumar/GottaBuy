import 'package:flutter/material.dart';
import '../services/api_client.dart';

class PricesScreen extends StatefulWidget {
  final ApiClient api;
  const PricesScreen({super.key, required this.api});
  @override
  State<PricesScreen> createState() => _PricesScreenState();
}
class _PricesScreenState extends State<PricesScreen> {
  final controller = TextEditingController(text: 'Milk');
  late Future<List<Map<String,dynamic>>> results;
  @override
  void initState() { super.initState(); results = widget.api.loadPrices('Milk'); }
  @override
  void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Historical prices')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: controller, decoration: const InputDecoration(labelText: 'Product')),
      ElevatedButton(onPressed: () => setState(() => results = widget.api.loadPrices(controller.text)),
        child: const Text('Compare')),
      const Text('Receipt history only — NOT live store prices.'),
      Expanded(child: FutureBuilder<List<Map<String,dynamic>>>(future: results,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return ListView(children: snapshot.data!.map((offer) => ListTile(
            title: Text('${offer['store_name']}'), subtitle: Text('${offer['purchased_at']}'),
            trailing: Text('${offer['currency']} ${offer['unit_price']}/${offer['unit']}'))).toList());
        })),
    ])),
  );
}
