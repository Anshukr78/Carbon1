import 'package:flutter/material.dart';

import '../../../helper/button.dart';
import '../../../helper/colors.dart';
import '../../../helper/size.dart';
import '../../../helper/text_form_field.dart';
import '../../../helper/text_style.dart';

class CalculateValue extends StatefulWidget {
  final Function function;
  final TextEditingController carService, busService, autoService, trainService, airplaneService;
  const CalculateValue({Key? key, required this.function,
    required this.carService,
    required this.busService,
    required this.autoService,
    required this.trainService,
    required this.airplaneService}) : super(key: key);


  @override
  State<CalculateValue> createState() => _CalculateValueState();
}

class _CalculateValueState extends State<CalculateValue> {

  calculateCarbon(){

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
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
                  'Enter public transportation details',
                  style: AppText.montserrat50015pxc000000,
                ),
                SizedMedia.heightDivide(context, 80),
                Text(
                  'Cab service',
                  style: AppText.montserrat50015pxc000000,
                ),
                calculateTextFormField(
                    context: context,
                    controller: widget.carService,
                    hintText: 'Cab service'
                ),
                Text(
                  'Bus',
                  style: AppText.montserrat50015pxc000000,
                ),
                calculateTextFormField(
                    context: context,
                    controller: widget.busService,
                    hintText: 'Bus service'
                ),
                Text(
                  'Auto rickshaw',
                  style: AppText.montserrat50015pxc000000,
                ),
                calculateTextFormField(
                    context: context,
                    controller: widget.autoService,
                    hintText: 'Auto rickshaw service'
                ),
                Text(
                  'Train or Metro',
                  style: AppText.montserrat50015pxc000000,
                ),
                calculateTextFormField(
                    context: context,
                    controller: widget.trainService,
                    hintText: 'Train or Metro service'
                ),
                Text(
                  'Airplane',
                  style: AppText.montserrat50015pxc000000,
                ),
                calculateTextFormField(
                    context: context,
                    controller: widget.airplaneService,
                    hintText: 'Airplane service'
                ),
                const SizedBox(height: 30,),
                Center(
                  child: button200Fill(
                      context: context,
                      text: 'Continue',
                      call: () {
                        widget.function();
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
