import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla_app/constants/color.dart';

class FanSliderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double fanSpeedSize = 0;
    RRect rRect = RRect.fromLTRBR(
        0, size.height, size.width, size.height + 5, const Radius.circular(10));
    Path shadowPath = Path()..addRRect(rRect);

    canvas.drawRRect(rRect, Paint()..color = const Color(0xff282B2E));
    canvas.drawShadow(shadowPath, const Color(0xff4E5154), 3, false);

    for (int i = 1; i <= 5; i++) {
      final textPainter = TextPainter(
          text: TextSpan(
            text: i.toString(),
            style: GoogleFonts.lato(
              color: darkText,
              fontSize: 14.sp,
            ),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center);
      textPainter.layout();
      final offset = Offset(fanSpeedSize, -(2.5 * size.height));
      textPainter.paint(canvas, offset);
      fanSpeedSize += size.width / 4.08;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
