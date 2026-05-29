// lib/app/config/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';

class AppRouter {
  // Named Route Location Identifiers
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String settings = '/settings';

  /// Centralized Navigator Key tracking for global notifications/dialog overlays
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: splash,
    debugLogDiagnostics: true, // Prints route updates directly to console for testing
    
    // ====================================================================
    // AUTH ROUTE GUARD (Dynamic Session Interceptor)
    // ====================================================================
    redirect: (BuildContext context, GoRouterState state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggingIn = state.matchedLocation == login;

      // If user isn't logged in and not on the splash/login track, force them to login
      if (session == null && state.matchedLocation != splash && !isLoggingIn) {
        return login;
      }
      
      // If user is already authenticated but trying to go to login, send them straight to dashboard
      if (session != null && isLoggingIn) {
        return dashboard;
      }

      return null; // Return null to proceed normally to the requested route
    },
    
    // ====================================================================
    // SCREEN DECLARATION MAPS
    // ====================================================================
    routes: [
      // Part of your app_router.dart configuration setup:
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(), // Launches the splash gateway first
),
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      
      // ------------------------------------------------------------------
      // Teammate Placeholder Screens (Keeps compilation working)
      // ------------------------------------------------------------------
      GoRoute(
        path: login,
        builder: (context, state) => const Scaffold(
          backgroundColor: Color(0xFF0A0E17),
          body: Center(child: Text('Onboarding/Auth\n(Developer 2 Work Area)', 
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16))),
        ),
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => Scaffold(
          backgroundColor: const Color(0xFF0A0E17),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Unified Portfolio Dashboard\n(Developer 3 Work Area)', 
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF161F30)),
                  onPressed: () => context.push(settings),
                  child: const Text('Open Settings Shell', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    ],
    
    // Global Fallback Error Routing View Setup
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Routing Path Error: ${state.error}')),
    ),
  );
}