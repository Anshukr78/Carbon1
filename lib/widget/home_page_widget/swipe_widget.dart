import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

class SwipeWidget extends StatefulWidget {
  const SwipeWidget({super.key, required this.map, required this.swipe});
  final Map<String, dynamic> map;
  final bool swipe;
  @override
  State<SwipeWidget> createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: AppSize.heightDivide(context, 40),
              horizontal: AppSize.widthDivide(context, 18)),
          height: AppSize.heightDivide(context, 1.6194),
          width: AppSize.widthMultiply(context, 1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.cFFFFFF,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: AppColor.c000000w15)
              ],
              image: DecorationImage(
                  image: AssetImage(widget.map['image']), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppSize.heightDivide(context, 40),
                horizontal: AppSize.widthDivide(context, 18)),
            height: AppSize.heightDivide(context, 1.6194),
            width: AppSize.widthMultiply(context, 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.c009177w60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.map['title'],
                  style: AppText.montserrat60016pxc000000,
                ),
                SizedMedia.heightDivide(context, 60),
                Text(
                  widget.map['text'],
                  style: AppText.montserrat50014pxc000000,
                ),
              ],
            ),
          ),
        ),
        widget.swipe == false
            ? Text(
                'Swipe for more>>',
                style: AppText.montserrat60014pxc000000w50,
              )
            : const SizedBox(),
      ],
    );
  }
}
