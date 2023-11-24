import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/list_tile_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ooui.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

import '../../model/userModel.dart';
import 'chat_details.dart';

class UserProfile extends StatefulWidget {
  final UserModel userModel;
  const UserProfile({super.key, required this.userModel});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Profile Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthDivide(context, 18)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: AppSize.heightDivide(context, 60),
                ),
                height: AppSize.heightDivide(context, 5.3333),
                width: AppSize.widthDivide(context, 2.4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: AppColor.c9ABAB6,
                ),
                child: widget.userModel.photoUrl == '' ?  SvgPicture.asset('images/user.svg') :  Image.network(widget.userModel.photoUrl,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.userModel.first_name} ${widget.userModel.last_name}',
                    style: AppText.montserrat60015pxc000000,
                  ),
                  SizedMedia.widthDivide(context, 36),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.c6AEC5E,
                    child: Iconify(
                      MaterialSymbols.upgrade,
                      color: AppColor.cFFFFFF,
                    ),
                  )
                ],
              ),
              SizedMedia.heightDivide(context, 80),
              Text(
                'Email : ${widget.userModel.email.toString()}',
                style: AppText.montserrat50013pxc000000,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSize.heightDivide(context, 60)),
                child: Divider(
                  thickness: 1,
                  color: AppColor.c000000w25,
                ),
              ),
              profileContainerWidget(
                context: context,
                text: '',
                bgColor: AppColor.c9ABAB6,
                child: ProfileListTileWidget(
                    icon: Teenyicons.chat_typing_alt_solid,
                    next: false,
                    title: 'Message',
                    call: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> ChatDetails(userModel: widget.userModel,)));
                    }),
              ),
              profileContainerWidget(
                context: context,
                text: 'Details',
                bgColor: AppColor.cFFFFFF,
                child: Column(
                  children: [
                    ProfileListTileWidget(
                        icon: Carbon.carbon_accounting,
                        next: false,
                        title: widget.userModel.carbonFootPrint == ''
                            ? '0'
                            :  '${widget.userModel.carbonFootPrint.toString()} Carbon footprint',
                        call: () {}),
                    // ProfileListTileWidget(
                    //     icon: MaterialSymbols.family_restroom,
                    //     next: false,
                    //     title: '8 Family member',
                    //     call: () {}),
                    ProfileListTileWidget(
                        icon: La.trophy,
                        next: false,
                        title: widget.userModel.reward_point == ''
                            ? '0 Reward points'
                            : '${widget.userModel.reward_point.toString()} Reward points',
                        call: () {}),
                  ],
                ),
              ),
              // profileContainerWidget(
              //   context: context,
              //   text: '',
              //   bgColor: AppColor.cFFFFFF,
              //   child: Column(
              //     children: [
              //       ProfileListTileWidget(
              //           icon: Mdi.volume_mute,
              //           next: false,
              //           title: 'Mute',
              //           call: () {}),
              //       ProfileListTileWidget(
              //           icon: Ooui.block,
              //           next: false,
              //           title: 'Block User',
              //           call: () {}),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
