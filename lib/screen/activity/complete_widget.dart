import 'package:flutter/material.dart';

import '../../api/listData.dart';
import '../pages/activity_page/complete/activity_details1.dart';



class CompleteWidgetCard extends StatefulWidget {
  const CompleteWidgetCard({super.key});

  @override
  State<CompleteWidgetCard> createState() => _CompleteWidgetCardState();
}

class _CompleteWidgetCardState extends State<CompleteWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icon.length,
      itemBuilder: (context, index) {
        return ActivityCompleteTask(
          color: colorList[index],
          icon: icon[index],
          title: title[index],
        );
      },
    );
  }
}
