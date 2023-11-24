import 'package:flutter/material.dart';

import '../../../helper/colors.dart';
import '../../../helper/size.dart';
import '../../../helper/text_style.dart';
import '../../../widget/app_bar_widget.dart';


class TransportationDetails extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String topic;
  const TransportationDetails({super.key, required this.imageUrl, required this.description, required this.topic});

  @override
  State<TransportationDetails> createState() => _TransportationDetailsState();
}

class _TransportationDetailsState extends State<TransportationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 30),
            vertical: AppSize.heightDivide(context, 40),
          ),
          child: Container(
            // margin: EdgeInsets.symmetric(
            //   vertical: AppSize.heightDivide(context, 60),
            // ),
            width: AppSize.widthMultiply(context, 1),
            decoration: BoxDecoration(
                color: AppColor.cFFFFFF,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    color: AppColor.c000000w15,

                  )
                ]),
            child: Column(
              children: [
                Container(

                  margin: EdgeInsets.symmetric(
                      vertical: AppSize.heightDivide(context, 40)
                  ),
                  height: AppSize.heightDivide(context, 2.5806),
                  width: AppSize.widthMultiply(context, 0.8),
                  decoration: BoxDecoration(
                      //color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.fill
                      )
                  ),
                  // child: Center(child: Image.asset('images/bicycle.png')),
                ),
                Container(
                  height: AppSize.heightDivide(context, 20),
                  width: AppSize.widthMultiply(context, 0.7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.c9ABAB6
                  ),
                  child: Center(
                    child: Text(widget.topic,
                      style: AppText.montserrat50016pxc000000,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: AppSize.heightDivide(context, 20),
                      horizontal: AppSize.widthDivide(context, 20)
                  ),
                  child: Text( widget.description,
                    style: AppText.montserrat50013pxc000000,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}