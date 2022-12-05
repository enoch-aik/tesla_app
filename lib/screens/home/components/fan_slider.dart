import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/widgets/text.dart';

class FanSlider extends StatefulWidget {
  const FanSlider({Key? key}) : super(key: key);

  @override
  State<FanSlider> createState() => _FanSliderState();
}

class _FanSliderState extends State<FanSlider> {
  double fanSpeed = 0;

  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: KText(
            'Fan speed',
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 26.h, bottom: 4.h),
          child: Row(
            children: [
              ...List.generate(
                5,
                (index) {
                  if (index < 4) {
                    return Padding(
                      padding: EdgeInsets.only(right: widgetWidth / 5.4),
                      child: KText((index + 1).toString(),
                          fontSize: 14.sp, color: darkText),
                    );
                  } else {
                    return KText((index + 1).toString(),
                        fontSize: 14.sp, color: darkText);
                  }
                },
              )
            ],
          ),
        ),
        SizedBox(
          width: widgetWidth,
          child: NeumorphicTheme(
            theme: NeumorphicThemeData.dark(
              lightSource: LightSource.top,
              shadowLightColorEmboss: const Color(0xff4E5154),
              shadowDarkColorEmboss: Colors.black.withOpacity(0.7),
            ),
            child: NeumorphicSlider(
              value: fanSpeed,
              onChanged: (value) {
                setState(() {
                  fanSpeed = value;
                });
              },
              height: 8.h,
              style: const SliderStyle(
                  variant: kBlueColor, accent: kBlueColor, depth: -50),
              thumb: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                    color: kBlueColor,
                    border: Border.all(
                      color: scaffoldBg2,
                      width: 12.w,
                    ),
                    shape: BoxShape.circle),
              ),
            ),
          ),
        )
      ],
    );
  }
}
