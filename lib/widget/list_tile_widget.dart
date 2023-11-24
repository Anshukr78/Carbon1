// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/activity_page_widget/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ProfileListTileWidget extends StatefulWidget {
  ProfileListTileWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.next,
      required this.call});
  var icon;
  final String title;
  final bool next;
  final Function call;

  @override
  State<ProfileListTileWidget> createState() => _ProfileListTileWidgetState();
}

class _ProfileListTileWidgetState extends State<ProfileListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.call();
      },
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: AppColor.cCCF2E9,
        child: Iconify(
          widget.icon,
          color: AppColor.c009177,
          size: AppSize.heightDivide(context, 57.1428),
        ),
      ),
      title: Text(
        widget.title,
        style: AppText.montserrat50014pxc000000,
      ),
      trailing: widget.next == true
          ? Icon(
              Icons.arrow_forward_ios,
              color: AppColor.c9ABAB6,
              size: AppSize.heightDivide(context, 57.1428),
            )
          : const SizedBox(),
    );
  }
}

class RewardListTileWidget extends StatefulWidget {
  RewardListTileWidget(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.point});
  final List<Color> color;
  var icon;
  final String title;
  final String subtitle;
  final String point;
  @override
  State<RewardListTileWidget> createState() => _RewardListTileWidgetState();
}

class _RewardListTileWidgetState extends State<RewardListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconContainerWidget(
        height: 20,
        width: 9,
        color: widget.color,
        icon: widget.icon,
      ),
      title: Text(
        widget.title,
        style: AppText.montserrat70013pxc000000,
      ),
      subtitle: Text(
        widget.subtitle,
        style: AppText.montserrat50007pxc000000,
      ),
      trailing: Text(
        widget.point,
        style: AppText.montserrat50008pxc000000,
      ),
    );
  }
}
