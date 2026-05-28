import 'package:flutter/material.dart';
import 'config/app_router.dart';
import '../core/theme/app_colors.dart';

class FintechApp extends StatelessWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Premium Fintech Engine',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgCanvas,
        primaryColor: AppColors.dev1Silver,
        fontFamily: 'SanFrancisco', // Use your system preferred premium font family
      ),
    );
  }
}