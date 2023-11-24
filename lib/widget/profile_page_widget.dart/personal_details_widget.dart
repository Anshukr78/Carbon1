// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/dropdown_button.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';

class PersonalDetailsWidget extends StatefulWidget {
  const PersonalDetailsWidget({super.key});

  @override
  State<PersonalDetailsWidget> createState() => _PersonalDetailsWidgetState();
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController calendar = TextEditingController();
  var selectedGender = 'gender';
  var selectedCountry = 'country';
  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: AppColor.c000000w15)
          ]),
      child: Column(
        children: [
          profileTextFormField(
              context: context, controller: firstName, hintText: 'First Name'),
          profileTextFormField(
              context: context, controller: lastName, hintText: 'Last Name'),
          profileTextFormField(
              context: context, controller: email, hintText: 'Email Id'),
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
                    )),
                DropdownMenuItem(
                    value: 'male',
                    child: Text(
                      'Male',
                      style: AppText.montserrat40014pxc000000,
                    )),
                DropdownMenuItem(
                    value: 'female',
                    child: Text(
                      'Female',
                      style: AppText.montserrat40014pxc000000,
                    )),
              ]),
          profileTextFormField(
              context: context, controller: mobile, hintText: 'Mobile Number'),
          profileTextFormField(
              context: context, controller: location, hintText: 'Location Pin'),
          CalendarTextFormField(calender: calendar,),
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
                    )),
              ]),
        ],
      ),
    );
  }
}
