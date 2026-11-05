import 'package:flutter/material.dart';
import '../services/barcode_lookup_service.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});
  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}
class _BarcodeScreenState extends State<BarcodeScreen> {
  final barcode = TextEditingController();
  String status = 'Barcode scanning and lookup are not implemented.';
  @override
  void dispose() { barcode.dispose(); super.dispose(); }
  Future<void> lookup() async {
    try {
      final product = await BarcodeLookupService().lookup(barcode.text.trim());
      if (!mounted) return;
      setState(() => status = product?.name ?? 'Product not found');
    } catch (e) { if (mounted) setState(() => status = e.toString()); }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Barcode lookup')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: barcode, decoration: const InputDecoration(labelText: 'Barcode')),
      FilledButton(onPressed: lookup, child: const Text('Look up product')),
      Text(status),
    ])));
}
