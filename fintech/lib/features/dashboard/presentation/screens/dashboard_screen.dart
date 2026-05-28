import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/portfolio_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Fixed: Removed the leading underscore to comply with Dart linter standards
    final List<Widget> views = [
      // Track 3 Feature A: Main Portfolio Hub
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            PortfolioCard(
              totalBalance: 12450.85,
              cryptoAddress: '0x7a...4b2f',
            ),
          ],
        ),
      ),
      // Track 3 Feature B: Crypto Asset Workspace
      const Center(
        child: Text(
          'Web3 Wallets Container Coming Soon', 
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ),
      // Track 3 Feature C: Swap Engine Workspace
      const Center(
        child: Text(
          'FX Swap Engine Block Coming Soon', 
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.bgCanvas,
      body: SafeArea(child: views[_currentIndex]), // Updated here too
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bgSurface,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.dev3Purple,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.token_outlined), 
            activeIcon: Icon(Icons.token),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined), 
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Web3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle_outlined), 
            activeIcon: Icon(Icons.swap_horizontal_circle),
            label: 'Swap',
          ),
        ],
      ),
    );
  }
}