import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:iconify_flutter/icons/mingcute.dart';
import 'package:iconify_flutter/icons/tabler.dart';

Widget profileContainerWidget(
    {required BuildContext context,
    required String text,
    required Widget child,
    required Color bgColor}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: AppSize.heightDivide(context, 70),
    ),
    width: AppSize.widthMultiply(context, 1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppText.montserrat50012pxc000000w50,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 60),
          ),
          width: AppSize.widthMultiply(context, 1),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                  color: AppColor.c000000w15,
                  inset: false,
                )
              ]),
          child: child,
        )
      ],
    ),
  );
}

class RewardContainerWidget extends StatefulWidget {
  const RewardContainerWidget({super.key, required this.call, required this.rewards});
  final Function call;
  final String rewards;

  @override
  State<RewardContainerWidget> createState() => _RewardContainerWidgetState();
}

class _RewardContainerWidgetState extends State<RewardContainerWidget> {
  Color background = AppColor.cFFFFFF;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.heightDivide(context, 40),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppSize.heightDivide(context, 30),
          horizontal: AppSize.widthDivide(context, 20)),
      height: AppSize.heightDivide(context, 4),
      width: AppSize.widthMultiply(context, 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: AppColor.c009177w40),
          color: background,
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, -150),
                blurRadius: 50,
                color: AppColor.cCCF2E9w50,
                inset: true),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('images/reward.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.rewards,
                style: AppText.montserrat70032pxc009177,
              ),
              Text(
                'Reward Point',
                style: AppText.montserrat50013pxc009177,
              ),
              SizedMedia.heightDivide(context, 40),
              // button100(
              //     context: context,
              //     text: 'Redeem',
              //     call: () {
              //       widget.call();
              //     })
            ],
          )
        ],
      ),
    );
  }
}

Widget certificateContainerWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: AppSize.widthDivide(context, 18),
        vertical: AppSize.heightDivide(context, 120)),
    padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthDivide(context, 20),
        vertical: AppSize.heightDivide(context, 80)),
    height: AppSize.heightDivide(context, 8.8888),
    width: AppSize.widthMultiply(context, 1),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.cFFFFFF,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 4,
            color: AppColor.c000000w15,
            inset: false,
          ),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedMedia.heightDivide(context, 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.cCCF2E9,
              child: Iconify(
                La.certificate,
                size: AppSize.heightDivide(context, 33.333),
                color: AppColor.c009177,
              ),
            ),
            SizedBox(
              width: AppSize.widthMultiply(context, 0.62),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vaccination Certificate',
                    style: AppText.montserrat60014pxc000000,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedMedia.heightDivide(context, 160),
                  Text(
                    'National Health Information Center',
                    style: AppText.montserrat30008pxc000000,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          '14 May 2021',
          style: AppText.montserrat40008pxc000000,
        ),
      ],
    ),
  );
}
