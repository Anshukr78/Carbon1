import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screen/chat/chat.dart';

class ChatButton extends StatefulWidget {
  const ChatButton({super.key});

  @override
  State<ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.heightDivide(context, 10)),
      child: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatUi()));
        },
        backgroundColor: AppColor.cFFFFFF,
        foregroundColor: AppColor.c9ABAB6,
        child: SvgPicture.asset('images/msg.svg'),
      ),
    );
  }
}
