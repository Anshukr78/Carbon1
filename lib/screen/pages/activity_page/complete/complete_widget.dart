import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../helper/colors.dart';
import '../../../../helper/size.dart';
import '../../../../helper/text_style.dart';
import '../../../../widget/app_bar_widget.dart';

class CompleteWidget extends StatefulWidget {
  final String type;
  final List listComplete;

  const CompleteWidget(
      {super.key, required this.type, required this.listComplete});

  @override
  State<CompleteWidget> createState() => _CompleteWidgetState();
}

class _CompleteWidgetState extends State<CompleteWidget> {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: widget.type,
      ),
      body: loader
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                    child: Divider(),
                  ),
                  widget.listComplete.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 50),
                            child: Text(
                              'No activity has been completed yet',
                              style: GoogleFonts.concertOne(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: AppColor.c6AEC5E,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.listComplete.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('activity')
                                  .where('type', isEqualTo: widget.type)
                                  .where('id',
                                      isEqualTo: widget.listComplete[index]
                                          ['activityId'])
                                  .get(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (snapshot.data!.docs.isEmpty) {
                                  return Center(
                                      child: Text('No activity completed'));
                                }

                                return Container(
                                  height: AppSize.heightDivide(context, 8),
                                  width: AppSize.widthMultiply(context, 0.9),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE5F8F3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.c000000w25,
                                          offset: const Offset(0, 4),
                                          blurRadius: 4),
                                    ],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          snapshot.data!.docs[0]['task'],
                                          style:
                                              AppText.montserrat70014pxc009177,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 15),
                                            child: LinearPercentIndicator(
                                              progressColor: AppColor.c009177,
                                              backgroundColor: AppColor.cFFFFFF,
                                              animation: true,
                                              percent: 1.0,
                                              width: AppSize.widthMultiply(
                                                  context, 0.65),
                                              lineHeight: 10,
                                              barRadius:
                                                  const Radius.circular(10),
                                            ),
                                          ),
                                          Text(
                                            '1/1',
                                            style: AppText
                                                .montserrat50008pxc000000,
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              height: 20,
                                              width: 50,
                                              margin: const EdgeInsets.only(
                                                  right: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: AppColor.cFD8913),
                                              child: Center(
                                                child: Text(
                                                  'Completed',
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          'You have received ${snapshot.data!.docs[0]['reward'].toString()} Reward points',
                                          style: GoogleFonts.croissantOne(
                                              fontSize: 12,
                                              color: AppColor.c000000,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 5,
                              child: Divider(),
                            );
                          },
                        ),
                  const SizedBox(
                    height: 5,
                    child: Divider(),
                  ),
                ],
              ),
            ),
    );
  }
}
