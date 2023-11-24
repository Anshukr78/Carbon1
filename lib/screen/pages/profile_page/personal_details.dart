

import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/edit_profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../helper/dropdown_button.dart';
import '../../../helper/text_form_field.dart';
import '../../../helper/text_style.dart';


class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {



  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController calendar = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();



  var selectedGender = 'gender';
  var selectedCountry = 'country';
  bool loader = false;

  updateProfile() async {
    try {

      setState(() {
        loader = true;
      });

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('users').doc(FirebaseAuth.instance.currentUser!.uid);


        transaction.update(documentReference, {
          'city': city.text.trim(),
          'countryName': selectedCountry,
          'dob': calendar.text.trim(),
          'email': email.text.trim(),
          'first_name': firstName.text.trim(),
          'gender': selectedGender,
          'last_name': lastName.text.trim(),
          'location': address.text.trim(),
          'mobile': mobile.text.trim(),
          'pin_code': location.text.trim(),
        });
      });


      setState(() {
        loader = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Profile updated',
          style: AppText.montserrat40012pxc000000,
        ),
        backgroundColor: AppColor.cFFFFFF,
      ));

      Navigator.pop(context);

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          error.toString(),
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

    setState(() {
      firstName.text = dataUser['first_name'];
      lastName.text = dataUser['last_name'];
      email.text = dataUser['email'];
      selectedGender = dataUser['gender'] == '' ? 'gender' : dataUser['gender'];
      mobile.text = dataUser['mobile'];
      location.text = dataUser['pin_code'];
      address.text = dataUser['location'];
      city.text = dataUser['city'];
      calendar.text = dataUser['dob'];
      selectedCountry = dataUser['countryName'] == "" ? 'country' : dataUser['countryName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Personal Details',
      ),
      body: dataUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSize.heightDivide(context, 40),
                // horizontal: AppSize.widthDivide(context, 18),
              ),
              height: AppSize.heightMultiply(context, 1),
              width: AppSize.heightMultiply(context, 1),
              child: Stack(
                children: [
                  Positioned(
                    left: AppSize.widthDivide(context, 18),
                    right: AppSize.widthDivide(context, 18),
                    top: AppSize.heightDivide(context, 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSize.heightDivide(context, 10),
                        horizontal: AppSize.widthDivide(context, 15),
                      ),
                      width: AppSize.widthMultiply(context, 1),
                      decoration: BoxDecoration(
                          color: AppColor.cFFFFFF,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                blurRadius: 15,
                                color: AppColor.c000000w15),
                          ]),
                      child: Column(
                        children: [
                          profileTextFormField(
                              context: context,
                              controller: firstName,
                              hintText: 'First Name'),
                          profileTextFormField(
                              context: context,
                              controller: lastName,
                              hintText: 'Last Name'),
                          profileTextFormField(
                              context: context,
                              controller: email,
                              hintText: 'Email Id'),
                          profileDropdownButtonWidget(
                              context: context,
                              value: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              item: [
                                DropdownMenuItem(
                                  value: 'gender',
                                  child: Text(
                                    'Gender',
                                    style: AppText.montserrat40014pxc000000,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'male',
                                  child: Text(
                                    'Male',
                                    style: AppText.montserrat40014pxc000000,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'female',
                                  child: Text(
                                    'Female',
                                    style: AppText.montserrat40014pxc000000,
                                  ),
                                ),
                              ]),
                          profileTextFormField(
                              context: context,
                              controller: mobile,
                              hintText: 'Mobile Number'),
                          profileTextFormField(
                              context: context,
                              controller: address,
                              hintText: 'Address'),
                          profileTextFormField(
                              context: context,
                              controller: city,
                              hintText: 'City'),
                          profileTextFormField(
                              context: context,
                              controller: location,
                              hintText: 'Location Pin'),
                          CalendarTextFormField(
                            calender: calendar,
                          ),
                          profileDropdownButtonWidget(
                              context: context,
                              value: selectedCountry,
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                              item: [
                                DropdownMenuItem(
                                    value: 'country',
                                    child: Text(
                                      'Country name',
                                      style: AppText.montserrat40014pxc000000,
                                    )),
                                DropdownMenuItem(
                                    value: 'india',
                                    child: Text(
                                      'India',
                                      style: AppText.montserrat40014pxc000000,
                                    )),
                                DropdownMenuItem(
                                  value: 'pakistan',
                                  child: Text(
                                    'Pakistan',
                                    style: AppText.montserrat40014pxc000000,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: AppSize.widthDivide(context, 2.7),
                    right: AppSize.widthDivide(context, 2.7),
                    top: AppSize.heightMultiply(context, 0),
                    child: EditProfileWidget(
                      imageUrl: dataUser['photoUrl'],
                    ),
                  ),
                  Positioned(
                    left: AppSize.widthDivide(context, 5.3),
                    right: AppSize.widthDivide(context, 5.3),
                    top: AppSize.heightDivide(context, 1.14),
                    child: loader? const Center(child: CircularProgressIndicator()) : button200Fill(
                      context: context,
                      text: 'Update',
                      call: () {
                        updateProfile();
                      },
                    ),
                  ),
                  // Positioned(
                  //     left: AppSize.widthDivide(context, 5.3),
                  //     right: AppSize.widthDivide(context, 5.3),
                  //     top: AppSize.heightDivide(context, 0.9),
                  //     child: button200Outlined(
                  //       context: context,
                  //       text: 'Cancel',
                  //       call: () {
                  //         Navigator.pop(context);
                  //       },
                  //     )),
                ],
              ),
            ),
      ),
    );
  }
}
