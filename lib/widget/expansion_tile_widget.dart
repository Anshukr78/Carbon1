import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

Widget faqsExpansionTileWidget(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      title: Text(
        'How to delete account ?',
        style: AppText.montserrat50014pxc000000,
      ),
      collapsedIconColor: AppColor.c797D8C,
      iconColor: AppColor.c797D8C,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 80),
            horizontal: AppSize.widthDivide(context, 25),
          ),
          width: AppSize.widthMultiply(context, 1),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: AppText.montserrat50010pxc000000w40,
          ),
        )
      ],
    ),
  );
}
