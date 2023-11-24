import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class SliderQuestionWidget extends StatefulWidget {
  const SliderQuestionWidget({super.key});

  @override
  State<SliderQuestionWidget> createState() => _SliderQuestionWidgetState();
}

class _SliderQuestionWidgetState extends State<SliderQuestionWidget> {
  double valueSlider = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthDivide(context, 18),
              vertical: AppSize.heightDivide(context, 40)),
          height: AppSize.heightDivide(context, 5.333),
          width: AppSize.widthMultiply(context, 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.cFFFFFF,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Share name of members in your house?',
                style: AppText.montserrat50015pxc000000,
                textAlign: TextAlign.start,
              ),
              Text(
                'No. of members :${valueSlider.toInt()}',
                style: AppText.montserrat40010pxc000000,
              ),
              Row(
                children: [
                  Text(
                    '1',
                    style: AppText.montserrat70010pxc000000,
                  ),
                  SizedBox(
                    width: AppSize.widthDivide(context, 1.3),
                    child: Slider(
                        activeColor: AppColor.cCCF2E9,
                        inactiveColor: AppColor.cCCF2E9,
                        min: 1,
                        max: 15,
                        value: valueSlider,
                        onChanged: (value) {
                          setState(() {
                            valueSlider = value;
                          });
                        }),
                  ),
                  Text(
                    '15',
                    style: AppText.montserrat70010pxc000000,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthDivide(context, 18),
              vertical: AppSize.heightDivide(context, 40)),
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
                widget.map['question'],
                style: AppText.montserrat50015pxc000000,
              ),
              SizedMedia.heightDivide(context, 80),
              ...List.generate(
                widget.map['options'].length,
                (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: AppSize.heightDivide(context, 70),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthDivide(context, 30),
                    ),
                    height: AppSize.heightDivide(context, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.cCCF2E9w50,
                    ),
                    child: Row(
                      children: [
                        Iconify(
                          Uil.glass,
                          color: AppColor.c797D8C,
                          size: AppSize.widthDivide(context, 22.5),
                        ),
                        SizedMedia.widthDivide(context, 30),
                        Text(
                          widget.map['options'][index]['text'],
                          style: AppText.montserrat40014pxc000000,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
