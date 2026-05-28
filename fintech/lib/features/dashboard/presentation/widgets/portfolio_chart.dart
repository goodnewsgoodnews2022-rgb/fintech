import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({super.key});

  @override
  Widget build(BuildContext context) {
    final Color trackPurple = AppColors.dev3Purple;

    return Container(
      width: double.infinity,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: trackPurple.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PERFORMANCE ALL-TIME',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const Spacer(),
          // Visual Simulation of a Custom Web3 Performance Graph Line
          SizedBox(
            height: 130,
            width: double.infinity,
            child: CustomPaint(
              painter: _ChartLinePainter(lineColor: trackPurple),
            ),
          ),
        ],
      ),
    );
  }
}

// Optimized native canvas painter to draw a smooth, zero-dependency track graph line
class _ChartLinePainter extends CustomPainter {
  final Color lineColor;
  _ChartLinePainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [lineColor.withValues(alpha: 0.25), lineColor.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.8)
      ..cubicTo(size.width * 0.25, size.height * 0.9, size.width * 0.4, size.height * 0.2, size.width * 0.65, size.height * 0.4)
      ..cubicTo(size.width * 0.8, size.height * 0.5, size.width * 0.9, size.height * 0.1, size.width, size.height * 0.15);

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}