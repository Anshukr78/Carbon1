import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/calculator_page_widget/indicator_widget.dart';
import 'package:carbon/widget/calculator_page_widget/question_widget.dart';
import 'package:carbon/widget/tab_bar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/uil.dart';

import '../../carbon_calculate/carbon_question.dart';
import '../../carbon_calculate/waste_question.dart';

class CalculatePage extends StatefulWidget {
  final bool check;
  const CalculatePage({super.key, required this.check});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        backgroundColor: AppColor.cF1F7F2,
        appBar: bottomNavBarAppBarWidget(
            context: context, title: 'Calculator', leading: () {Navigator.pop(context);}, check: widget.check),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 30),
          ),
          child: const Column(
            children: [
              TabBarWidget(
                text1: 'Carbon',
                text2: 'Waste',
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CarbonQuestion(),
                    WasteQuestion(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
