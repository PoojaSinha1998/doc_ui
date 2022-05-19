import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../constant/custom_colors.dart';

Widget DrawerWidget(BuildContext context)
{
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

  return  Container(
    clipBehavior: Clip.hardEdge,
    width: screenWidth*0.89,
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.all(10),
          height: screenHeight*0.15,
          decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),

          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("XYZ",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)
                )
              ],
            ),
          ),
        ),

      ],
    ),
  );
}