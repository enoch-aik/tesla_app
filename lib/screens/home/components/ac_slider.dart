import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/slider.dart';
import 'package:tesla_app/widgets/text.dart';

import 'ac_control.dart';

double radius = 90;
double strokeWidth = 40;

class ACControl extends StatefulWidget {
  final ValueChanged<double> onTempChanged;
  final ValueNotifier<bool> ac;

  const ACControl({
    Key? key,
    required this.ac,
    required this.onTempChanged,
  }) : super(key: key);

  @override
  State<ACControl> createState() => _ACControlState();
}

class _ACControlState extends State<ACControl> {
  Offset initialOffset = Offset.zero;

  double currentAngle = 0.9;

  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  int temperature = 16;

  @override
  Widget build(BuildContext context) {
    Size sliderSize = MediaQuery.of(context).size;
    Size canvasSize = Size(sliderSize.width, sliderSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
        center - Offset(strokeWidth + 6.7, -strokeWidth + 56.5),
        currentAngle + startAngle,
        radius);

    return ValueListenableBuilder(
        valueListenable: widget.ac,
        builder: (context, acState, _) {
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
              if (widget.ac.value)
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KText(
                        '$temperature°C',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 45.sp,
                      ),
                      KText(
                        'Cooling...',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                ),
              Positioned(
                left: knobPos.dx,
                top: knobPos.dy,
                child: GestureDetector(
                  onPanStart: (details) {
                    RenderBox getBox = context.findRenderObject() as RenderBox;
                    initialOffset =
                        getBox.globalToLocal(details.globalPosition);
                  },
                  onPanUpdate: (details) {
                    if (acState) {
                      var previousOffset = initialOffset;
                      initialOffset += details.delta;
                      var angle = currentAngle +
                          toAngle(initialOffset, center) -
                          toAngle(previousOffset, center);
                      if (angle <= 6.10865 && angle >= 0) {
                        currentAngle = normalizeAngle(angle);
                        widget.onTempChanged(currentAngle);
                        getTemperature(angle);
                        setState(() {});
                      }
                    }
                  },
                  child: acControl(),
                ),
              ),
            ],
          );
        });
  }

  getTemperature(double radians) {
    double addedTemp = radians * (180 / math.pi) / 360 * 18;
    int newTemperature = 16 + addedTemp.toInt();
    setState(() {
      temperature = newTemperature;
    });
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

    for (int i = 0; i < meterPoints - 1; i++) {
      //printing the arc
      canvas.drawArc(
        rect,
        startAngle,
        math.pi * 2,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth = strokeWidth,
      );
      canvas.drawArc(
          meterRect,
          toRadian(startOfArcInDegree + 135),
          toRadian(1),
          false,
          Paint()
            ..color = currentAngle >= toRadian(startOfArcInDegree + 45)
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
          ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth);
    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
