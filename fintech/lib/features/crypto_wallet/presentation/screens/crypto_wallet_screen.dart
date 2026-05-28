import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/address_frame.dart';
import '../widgets/crypto_asset_tile.dart';

class CryptoWalletScreen extends StatelessWidget {
  const CryptoWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCanvas,
      appBar: AppBar(
        title: const Text(
          'Web3 Assets',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Your custom Track 3 address frame display block
              const Center(
                child: AddressFrame(
                  fullAddress: '0x7a89c31415926cdeba34b2f1122a90b8f3914b2f',
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'CONNECTED CHAINS',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              // List view displaying individual token assets
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CryptoAssetTile(
                      tokenName: 'Ethereum',
                      tokenSymbol: 'ETH',
                      cryptoBalance: 1.4502,
                      fiatValue: 4850.25,
                      tokenIcon: Icons.currency_bitcoin, // Standing in for coin icon token
                    ),
                    CryptoAssetTile(
                      tokenName: 'USD Coin',
                      tokenSymbol: 'USDC',
                      cryptoBalance: 2500.00,
                      fiatValue: 2500.00,
                      tokenIcon: Icons.monetization_on,
                    ),
                    CryptoAssetTile(
                      tokenName: 'Solana',
                      tokenSymbol: 'SOL',
                      cryptoBalance: 18.75,
                      fiatValue: 1920.40,
                      tokenIcon: Icons.token,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}