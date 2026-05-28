import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CryptoAssetTile extends StatelessWidget {
  final String tokenName;
  final String tokenSymbol;
  final double cryptoBalance;
  final double fiatValue;
  final IconData tokenIcon;

  const CryptoAssetTile({
    super.key,
    required this.tokenName,
    required this.tokenSymbol,
    required this.cryptoBalance,
    required this.fiatValue,
    required this.tokenIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.dev3Purple.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Token Graphic Icon Frame
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.bgCanvas,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.dev3Purple.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Icon(tokenIcon, color: AppColors.dev3Purple, size: 24),
          ),
          const SizedBox(width: 14),
          // Token Label Hierarchy
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tokenName,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                tokenSymbol,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Financial Metric Calculations
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cryptoBalance.toString(),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${fiatValue.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}