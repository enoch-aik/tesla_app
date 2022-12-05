import 'package:flutter/material.dart';
import 'package:tesla_app/constants/color.dart';

Widget acControl() => Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: kBlueColor,
          shape: BoxShape.circle,
          border: Border.all(color: scaffoldBg2, width: 16.0)),
    );
