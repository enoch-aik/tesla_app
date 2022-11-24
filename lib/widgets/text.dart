import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla_app/constants/color.dart';

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? lineHeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final bool isNeumorphic;

  const KText(this.text,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.lineHeight,
      this.textAlign,
      this.isNeumorphic = false,
      this.decoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNeumorphic
        ? NeumorphicText(
            text,
            textAlign: textAlign ?? TextAlign.center,
            style: NeumorphicStyle(color: color ?? lightText,depth: 1),
            textStyle: NeumorphicTextStyle(
                fontSize: fontSize ?? 18.sp,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: fontWeight ?? FontWeight.w400,
                height: lineHeight),
          )
        : Text(
            text,
            textAlign: textAlign,
            overflow: overflow,
            style: GoogleFonts.lato().copyWith(
                decoration: decoration,
                fontSize: fontSize ?? 18.sp,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? lightText,
                height: lineHeight),
          );
  }
}
