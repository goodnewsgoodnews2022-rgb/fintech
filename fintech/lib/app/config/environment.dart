// lib/app/config/environment.dart

// ignore_for_file: avoid_print

/// Centralized Environment Configuration Manager.
/// This class safely abstracts sensitive API configurations away from direct code.
/// Launch variables are passed securely during compilation using environment keys:
/// e.g., flutter run --dart-define=SUPABASE_URL=https://xyz.supabase.co
class Environment {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://gisrbsjzzdtmvjsdnyym.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'placeholder-your-anonymous-api-public-key-string',
  );

  // You can easily scale this to include Web3 RPC Endpoints later:
  static const String mainnetRpcUrl = String.fromEnvironment(
    'MAINNET_RPC_URL',
    defaultValue: 'https://eth-mainnet.g.alchemy.com/v2/placeholder',
  );

  /// Helper to assert configurations are valid during development stages.
  static void validate() {
    if (supabaseUrl.contains('placeholder') || supabaseAnonKey.contains('placeholder')) {
      print('⚠️ WARNING: Supabase configurations are using fallback placeholder tokens. Ensure environment parameters are defined.');
    }
  }
}