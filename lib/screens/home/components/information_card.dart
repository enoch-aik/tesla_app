import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/widgets/text.dart';

class InformationCard extends StatelessWidget {
  final bool enabled;
  final String bgPath;
  final String title;
  final String details;

  const InformationCard(
      {Key? key,
      required this.bgPath,
      this.enabled = true,
      required this.details,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 32.w),
      child: InkWell(
        onTap: () {},
        child: Neumorphic(
          style: const NeumorphicStyle(
              lightSource: LightSource.topLeft,
              shape: NeumorphicShape.concave,
              color: Colors.transparent,
              depth: 10,
              shadowLightColor: Colors.white12,
              shadowDarkColor: scaffoldBg2),
          child: SizedBox(
            height: 160.w,
            width: 150.w,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/$bgPath.png',
                ),
                Positioned(
                  bottom: 16.w,
                  left: 16.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        title,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: KText(
                          details,
                          fontSize: 18.sp,
                          color: darkText,
                        ),
                      ),
                    ],
                  ),
                ),
                if (enabled)
                  Positioned(
                    top: 8.w,
                    left: 8.w,
                    child: Image.asset(
                      'assets/images/blue_light.png',
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
