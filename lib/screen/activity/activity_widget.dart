import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../api/listData.dart';
import '../../widget/activity_page_widget/container_widget.dart';


class ActivityCardWidget extends StatefulWidget {
  const ActivityCardWidget({super.key});

  @override
  State<ActivityCardWidget> createState() => _ActivityCardWidgetState();
}

class _ActivityCardWidgetState extends State<ActivityCardWidget> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icon.length,
      itemBuilder: (context, index){
        return ActivityContainerWidget(
          color: colorList[index],
          icon: icon[index],
          title: title[index],
        );
      },
    );
  }
}
