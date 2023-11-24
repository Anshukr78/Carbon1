import 'package:carbon/screen/carbon_calculate/calculate%20value.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:uuid/uuid.dart';

import '../../helper/colors.dart';
import '../../helper/size.dart';
import '../../helper/text_style.dart';
import '../../widget/calculator_page_widget/indicator_widget.dart';
import '../../widget/calculator_page_widget/question_widget.dart';
import '../../widget/conguratulation.dart';
import '../pages/calculate_page/calculate_value.dart';

class CarbonQuestion extends StatefulWidget {
  const CarbonQuestion({Key? key}) : super(key: key);

  @override
  State<CarbonQuestion> createState() => _CarbonQuestionState();
}

class _CarbonQuestionState extends State<CarbonQuestion> {
  TextEditingController carService = TextEditingController();
  TextEditingController busService = TextEditingController();
  TextEditingController autoService = TextEditingController();
  TextEditingController trainService = TextEditingController();
  TextEditingController airplaneService = TextEditingController();

  var mapList;
  bool loader = false;

  var carbonValue;

  Map<String, dynamic> selectedOptions = {};

  Map<String, dynamic> answerMenu = {};

  TextEditingController houseMember = TextEditingController();
  TextEditingController waterQuantity = TextEditingController();
  TextEditingController electricityQuantity = TextEditingController();
  TextEditingController gasQuantity = TextEditingController();

  var dataUser;

