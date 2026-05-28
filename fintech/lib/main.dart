// lib/main.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app.dart';

Future<void> main() async {
  // 1. Ensure the engine binding layer is completely native-initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Establish the secure global handshake with your Supabase backend
  // TODO: Replace placeholders with your actual Supabase dashboard credentials
  await Supabase.initialize(
    url: 'https://gisrbsjzzdtmvjsdnyym.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdpc3Jic2p6emR0bXZqc2RueXltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4MDA2OTIsImV4cCI6MjA5NTM3NjY5Mn0.crAdaSg4O6rxqwk6mdibpfdHCVoG_xOf2KPXwxH2zbM',
  );

  // 3. Mount and boot your architectural shell framework 
  runApp(const FintechApp());
}