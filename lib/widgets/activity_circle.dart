import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ActivityCircle extends StatelessWidget {
  final double progress;
  final String value;
  final String label;
  final double size;
  final Color color;

  const ActivityCircle({
    super.key,
    required this.progress,
    required this.value,
    required this.label,
    this.size = 94,
    this.color = AppColors.neon,
  });

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 6,
              color: AppColors.border,
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: safeProgress),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            builder: (context, animatedValue, child) {
              return SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: animatedValue,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                  color: color,
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
