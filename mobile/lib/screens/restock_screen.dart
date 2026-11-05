import 'package:flutter/material.dart';
import '../services/restock_service.dart';

class RestockScreen extends StatefulWidget {
  const RestockScreen({super.key});
  @override
  State<RestockScreen> createState() => _RestockScreenState();
}
class _RestockScreenState extends State<RestockScreen> {
  String status = 'No reminders configured';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Restock reminders')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(status), const SizedBox(height: 16),
      FilledButton(onPressed: () {
        final reminder = RestockService().schedule('Milk', DateTime.now(), 7);
        setState(() => status = 'Milk due ${reminder.dueAt.toLocal().toString().split(' ')[0]}');
      }, child: const Text('Create demo reminder')),
      const Text('TODO: connect purchase history and notification scheduling.'),
    ])));
}
