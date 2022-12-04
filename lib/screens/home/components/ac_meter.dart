import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/slider.dart';

double radius = 90;
double strokeWidth = 40;

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  const CircularSlider({
    Key? key,
    required this.onAngleChanged,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double currentAngle = 0;

  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
        center - Offset(strokeWidth + 6.7, -strokeWidth + 19.5),
        currentAngle + startAngle,
        radius);

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: SliderPainter(
            startAngle: startAngle,
            currentAngle: currentAngle,
          ),
          child: Container(),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: _Knob(),
          ),
        ),
      ],
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    const int meterPoints = 8;
    const int spaceLength = 40;

    double startOfArcInDegree = toRadian(90);

    double meterLength = (360 - (meterPoints * spaceLength)) / meterPoints;

    if (meterLength <= 0) {
      meterLength = 360 / spaceLength - 1;
    }

    Offset center = size.center(Offset.zero);
    Rect meterRect = Rect.fromCircle(center: center, radius: radius + 40);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..color = const Color(0xff005696)
      //..shader = SweepGradient(colors: colors).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < meterPoints; i++) {
      //printing the arc
      canvas.drawArc(
          meterRect,
          toRadian(startOfArcInDegree + 90),
          toRadian(1),
          false,
          Paint()
            ..color = currentAngle >= toRadian(startOfArcInDegree)
                ? kBlueColor
                : const Color(0xff15171C)
            ..strokeWidth = 10
            ..style = PaintingStyle.stroke);
      startOfArcInDegree += meterLength + spaceLength;
    }
    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth + 15,
    );

    canvas.drawArc(
        rect,
        startAngle,
        math.pi * 2,
        false,
        Paint()
          ..color = const Color(0xff1F2124).withOpacity(0.7)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth);
    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  const _Knob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: kBlueColor,
          shape: BoxShape.circle,
          border: Border.all(color: scaffoldBg2, width: 16.0)),
    );
  }
}
