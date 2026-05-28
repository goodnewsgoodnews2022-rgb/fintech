import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AddressFrame extends StatelessWidget {
  final String fullAddress;

  const AddressFrame({
    super.key,
    required this.fullAddress,
  });

  // Automatically truncates addresses to match your Track 3 blueprint style: 0x7a...4b2f
  String get _truncatedAddress {
    if (fullAddress.length <= 10) return fullAddress;
    final String start = fullAddress.substring(0, 4);
    final String end = fullAddress.substring(fullAddress.length - 4);
    return '$start...$end';
  }

  @override
  Widget build(BuildContext context) {
    final Color trackPurple = AppColors.dev3Purple;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: trackPurple.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.vpn_key_outlined, color: trackPurple, size: 16),
          const SizedBox(width: 8),
          Text(
            _truncatedAddress,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}