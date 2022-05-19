
import 'package:doc_app/widgets/text_component.dart';
import 'package:doc_app/widgets/widget_shadow.dart';
import 'package:flutter/material.dart';

import 'helper_widget.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBackArrow;
  final EdgeInsetsGeometry? padding;
  const CustomAppBar({
    Key? key,
    this.showBackArrow = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??  EdgeInsets.symmetric(horizontal: sWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackArrow)
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),

          size0w10,
          myText(
            'DOCTOR-DENTIST',
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
