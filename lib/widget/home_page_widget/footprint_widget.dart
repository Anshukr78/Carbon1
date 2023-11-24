import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

Widget footPrintWidget(
    {required BuildContext context, required Function call}) {
  return Container(
    margin: EdgeInsets.only(
      top: AppSize.heightDivide(context, 20),
      bottom: AppSize.heightDivide(context, 15),
    ),
    height: AppSize.heightDivide(context, 4.1884),
    width: AppSize.widthMultiply(context, 1),
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: AppSize.heightDivide(context, 40),
              horizontal: AppSize.widthDivide(context, 25)),
          height: AppSize.heightDivide(context, 4.7058),
          width: AppSize.widthMultiply(context, 1),
          decoration: BoxDecoration(
              color: AppColor.cFFFFFF,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    color: AppColor.c000000w15)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppSize.widthMultiply(context, 0.42),
                child: Text(
                  'What is your carbon footprint ?',
                  style: AppText.montserrat50020pxc000000,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: AppSize.widthMultiply(context, 0.42),
                  child: Image.asset('images/footprint.png')),
            ],
          ),
        ),
        Positioned(
          left: AppSize.widthDivide(context, 8),
          right: AppSize.widthDivide(context, 8),
          bottom: AppSize.heightMultiply(context, 0),
          child: button229(
              context: context,
              text: 'Calculate Your Impact',
              call: () {
                call();
              }),
        ),
      ],
    ),
  );
}
