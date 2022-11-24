import 'package:flutter/material.dart';

enum CurveType { concave, convex, flat }

class NeumorphicWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final int? depth;
  final Color? primaryColor;
  final Color? borderColor;
  final double? borderThickness;
  final double? shadowSpread;
  final Widget? child;
  final double? borderRadius;
  final BorderRadius? customRadius;
  final CurveType? curveType;

  const NeumorphicWidget({
    super.key,
    this.child,
    this.height,
    this.width,
    this.depth,
    this.borderThickness,
    this.primaryColor,
    this.borderColor,
    this.shadowSpread,
    this.borderRadius,
    this.customRadius,
    this.curveType,
  });

  List<Color> smoothGradient(baseColor, depth) {
    return [
      baseColor,
      baseColor,
    ];
  }

  List<Color> concaveGradients(baseColor, depth) {
    return [
      _baseColor(baseColor, 0 - depth),
      _baseColor(baseColor, depth),
    ];
  }

  List<Color> convexGradients(baseColor, depth) {
    return [
      _baseColor(baseColor, depth),
      _baseColor(baseColor, 0 - depth),
    ];
  }

  Color _baseColor(Color color, amount) {
    Map colors = {"red": color.red, "green": color.green, "blue": color.blue};
    colors = colors.map((key, value) {
      if (value + amount < 0) return MapEntry(key, 0);
      if (value + amount > 255) return MapEntry(key, 255);
      return MapEntry(key, value + amount);
    });
    return Color.fromRGBO(colors["red"], colors["green"], colors["blue"], 1);
  }

  @override
  Widget build(BuildContext context) {
    final double? heightValue = height;
    final double? widthValue = width;
    final int depthValue = depth ?? 20;
    late bool eValue = false;
    Color colorValue = primaryColor ?? const Color(0xFFf0f0f0);
    final double spreadValue = shadowSpread ?? 6;
    eValue = false;
    BorderRadius borderRadiusValue = borderRadius == null
        ? BorderRadius.zero
        : BorderRadius.circular(borderRadius!);
    final double thicknessValue = borderThickness ?? 0;
    Border borderValue = borderColor == null
        ? Border.all(color: Colors.transparent, width: thicknessValue)
        : Border.all(color: borderColor!, width: thicknessValue);

    if (customRadius != null) {
      borderRadiusValue = customRadius!;
    }
    final CurveType curveTypeValue = curveType ?? CurveType.flat;

    List<BoxShadow> shadowList = [
      BoxShadow(
          color: _baseColor(colorValue, eValue ? 0 - depthValue : depthValue),
          offset: Offset(0 - spreadValue, 0 - spreadValue),
          blurRadius: spreadValue),
      BoxShadow(
          color: _baseColor(colorValue, eValue ? depthValue : 0 - depthValue),
          offset: Offset(spreadValue, spreadValue),
          blurRadius: spreadValue)
    ];

    if (eValue) {
      shadowList = shadowList.reversed.toList();
    }
    if (eValue) {
      colorValue = _baseColor(colorValue, 0 - depthValue ~/ 2);
    }

    List<Color> gradientColors;
    switch (curveTypeValue) {
      case CurveType.concave:
        gradientColors = concaveGradients(colorValue, depthValue);
        break;
      case CurveType.convex:
        gradientColors = convexGradients(colorValue, depthValue);
        break;
      case CurveType.flat:
        gradientColors = smoothGradient(colorValue, depthValue);
        break;
    }

    return Container(
      height: heightValue,
      width: widthValue,
      decoration: BoxDecoration(
          border: borderValue,
          borderRadius: borderRadiusValue,
          color: colorValue,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors),
          boxShadow: shadowList),
      child: child,
    );
  }
}
