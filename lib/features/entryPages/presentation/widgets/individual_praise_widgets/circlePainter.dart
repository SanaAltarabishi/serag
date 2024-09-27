import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:serag/features/entryPages/presentation/pages/individual_praise_page.dart';

class CirclePainter extends CustomPainter {
  final int containerCount;
  final Color containerColor;
  final double containerRadius;
  final double containerTextSize;
  final double scrollPosition;
  final double circleSize;

  CirclePainter({
    required this.containerCount,
    required this.containerColor,
    required this.containerRadius,
    required this.containerTextSize,
    required this.scrollPosition,
    required this.circleSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2.2;

    final paint = Paint()..color = containerColor;

    // Draw each number at its position
    for (int index = 0; index < containerCount; index++) {
      // Compute the angle for this index, adjusted by scrollPosition
      final double angle =
          (2 * math.pi * index) / containerCount + scrollPosition;

      // Calculate the position of the item along the circle's circumference
      final double itemX = radius * math.cos(angle);
      final double itemY = radius * math.sin(angle);
      final Offset itemCenter = center.translate(itemX, itemY);

      // Draw the circle background if necessary (currently transparent)
      canvas.drawCircle(itemCenter, containerRadius, paint);

      // Save canvas state before rotation
      canvas.save();

      // Move the canvas to the text position and rotate it inversely to the angle
      canvas.translate(itemCenter.dx, itemCenter.dy);
      canvas.rotate(
          angle + math.pi / 2); // Rotate to face inward towards the center

      // Draw the text at the translated and rotated position
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${indexList[index]}',
          style: TextStyle(
            fontSize: containerTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

      // Restore the canvas state after drawing the text
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  animate({required int target, required Function(dynamic controller) onPlay, required void Function(dynamic controller) onComplete}) {}
}
