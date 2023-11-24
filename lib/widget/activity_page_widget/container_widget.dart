// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../screen/pages/activity_page/complete/activity_details1.dart';
import '../../screen/pages/activity_page/actvity_details.dart';

class IconContainerWidget extends StatefulWidget {
  IconContainerWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.color});

  final double height;
  final double width;
  var icon;
  final List<Color> color;

  @override
  State<IconContainerWidget> createState() => _IconContainerWidgetState();
}

class _IconContainerWidgetState extends State<IconContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.heightDivide(context, widget.height),
      width: AppSize.widthDivide(context, widget.width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: widget.color,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Center(
          child: Iconify(
        widget.icon,
        color: AppColor.cFFFFFF,
        size: AppSize.widthDivide(context, 18),
      )),
    );
  }
}

class ActivityContainerWidget extends StatefulWidget {
  ActivityContainerWidget
      ({super.key,
      required this.color,
      required this.icon,
      required this.title,
   // required this.count
  });

  final List<Color> color;
  var icon;
  final String title;
  //final int count;

  @override
  State<ActivityContainerWidget> createState() => _ActivityContainerWidgetState();
}

class _ActivityContainerWidgetState extends State<ActivityContainerWidget> {


  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance.currentUser!.uid;


  List getActivityCount = [], getCompleteActivityCount = [], newListValue = [];

  var getUserDetail;

  bool loader = false;

  getActivity(String value)async{
    try{
      setState(() {
        loader = true;
      });
      await firebaseFirestore.collection('activity').where('type', isEqualTo: value).get().then((QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          getActivityCount.add(element.data());
        }
      });
      getCompleteActivity(value);
    }catch(error){
      print('1st');
      print(error.toString());
    }
  }

  getCompleteActivity(String value)async{
    try{
      await firebaseFirestore.collection('completeActivity').where('userId', isEqualTo:firebaseAuth).where('type', isEqualTo: value).get().then((QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          getCompleteActivityCount.add(element.data());
        }
      });
      compare();
      setState(() {
        loader = false;
      });
    }catch(e){
      print('2nd');
      print(e.toString());
    }
  }

  List differenceById(List list1, List list2) {
    List result = [];

    for (var map1 in list1) {
      var id1 = map1['id'];
      bool found = false;

      for (var map2 in list2) {
        var id2 = map2['activityId'];

        if (id1 == id2) {
          found = true;
          break;
        }
      }

      if (!found) {
        result.add(map1);
      }
    }

    return result;
  }


  compare(){
    newListValue = differenceById(getActivityCount, getCompleteActivityCount);
  }

  getUser()async{
    try{
      getUserDetail = await firebaseFirestore.collection('users').doc(firebaseAuth).get();
    }catch(e){
      print('user');
      print(e.toString());
    }
  }

  @override
  void initState() {
    getActivity(widget.title);
    getUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return loader ? Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.heightDivide(context, 60),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppSize.heightDivide(context, 50),
          horizontal: AppSize.widthDivide(context, 20)),
      height: AppSize.heightDivide(context, 5.7971),
      width: AppSize.widthMultiply(context, 1),
      decoration: BoxDecoration(
        color: AppColor.c000000.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
      ),
    ) : InkWell(
      onTap: () {
        print(widget.title);
        print(newListValue.length);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ActivityDetails(
              type: widget.title, listApp: newListValue,
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
                      newListValue.length.toString(),
                      //'${(getActivityCount.length - getCompleteActivityCount.length).toString()} Activity',
                      style: AppText.montserrat50024pxc000000,
                    ),
                    SizedMedia.heightDivide(context, 160),
                    Text(
                      'Level up',
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
              percent: (getCompleteActivityCount.length / getActivityCount.length),
              //percent: ((getActivityCount.length - getCompleteActivityCount.length)/getActivityCount.length) == 1 ? 0.0 :  ((getActivityCount.length - getCompleteActivityCount.length)/getActivityCount.length),
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
