import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/icons.dart';
import 'package:tesla_app/screens/home/components/mode_button.dart';
import 'package:tesla_app/widgets/text.dart';

class ACMode extends StatefulWidget {
  const ACMode({Key? key}) : super(key: key);

  @override
  State<ACMode> createState() => _ACModeState();
}

class _ACModeState extends State<ACMode> {
  @override
  Widget build(BuildContext context) {
    List<String> modes = ['Auto', 'Dry', 'Cool', 'Program'];
    List<String> modeIcons = [autoIcon, dryIcon, coolIcon, programIcon];
    ValueNotifier<List<bool>> modeValue = ValueNotifier([false,false,false,false]);
    List<bool> values = [false,false,false,false];
    void onChanged(bool val, int index, List currentVal) {
      setState(() {
        values = List.generate(4, (i) {
          return i == index ? val : currentVal[i];
        });
      });
    }
    return Column(
      children: [
        KText(
          'Mode',
          fontSize: 24.sp,
          fontWeight: FontWeight.w900,
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: KText(
                    modes[index],
                    fontSize: 18.sp,
                    color: darkText,
                  ),
                ),
                ACModeButton(
                  valueNotifier: values,
                  index: index,
                  iconPath: modeIcons[index],

                  //TODO: SIMPLIFY ICON WIDTH
                  iconWidth: index == 0
                      ? 55.w
                      : index == 1
                          ? 15.w
                          : 20.w, isSelected: false,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
