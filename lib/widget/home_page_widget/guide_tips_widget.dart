import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget(
      {super.key, required this.text, required this.image, required this.call});
  final String text;
  final String image;
  final Function call;

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  Color background = AppColor.cFFFFFF;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.call();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: AppSize.heightDivide(context, 40),
          bottom: AppSize.heightDivide(context, 20),
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 60),
            horizontal: AppSize.widthDivide(context, 30)),
        height: AppSize.heightDivide(context, 5.4794),
        width: AppSize.widthMultiply(context, 0.45),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.c009177w40),
            color: background,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, -20),
                  blurRadius: 50,
                  color: AppColor.cCCF2E9,
                  inset: true),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 50,
                  color: AppColor.cCCF2E9,
                  inset: true),
              BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 5,
                  color: AppColor.c9ABAB6w50,
                  inset: false),
            ]),
        child: Stack(
          children: [
            Positioned(
              bottom: AppSize.heightMultiply(context, 0),
              right: AppSize.widthMultiply(context, 0),
              child: SizedBox(
                height: AppSize.heightDivide(context, 9.0909),
                width: AppSize.widthDivide(context, 4.0909),
                child: Image.asset(widget.image),
              ),
            ),
            Positioned(
              top: AppSize.heightMultiply(context, 0),
              left: AppSize.widthMultiply(context, 0),
              child: SizedBox(
                width: AppSize.widthDivide(context, 4.3),
                child: Text(
                  widget.text,
                  style: AppText.montserrat70014pxc009177,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
