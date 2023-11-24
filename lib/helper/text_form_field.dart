import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget signInTextFormField({
  required BuildContext context,
  required double width,
  required TextEditingController controller,
  required String hintText,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: AppSize.heightDivide(context, 120),
    ),
    height: AppSize.heightDivide(context, 16),
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 3,
              color: AppColor.c000000w15,
          ),
        ],
    ),
    child: TextFormField(
      style: AppText.montserrat40014pxc000000,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 150),
            horizontal: AppSize.widthDivide(context, 20)),
        filled: true,
        fillColor: AppColor.cFFFFFF,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.cFFFFFF,),),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.cFFFFFF,),),
        hintText: hintText,
        hintStyle: AppText.montserrat40014pxc000000w50,
      ),
    ),
  );
}

Widget passwordTextFormField({
  required BuildContext context,
  required double width,
  required TextEditingController controller,
  required String hintText,
  required Widget suffix,
  required bool obscureText,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 120)),
    height: AppSize.heightDivide(context, 16),
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 3,
              color: AppColor.c000000w15)
        ]),
    child: TextFormField(
      style: AppText.montserrat40014pxc000000,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 150),
            horizontal: AppSize.widthDivide(context, 20)),
        filled: true,
        fillColor: AppColor.cFFFFFF,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.cFFFFFF)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.cFFFFFF)),
        hintText: hintText,
        hintStyle: AppText.montserrat40014pxc000000w50,
        suffixIcon: suffix,
        suffixIconColor: AppColor.c000000w50,
        enabled: true,
      ),
      obscureText: obscureText,
    ),
  );
}


Widget calculateTextFormField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText}){
  return Container(
    height: AppSize.heightDivide(context, 18),
    margin: const EdgeInsets.all(8),
    child: TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.c000000),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.c000000),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.c000000),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSize.heightDivide(context, 150),
          horizontal: AppSize.widthDivide(context, 30),
        ),
        hintText: hintText,
        hintStyle: AppText.montserrat40014pxc000000,
      ),
      controller: controller,
    ),
  );
}


Widget profileTextFormField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 120)),
    height: AppSize.heightDivide(context, 20),
    width: AppSize.widthMultiply(context, 1),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextFormField(
      style: AppText.montserrat40014pxc000000,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 150),
            horizontal: AppSize.widthDivide(context, 30)),
        filled: true,
        fillColor: AppColor.cFFFFFF,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.c000000)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColor.c000000)),
        hintText: hintText,
        hintStyle: AppText.montserrat40014pxc000000,
      ),
    ),
  );
}

// Widget calendarTextFormField({
//   required BuildContext context,
//   required TextEditingController controller,
//   required String hintText,
//   required Function call,
// }) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 120)),
//     height: AppSize.heightDivide(context, 20),
//     width: AppSize.widthMultiply(context, 1),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25),
//     ),
//     child: TextFormField(
//       style: AppText.montserrat40014pxc000000,
//       controller: controller,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//               vertical: AppSize.heightDivide(context, 150),
//               horizontal: AppSize.widthDivide(context, 30)),
//           filled: true,
//           fillColor: AppColor.cFFFFFF,
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: BorderSide(width: 1, color: AppColor.c000000)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: BorderSide(width: 1, color: AppColor.c000000)),
//           hintText: hintText,
//           hintStyle: AppText.montserrat40014pxc000000,
//           suffixIcon: InkWell(
//               onTap: () {
//                 call();
//               },
//               child: Icon(
//                 Icons.calendar_month,
//                 color: AppColor.c797D8C,
//               ))),
//     ),
//   );
// }

Widget searchTextFormField({
  required BuildContext context,
  required TextEditingController controller,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: AppSize.widthDivide(context, 25),
        vertical: AppSize.heightDivide(context, 40),
    ),
    height: AppSize.heightDivide(context, 20),
    width: AppSize.widthMultiply(context, 1),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: CupertinoSearchTextField(
      style: AppText.montserrat40014pxc000000,
      controller: controller,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColor.cFFFFFF,),
    ),
  );
}

class CalendarTextFormField extends StatefulWidget {
  final TextEditingController calender;
  const CalendarTextFormField({super.key, required this.calender});

  @override
  State<CalendarTextFormField> createState() => _CalendarTextFormFieldState();
}

class _CalendarTextFormFieldState extends State<CalendarTextFormField> {
  DateTime? date;
  var myFormat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 120)),
      height: AppSize.heightDivide(context, 20),
      width: AppSize.widthMultiply(context, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        style: AppText.montserrat40014pxc000000,
        controller: widget.calender,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.heightDivide(context, 150),
                horizontal: AppSize.widthDivide(context, 30)),
            filled: true,
            fillColor: AppColor.cFFFFFF,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 1, color: AppColor.c000000)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 1, color: AppColor.c000000)),
            hintText: 'Date of birth',
            hintStyle: AppText.montserrat40014pxc000000,
            suffixIcon: InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1970),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    setState(() {
                      date = value;
                      widget.calender.text = myFormat.format(date!);
                    });
                  });
                },
                child: Icon(
                  Icons.calendar_month,
                  color: AppColor.c797D8C,
                ))),
      ),
    );
  }
}
