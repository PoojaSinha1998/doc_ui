
import 'package:doc_app/widgets/text_component.dart';
import 'package:flutter/material.dart';

import '../constant/custom_colors.dart';

class HelperText extends StatelessWidget {
  final String text;
  final Color? textColor;
  const HelperText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: myText(
          text,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: textColor ?? CustomColors.brightOrange,
        ),
      ),
    );
  }
}
