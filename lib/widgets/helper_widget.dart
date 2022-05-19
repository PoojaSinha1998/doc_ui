import 'package:flutter/material.dart';

import '../../../widgets/text_component.dart';

// screen widhth

const double sWidth = 20.0;
const double sWidthMax = 40.0;

//sizedbox height
const SizedBox size0h05 = SizedBox(height: 05);
const SizedBox size0h10 = SizedBox(height: 10);
const SizedBox size0h15 = SizedBox(height: 15);
const SizedBox size0h20 = SizedBox(height: 20);
const SizedBox size0h25 = SizedBox(height: 25);
const SizedBox size0h40 = SizedBox(height: 40);

//sizedbox width
const SizedBox size0w10 = SizedBox(width: 10);

Widget title({required String text, EdgeInsetsGeometry? padding}) => Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: myText(
        text,
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
      ),
    );

Widget subtitle(String text) => myText(
      text,
      fontSize: 27.0,
      fontWeight: FontWeight.bold,
    );
