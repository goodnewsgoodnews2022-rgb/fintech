import 'package:fintech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      // --- Teammate Fallback Placeholders ---
      GoRoute(
        path: login,
        builder: (context, state) => const Scaffold(
          backgroundColor: AppColors.bgCanvas,
          body: Center(child: Text('Login Screen (Dev 2 Work Area)', style: TextStyle(color: Colors.white))),
        ),
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.bgCanvas,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dashboard Hub (Dev 3 Work Area)', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.push(settings),
                  child: const Text('Go to Settings Menu'),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}