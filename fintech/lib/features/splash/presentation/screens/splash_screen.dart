import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../app/config/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAppSession();
  }

  Future<void> _initializeAppSession() async {
    // Simulate checking the Supabase auth session token state
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      // Direct user to onboarding/login or the main dashboard portfolio
      context.go(AppRouter.dashboard); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgCanvas,
      body: Stack(
        children: [
          Center(
            child: Text(
              'G R E Y', // Replace with your actual vector brand asset logo image
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 40,
            right: 40,
            child: LinearProgressIndicator(
              color: AppColors.dev1Silver,
              backgroundColor: AppColors.bgSurface,
              minHeight: 2,
            ),
          )
        ],
      ),
    );
  }
}