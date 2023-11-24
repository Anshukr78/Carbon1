


import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

import '../../widget/app_bar_widget.dart';


class ProfileAccount extends StatefulWidget {
  const ProfileAccount({Key? key}) : super(key: key);
  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context: context,
        title: 'Profile Details',
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: AppSize.heightDivide(context, 8),
              backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1605092676920-8ac5ae40c7c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('First name Last name', style: AppText.montserrat70015pxc000000),
                Icon(Icons.upgrade_rounded),
                Icon(Icons.arrow_circle_down_outlined)
              ],
            )
          ],
        ),
      ),
    );
  }
}
