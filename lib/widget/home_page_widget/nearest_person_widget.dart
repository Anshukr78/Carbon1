import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/chat/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearestPersonWidget extends StatefulWidget {
  const NearestPersonWidget({super.key});

  @override
  State<NearestPersonWidget> createState() => _NearestPersonWidgetState();
}

class _NearestPersonWidgetState extends State<NearestPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(context,
          //  MaterialPageRoute(builder: (context) => UserProfile(userModel: null,)));
      },
      child: Container(
        margin: EdgeInsets.only(right: AppSize.widthDivide(context, 30)),
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 30),
            vertical: AppSize.heightDivide(context, 60)),
        height: AppSize.heightDivide(context, 4.4198),
        width: AppSize.widthDivide(context, 2.7692),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.cFFFFFF,
            border: Border.all(width: 1, color: AppColor.c9ABAB6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppSize.heightDivide(context, 11.4285),
              width: AppSize.widthDivide(context, 5.1428),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColor.c9ABAB6,
              ),
              child: SvgPicture.asset('images/user.svg'),
            ),
            Text(
              'User Name',
              style: AppText.montserrat60013pxc000000,
            ),
            Text(
              '5km away',
              style: AppText.montserrat50012pxc000000w50,
            ),
            Container(
              height: AppSize.heightDivide(context, 27.5862),
              width: AppSize.widthDivide(context, 3.3333),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColor.cFD8913,
              ),
              child: Center(
                child: Text(
                  '20% Carbon',
                  style: AppText.montserrat60012pxcFFFFFF,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
