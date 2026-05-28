// lib/app/app.dart

import 'package:flutter/material.dart';
import 'config/app_router.dart';
import 'config/environment.dart';
import '../core/theme/app_colors.dart';

class FintechApp extends StatefulWidget {
  const FintechApp({super.key});

  @override
  State<FintechApp> createState() => _FintechAppState();
}

class _FintechAppState extends State<FintechApp> {
  @override
  void initState() {
    super.initState();
    // Validate configuration safety parameters immediately upon boot sequence
    Environment.validate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Premium Multi-Currency Engine',
      debugShowCheckedModeBanner: false,
      
      // Hook up your global GoRouter configuration grid
      routerConfig: AppRouter.router,
      
      // ====================================================================
      // PROFESSIONAL DARK MODE DESIGN IMPLEMENTATION
      // ====================================================================
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgCanvas,
        primaryColor: AppColors.dev1Silver,
        
        // Define clean global text parameters
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
        
        // Match interactive button layouts to your design tokens
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgCanvas,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
      ),
    );
  }
}