import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final EdgeInsetsGeometry padding;
  final bool isHighlighted;

  const PremiumCard({
    super.key,
    required this.child,
    required this.baseColor,
    this.padding = const EdgeInsets.all(24),
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.7), // Slate 800
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isHighlighted ? baseColor : baseColor.withValues(alpha: 0.3),
          width: isHighlighted ? 2 : 1,
        ),
        boxShadow: [
          if (isHighlighted)
            BoxShadow(
              color: baseColor.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
