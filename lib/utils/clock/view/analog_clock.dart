import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paint/utils/clock/provider/clock_provider.dart';
import 'package:paint/utils/constants/color.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;
  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final fillBrush = Paint()..color = const Color(0xFF444974);
    final outlineBrush = Paint()
      ..color = whiteColor
      ..strokeWidth = size.width * 0.07
      ..style = PaintingStyle.stroke;
    final centerDotBrush = Paint()..color = whiteColor;

    final secHandBrush = Paint()
      ..color = orangeColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.015;
    final minHandBrush = Paint()
      ..color = orangeColor
      ..shader = RadialGradient(colors: [minColorA, minColorB])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.025;
    final hourHandBrush = Paint()
      ..color = orangeColor
      ..shader = RadialGradient(colors: [hourColorA, hourColorB])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.04;

    final secHandX =
        centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    final secHandY =
        centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    final minHandX =
        centerX + radius * 0.45 * cos(dateTime.minute * 6 * pi / 180);
    final minHandY =
        centerX + radius * 0.45 * sin(dateTime.minute * 6 * pi / 180);
    final hourHandX = centerX +
        radius *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final hourHandY = centerX +
        radius *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawCircle(center, radius * 0.76, fillBrush);
    canvas.drawCircle(center, radius * 0.76, outlineBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, radius * 0.1, centerDotBrush);

    final outerCircleRadius = radius * 0.76 - size.width * 0.03;
    var innerCircleRadius = outerCircleRadius * 0.95;

    final dashBrush = Paint()
      ..color = whiteColor
      ..strokeWidth = 1.5;

    for (double i = 0; i < 360; i += 6) {
      final x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      final y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      innerCircleRadius = outerCircleRadius * 0.92;
      if (i == 0 || i == 90 || i == 180 || i == 270) {
        innerCircleRadius = outerCircleRadius * 0.8;
      }
      final x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      final y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      // if (i == 0 || i == 90 || i == 180 || i == 270) {
      //   TextSpan span =
      //       TextSpan(style: TextStyle(color: Colors.blue[800]), text: '1');
      //   TextPainter tp = TextPainter(
      //       text: span,
      //       // textAlign: TextAlign.left,
      //       textDirection: TextDirection.rtl);
      //   tp.layout();
      //   tp.paint(canvas, Offset(x1, y1));
      // }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AnalogClockView extends ConsumerStatefulWidget {
  final double size;
  const AnalogClockView({Key? key, required this.size}) : super(key: key);

  @override
  ConsumerState<AnalogClockView> createState() => _ClockViewState();
}

class _ClockViewState extends ConsumerState<AnalogClockView> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(clockProvider.notifier).updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    final clock = ref.watch(clockProvider);
    return SizedBox(
      height: 0.8 * widget.size,
      width: 0.8 * widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(dateTime: clock),
        ),
      ),
    );
  }
}
