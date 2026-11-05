import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const FeatureTile({super.key, required this.icon, required this.title,
    required this.subtitle, required this.onTap});
  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon), title: Text(title), subtitle: Text(subtitle), onTap: onTap);
}
