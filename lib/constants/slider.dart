import 'dart:math' as math;

import 'package:flutter/gestures.dart';

const fullAngleInRadians = math.pi * 2;




double normalizeAngle(double angle) => normalize(angle, fullAngleInRadians);

Offset toPolar(Offset center, double radians, double radius) =>
    center + Offset.fromDirection(radians, radius);

double normalize(double value, double max) => (value % max + max) % max;

double toAngle(Offset position, Offset center) => (position - center).direction;

double toRadian(double value) => (value * math.pi) / 180;

double radianToAngle(double radians) => (2 * math.pi * radians);
