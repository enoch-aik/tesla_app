import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/images.dart';

Widget carCard() {
  return SizedBox(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('297',
                  style: TextStyle(
                    fontSize: 188.sp,
                    color: lightText,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Gilroy',
                  )),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Text(/*'\u1d4f\u1d50',*/ ' km',
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: lightText,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Image.asset(carSide),
        )
      ],
    ),
  );
}
