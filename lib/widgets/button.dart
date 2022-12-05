import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_app/constants/color.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final void Function() onTap;
  final String iconPath;
  final bool isReactive;
  final double? width;
  final double? height;
  final double? iconWidth;
  bool isSelected;

  CustomButton(
      {Key? key,
      required this.isSelected,
      required this.iconPath,
      required this.onTap,
      this.height,
      this.isReactive = true,
      this.iconWidth,
      this.width})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late bool isSelected = widget.isSelected;

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xff0081C9);
    const Color selectedBorderColor = Color(0xff11A8FD);

    return InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onTap();
        },
        child: Neumorphic(
          style: NeumorphicStyle(
              shape:
                  isSelected ? NeumorphicShape.concave : NeumorphicShape.convex,
              boxShape: const NeumorphicBoxShape.circle(),
              border: NeumorphicBorder(
                  width: 3,
                  color: widget.isReactive
                      ? isSelected
                          ? selectedBorderColor
                          : scaffoldBg1
                      : scaffoldBg1),
              depth: isSelected ? -5 : 3,
              /*shadowLightColor: Colors.transparent,
              shadowDarkColor: Color(0xff2E2E2E),*/
              lightSource: LightSource.topLeft,
              color: widget.isReactive
                  ? isSelected
                      ? selectedColor
                      : scaffoldBg2
                  : scaffoldBg2),
          child: Container(
            alignment: Alignment.center,
            height: widget.height ?? 63.w,
            width: widget.width ?? 63.w,
            child: SvgPicture.asset(
              widget.iconPath,
              color: widget.isReactive
                  ? isSelected
                      ? Colors.white
                      : darkText
                  : darkText,
              width: widget.iconWidth ?? 20.w,
            ),
          ),
        ));
  }
}
