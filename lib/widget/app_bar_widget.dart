import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar logoAppBarWidget(
    {required BuildContext context,
    required Function leading,
    required Function notify}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    // leading: InkWell(
    //   onTap: () {
    //     leading();
    //   },
    //   child: Icon(
    //     Icons.menu,
    //     color: AppColor.c000000,
    //   ),
    // ),
    //centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Green Goals',
        style: GoogleFonts.montserrat(
          color: AppColor.c009177,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    actions: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSize.widthDivide(context, 30)),
        child: InkWell(
          onTap: () {
            notify();
          },
          child: Icon(
            Icons.notifications,
            color: AppColor.c000000,
          ),
        ),
      ),
    ],
  );
}

AppBar bottomNavBarAppBarWidget(
    {required BuildContext context,
    required Function leading,
    required String title, required bool check}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading: check ? InkWell(
      onTap: () {
        leading();
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: AppColor.c000000,
      ),
    ) : null,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        title,
        style: AppText.montserrat60018pxc000000,
      ),
    ),
  );
}

AppBar appBarWidget({required BuildContext context, required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: CircleAvatar(
          radius: 13,
          backgroundColor: AppColor.cD9D9D9w40,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.c000000,
            size: AppSize.heightDivide(context, 55),
          ),
        ),
      ),
    ),
    title: Text(
      title,
      style: AppText.montserrat60018pxc000000,
    ),
  );
}
