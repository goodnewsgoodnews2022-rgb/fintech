// lib/main.dart
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/network/supabase_client.dart';

Future<void> main() async {
  // 1. Ensure engine hardware binding layer is fully ready
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize your newly created shared initialization engine
  await SupabaseClientService.instance.initialize();

  // 3. Mount and boot your application shell frame
  runApp(const FintechApp());
}