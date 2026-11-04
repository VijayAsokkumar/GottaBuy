import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/receipt_scanner.dart';

class ReceiptScreen extends StatefulWidget {
  final ApiClient api;
  const ReceiptScreen({super.key, required this.api});
  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}
class _ReceiptScreenState extends State<ReceiptScreen> {
  String message = 'Receipt OCR is not implemented yet.';
  final scanner = ReceiptScanner();
  Future<void> addDemo() async {
    try {
      await widget.api.saveReceipt(scanner.demoReceipt());
      setState(() => message = 'Demo receipt saved. Open Inventory to see the items.');
    } catch (error) { setState(() => message = 'API error: $error'); }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Receipt scanner')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(message), const SizedBox(height: 16),
      ElevatedButton(onPressed: addDemo, child: const Text('Add demo receipt')),
      const SizedBox(height: 8),
      const Text('TODO: Scan image, extract items, review and confirm before saving.'),
    ])),
  );
}
