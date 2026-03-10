import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'premium_card.dart';

class ModelChip extends StatelessWidget {
  final String name;
  final String detail;
  final Color color;
  final bool isRecommended;
  final int stepNumber;
  final int targetStep;

  const ModelChip({
    super.key,
    required this.name,
    required this.detail,
    required this.color,
    required this.isRecommended,
    required this.stepNumber,
    this.targetStep = 5,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
          baseColor: color,
          isHighlighted: isRecommended,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (isRecommended) ...[
                    Icon(Icons.star, color: color, size: 28),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: isRecommended ? color : Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 18,
                  color: isRecommended
                      ? color.withValues(alpha: 0.9)
                      : const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        )
        .animate(target: stepNumber >= targetStep ? 1.0 : 0.0)
        .fade(duration: 500.ms)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOutQuad,
        );
  }
}
