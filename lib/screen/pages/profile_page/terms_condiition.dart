import 'package:carbon/helper/colors.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Terms & Condition',
      ),
    );
  }
}
