import 'package:doc_app/constant/custom_colors.dart';
import 'package:flutter/material.dart';


class CustomShadowButtom extends StatelessWidget {
  String text;
  final onTap;
  double fontSize;
  bool? status;
   CustomShadowButtom({
     this.text = '',
     this.onTap,
     this.fontSize = 20,
     this.status,
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
            height: 45,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: status! ? CustomColors.darkGreenShade1 :CustomColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              ),
             ],
            ),
            width: double.infinity,
        child: Center(child: Text(text,style: AppStyles.textstyle.copyWith(
          fontWeight : FontWeight.w600,fontSize: fontSize,color: CustomColors.cWhite),)),
      ),
    );
  }
}