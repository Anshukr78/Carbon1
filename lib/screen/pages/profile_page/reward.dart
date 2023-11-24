
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/list_tile_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/container_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/maki.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mingcute.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {



  getUser()async{

    setState(() {
      loader == true;
    });

    getUserDetail = await firebaseFirestore.collection('users').doc(firebaseAuth).get();

    setState(() {
      loader = false;
    });
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance.currentUser!.uid;


  var getUserDetail;

  bool loader = false;

  @override
  void initState() {
    getUser();
    super.initState();
  }



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
    [
      AppColor.cFD8913,
      AppColor.cFD8913w23,
    ],
    [
      AppColor.cFDE613,
      AppColor.cFDE613w23,
    ],
    [
      AppColor.cFD8913,
      AppColor.cFD8913w23,
    ],
    [
      AppColor.cFDE613,
      AppColor.cFDE613w23,
    ],
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Your Reward',
      ),
      body: getUserDetail == null ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 12),
          ),
          child: Column(
            children: [
              RewardContainerWidget(
                call: () {}, rewards: getUserDetail['reward_point'].toString() == '' ? '0' : getUserDetail['reward_point'].toString(),
              ),
              profileContainerWidget(
                  context: context,
                  bgColor: AppColor.cFFFFFF,
                  text: 'Recent',
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('rewardHistory')
                        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> collection2Snapshot) {
                      if (collection2Snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (collection2Snapshot.hasError) {
                        return Text('Error: ${collection2Snapshot.error}');
                      }

                      if (collection2Snapshot.data!.docs.isEmpty) {
                        return Center(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('No History available'),
                        ));
                      }

                      return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: collection2Snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return RewardListTileWidget(
                                color: collection2Snapshot.data!.docs[index]['type'] == 'Home Activity'
                                    ? colorList[0] : collection2Snapshot.data!.docs[index]['type'] == 'Transport Activity'
                                    ? colorList[1]  : collection2Snapshot.data!.docs[index]['type'] == 'Public Activity'
                                    ? colorList[2] : colorList[3],
                                icon: collection2Snapshot.data!.docs[index]['type'] == 'Home Activity'
                                    ? MaterialSymbols.energy_savings_leaf : collection2Snapshot.data!.docs[index]['type'] == 'Transport Activity'
                                    ? MaterialSymbols.directions_car_rounded : collection2Snapshot.data!.docs[index]['type'] == 'Public Activity'
                                    ?  Mingcute.bus_fill: MaterialSymbols.fastfood,
                                title: collection2Snapshot.data!.docs[index]['type'],
                                subtitle: collection2Snapshot.data!.docs[index]['description'],
                                point: collection2Snapshot.data!.docs[index]['rewardPoint'],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Divider(
                                thickness: 1,
                                color: AppColor.c000000w05,
                              );
                            },
                          );

                    },
                  ),
                  // child: ListView.separated(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: icon.length,
                  //   itemBuilder: (context, index) {
                  //     return RewardListTileWidget(
                  //       color: colorList[index],
                  //       icon: icon[index],
                  //       title: title[index],
                  //       subtitle: subtitle[index],
                  //       point: points[index],
                  //     );
                  //   },
                  //   separatorBuilder: (BuildContext context, int index) {
                  //     return Divider(
                  //       thickness: 1,
                  //       color: AppColor.c000000w05,
                  //     );
                  //   },
                  // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
