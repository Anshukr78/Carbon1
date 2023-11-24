import 'package:carbon/screen/carbon_calculate/waste_conguratiolation.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:uuid/uuid.dart';

import '../../helper/button.dart';
import '../../helper/colors.dart';
import '../../helper/size.dart';
import '../../helper/text_form_field.dart';
import '../../helper/text_style.dart';
import '../../widget/calculator_page_widget/indicator_widget.dart';

class WasteQuestion extends StatefulWidget {
  const WasteQuestion({Key? key}) : super(key: key);

  @override
  State<WasteQuestion> createState() => _WasteQuestionState();
}

class _WasteQuestionState extends State<WasteQuestion> {

  double valueSlider = 1.0;
  int pageIndex = 0;
  var mapWasteList, userData;
  var wasteCalculateValue;
  bool loader = false;
  CarouselController buttonController = CarouselController();

  getWasteData() async {
    setState(() {
      loader = true;
    });

    QuerySnapshot queryWasteSnapshot =
        await FirebaseFirestore.instance.collection('waste').get();

    mapWasteList = queryWasteSnapshot.docs.map((e) => e.data()).toList();

    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    getWasteData();
    getUserData();
    super.initState();
  }


  getUserData()async{

    setState(() {
      loader = true;
    });

    userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid).get();

    setState(() {
      loader = false;
    });

  }

  uploadValue()async{

    await FirebaseFirestore
        .instance
        .runTransaction(
            (transaction) async {
          DocumentReference documentReference = FirebaseFirestore
              .instance
              .collection(
              'users')
              .doc(FirebaseAuth.instance.currentUser!.uid);

          DocumentSnapshot
          snapShotDataUpdate =
          await transaction
              .get(documentReference);

          transaction
              .update(
              documentReference,
              {
                'wasteCalculate':
                wasteCalculateValue..toStringAsFixed(2),
                'reward_point': (userData['reward_point'] == ''
                    ? '10'
                    : int.parse(userData['reward_point']) + int.parse('10'))
                    .toString(),
              });
        });

    String uniqueId1 = Uuid().v4();

    FirebaseFirestore.instance.collection('rewardHistory').doc(uniqueId1).set(
        {
          "id" : uniqueId1,
          "rewardPoint" : '10',
          'activityId' : '4',
          'userId' : FirebaseAuth.instance.currentUser!.uid,
          'createdAt' : DateTime.now(),
          'type' : 'Waste calculate',
          'description' : 'The Waste value is ${wasteCalculateValue.toString()}',
        });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        'You have rewarded 10 point',
        style: AppText.montserrat40012pxc000000,
      ),
      backgroundColor: AppColor.cFFFFFF,
    ));

    // ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: 'content')
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WasteCong(
         wasteCalculate: wasteCalculateValue.toString(),
        ),
      ),
    );
  }


  TextEditingController homeWaste = TextEditingController();

  TextEditingController foodWaste = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loader
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 100,),

              signInTextFormField(
                  context: context,
                  width: AppSize.widthMultiply(context, 1),
                  controller: homeWaste,
                  hintText: 'Plastic waste(in tones)',),

              signInTextFormField(
                  context: context,
                  width: AppSize.widthMultiply(context, 1),
                  controller: foodWaste,
                  hintText: 'Food waste(in tones)',),

              Container(
                margin: EdgeInsets.symmetric(
                  vertical: AppSize.heightDivide(context, 120),
                ),
                padding: EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 50),horizontal: AppSize.heightDivide(context, 50) ),
                height: AppSize.heightDivide(context, 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 3,
                      color: AppColor.c000000w15,
                    ),
                  ],
                ),
                child: Text('${userData['carbonFootPrint']} (Your carbon footprint)', style: AppText.montserrat40014pxc000000w50,)
              ),

              const SizedBox(height: 40,),

              button200Fill(
                  context: context,
                  text: 'Calculate waste',
                  call: () {

                    var home = double.parse(homeWaste.text.trim()) * 1000;
                    var waste = double.parse(foodWaste.text.trim()) * 1000;
                    var carbon = double.parse(userData['carbonFootPrint'].toString());

                    if(userData['carbonFootPrint'].toString().isEmpty && homeWaste.text.isEmpty && foodWaste.text.isEmpty ){

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Carbon footprint is empty, Please calculate Carbon footprint',
                          style: AppText.montserrat40012pxc000000,
                        ),
                        backgroundColor: AppColor.cFFFFFF,
                      ));

                    }else{
                      setState(() {
                        wasteCalculateValue = (home + waste) * 100 / carbon ;
                      });
                      uploadValue();
                    }



                  }),


              // IndicatorWidget(
              //   count: mapWasteList.length,
              //   index: pageIndex + 1,
              // ),
              // SizedBox(
              //   height: AppSize.heightMultiply(context, 0.7),
              //   child: PageView.builder(
              //     onPageChanged: (value) {
              //       setState(() {
              //         pageIndex = value;
              //       });
              //     },
              //     itemCount: mapWasteList.length,
              //     itemBuilder: (context, index) {
              //       return Column(
              //         children: [
              //           Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: AppSize.widthDivide(context, 18),
              //                 vertical: AppSize.heightDivide(context, 40)),
              //             // height: AppSize.heightDivide(context, 5.333),
              //             width: AppSize.widthMultiply(context, 1),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: AppColor.cFFFFFF,
              //             ),
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     mapWasteList[index]['Question'],
              //                     style: AppText.montserrat50015pxc000000,
              //                   ),
              //                   SizedMedia.heightDivide(context, 80),
              //                   ...List.generate(
              //                     int.parse(
              //                         mapWasteList[index]['OptionLength']),
              //                     (indexCount) {
              //                       return Container(
              //                         margin: EdgeInsets.symmetric(
              //                           vertical:
              //                               AppSize.heightDivide(context, 70),
              //                         ),
              //                         padding: EdgeInsets.symmetric(
              //                           horizontal:
              //                               AppSize.widthDivide(context, 30),
              //                         ),
              //                         height: AppSize.heightDivide(context, 20),
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(10),
              //                           color: AppColor.cCCF2E9w50,
              //                         ),
              //                         child: Row(
              //                           children: [
              //                             Iconify(
              //                               Uil.glass,
              //                               color: AppColor.c797D8C,
              //                               size: AppSize.widthDivide(
              //                                   context, 22.5),
              //                             ),
              //                             SizedMedia.widthDivide(context, 30),
              //                             Text(
              //                               mapWasteList[index][
              //                                   'Option${(indexCount + 1).toString()}'],
              //                               style: AppText
              //                                   .montserrat40014pxc000000,
              //                             )
              //                           ],
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 ]),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          );
  }
}
