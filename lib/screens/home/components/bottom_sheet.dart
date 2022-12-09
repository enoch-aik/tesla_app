import 'dart:math' as math;

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/icons.dart';
import 'package:tesla_app/widgets/button.dart';
import 'package:tesla_app/widgets/text.dart';

import 'ac_mode.dart';
import 'ac_slider.dart';
import 'fan_slider.dart';

class HomeBottomSheet extends StatefulWidget {
  final ScrollController scrollController;

  const HomeBottomSheet({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  int temperature = 0;
  ValueNotifier<bool> ac = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: scaffoldBg2,
        depth: 1,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        border: const NeumorphicBorder(width: 2, color: scaffoldBg1),
      ),
      child: ListView(padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
        controller: widget.scrollController,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              /*onVerticalDragDown: (DragDownDetails details){
                              },*/
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  width: 60.w,
                  height: 5.h,
                  color: const Color(0xff17181C),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                      valueListenable: ac,
                      builder: (context, acState, _) {
                        return KText(
                          'A/C is ${acState ? 'ON' : 'OFF'}',
                          fontWeight: FontWeight.w900,
                          fontSize: 24.sp,
                        );
                      }),
                  SizedBox(height: 6.h),
                  KText(
                    'Tap to turn off or swipe up  for a fast setup',
                    color: darkText,
                    fontSize: 18.sp,
                  ),
                ],
              ),
              CustomButton(
                height: 80.h,
                isSelected: ac.value,
                width: 80.h,
                isReactive: true,
                iconPath: powerIcon,
                iconWidth: 70.w,
                onTap: () {
                  ac.value = !ac.value;
                },
              ),
            ],
          ),
          SizedBox(
            height: 400.w,
            child: ACControl(
              acState: ac,
              onTempChanged: (angle) {
                temperature = ((angle / (math.pi * 2)) * 100).toInt();
                setState(() {});
              },
            ),
          ),
          const FanSlider(),
          Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: const ACMode(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ac.dispose();
  }
}
