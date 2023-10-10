import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

class SwingLeftWidget extends StatelessWidget {
  const SwingLeftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 150),
      painter: SwingLeftPainter(),
    );
  }
}

class SwingLeftPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = swing;

    final path = Path()
      ..moveTo(0, 420)
      ..lineTo(25, 400)
      ..lineTo(25, 600)
      ..lineTo(0, 620)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SwingRightWidget extends StatelessWidget {
  const SwingRightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: const Size(20, 150),
      painter: SwingRightPainter(w: width),
    );
  }
}

class SwingRightPainter extends CustomPainter {
  double w;
  SwingRightPainter({required this.w});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = swing;

    final path = Path()
      ..moveTo(w - 25, 400)
      ..lineTo(w, 420)
      ..lineTo(w, 620)
      ..lineTo(w - 25, 600)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
