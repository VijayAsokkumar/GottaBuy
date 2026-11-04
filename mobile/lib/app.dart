import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/api_client.dart';

class GottaBuyApp extends StatefulWidget {
  const GottaBuyApp({super.key});
  @override
  State<GottaBuyApp> createState() => _GottaBuyAppState();
}
class _GottaBuyAppState extends State<GottaBuyApp> {
  late final ApiClient api = ApiClient(baseUrl: const String.fromEnvironment(
    'API_BASE_URL', defaultValue: 'http://localhost:8000'));
  @override
  void dispose() { api.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'GottaBuy', theme: ThemeData(useMaterial3:true, colorSchemeSeed: Colors.teal),
    home: HomeScreen(api:api),
  );
}
