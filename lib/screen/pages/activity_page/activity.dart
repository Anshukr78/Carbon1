import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/activity_page_widget/container_widget.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../activity/activity_widget.dart';
import '../../activity/complete_widget.dart';
import 'complete/activity_details1.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  List colorList = [
    [
      AppColor.c6AEC5E,
      AppColor.c1FAC11w10,
    ],
    [
      AppColor.c5E63EC,
      AppColor.c116BACw10,
    ],
    [
      AppColor.cEC5EE6,
      AppColor.cAC1165w10,
    ],
    [
      AppColor.cEC5E5E,
      AppColor.cAC1111w10,
    ],
  ];

  List title = [
    'Home Activity',
    'Transport Activity',
    'Public Activity',
    'Food Activity',
  ];

  List icon = [
    MaterialSymbols.energy_savings_leaf,
    MaterialSymbols.directions_car_rounded,
    MaterialSymbols.train,
    MaterialSymbols.fastfood,
  ];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.cF1F7F2,
        appBar: bottomNavBarAppBarWidget(
            context: context, title: 'Eco challenge', leading: () {}, check: false),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 30),
          ),
          child: const Column(
            children: [
              TabBarWidget(
                text1: 'BucketList',
                text2: 'Complete',
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // ListView.builder(
                    //   itemCount: icon.length,
                    //   itemBuilder: (context, index) {
                    //     return ActivityContainerWidget(
                    //       color: colorList[index],
                    //       icon: icon[index],
                    //       title: title[index],
                    //     );
                    //   },
                    // ),
                    // ListView.builder(
                    //   itemCount: icon.length,
                    //   itemBuilder: (context, index) {
                    //     return ActivityCompleteTask(
                    //       color: colorList[index],
                    //       icon: icon[index],
                    //       title: title[index],
                    //     );
                    //   },
                    // ),
                    ActivityCardWidget(),
                    CompleteWidgetCard(),

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
