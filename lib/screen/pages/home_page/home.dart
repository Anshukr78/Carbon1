import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/pages/home_page/guide.dart';
import 'package:carbon/screen/pages/home_page/tips.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/floating_action_button.dart';
import 'package:carbon/widget/home_page_widget/footprint_widget.dart';
import 'package:carbon/widget/home_page_widget/guide_tips_widget.dart';
import 'package:carbon/widget/home_page_widget/image_slider_widget.dart';
import 'package:carbon/widget/home_page_widget/nearest_person_widget.dart';
import 'package:carbon/widget/home_page_widget/scaled_list_widget.dart';
import 'package:carbon/widget/home_page_widget/transportation_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../calculate_page/calculate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userData;
  bool loader = false;

  getUser() async {
    setState(() {
      loader = true;
    });

    userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: logoAppBarWidget(context: context, leading: () {}, notify: () {}),
      body: loader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthDivide(context, 30),
                  vertical: AppSize.heightDivide(context, 40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi ${userData['first_name'].toString().toUpperCase()}',
                      style: AppText.montserrat60016pxc000000,
                    ),
                    const ImageSliderWidget(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Sustainable Product',
                    //       style: AppText.montserrat60016pxc000000,
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'See All',
                    //         style: AppText.montserrat60013pxc009177,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const ScaledListWidget(),

                    const TransportationWidget(),
                    SizedMedia.heightDivide(context, 20),
                    footPrintWidget(
                      context: context,
                      call: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalculatePage(
                                      check: true,
                                    )));
                      },
                    ),

                    Text(
                      'Guide and Tips',
                      style: AppText.montserrat60016pxc000000,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerWidget(
                          text: 'Green Energy Guide',
                          image: 'images/guide.png',
                          call: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GreenEnergyGuide()));
                          },
                        ),
                        ContainerWidget(
                          text: 'Sustainable Lifestyle Tips',
                          image: 'images/tips.png',
                          call: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SustainableLifestyleTips()));
                          },
                        )
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Nearest Person',
                    //       style: AppText.montserrat60016pxc000000,
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'See All',
                    //         style: AppText.montserrat60013pxc009177,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Container(
                    //     margin: EdgeInsets.only(
                    //       top: AppSize.heightDivide(context, 40),
                    //       bottom: AppSize.heightDivide(context, 10),
                    //     ),
                    //     height: AppSize.heightDivide(context, 4.4198),
                    //     width: AppSize.widthMultiply(context, 1),
                    //     child: ListView.builder(
                    //         // shrinkWrap: true,
                    //         // physics: const NeverScrollableScrollPhysics(),
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: 5,
                    //         itemBuilder: (context, index) {
                    //           return const NearestPersonWidget();
                    //         })),

                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: const ChatButton(),
    );
  }
}
