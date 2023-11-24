import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({super.key});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<String> imageSliderList = [
    'images/poster1.png', 'images/poster2.jpg', 'images/poster3.png', 'images/pposter11.jpg'
  ];
  CarouselController buttonController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.heightDivide(context, 40),
        bottom: AppSize.heightDivide(context, 20),
      ),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonController,
            items: List.generate(imageSliderList.length, (index) {
              return Container(
                height: AppSize.heightDivide(context, 4.7058),
                width: AppSize.widthMultiply(context, 1),
                decoration: BoxDecoration(
                  color: AppColor.cFFFFFF,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //       offset: const Offset(0, 5),
                  //       blurRadius: 15,
                  //       color: AppColor.c000000w15)
                  // ]
                  image: DecorationImage(
                      image: AssetImage(imageSliderList[index]),
                    fit: BoxFit.fill
                  ),
                ),
              );
            }),
            options: CarouselOptions(
                height: AppSize.heightDivide(context, 4.7058),
                viewportFraction: 1,
                onPageChanged: (value, _) {
                  setState(() {
                    pageIndex = value;
                  });
                }),
          ),
          SizedMedia.heightDivide(context, 60),
          CarouselIndicator(
            height: AppSize.heightDivide(context, 100),
            width: AppSize.widthDivide(context, 45),
            count: imageSliderList.length,
            index: pageIndex,
            color: AppColor.cD9D9D9w40,
            activeColor: AppColor.cFD8913,
          ),
        ],
      ),
    );
  }
}
