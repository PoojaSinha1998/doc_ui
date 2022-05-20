import 'package:doc_app/constant/custom_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  var appVersion;

  LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: CustomColors.themeColor,
        strokeWidth: 5,
      ),
    );
  }
}
