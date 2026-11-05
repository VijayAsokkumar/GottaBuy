import 'package:flutter/material.dart';

class ErrorPanel extends StatelessWidget {
  final Object error;
  const ErrorPanel({super.key, required this.error});
  @override
  Widget build(BuildContext context) => Center(child: Padding(
    padding: const EdgeInsets.all(20), child: Text('Unable to load: $error')));
}
