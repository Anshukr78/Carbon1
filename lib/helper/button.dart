import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

Widget button200Fill(
    {required BuildContext context,
    required String text,
    required Function call}) {
  return Container(
    // margin: EdgeInsets.symmetric(
    //     horizontal: AppSize.widthDivide(context, 20),
    //     vertical: AppSize.heightDivide(context, 60)),
    height: AppSize.heightDivide(context, 17.7777),
    width: AppSize.widthDivide(context, 1.8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),
    child: ElevatedButton(
        onPressed: () {
          call();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.c009177,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          text,
          style: AppText.montserrat60016pxcCCF2E9,
        )),
  );
}

Widget button229(
    {required BuildContext context,
    required String text,
    required Function call}) {
  return Container(
    // margin: EdgeInsets.symmetric(
    //     horizontal: AppSize.widthDivide(context, 20),
    //     vertical: AppSize.heightDivide(context, 60)),
    height: AppSize.heightDivide(context, 17.7777),
    width: AppSize.widthDivide(context, 1.5720),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
        onPressed: () {
          call();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.c009177,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: AppText.montserrat60014pxcFFFFFF,
        )),
  );
}

Widget button200Outlined(
    {required BuildContext context,
    required String text,
    required Function call}) {
  return Container(
    // margin: EdgeInsets.symmetric(
    //     horizontal: AppSize.widthDivide(context, 20),
    //     vertical: AppSize.heightDivide(context, 60)),
    height: AppSize.heightDivide(context, 17.7777),
    width: AppSize.widthDivide(context, 1.8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),
    child: OutlinedButton(
        onPressed: () {
          call();
        },
        style: OutlinedButton.styleFrom(
            backgroundColor: AppColor.cF1F7F2,
            side: BorderSide(width: 1.5, color: AppColor.c009177),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          text,
          style: AppText.montserrat60016pxc009177,
        )),
  );
}

Widget button100(
    {required BuildContext context,
    required String text,
    required Function call}) {
  return Container(
    // margin: EdgeInsets.symmetric(
    //     horizontal: AppSize.widthDivide(context, 20),
    //     vertical: AppSize.heightDivide(context, 60)),
    height: AppSize.heightDivide(context, 40),
    width: AppSize.widthDivide(context, 3.6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
        onPressed: () {
          call();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.cFD8913,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: AppText.montserrat50010pxcFFFFFF,
        )),
  );
}
