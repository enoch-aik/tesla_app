import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/widgets/text.dart';

Widget status(
    {required String iconPath, required String title, required String detail}) {
  return Padding(
    padding:  EdgeInsets.only(right: 40.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: SvgPicture.asset('assets/icons/$iconPath.svg'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText(
              title,
              color: darkText,
              fontSize: 18.sp,
            ),
            SizedBox(height: 8.h),
            KText(
              detail,
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            )
          ],
        )
      ],
    ),
  );
}
