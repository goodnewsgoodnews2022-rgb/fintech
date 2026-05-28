import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class InterlockingSwapButton extends StatefulWidget {
  final VoidCallback onSwapPressed;

  const InterlockingSwapButton({
    super.key,
    required this.onSwapPressed,
  });

  @override
  State<InterlockingSwapButton> createState() => _InterlockingSwapButtonState();
}

class _InterlockingSwapButtonState extends State<InterlockingSwapButton> {
  double _turns = 0.0;

  void _handleTap() {
    setState(() {
      _turns += 0.5; // Smoothly spins the arrows 180 degrees on tap
    });
    widget.onSwapPressed();
  }

  @override
  Widget build(BuildContext context) {
    final Color trackPurple = AppColors.dev3Purple;

    return Center(
      child: AnimatedRotation(
        turns: _turns,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: InkWell(
          onTap: _handleTap,
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: trackPurple, // Your solid Electric Purple theme token
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: trackPurple.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.swap_vert_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}