  getUserData() async {
    dataUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  void getData() async {
    setState(() {
      loader = true;
    });

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('carbon').get();
    mapList = querySnapshot.docs.map((element) => element.data()).toList();

    for (int i = 1; i < mapList.length; i++) {
      selectedOptions[i.toString()] = '';
    }
    setState(() {
      loader = false;
    });
  }

  addMoreData() {
    if (carService.text.isNotEmpty &&
        autoService.text.isNotEmpty &&
        busService.text.isNotEmpty &&
        trainService.text.isNotEmpty &&
        airplaneService.text.isNotEmpty) {
      answerMenu['CarService'] = carService.text.trim();
      answerMenu['AutoService'] = autoService.text.trim();
      answerMenu['BusService'] = busService.text.trim();
      answerMenu['TrainService'] = trainService.text.trim();
      answerMenu['AirplaneService'] = airplaneService.text.trim();

      uploadData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Please enter all fields',
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ),
      );
    }
  }

  void uploadData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('carbon')
          .doc(auth.currentUser!.uid)
          .set(answerMenu);

      calculateCarbon();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            error.toString(),
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ),
      );
    }
  }

  calculateCarbon() async{
    try {
      var member = calculateValueData(
        value: selectedOptions['1'] == '1-3 members'
            ? 3.0
            : selectedOptions['1'] == '3-5 members'
                ? 4.0
                : selectedOptions['1'] == '5-10 members'
                    ? 7.0
                    : selectedOptions['1'] == '<10 members'
                        ? 12.0
                        : double.parse(houseMember.text.trim(),
        ),
        calculateData: 1.0,
      );

      var water = calculateValueData(
        value: selectedOptions['2'] == '<50 liters'
            ? 49.0
            : selectedOptions['2'] == '50-100 liters'
                ? 99.0
                : selectedOptions['2'] == '>100 liters'
                    ? 160.0
                    : selectedOptions['2'] == 'I do not use this'
                        ? 110.0
                        : double.parse(waterQuantity.text.trim(),
        ),
        calculateData: 50.0,
      );

      var electricity = calculateValueData(
        value: selectedOptions['3'] == '<50 units'
            ? 49.0
            : selectedOptions['3'] == '50-300 units'
                ? 250.0
                : selectedOptions['3'] == '>300 units'
                    ? 330.0
                    : selectedOptions['3'] == 'I do not use this'
                        ? 220.0
                        : double.parse(electricityQuantity.text.trim()),
        calculateData: 105.0,
      );

      var gas = calculateValueData(
        value: selectedOptions['4'] == '<20 units'
            ? 19.0
            : selectedOptions['4'] == '20-30 units'
                ? 28.0
                : selectedOptions['4'] == '>30 units'
                    ? 40.0
                    : selectedOptions['4'] == 'I do not use this'
                        ? 33.0
                        : double.parse(gasQuantity.text.trim()),
        calculateData: 105.0,
      );

      var foodType = calculateValueData(
        value: selectedOptions['5'] == 'Vegan'
            ? 10.0
            : selectedOptions['5'] == 'Vegetarian'
                ? 20.0
                : selectedOptions['5'] == 'Eggetarian'
                    ? 30.0
                    : selectedOptions['5'] == 'Non-vegetarian'
                        ? 40.0
                        : 44.0,
        calculateData: 11.3,
      );

      var orderOnline = calculateValueData(
        value: selectedOptions['6'] == 'Rarely(1-2 times a month)'
            ? 2.0
            : selectedOptions['6'] == 'Once a week'
                ? 4.0
                : selectedOptions['6'] == '3-4 times a week'
                    ? 15.0
                    : selectedOptions['6'] == 'Almost everyday'
                        ? 30.0
                        : selectedOptions['6'] == 'I do not order online'
                            ? 0.5
                            : 3.0,
        calculateData: 10.5,
      );

      var transport = calculateValueData(
        value: 6.0,
        calculateData: selectedOptions['7'] == "Personal Vehicle"
            ? 79.0
            : selectedOptions['7'] == "Personal Vehicle"
                ? 15.0
                : selectedOptions['7'] == "Personal Vehicle"
                    ? 30.0
                    : selectedOptions['7'] == "Personal Vehicle"
                        ? 4400.0
                        : 1.0,
      );

      var car = calculateValueData(
        value: double.parse(carService.text.trim()),
        calculateData: 0.79,
      );

      var train = calculateValueData(
        value: double.parse(trainService.text.trim()),
        calculateData: 0.10,
      );

      var airplane = calculateValueData(
        value: double.parse(airplaneService.text.trim()),
        calculateData: 1100.0,
      );

      var bus = calculateValueData(
        value: double.parse(busService.text.trim()),
        calculateData: 0.50,
      );

      var auto = calculateValueData(
        value: double.parse(autoService.text.trim()),
        calculateData: 0.51,
      );

      carbonValue = (auto +
          bus +
          airplane +
          train +
          car +
          transport +
          orderOnline +
          foodType +
          gas +
          electricity +
          water +
          member +
          184 +
          166 +
          120);

      setState(() {});

      var mapShowData = {
        'member' : member.toString(),
        'water' : water.toString(),
        'electricity' : electricity.toString(),
        'gas' : gas.toString(),
        'foodType' : foodType.toString(),
        'orderOnline' : orderOnline.toString(),
        'transport' : transport.toString(),
        'car' : car.toString(),
        'train' : train.toString(),
        'airplane' : airplane.toString(),
        'bus' : bus.toString()
      };

      try{

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('carbon')
            .doc('all_collection')
            .set(mapShowData);

      }catch(error){

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              error.toString(),
              style: AppText.montserrat40012pxc000000,
            ),
            backgroundColor: AppColor.cFFFFFF,
          ),
        );

      }

      uploadValue();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CongratulationPage(
            carbonCalculate: double.parse(carbonValue.toString()),
          ),
        ),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            e.toString(),
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ),
      );
    }

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
                'carbonFootPrint':
                carbonValue.toStringAsFixed(2),
                'reward_point': (dataUser['reward_point'] == ''
                    ? '10'
                    : int.parse(dataUser['reward_point']) + int.parse('10'))
                    .toString(),
              });
        });

    String uniqueId1 = Uuid().v4();

    FirebaseFirestore.instance.collection('rewardHistory').doc(uniqueId1).set(
        {
          "id" : uniqueId1,
          "rewardPoint" : '10',
          'activityId' : '1',
          'userId' : FirebaseAuth.instance.currentUser!.uid,
          'createdAt' : DateTime.now(),
          'type' : 'Carbon calculate',
          'description' : 'The carbon value is ${carbonValue.toString()}',
        });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        'You have rewarded 10 point',
        style: AppText.montserrat40012pxc000000,
      ),
      backgroundColor: AppColor.cFFFFFF,
    ));
  }


  CarouselController buttonController = CarouselController();

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    getData();
    getUserData();
  }

  double valueSlider = 1.0;
  int pageIndex = 0;

  // List<Widget> questionList = [
  //   const SliderQuestionWidget(),
  // ];

  @override
  Widget build(BuildContext context) {

    return loader
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            // height: AppSize.heightMultiply(context, 1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IndicatorWidget(
                    count: mapList.length + 1,
                    index: pageIndex + 1,
                  ),


                  SizedBox(
                    height: AppSize.heightMultiply(context, 0.7),
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        if (selectedOptions[(pageIndex + 1).toString()] == '') {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 1),
                              curve: Curves.bounceIn);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Please select any options',
                              style: AppText.montserrat40012pxc000000,
                            ),
                            backgroundColor: AppColor.cFFFFFF,
                          ));
                        }
                        else {
                          setState(() {
                            pageIndex = value;
                          });
                          setState(() {});
                        }
                      },
                      children: [
                        ...List.generate(mapList.length, (index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.widthDivide(context, 18),
                                  vertical: AppSize.heightDivide(context, 40),
                                ),
                                // height: AppSize.heightDivide(context, 5.333),
                                width: AppSize.widthMultiply(context, 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.cFFFFFF,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mapList[index]['Question'] ?? '',
                                      style: AppText.montserrat50015pxc000000,
                                    ),
                                    SizedMedia.heightDivide(context, 80),
                                    ...List.generate(
                                      int.parse(mapList[index]['OptionLength']),
                                      (indexCount) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedOptions[(index + 1)
                                                  .toString()] = mapList[index][
                                                      'Option${(indexCount + 1).toString()}']
                                                  .toString();
                                              answerMenu[mapList[index]
                                                  ['Question']] = mapList[index]
                                                      [
                                                      'Option${(indexCount + 1).toString()}']
                                                  .toString();
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: AppSize.heightDivide(
                                                  context, 70),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppSize.widthDivide(
                                                  context, 30),
                                            ),
                                            height: AppSize.heightDivide(
                                                context, 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: selectedOptions[(index + 1)
                                                          .toString()] ==
                                                      mapList[index][
                                                              'Option${(indexCount + 1).toString()}']
                                                          .toString()
                                                  ? AppColor.cCCF2E9
                                                  : AppColor.cCCF2E9w50,
                                            ),
                                            child: Row(
                                              children: [
                                                Iconify(
                                                  Uil.glass,
                                                  color: AppColor.c797D8C,
                                                  size: AppSize.widthDivide(
                                                      context, 22.5),
                                                ),
                                                SizedMedia.widthDivide(
                                                    context, 30),
                                                Text(
                                                  mapList[index][
                                                          'Option${(indexCount + 1).toString()}']
                                                      .toString(),
                                                  style: selectedOptions[
                                                              (index + 1)
                                                                  .toString()] ==
                                                          mapList[index][
                                                                  'Option${(indexCount + 1).toString()}']
                                                              .toString()
                                                      ? AppText
                                                          .montserrat70016pxc000000
                                                      : AppText
                                                          .montserrat40014pxc000000,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                        CalculateValue(
                          function: () {
                            addMoreData();
                          },
                          carService: carService,
                          busService: busService,
                          autoService: autoService,
                          trainService: trainService,
                          airplaneService: airplaneService,
                        ),
                      ],
                    ),
                  ),


                  // SizedBox(
                  //   height: AppSize.heightMultiply(context, 0.7),
                  //   child: PageView.builder(
                  //       onPageChanged: (value) {
                  //         setState(() {
                  //           pageIndex = value;
                  //         });
                  //       },
                  //       itemCount: mapList.length,
                  //       itemBuilder: (context, index) {
                  //         return Column(
                  //           children: [
                  //             Container(
                  //               padding: EdgeInsets.symmetric(
                  //                   horizontal: AppSize.widthDivide(context, 18),
                  //                   vertical: AppSize.heightDivide(context, 40),
                  //               ),
                  //               // height: AppSize.heightDivide(context, 5.333),
                  //               width: AppSize.widthMultiply(context, 1),
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(20),
                  //                 color: AppColor.cFFFFFF,
                  //               ),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     mapList[index]['Question'] ?? '',
                  //                     style: AppText.montserrat50015pxc000000,
                  //                   ),
                  //                   SizedMedia.heightDivide(context, 80),
                  //                   ...List.generate(
                  //                     int.parse(mapList[index]['OptionLength']),
                  //                     (indexCount) {
                  //                       return InkWell(
                  //                         onTap: (){
                  //
                  //                           print('Its working');
                  //                           setState(() {
                  //                             selectedOptions[(index+1).toString()] = mapList[index]['Option${(indexCount + 1).toString()}'].toString();
                  //                           });
                  //                           print(selectedOptions[(index+1).toString()]);
                  //                           print(mapList[index]['Option${(indexCount + 1).toString()}']);
                  //                         },
                  //                         child: Container(
                  //                           margin: EdgeInsets.symmetric(
                  //                             vertical: AppSize.heightDivide(
                  //                                 context, 70),
                  //                           ),
                  //                           padding: EdgeInsets.symmetric(
                  //                             horizontal: AppSize.widthDivide(
                  //                                 context, 30),
                  //                           ),
                  //                           height:
                  //                               AppSize.heightDivide(context, 20),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                             color: selectedOptions[(index+1).toString()]== mapList[index]['Option${(indexCount + 1).toString()}'].toString() ? AppColor.cCCF2E9 : AppColor.cCCF2E9w50,
                  //                           ),
                  //                           child: Row(
                  //                             children: [
                  //                               Iconify(
                  //                                 Uil.glass,
                  //                                 color:  AppColor.c797D8C,
                  //                                 size: AppSize.widthDivide(
                  //                                     context, 22.5),
                  //                               ),
                  //                               SizedMedia.widthDivide(
                  //                                   context, 30),
                  //                               Text(
                  //                                 mapList[index][
                  //                                         'Option${(indexCount + 1).toString()}']
                  //                                     .toString(),
                  //                                 style:selectedOptions[(index+1).toString()]== mapList[index]['Option${(indexCount + 1).toString()}'].toString() ? AppText.montserrat70016pxc000000 : AppText
                  //                                     .montserrat40014pxc000000 ,
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //   ),
                  // ),


                ],
              ),
            ),
          );
  }
}
