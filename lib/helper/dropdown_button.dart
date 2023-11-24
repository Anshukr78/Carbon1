import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget profileDropdownButtonWidget(
    {required BuildContext context,
    required var value,
    required Function onChanged,
    required List<DropdownMenuItem> item}) {
  return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 120)),
      height: AppSize.heightDivide(context, 20),
      width: AppSize.widthMultiply(context, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            dropdownWidth: AppSize.widthDivide(context, 1.44),
            buttonHeight: AppSize.heightDivide(context, 20),
            buttonWidth: AppSize.widthMultiply(context, 1),
            items: item,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: AppSize.heightDivide(context, 150),
                  horizontal: AppSize.widthDivide(context, 30)),
              filled: true,
              fillColor: AppColor.cFFFFFF,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColor.c000000,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColor.c000000,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColor.c000000,
                ),
              ),
            ),
            value: value,
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ));
}
