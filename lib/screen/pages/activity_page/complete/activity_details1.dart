

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../helper/colors.dart';
import '../../../../helper/size.dart';
import '../../../../helper/text_style.dart';
import '../../../../widget/activity_page_widget/container_widget.dart';
import 'complete_widget.dart';


class ActivityCompleteTask extends StatefulWidget {

  final List<Color> color;
  final icon;
  final String title;

  const ActivityCompleteTask({super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  @override
  State<ActivityCompleteTask> createState() => _ActivityCompleteTaskState();
}

class _ActivityCompleteTaskState extends State<ActivityCompleteTask> {

  getCompleteActivity()async{

      setState(() {
        loader = true;
      });

    await firebaseFirestore.collection('completeActivity').where('userId', isEqualTo:firebaseAuth).where('type', isEqualTo: widget.title).get().then((QuerySnapshot snapshot) {
      for (var element in snapshot.docs) {
        getCompleteActivityCount.add(element.data());
      }
    });

    setState(() {
      loader = false;
    });

  }


  getUser()async{

    getUserDetail = await firebaseFirestore.collection('users').doc(firebaseAuth).get();

  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance.currentUser!.uid;


  List getCompleteActivityCount = [];

  var getUserDetail;

  bool loader = false;

  @override
  void initState() {
    getUser();
    getCompleteActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loader ? const SizedBox() : InkWell(
      onTap: () {
        print(widget.title);
        print(getCompleteActivityCount);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CompleteWidget(
                  type: widget.title,
                  listComplete: getCompleteActivityCount,
                ),
          ),
        );
      },
      child: Container(

        margin: EdgeInsets.symmetric(
          vertical: AppSize.heightDivide(context, 60),
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 50),
            horizontal: AppSize.widthDivide(context, 20)),
        height: AppSize.heightDivide(context, 5.7971),
        width: AppSize.widthMultiply(context, 1),
        decoration: BoxDecoration(
          color: AppColor.cFFFFFF,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconContainerWidget(
                  height: 13.3333,
                  width: 6,
                  color: widget.color,
                  icon: widget.icon,
                ),
                SizedMedia.widthDivide(context, 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppText.montserrat60014pxc000000w50,
                    ),
                    SizedMedia.heightDivide(context, 70),
                    Text(
                      '${getCompleteActivityCount.length.toString()} Activity',
                      style: AppText.montserrat50024pxc000000,
                    ),
                    SizedMedia.heightDivide(context, 160),
                    Text(
                      'Level ${getUserDetail['level'].toString()}',
                      style: AppText.montserrat50010pxc000000w60,
                    ),
                  ],
                ),
              ],
            ),
            LinearPercentIndicator(
              progressColor: AppColor.c009177,
              backgroundColor: AppColor.c9ABAB6w50,
              animation: true,
              percent: 1,
              width: AppSize.widthDivide(context, 1.2),
              lineHeight: 10,
              barRadius: const Radius.circular(10),
            )
          ],
        ),
      ),
    );
  }
}
