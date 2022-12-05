import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_app/constants/color.dart';

// ignore: must_be_immutable
class ACModeButton extends StatefulWidget {
  final String iconPath;
   List<bool> valueNotifier;
  final int index;
  final double? width;
  final double? height;
  final double? iconWidth;
  bool isSelected;

  ACModeButton(
      {Key? key,
      required this.isSelected,
      required this.index,
      required this.iconPath,
      required this.valueNotifier,
      this.height,
      this.iconWidth,
      this.width})
      : super(key: key);

  @override
  State<ACModeButton> createState() => _ACModeButtonState();
}

class _ACModeButtonState extends State<ACModeButton> {
  late bool isSelected = widget.valueNotifier[widget.index];

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xff0081C9);
    const Color selectedBorderColor = Color(0xff11A8FD);

    void onChanged(bool val, int index, List currentVal) {
      widget.valueNotifier = List.generate(4, (i) {
        return i == index ? val : currentVal[i];
      });
      isSelected = widget.valueNotifier[widget.index];
    }

    return InkWell(
              onTap: () {
                setState(() {
                  onChanged(!widget.valueNotifier[widget.index],
                      widget.index, widget.valueNotifier);

                });
                },
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: isSelected
                        ? NeumorphicShape.concave
                        : NeumorphicShape.convex,
                    boxShape: const NeumorphicBoxShape.circle(),
                    border: NeumorphicBorder(
                        width: 3,
                        color: isSelected
                            ? const Color(0xff454545)
                            : const Color(0xff1D2328)),
                    depth: isSelected ? -5 : 3,
                    //shadowDarkColor: isSelected? kBlueColor:Color(0xff454545),
                    lightSource: LightSource.topLeft,
                    color: isSelected
                        ? const Color(0xff1D2328)
                        : const Color(0xff2F353A)),
                child: Container(
                  alignment: Alignment.center,
                  height: widget.height ?? 63.w,
                  width: widget.width ?? 63.w,
                  child: SvgPicture.asset(
                    widget.iconPath,
                    color: isSelected ? Colors.white : darkText,
                    width: widget.iconWidth ?? 20.w,
                  ),
                ),
              ));
  }
}
