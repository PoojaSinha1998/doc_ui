
import 'package:flutter/material.dart';

import '../constant/custom_colors.dart';

class WidgetShadow extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final bool? shadow;
  const WidgetShadow(
      {Key? key,
      required this.child,
      this.height,
      this.padding,
      this.margin,
      this.borderRadius,
      this.width,
      this.color,
      this.shadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? CustomColors.cBackground,
          borderRadius: borderRadius ?? BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, -3),
                color:
                    shadow ?? true ? CustomColors.cWhite : Colors.transparent,
                blurRadius: 2),
            BoxShadow(
                offset: const Offset(-3, 3),
                color:
                    shadow ?? true ? CustomColors.darkGrey : Colors.transparent,
                blurRadius: 2),
          ]),
      child: child,
    );
  }
}
