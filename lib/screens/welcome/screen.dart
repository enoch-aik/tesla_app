import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/icons.dart';
import 'package:tesla_app/screens/home/screen.dart';
import 'package:tesla_app/screens/welcome/components/car_card.dart';
import 'package:tesla_app/widgets/button.dart';
import 'package:tesla_app/widgets/scaffold.dart';
import 'package:tesla_app/widgets/text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KScaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 20.w, bottom: 51.h),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  isSelected: false,
                  iconPath: settingsIcon,
                  onTap: () {},
                ),
              ),
            ),
            KText(
              'Tesla',
              color: darkText,
              fontSize: 24.sp,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: KText(
                'Cybertruck',
                color: lightText,
                fontSize: 50.sp,
                isNeumorphic: true,
                fontWeight: FontWeight.w900,
              ),
            ),
            carCard(),
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
              child: const KText('A/C is turned OFF', color: darkText),
            ),
            CustomButton(
              isReactive: true,
              height: 120.h,
              isSelected: true,
              width: 120.h,
              iconPath: lockIcon,
              iconWidth: 70.w,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: KText(
                'Tap to open the car',
                fontSize: 18.sp,
                color: lightText,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
