import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatefulWidget {
  const IndicatorWidget({super.key, required this.count, required this.index});
  final int count;
  final int index;

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      CarouselIndicator(
        height: AppSize.heightDivide(context, 160),
        count: widget.count,
        index: widget.index-1,
        color: AppColor.cCCF2E9,
        activeColor: AppColor.c009177,
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Question : ',
              style: AppText.montserrat50008pxc000000,
            ),
            Text(
              '${widget.index}/${widget.count}',
              style: AppText.montserrat50008pxc6AEC5E,
            ),
          ],
        ),
      ),
    ]);
  }
}
