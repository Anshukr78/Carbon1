import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.heightDivide(context, 70),
      ),
      height: AppSize.heightDivide(context, 20),
      width: AppSize.widthMultiply(context, 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.cFFFFFF,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 15,
              color: AppColor.c000000w15,
            )
          ]),
      child: TabBar(
        indicatorWeight: 0.1,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        tabs: [
          Container(
              width: AppSize.widthMultiply(context, 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedIndex == 0 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
              child: Center(
                child: Text(
                  widget.text1,
                  style: selectedIndex == 0
                      ? AppText.montserrat60015pxcFFFFFF
                      : AppText.montserrat60015pxc009177,
                ),
              )),
          Container(
              width: AppSize.widthMultiply(context, 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedIndex == 1 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
              child: Center(
                child: Text(
                  widget.text2,
                  style: selectedIndex == 1
                      ? AppText.montserrat60015pxcFFFFFF
                      : AppText.montserrat60015pxc009177,
                ),
              )),
        ],
      ),
    );
  }
}
