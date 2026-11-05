import 'package:flutter/material.dart';
import '../models/receipt.dart';
import '../services/api_client.dart';

class ReceiptReviewScreen extends StatefulWidget {
  final ApiClient api;
  final Receipt receipt;
  const ReceiptReviewScreen({super.key, required this.api, required this.receipt});
  @override
  State<ReceiptReviewScreen> createState() => _ReceiptReviewScreenState();
}
class _ReceiptReviewScreenState extends State<ReceiptReviewScreen> {
  bool saving = false;
  String? error;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Review receipt')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      Text(widget.receipt.storeName),
      Expanded(child: ListView(children: widget.receipt.lines.map((line) => ListTile(
        title: Text(line.productName),
        subtitle: Text('${line.quantity} ${line.unit}'),
        trailing: Text(line.totalPrice.toStringAsFixed(2)))).toList())),
      if (error != null) Text(error!),
      FilledButton(onPressed: saving ? null : () async {
        setState(() { saving = true; error = null; });
        try {
          await widget.api.saveReceipt(widget.receipt);
          if (context.mounted) Navigator.pop(context, true);
        } catch (e) { if (mounted) setState(() => error = e.toString()); }
        finally { if (mounted) setState(() => saving = false); }
      }, child: const Text('Confirm and save')),
    ])));
}
