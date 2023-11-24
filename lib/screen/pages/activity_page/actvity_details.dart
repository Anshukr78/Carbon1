import 'dart:io';

import 'package:carbon/helper/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

import '../../../helper/colors.dart';
import '../../../helper/size.dart';
import '../../../helper/text_form_field.dart';
import '../../../widget/app_bar_widget.dart';
import '../../../widget/bottom_nav_bar_widget.dart';

class ActivityDetails extends StatefulWidget {
  final String type;
  final List listApp;

  const ActivityDetails({super.key, required this.type, required this.listApp});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  String dropdownValue = 'No';
  bool loader = false;
  TextEditingController otherFormField = TextEditingController();

  XFile? imageFile;
  ImagePicker imagePicker = ImagePicker();

  Uuid uuid = const Uuid();

  uploadImage({required String activityId, required String reward}) async {
    Navigator.pop(context);

    setState(() {
      loader = true;
    });

    String imageId = const Uuid().v4();

    storage.Reference reference =
        storage.FirebaseStorage.instance.ref().child('activity').child(imageId);

    storage.UploadTask uploadTask = reference.putFile(File(imageFile!.path));

    storage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

    try {
      await taskSnapshot.ref.getDownloadURL().then((url) async {

        await uploadActivity(
          activityId: activityId,
          text: otherFormField.text.trim(),
          value: dropdownValue,
          image: url,
        );

        await FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
          print('485132');

          transaction.update(documentReference, {
            'reward_point': (dataUser['reward_point'] == ''
                    ? int.parse(reward).toString()
                    : int.parse(dataUser['reward_point']) + int.parse(reward))
                .toString(),
          });

          print('4851fcgvjhbkj32');
        });

        String uniqueId1 = uuid.v4();

        FirebaseFirestore.instance.collection('rewardHistory').doc(uniqueId1).set(
            {
              "id" : uniqueId1,
              "rewardPoint" : reward,
              'activityId' : activityId,
              'userId' : FirebaseAuth.instance.currentUser!.uid,
              'createdAt' : DateTime.now(),
              'type' : widget.type,
              'description' : dropdownValue + otherFormField.text.trim(),
            });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Successful Completed',
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ));

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavBarWidget()));

        setState(() {
          loader = false;
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      print('error');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          e.toString(),
          style: AppText.montserrat40012pxc000000,
        ),
        backgroundColor: AppColor.cFFFFFF,
      ));
    } catch (e) {
      print(e.toString());
      print('Error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          e.toString(),
          style: AppText.montserrat40012pxc000000,
        ),
        backgroundColor: AppColor.cFFFFFF,
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  var dataUser;

  getData() async {
    dataUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  uploadActivity(
      {required String activityId,
      required String text,
      required String value,
      required String image}) async {
    String uniqueId = uuid.v4();
    FirebaseFirestore.instance
        .collection('completeActivity')
        .doc(uniqueId)
        .set({
      'activityId': activityId,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'type' : widget.type,
      'complete': value,
      'completeValue': text,
      'imageUpload': image,
      'completeAt': DateTime.now(),
      'id': uniqueId,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: widget.type,
      ),
      body: loader?
      Center(child: CircularProgressIndicator())
          :
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5,
              child: Divider(),
            ),
            widget.listApp.isEmpty ?
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 50),
                child: Text('Activity is not available',
                  style: GoogleFonts.concertOne(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: AppColor.c6AEC5E,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) :
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.listApp.length,
              itemBuilder: (context, index) {
                print(widget.listApp[index]['id']);
                return Container(
                  height: AppSize.heightDivide(context, 8),
                  width: AppSize.widthMultiply(context, 0.9),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          widget.listApp[index]['task'],
                          style: AppText.montserrat70014pxc009177,
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
                            margin: const EdgeInsets.only(left: 15),
                            child: LinearPercentIndicator(
                              progressColor: AppColor.c009177,
                              backgroundColor: AppColor.cFFFFFF,
                              animation: true,
                              percent: 0.0,
                              width:
                              AppSize.widthMultiply(context, 0.65),
                              lineHeight: 10,
                              barRadius: const Radius.circular(10),
                            ),
                          ),
                          Text(
                            '0/1',
                            style: AppText.montserrat50008pxc000000,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                // user must tap button!
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: Text(
                                            widget.listApp[index]['task'],
                                            style: AppText
                                                .montserrat70014pxc009177,
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                  'Please select related value',
                                                  style: AppText
                                                      .montserrat50015pxc000000,
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.symmetric(
                                                    vertical: AppSize
                                                        .heightDivide(
                                                        context, 120),
                                                  ),
                                                  height:
                                                  AppSize.heightDivide(
                                                      context, 16),
                                                  width:
                                                  AppSize.widthDivide(
                                                      context, 2.4827),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(25),
                                                    color: AppColor.cFFFFFF,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset:
                                                        const Offset(
                                                            0, 1),
                                                        blurRadius: 3,
                                                        color: AppColor
                                                            .c000000w15,
                                                      ),
                                                    ],
                                                  ),
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          20.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        // Step 3.
                                                        value:
                                                        dropdownValue,
                                                        // Step 4.
                                                        items: <String>[
                                                          'Yes',
                                                          'No',
                                                          'other'
                                                        ].map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                        value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(
                                                              value,
                                                              style: AppText
                                                                  .montserrat50015pxc000000,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        // Step 5.
                                                        onChanged:
                                                            (newValue) {
                                                          setState(() {
                                                            dropdownValue =
                                                            newValue!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                dropdownValue == 'other'
                                                    ? signInTextFormField(
                                                    context: context,
                                                    width: AppSize
                                                        .widthDivide(
                                                        context,
                                                        2.4827),
                                                    controller:
                                                    otherFormField,
                                                    hintText:
                                                    'Enter other value')
                                                    : const SizedBox(),
                                                dropdownValue == 'No'
                                                    ? const SizedBox()
                                                    : Container(
                                                  height: 60,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: AppSize
                                                            .widthDivide(
                                                            context,
                                                            2),
                                                        child: Text(
                                                          imageFile ==
                                                              null
                                                              ? 'Please provide image proof'
                                                              : imageFile!
                                                              .name
                                                              .toString(),
                                                          style: AppText
                                                              .montserrat40012pxc000000w50,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap:
                                                            () async {
                                                          imageFile =
                                                          await imagePicker.pickImage(
                                                              source:
                                                              ImageSource.gallery);
                                                          setState(
                                                                  () {});
                                                        },
                                                        child:
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                              color: AppColor
                                                                  .cFD8913),
                                                          child: Icon(
                                                            Icons
                                                                .upload,
                                                            color: AppColor
                                                                .c000000,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Continue'),
                                              onPressed: () {
                                                print(
                                                    widget.listApp[index]['id']);
                                                print(widget.listApp[index]
                                                ['reward']);
                                                print('Its checking');

                                                if (dropdownValue
                                                    .isNotEmpty &&
                                                    imageFile != null) {
                                                  uploadImage(
                                                      activityId:
                                                      widget.listApp[index]
                                                      ['id'],
                                                      reward:
                                                      widget.listApp[index]
                                                      ['reward']);
                                                } else {
                                                  ScaffoldMessenger.of(
                                                      context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      behavior:
                                                      SnackBarBehavior
                                                          .floating,
                                                      content: Text(
                                                        'Please select all Value',
                                                        style: AppText
                                                            .montserrat40012pxc000000,
                                                      ),
                                                      backgroundColor:
                                                      AppColor.cFFFFFF,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                  color: AppColor.cFD8913),
                              child: Center(
                                child: Icon(
                                  Icons.upload,
                                  color: AppColor.c000000,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
