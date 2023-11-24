import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/container_widget.dart';
import 'package:flutter/material.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Certificate',
      ),
      body: ListView.builder(
          itemCount: 10,
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return certificateContainerWidget(context);
          }),
    );
  }
}
